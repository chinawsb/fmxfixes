{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Timer.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.SyncObjs, System.Generics.Collections, System.Messaging, Androidapi.JNI.Embarcadero, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, AndroidApi.JNI.App, FMX.Types;

type

  TAndroidCommonTimerListener = class(TJavaLocal, JFMXTimerListener)
  public type
    TTimerEvent = procedure(const AHandle: Integer) of object;
  private
    FTimerEvent: TTimerEvent;
  public
    constructor Create(const ATimerEvent: TTimerEvent);
    { JFMXTimerListener }
    procedure onTimer(AHandle: Integer); cdecl;
  end;

  THandleQueue = class
  strict private
    FRingBuffer: TArray<TFmxHandle>;
    FLock: TObject;
    FHead, FTail: Integer;
  const
    InitialCapacity: Integer = 32;
    function Size: Integer;
    function Capacity: Integer;
    procedure Expand(const At: Integer);
    function Contains(const Handle: TFmxHandle): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enqueue(const Handle: TFmxHandle);
    function TryDequeue(var Value: TFmxHandle): Boolean;
  end;

  /// <summary>Implementation of timer service for Android</summary>
  TAndroidTimerService = class(TInterfacedObject, IFMXTimerService)
  private
    FTimers: TDictionary<TFmxHandle, TTimerProc>;
    FObjectMap: TDictionary<TFmxHandle, TObject>;
    FTimersQueue: THandleQueue;
    FHandleCounter: TFmxHandle;
    FTerminating: Boolean;
    FInternalProcessMessage: Integer;
    FCommonTimerListener: TAndroidCommonTimerListener;
    procedure ApplicationTerminatingHandler(const Sender: TObject; const Msg: TMessage);
    procedure CommonTimerHandler(const AHandle: Integer);
    procedure AddToTimerQueue(const AHandle: TFmxHandle);

  protected
    /// <summary>Returns new unique handle</summary>
    function NewFmxHandle: TFmxHandle;
    /// <summary>Creates new unique handle and binds it with specified object.</summary>
    /// <remarks>Use <c>DeleteObjectHandle</c> for removing of created binding.</remarks>
    function AllocObjectHandle(const AObject: TObject): TFmxHandle;
    /// <summary>Removes binding specified handle with object, which was created by <c>AllocObjectHandle</c></summary>
    procedure DeleteObjectHandle(const AHandle: TFmxHandle);
    /// <summary>Finds object, which was bound with specified handle</summary>
    function HandleToObject(const AHandle: TFmxHandle): TObject;
    /// <summary>Checks a validity of a <c>AHandle</c></summary>
    procedure ValidateHandle(const AHandle: TFmxHandle);
    /// <summary>Registers timer service in platform</summary>
    procedure RegisterService; virtual;
    /// <summary>Unregisters timer service from platform</summary>
    procedure UnregisterService; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>Destroys all allocated timers</summary>
    procedure DestroyTimers;
    { IFMXTimerService }
    /// <summary>Creates timer and assing <c>ATimerFunc</c></summary>
    /// <returns>Handle of timer for correet destroying by <c>DestroyTimer</c></returns>
    function CreateTimer(AInterval: Integer; ATimerProc: TTimerProc): TFmxHandle;
    /// <summary>Destroy timer by specified timer's handle</summary>
    function DestroyTimer(ATimer: TFmxHandle): Boolean;
    /// <summary>Returns current time in nano seconds</summary>
    function GetTick: Double;
    function TimerExists(const ATimer: TFmxHandle): Boolean;
    // Invokes all events from timer,
    procedure ProcessQueueTimers;
  end;

implementation

uses
  System.SysUtils, System.Classes, Posix.Time, Androidapi.Helpers, FMX.Platform, FMX.Forms, FMX.Consts,
  FMX.Helpers.Android, Androidapi.JNI.Os;

type
  TAndroidTimer = class;

  TTimerRunnable = class(TJavaLocal, JRunnable)
  private
    FInterval: Integer;
    FTimer: TAndroidTimer; // Strong reference in order to keep object
    //swish:Call the timer proc direct while ProcessQueueTimers
    FStartTick,FPriorTick,FNextTick:Double;
    FCallCount:Integer;
    FStopped: Boolean;
  private class var
    FMainHandler: JHandler;
  private
    class function GetMainHandler: JHandler; static;
  public
    constructor Create(const ATimer: TAndroidTimer; const AInterval: Integer);
    destructor Destroy;override;
    procedure run; cdecl;
    procedure RunTimerProc(AQueueNext:Boolean);
    class property MainHandler: JHandler read GetMainHandler;
  end;

  TAndroidTimer = class
  private
    FRunnable: TTimerRunnable;
    FTimerProc: TTimerProc;
    function GetStopped: Boolean;

  public
    constructor Create(const AInterval: Integer; const ATimerProc: TTimerProc);
    destructor Destroy;override;
    procedure Stop;
    property TimerProc: TTimerProc read FTimerProc;
    property Stopped: Boolean read GetStopped;
  end;
var
  TimerService:TAndroidTimerService;
{ TAndroidTimerService }

procedure TAndroidTimerService.AddToTimerQueue(const AHandle: TFmxHandle);
begin
end;

function TAndroidTimerService.AllocObjectHandle(const AObject: TObject): TFmxHandle;
begin
end;

procedure TAndroidTimerService.ApplicationTerminatingHandler(const Sender: TObject; const Msg: TMessage);
begin
end;

constructor TAndroidTimerService.Create;
begin
  inherited;
  TimerService:=Self;
  RegisterService;
  FObjectMap:=TDictionary<TFmxHandle, TObject>.Create;
end;

function TAndroidTimerService.CreateTimer(AInterval: Integer; ATimerProc: TTimerProc): TFmxHandle;
var
  Timer: TAndroidTimer;
begin
  Result := 0;
  if (AInterval > 0) and Assigned(ATimerProc) then
  begin
    Timer := TAndroidTimer.Create(AInterval, ATimerProc);
    Result := TFmxHandle(Timer);
    FObjectMap.Add(Result,Timer);
  end;
end;

procedure TAndroidTimerService.DeleteObjectHandle(const AHandle: TFmxHandle);
begin
end;

destructor TAndroidTimerService.Destroy;
begin
  UnregisterService;
  FreeAndNil(FObjectMap);
  inherited;
end;

function TAndroidTimerService.DestroyTimer(ATimer: TFmxHandle): Boolean;
var
  Timer: TAndroidTimer;
begin
  Result := False;
  Timer := TAndroidTimer(ATimer);
  if Timer <> nil then
  begin
    Timer.Stop;
    Result := True;
    FObjectMap.Remove(ATimer);
  end;
end;

procedure TAndroidTimerService.DestroyTimers;
begin
end;

function TAndroidTimerService.GetTick: Double;
var
  Res: timespec;
begin
  clock_gettime(CLOCK_MONOTONIC, @Res);
  Result := (Int64(1000000000) * res.tv_sec + res.tv_nsec) / 1000000000;
end;

function TAndroidTimerService.HandleToObject(const AHandle: TFmxHandle): TObject;
begin
end;

function TAndroidTimerService.TimerExists(const ATimer: TFmxHandle): Boolean;
begin
end;

function TAndroidTimerService.NewFmxHandle: TFmxHandle;
begin
end;

procedure TAndroidTimerService.CommonTimerHandler(const AHandle: Integer);
begin
end;

procedure TAndroidTimerService.ProcessQueueTimers;
var
  AObj:TObject;
  ATimer:TAndroidTimer;
  ATick:Double;
begin
  ATick:=GetTick;
  for AObj in FObjectMap.Values do
    begin
    ATimer:=AObj as TAndroidTimer;
    if (ATick- ATimer.FRunnable.FPriorTick)*1000+1>ATimer.FRunnable.FInterval then
       ATimer.FRunnable.RunTimerProc(False);
    end;
end;

procedure TAndroidTimerService.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXTimerService) then
    TPlatformServices.Current.AddPlatformService(IFMXTimerService, Self);
end;

procedure TAndroidTimerService.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXTimerService);
end;

procedure TAndroidTimerService.ValidateHandle(const AHandle: TFmxHandle);
begin
end;

{ TAndroidTimerListener }

constructor TAndroidCommonTimerListener.Create(const ATimerEvent: TTimerEvent);
begin
  inherited Create;
end;

procedure TAndroidCommonTimerListener.onTimer(AHandle: Integer);
begin
end;

{ TTimerRunnable }

constructor TTimerRunnable.Create(const ATimer: TAndroidTimer; const AInterval: Integer);
begin
  inherited Create;
  FTimer := ATimer;
  FInterval := AInterval;
  FStartTick:=TimerService.GetTick;
  FNextTick:=FStartTick+AInterval/1000;
  FPriorTick:=-1;
  MainHandler.postDelayed(Self, AInterval);
end;

destructor TTimerRunnable.Destroy;
begin

  inherited;
end;

class function TTimerRunnable.GetMainHandler: JHandler;
begin
  if FMainHandler = nil then
    FMainHandler := TJHandler.JavaClass.init(TJLooper.JavaClass.getMainLooper);
  Result := FMainHandler;
end;

procedure TTimerRunnable.run;
var
  ATick:Double;
  ACount:Integer;
begin
  ATick:=TimerService.GetTick;
  ACount:=Trunc((ATick-FStartTick)*1000/FInterval+0.1);
  if ACount>FCallCount then
    begin
    Inc(FCallCount);
    if not FStopped then
      RunTimerProc(true)
    else
      FTimer:=nil;
    end;
end;

procedure TTimerRunnable.RunTimerProc(AQueueNext:Boolean);
var
  ADelta:Double;
begin
  FPriorTick:=TimerService.GetTick;
  try
    FTimer.TimerProc;
  finally
    if AQueueNext then
      begin
        FNextTick:=FPriorTick+FInterval;
        MainHandler.postDelayed(Self,Trunc(FInterval*1000));
//        ADelta:=FNextTick-TimerService.GetTick;
//        if ADelta<0 then
//          MainHandler.post(Self)
//        else
//          MainHandler.postDelayed(Self,Trunc(ADelta*1000));
      end;
  end;
end;

{ TAndroidTimer }

constructor TAndroidTimer.Create;
begin
  FRunnable := TTimerRunnable.Create(Self, AInterval);
  FTimerProc := ATimerProc;
end;

destructor TAndroidTimer.Destroy;
begin
  inherited;
end;

function TAndroidTimer.GetStopped: Boolean;
begin
  Result:=FRunnable.FStopped;
end;

procedure TAndroidTimer.Stop;
begin
  FRunnable.FStopped := True;
end;

{ THandleQueue }

function THandleQueue.Size: Integer;
begin
  Result := 0;
end;

function THandleQueue.Capacity: Integer;
begin
  Result := 0;
end;

function THandleQueue.Contains(const Handle: TFmxHandle): Boolean;
begin
  Result := False;
end;

constructor THandleQueue.Create;
begin
end;

destructor THandleQueue.Destroy;
begin
  inherited;
end;

procedure THandleQueue.Enqueue(const Handle: TFmxHandle);
begin
end;

procedure THandleQueue.Expand(const At: Integer);
begin
end;

function THandleQueue.TryDequeue(var Value: TFmxHandle): Boolean;
begin
end;

end.
