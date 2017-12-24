{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Consts;

interface

{$SCOPEDENUMS ON}
uses
  System.Math.Vectors;

const
  StyleDescriptionName = 'Description';        // do not localize
  SMainItemStyle = 'menubaritemstyle';         // do not localize
  SSeparatorStyle = 'menuseparatorstyle';      // do not localize

  SMenuBarDisplayName = 'Menu Bar';            // do not localize
  SMenuAppDisplayName = 'Menu Application';    // do not localize

  SBMPImageExtension = '.bmp';                 // do not localize
  SJPGImageExtension = '.jpg';                 // do not localize
  SJPEGImageExtension = '.jpeg';               // do not localize
  SJP2ImageExtension = '.jp2';
  SPNGImageExtension = '.png';                 // do not localize
  SGIFImageExtension = '.gif';                 // do not localize
  STIFImageExtension = '.tif';                 // do not localize
  STIFFImageExtension = '.tiff';               // do not localize
  SICOImageExtension = '.ico';                 // do not localize
  SHDPImageExtension = '.hdp';                 // do not localize
  SWMPImageExtension = '.wmp';                 // do not localize
  STGAImageExtension = '.tga';                 // do not localize
  SICNSImageExtension = '.icns';               // do not localize

  // Keys for TPlatformServices.GlobalFlags
  GlobalDisableStylusGestures: string = 'GlobalDisableStylusGestures'; // do not localize
  EnableGlassFPSWorkaround: string = 'EnableGlassFPSWorkaround'; // do not localize

  FormUseDefaultPosition: Integer = -1; // same as CW_USEDEFAULT = DWORD($80000000)

type
  TEpsilonHelper = record helper for TEpsilon
  const
    Scale = 1E-4;
    FontSize = 1E-2;
    Position = 1E-3;
    Angle = 1E-4;
  end;

resourcestring

  { Error Strings }
  SInvalidPrinterOp       = '选定的打印机不支持该操作';
  SInvalidPrinter         = '选定的打印机无效';
  SPrinterIndexError      = '打印机索引越界';
  SDeviceOnPort           = '%s 位于 %s';
  SNoDefaultPrinter       = '当前没有选择默认打印机';
  SNotPrinting            = '打印机当前未打印';
  SPrinting               = '打印进行中';
  SInvalidPrinterSettings = '无效的打印作业设置';
  SInvalidPageFormat      = '无效的页面格式设置';
  SCantStartPrintJob      = '无法启动打印作业';
  SCantEndPrintJob        = '无法结束打印作业';
  SCantPrintNewPage       = '不能添加一个新的打印页面';
  SCantSetNumCopies       = '不能修改打印份数';
  StrCannotFocus          = '不能切换焦点到这个控件';
  SResultCanNotBeNil      = '函数 ''%s'' 不可以返回空值';
  SKeyAcceleratorConflict = '当前快捷键有冲突';

  SInvalidStyleForPlatform = '你选择的样式对于当前选择的平台不可用。你可以选择一个自义定样式或移除 StyleBook 来允许 FireMonkey 在运行时自动加载原生样式';
  SCannotLoadStyleFromStream = '无法从流中加载样式';
  SCannotLoadStyleFromRes = '无法从资源中加载样式';
  SCannotLoadStyleFromFile = '无法从文件 %s 中加载样式';
  SCannotChangeInLiveBinding = '使用 LiveBindings 时无法改变该属性';

  SInvalidPrinterClass    = '无效的打印机类: %s';
  SPromptArrayTooShort    = '值数组长度必需 >= 提示数组长度';
  SPromptArrayEmpty       = '提示数组必需不为空';
  SUnsupportedInputQuery  = '不支持的 InputQuery 字段';
  SInvalidColorString     = '无效的颜色值字符串';

  SInvalidFmxHandle   = '无效的 FMX 句柄: %s%.*x';
  SInvalidFmxHandleClass = '无效的句柄. [%s] 必须是 [%s] 的实例';
  SDelayRelease = '当前你不能更改窗口句柄';
  SMediaGlobalError  = '无法创建媒体控件';
  SMediaFileNotSupported  = '不支持的媒体文件 %s%';
  SUnsupportedPlatformService = '不支持的平台服务: %s';
  SServiceAlreadyRegistered = '服务 %s 已经注册';
  SUnsupportedOSVersion = '不支持的操作系统版本: %s';
  SUnsupportedMultiInstance = '"%s" 的其它实例已存在。不支持多实例';
  SNotInstance = '"%s" 的实例未创建';
  SFlasherNotRegistered = '闪烁控件类未注册';
  SUnsupportedInterface = '类 %0:s 不支持接口 %1:s';
  SNullException = '已处理空异常';
  SCannotGetDeviceIDForTestAds = '无法获取设备 ID。请使用 SetTestModeDeviceID.';

  SErrorShortCut = '未知的按键组合 %s';
  SEUseHeirs = '你只能使用类型 "%s" 的迭代器';

  SUnavailableMenuId = '无法创建菜单 ID. 所有的 ID 必须已经被赋值';

  SInvalidGestureID = '无效的手势 ID (%d)';
  SInvalidStreamFormat = '无效的流格式';
  SDuplicateGestureName = '重复的手势名称: %s';
  SDuplicateRecordedGestureName = '一个名为 %s 手势已经存在';
  SControlNotFound = '控件未找到';
  SRegisteredGestureNotFound = '下面已注册的手势无法找到:' + sLinebreak + sLinebreak + '%s';
  SErrorLoadingFile = '无法加载以前保存的设置文件: %s' + sLinebreak + '你是否希望删除它?';
  STooManyRegisteredGestures = '注册了太多的手势';
  SDuplicateRegisteredGestureName = '名为手势 %s 已注册';
  SUnableToSaveSettings = '无法保存设置';
  SInvalidGestureName = '无效的手势名称 (%s)';
  SOutOfRange = '值必需介于 %d 和 %d 之间';

  SAddIStylusAsyncPluginError = '无法添加 IStylusAsyncPlugin: %s';
  SAddIStylusSyncPluginError = '无法添加 IStylusSyncPlugin: %s';
  SRemoveIStylusAsyncPluginError = '无法移除 IStylusAsyncPlugin: %s';
  SRemoveIStylusSyncPluginError = '无法移除 IStylusSyncPlugin: %s';
  SStylusHandleError = '无法获取或设置窗口句柄: %s';
  SStylusEnableError = '无法启用或禁用 IRealTimeStylus: %s';
  SEnableRecognizerError = '无法启用或禁用 IGestureRecognizer: %s';
  SInitialGesturePointError = '无法获取初始手势位置';
  SSetStylusGestureError = '无法设置手势: %s';
  StrESingleMainMenu = '主菜单只能有一个实例';
  SMainMenuSupportsOnlyTMenuItems = '一个主菜单仅支持 TMenuItem';

  SNoImplementation = '%s 实现未找到';
  SNotImplementedOnPlatform = '%s 在此平台未实现';
  {$IFDEF ANDROID}
  SInputQueryAndroidOverloads = 'Android 上只支持重载 TInputCloseBoxProc 或 TInputCloseBoxEvent';
  {$ENDIF}

  SBitmapSizeNotEqual = '拷贝操作时位图尺寸必需相等';

  SBlockingDialogs = '阻塞对话框';

  SCannotCreateScrollContent = '无法创建 %s, 因为 |CreateScrollContent| 必须返回非空对象';
  SContentCannotBeNil = 'Presentation received nil Content from TPresentedControl. Content cannot be nil.';

  SPointInTextLayoutError = '该点不在布局内';
  SCaretLineIncorrect = 'TCaretPosition.Line 值错误';
  SCaretPosIncorrect = 'TCaretPosition.Pos 值错误';

  SInvalidSceneUpdatingPairCall = 'Invalid IScene.DisableUpdating/IScene.EnableUpdating call pair';

  SNoPlatformStyle = '没有任何可用的平台样式'; // happens when there are no platform styles at all
  SInvalidPlatformStyle = '当前平台没有可用的样式'; // happens when there are platform styles, just not the right ones
  SNoIDeviceBehaviorBehavior = 'IDeviceBehavior 必须未被注册';
  SStyleResourceDoesNotExist = '样式资源不存在';

  SDialogMustBeRunInUIThread = '消息必须在主界面线程中显示.';

  { Dialog Strings }
  SMsgDlgWarning = '警告';
  SMsgDlgError = '错误';
  SMsgDlgInformation = '信息';
  SMsgDlgConfirm = '确认';
  SMsgDlgYes = '是';
  SMsgDlgNo = '否';
  SMsgDlgOK = '确定';
  SMsgDlgCancel = '取消';
  SMsgDlgHelp = '帮助';
  SMsgDlgHelpNone = '没有可用帮助';
  SMsgDlgHelpHelp = '帮助';
  SMsgDlgAbort = '中止';
  SMsgDlgRetry = '重试';
  SMsgDlgIgnore = '忽略';
  SMsgDlgAll = '全部';
  SMsgDlgNoToAll = '全否';
  SMsgDlgYesToAll = '全是(&A)';
  SMsgDlgClose = '关闭';

  SWindowsVistaRequired = '%s 需要 Windows Vista 以上版本';

  SUsername = '用户名(&U)';
  SPassword = '密码(&P)';
  SDomain = '域(&D)';
  SLogin = '登录';

  {$IF DEFINED(MACOS) and not DEFINED(IOS)}
  SAlertCreatedReleasedInconsistency = '平台的 AlertCreated/AlertReleased 不一致';
  {$ENDIF}

  { Menus }
  SMenuAppQuit = '退出 %s';
  SMenuCloseWindow = '关闭窗口';
  SMenuAppHide = '隐藏 %s';
  SMenuAppHideOthers = '隐藏其它';
  SAppDesign = '<Application.Title>';
  SAppDefault = '应用程序';
  SGotoTab = '跳到 %s';
  SGotoNilTab = '跳到 <Tab>';
  SMediaPlayerStart = '播放';
  SMediaPlayerPause = '暂停';
  SMediaPlayerStop = '停止';
  SMediaPlayerVolume = '%3.0F %%';
  
  SMsgGooglePlayServicesNeedUpdating = 'Google Play 服务需要升级. 请前往 Play Store 升级 '
    + ' Google Play 服务后, 重新打开应用';
const
  SChrHorizontalEllipsis = Chr($2026);
{$IFDEF MACOS}
  SmkcBkSp = Chr($232B); // (NSBackspaceCharacter);
  SmkcTab = Chr($21E5); // (NSTabCharacter);
  SmkcEsc = Chr($238B);
  SmkcEnter = Chr($21A9); // (NSCarriageReturnCharacter);
  SmkcPgUp = Chr($21DE); // (NSPageUpFunctionKey);
  SmkcPgDn = Chr($21DF); // (NSPageDownFunctionKey);
  SmkcEnd = Chr($2198); // (NSEndFunctionKey);
  SmkcDel = Chr($2326); // (NSDeleteCharacter);
  SmkcHome = Chr($2196); // (NSHomeFunctionKey);
  SmkcLeft = Chr($2190); // (NSLeftArrowFunctionKey);
  SmkcUp = Chr($2191); // (NSUpArrowFunctionKey);
  SmkcRight = Chr($2192); // (NSRightArrowFunctionKey);
  SmkcDown = Chr($2193); // (NSDownArrowFunctionKey);
  SmkcNumLock = Chr($2327);
  SmkcPara = Chr($00A7);
  SmkcShift = Chr($21E7);
  SmkcCtrl = Chr($2303);
  SmkcAlt = Chr($2325);
  SmkcCmd = Chr($2318);
  // Specific keys for OSX
  SmkcBacktab= Chr($21E4);
  SmkcIbLeft= Chr($21E0);
  SmkcIbUp= Chr($21E1);
  SmkcIbRight= Chr($21E2);
  SmkcIbDown= Chr($21E3);
  SmkcIbEnter= Chr($2305);
  SmkcIbHelp= Chr($225F);
{$ELSE}
  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcDel = 'Del';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcNumLock = 'Num Lock';
  SmkcPara = 'Paragraph';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';
  SmkcCmd = 'Cmd+';

  SmkcLWin = 'Left Win';
  SmkcRWin = 'Right Win';
  SmkcApps = 'Application';
  SmkcClear = 'Clear';
  SmkcScroll = 'Scroll Lock';
  SmkcCancel = 'Break';
  SmkcLShift = 'Left Shift';
  SmkcRShift = 'Right Shift';
  SmkcLControl = 'Left Ctrl';
  SmkcRControl = 'Right Ctrl';
  SmkcLMenu = 'Left Alt';
  SmkcRMenu = 'Right Alt';
  SmkcCapital = 'Caps Lock';
{$ENDIF}
  SmkcOem102 = 'Oem \';
  SmkcSpace = 'Space';
  SmkcNext = 'Next';
  SmkcBack = 'Back';
  SmkcIns = 'Ins';
  SmkcPause = 'Pause';
  SmkcCamera = 'Camera';
  SmkcBrowserBack= 'BrowserBack';
  SmkcHardwareBack= 'HardwareBack';
  SmkcNum = 'Num %s';

resourcestring
  SEditUndo = '撤销';
  SEditCopy = '复制';
  SEditCut = '剪切';
  SEditPaste = '粘贴';
  SEditDelete = '删除';
  SEditSelectAll = '全选';

  SAseLexerTokenError = 'ERROR at line %d. %s expected but token %s found.';
  SAseLexerCharError = 'ERROR at line %d. ''%s'' expected but char ''%s'' found.';
  SAseLexerFileCorruption = 'File is corrupt.';

  SAseParserWrongMaterialsNumError = 'Wrong materials number';
  SAseParserWrongVertexNumError = 'Wrong vertex number';
  SAseParserWrongNormalNumError = 'Wrong normal number';
  SAseParserWrongTexCoordNumError = 'Wrong texture coord number';
  SAseParserWrongVertexIdxError = 'Wrong vertex index';
  SAseParserWrongFacesNumError = 'Wrong faces number';
  SAseParserWrongFacesIdxError = 'Wrong faces index';
  SAseParserWrongTriangleMeshNumError = 'Wrong triangle mesh number';
  SAseParserWrongTriangleMeshIdxError = 'Wrong triangle mesh index';
  SAseParserWrongTexCoordIdxError = 'Wrong texture coord index';
  SAseParserUnexpectedKyWordError = 'Unexpected key word';

  SIndexDataNotFoundError = 'Index data not found. File is corrupt.';
  SEffectIdNotFoundError = 'Effect id %s not found. File is corrupt.';
  SMeshIdNotFoundError = 'Mesh id %s not found. File is corrupt.';
  SControllerIdNotFoundError = 'Controller id %s not found. File is corrupt.';

  SCannotCreateCircularDependence = 'Cannot create a circular dependency between components';
  SPropertyOutOfRange = '%s property out of range';

  SPrinterDPIChangeError = 'Active printer DPI cannot be changed while printing';
  SPrinterSettingsReadError = 'Error occurred while reading printer settings: %s';
  SPrinterSettingsWriteError = 'Error occurred while writing printer settings: %s';

  SVAllFiles = '所有文件';
  SVBitmaps = '位图(Bitmaps)';
  SVIcons = '图标(Icons)';
  SVTIFFImages = 'TIFF 图片'; 
  SVJPGImages = 'JPEG 图片';
  SVPNGImages = 'PNG 图片';
  SVGIFImages = 'GIF 图片';
  SVJP2Images = 'JPG/JPEG(Jpeg 2000) 图片';
  SVTGAImages = 'TGA 图片';
  SWMPImages = 'WMP 图片';

  SVAviFiles = 'AVI 视频格式';
  SVWMVFiles = 'WMV 视频格式';
  SVMP4Files = 'MP4(Mpeg4) 视频格式';
  SVMOVFiles = 'MOV(QuickTime) 视频格式';
  SVM4VFiles = 'M4V 视频格式';

  SVWMAFiles = 'WMA(Windows Media Audio) 音频格式';
  SVMP3Files = 'MP3(Mpeg Layer 3) 音频格式';
  SVWAVFiles = 'WAV 音频格式';
  SVCAFFiles = 'CAF(Apple Core Audio Format) 音频格式';
  SV3GPFiles = '3GP(3GP Audio) 音频格式';
  SVM4AFiles = 'M4A 音频格式';

  SAllFilesExt = '.*';
  SDefault = '所有文件';

  StrEChangeFixed  = 'The "%s" cannot be modified (Fixed = True)';
  StrEDupScale     = 'Duplicate scale value %s';
  StrOther         = 'Other scale';
  StrScale1        = 'Normal';
  StrScale2        = 'Hi Res';

  { Media }

  SNoFlashError = '该设备上不存在Flash';
  SNoTorchError = '该设备上不存在Flash';

  { Pickers }
  SPickerCancel = '取消';
  SPickerDone   = '完成';
  SEditorDone   = '完成';
  SListPickerIsNotFound = 'This version of Android does not have an implementation of list pickers';
  SDateTimePickerIsNotFound = 'This version of Android does not have an implementation of Date/Time pickers';

  { Notification Center }
  SNotificationCancel = '取消';
  SNotificationCenterTitleIsNotSupported = 'NotificationCenter: Title is not supported in iOS';
  SNotificationCenterActionIsNotSupported = 'NotificationCenter: Action is not supported in Android';

  { Media Library }
  STakePhotoFromCamera = '拍照';
  STakePhotoFromLibarary = '相册';
  SOpenStandartServices = '发送到';
  SSavedPhotoAlbum = '已保存的照片';
  SImageSaved = '图片已保存';

  { Canvas helpers / 2D and 3D engine / GPU }
  SBitmapIncorrectSize = 'Incorrect size of bitmap parameter(s).';
  SBitmapLoadingFailed = 'Loading bitmap failed.';
  SBitmapLoadingFailedNamed = 'Loading bitmap failed (%s).';
  SBitmapSizeTooBig = 'Bitmap size too big.';
  SInvalidCanvasParameter = 'Invalid call of GetParameter.';
  SThumbnailLoadingFailed = 'Loading thumbnail failed.';
  SThumbnailLoadingFailedNamed = 'Loading thumbnail failed (%s).';
  SBitmapSavingFailed = 'Saving bitmap failed.';
  SBitmapSavingFailedNamed = 'Saving bitmap failed (%s).';
  SBitmapFormatUnsupported = 'The specified bitmap format is not supported.';
  SRetrieveSurfaceDescription = 'Could not retrieve surface description.';
  SRetrieveSurfaceContents = 'Could not retrieve surface contents.';
  SAcquireBitmapAccess = 'Failed acquiring access to bitmap.';
  SVideoCaptureFault = 'Failure during video feed capture.';
  SNoCaptureDeviceManager = 'No CaptureDeviceManager implementation found';
  SInvalidCallingConditions = 'Invalid calling conditions for ''%s''.';
  SInvalidRenderingConditions = 'Invalid rendering conditions for ''%s''.';
  STextureSizeTooSmall = 'Cannot create texture for ''%s'' because the size is too small.';
  SCannotAcquireBitmapAccess = 'Cannot acquire bitmap access for ''%s''.';
  SCannotFindSuitablePixelFormat = 'Cannot find a suitable pixel format for ''%s''.';
  SCannotFindSuitableShader = 'Cannot find a suitable shader for ''%s''.';
  SCannotDetermineDirect3DLevel = 'Cannot determine Direct3D support level.';
  SCannotCreateDirect3D = 'Cannot create Direct3D object for ''%s''.';
  SCannotCreateD2DFactory = 'Cannot create Direct2D Factory object for ''%s''.';
  SCannotCreateDWriteFactory = 'Cannot create DirectWrite Factory object for ''%s''.';
  SCannotCreateWICImagingFactory = 'Cannot create WIC Imaging Factory object for ''%s''.';
  SCannotCreateRenderTarget = 'Cannot create rendering target for ''%s''.';
  SCannotCreateD3DDevice = 'Cannot create Direct3D device for ''%s''.';
  SCannotAcquireDXGIFactory = 'Cannot acquire DXGI factory from Direct3D device for ''%s''.';
  SCannotResizeBuffers = 'Cannot resize buffers for ''%s''.';
  SCannotAssociateWindowHandle = 'Cannot associate the window handle for ''%s''.';
  SCannotRetrieveDisplayMode = 'Cannot retrieve display mode for ''%s''.';
  SCannotRetrieveBufferDesc = 'Cannot retrieve buffer description for ''%s''.';
  SCannotCreateSamplerState = 'Cannot create sampler state for ''%s''.';
  SCannotRetrieveSurface = 'Cannot retrieve surface for ''%s''.';
  SCannotCreateTexture = 'Cannot create texture for ''%s''.';
  SCannotUploadTexture = 'Cannot upload pixel data to texture for ''%s''.';
  SCannotActivateTexture = 'Cannot activate the texture for ''%s''.';
  SCannotAcquireTextureAccess = 'Cannot acquire texture access for ''%s''.';
  SCannotCopyTextureResource = 'Cannot copy texture resource ''%s''.';
  SCannotCreateRenderTargetView = 'Cannot create render target view for ''%s''.';
  SCannotActivateFrameBuffers = 'Cannot activate frame buffers for ''%s''.';
  SCannotCreateRenderBuffers = 'Cannot create render buffers for ''%s''.';
  SCannotRetrieveRenderBuffers = 'Cannot retrieve device render buffers for ''%s''.';
  SCannotActivateRenderBuffers = 'Cannot activate render buffers for ''%s''.';
  SCannotBeginRenderingScene = 'Cannot begin rendering scene for ''%s''.';
  SCannotSyncDeviceBuffers = 'Cannot synchronize device buffers for ''%s''.';
  SCannotUploadDeviceBuffers = 'Cannot upload device buffers for ''%s''.';
  SCannotCreateDepthStencil = 'Cannot create a depth/stencil buffer for ''%s''.';
  SCannotRetrieveDepthStencil = 'Cannot retrieve device depth/stencil buffer for ''%s''.';
  SCannotActivateDepthStencil = 'Cannot activate depth/stencil buffer for ''%s''.';
  SCannotCreateSwapChain = 'Cannot create a swap chain for ''%s''.';
  SCannotResizeSwapChain = 'Cannot resize swap chain for ''%s''.';
  SCannotActivateSwapChain = 'Cannot activate swap chain for ''%s''.';
  SCannotCreateVertexShader = 'Cannot create vertex shader for ''%s''.';
  SCannotCreatePixelShader = 'Cannot create pixel shader for ''%s''.';
  SCannotCreateVertexLayout = 'Cannot create vertex layout for ''%s''.';
  SCannotCreateVertexDeclaration = 'Cannot create vertex declaration for ''%s''.';
  SCannotCreateVertexBuffer = 'Cannot create vertex buffer for ''%s''.';
  SCannotCreateIndexBuffer = 'Cannot create index buffer for ''%s''.';
  SCannotCreateShader = 'Cannot create shader for ''%s''.';
  SCannotFindShaderVariable = 'Cannot find shader variable ''%s''.';
  SCannotActivateShaderProgram = 'Cannot activate shader program for ''%s''.';
  SCannotCreateOpenGLContext = 'Cannot create OpenGL context for ''%s''.';
  SCannotCreateOpenGLContextWithCode = 'Cannot create OpenGL context for ''%s''. Error code: %d.';
  SCannotUpdateOpenGLContext = 'Cannot update OpenGL context for ''%s''.';
  SCannotDrawMeshObject = 'Cannot draw mesh object for ''%s''.';
  SErrorInContextMethod = 'Error in context method ''%s''.';
  SFeatureNotSupported = 'This feature is not supported in ''%s''.';
  SErrorCompressingStream = 'Error compressing stream.';
  SErrorDecompressingStream = 'Error decompressing stream.';
  SErrorUnpackingShaderCode = 'Error unpacking shader code.';

  SCannotAddFixedSize = 'Cannot add columns or rows when ExpandStyle is TExpandStyle.FixedSize';
  SInvalidSpan = '''%d'' is not a valid span';
  SInvalidRowIndex = 'Row index, %d, out of bounds';
  SInvalidColumnIndex = 'Column index, %d, out of bounds';
  SInvalidControlItem = 'ControlItem.Control cannot be set to owning GridPanel';
  SCannotDeleteColumn = 'Cannot delete a column that contains controls';
  SCannotDeleteDefColumn = 'You cannot delete a column by default';
  SCannotDeleteRow = 'Cannot delete a row that contains controls';
  SCellMember = 'Member';
  SCellSizeType = 'Size Type';
  SCellValue = 'Value';
  SCellAutoSize = 'Auto';
  SCellPercentSize = 'Percent';
  SCellAbsoluteSize = 'Absolute';
  SCellColumn = 'Column%d';
  SCellRow = 'Row%d';

  SDateTimeMax = 'Date exceeds maximum of "%s"';
  SDateTimeMin = 'Date is less than minimum of "%s"';

  SDateTimePickerShowModeNotSupported = 'DateTime picker does not support psmDateTime on current platform';

  SMediaLibraryOpenImageWith = 'Send image using:';
  SMediaLibraryOpenTextWith = 'Send text using:';
  SMediaLibraryOpenTextAndImageWith = 'Send text/image using:';

  SNativePresentation = 'Native %s';

  { In-App Purchase }
  SIAPNotSetup = 'In-App Purchase component is not set up';
  SIAPNoLicenseKey = 'In-App Purchase component has no license key';
  SIAPPayloadVerificationFailed = 'Transaction payload verification failed';
  SIAPAlreadyPurchased = 'Item has already been purchased';
  SIAPNotAlreadyPurchased = 'Cannot consume an item you have not purchased';
  SIAPSetupProblem = 'Problem setting up in-app billing';
  SIAPIllegalArguments = 'Argument problem in IAP API';
  SITunesConnectionError = 'Cannot connect to iTunes Store';
  SProductsRequestInProgress = 'Products request already in progress';

  { Advertising }
  SAdFailedToLoadError = 'Ad failed to load: %d';

  { TMultiView }
  SCannotCreatePresentation = 'You cannot create Presentation without MultiView';
  SDrawer = 'Drawer';
  SOverlapDrawer = 'Overlap Drawer';
  SDockedPanel = 'Docked Panel';
  SPopover = 'Popover';
  SNavigationPane = 'Navigation Pane';
  SObjectCannotBeChild = '"%0:s" of "%1:s" cannot be a child control of "%1:s" or the "%1:s" itself';

  { Presentations }
  SWrongModelClassType = 'Model is not valid class. Expected [%s], but received [%s]';
  SWrongParameter = '[%] parameter cannot be nil';
  SControlWithoutPresentation = '[%s] without Presentation';
  SControlClassIsNil = 'AControlClass cannot be nil. Factory cannot generate presentation name.';
  SPresentationProxyCreateError = 'Cannot create presentation proxy with nil model or PresentedControl. ' +
    'Use overloaded version of constructor with parameters and pass correct values.';
  SPresentationProxyClassNotFound = 'Presentation Proxy class for presentation name [%s] is not found';
  SPresentationProxyClassIsNil = 'APresentationProxyClass is nil. Factory cannot register presentation with a nil presentation proxy class.';
  SPresentationProxyNameIsEmpty = 'APresentationName is empty. Factory cannot register presentation with an empty presentation name';
  SPresentationAlreadyRegistered = 'Presentation Proxy class [%s] for this presentation name [%s] has already been registered.';
  SPresentationTitleInDesignTime = '%s (%s)';
  SProxyIsNotRegisteredWarning = 'A descendant of TStyledPresentationProxy has not been registered for class %s.' + sLineBreak +
    'Maybe it is necessary to add the %s module to the uses section';
  { TScrollBox }
  SScrollBoxOwnerWrong = '|AOwner| should be an instance of TCustomPresentedScrollBox';
  SScrollBoxAniCalculations = 'Could not create styled presentation because CreateAniCalculations returned nil.';

  { Data Model }
  SDataModelKeyEmpty = 'Key cannot be empty. Data model cannot set or get data by key with an empty name.';

  { Analytics }
  SInvalidActivityTrackingAppID = 'Invalid Application ID';
  SAppAnalyticsDefaultPrivacyMessage = 'Privacy Notice:' + sLineBreak + sLineBreak +
    'This application anonymously tracks your usage and sends it to us for analysis. We use this analysis to make ' +
    'the software work better for you.' + sLineBreak + sLineBreak +
    'This tracking is completely anonymous. No personally identifiable information is tracked, and nothing about ' +
    'your usage can be tracked back to you.' + sLineBreak + sLineBreak +
    'Please click Yes to help us to improve this software. Thank you.';
  SCustomAnalyticsCategoryMissing = 'AppAnalytics custom event error: category cannot be empty.';

  { Clipboard }
  SFormatAlreadyRegistered = 'Custom clipboard format with name "%s" is already registered';
  SFormatWasNotRegistered = 'Custom clipboard format with name "%s" is not registered';
  SDoesnotSupportCustomData = '%s does not support custom data';

  { Helpers }

  SCannotConvertDelphiArrayToJStringArray = 'Cannot convert Delphi Source array to Java JString array. [%d] is unsupported type';

  { Address Book }

  // Permission
  SCannotPerformOperation = 'Cannot perform operation. You have to request permission by using AddressBook.RequestPermission';
  SCannotPerformOperationRejectedAccess = 'Cannot perform operation. User rejected access to AddressBook';
  SRequiredPermissionsAreAbsent = 'Required permissions [%s] are not in Manifest file.';
  SPermissionCannotChangeDataInAddressBook = 'Writing permission [WRITE_CONTACTS] is not in Manifest file. You will not be able to make changes with AddressBook';
  SPermissionCannotGetDataFromAddressBook = 'Reading permission [READ_CONTACTS] is not in Manifest file. You will not be able to get data from AddressBook';
  SUserRejectedAddressBookPermission = 'User rejected permission';
  // Common
  SCannotSaveAddressBookChanges = 'Cannot save changes in AddressBook. %s';
  SFieldTypeIsNotSupportedOnCurrentPlatform = 'Specified type of field [%s] is not supported on current platform';
  SCannotSaveFieldValue = 'Cannot save [%s]. %s';
  SCannotGetDisplayName = 'Cannot get display name. %s';
  SCannotCheckExisitingDataRecord = 'Cannot check existing data record. %s';
  SCannotExtractContactID = 'Cannot extract ID of new contact';
  SCannotCheckExistingDataRecord = 'Cannot check existing data record. %s';
  SCannotExtractAddresses = 'Cannot extract Addresses. %s';
  SCannotExtractMessagingServices = 'Cannot fetch messaging service info. %s';
  SCannotExtractDates = 'Cannot fetch dates. %s';
  SCannotExtractMultipleStringValue = 'Cannot extract multiple string values. %s';
  SCannotExtractStringValue = 'Cannot extract string value. %s';
  SSocialProfilesAreNotSupported = 'Social Profiles are not supported on this platform.';
  SCannotConvertTBitmapToJBitmap = 'Cannot save Contact Photo. TBitmap cannot be converted into JBitmap.';
  SCannotBeginNewProcessing = 'Cannot begin new processing until previous has not finished';
  // Sources
  SCannotFetchAllSourcesNilArg = 'Cannot fetch sources. [%s] cannot be nil.';
  SCannotCreateSource = 'Cannot create contact, use AddressBook.Sources for getting all available sources on your device.';
  SCannotCreateSourceNilArg = 'Cannot create instance of source. [%s] cannot be nil.';
  SCannotGetSourceNameSourceRefRefNil = 'Cannot get source name. [SourceRef] is nil';
  SCannotGetSourceTypeSourceRefRefNil = 'Cannot get source type. [SourceRef] is nil';
  // Contacts
  SCannotFetchContacts = 'Cannot fetch contacts. %s';
  SCannotFetchAllContactsWrongClassArg = 'Cannot fetch contacts. [%s] should be instance of [%s] class.';
  SCannotFetchAllContactNilArg = 'Cannot fetch contacts. [%s] cannot be nil.';
  SCannotFetchAllGroupsFromContact = 'Cannot fetch groups of contact. %s';
  SCannotCreateContact = 'Cannot create contact.';
  SCannotCreateContactNilArg = 'Cannot create instance of contact. [%s] cannot be nil.';
  SCannotCreateContactWrongClassArg = 'Cannot create instance of contact. [%s] should be instance of [%s] class.';
  SCannotCreateContactUseFactoryMethod = 'Cannot create contact, use AddressBook.CreateContact instead.';
  SCannotSaveContact = 'Cannot save contact. %s';
  SCannotSaveContactNilArg = 'Cannot save contact. [%s] cannot be nil.';
  SCannotSaveContactWrongClassArg = 'Cannot save contact. [%s] should be instance of [%s] class.';
  SCannotSaveNotModifiedContact = 'Cannot save contact, when contact is not modified';
  SCannotRemoveContact = 'Cannot remove contact. %s';
  SCannotRemoveContactNilArg = 'Cannot remove contact. [%s] cannot be nil.';
  SCannotRemoveContactWrongClassArg = 'Cannot remove contact. [%s] should be instance of [%s] class.';
  // Groups
  SCannotFetchGroups = 'Cannot fetch groups. %s';
  SCannotFetchAllGroupsWrongClassArg = 'Cannot fetch groups. [%s] should be instance of [%s] class.';
  SCannotFetchAllGroupsNilArg = 'Cannot fetch groups. [%s] cannot be nil.';
  SCannotCreateGroup = 'Cannot create instance of group.';
  SCannotCreateGroupNilArg = 'Cannot create instance of group. [%s] cannot be nil';
  SCannotCreateGroupWrongClassArg = 'Cannot create instance of group. [%s] should be instance of [%s] class.';
  SCannotCreateGroupUseFactoryMethod = 'Cannot create group, use AddressBook.CreateGroup instead.';
  SCannotSaveGroup = 'Cannot save group. %s';
  SCannotSaveGroupNilArg = 'Cannot save group. [%s] cannot be nil.';
  SCannotSaveGroupWrongClassArg = 'Cannot save group. [%s] should be instance of [%s] class.';
  SCannotRemoveGroup = 'Cannot remove group. %s';
  SCannotRemoveGroupNilArg = 'Cannot remove group. [%s] cannot be nil.';
  SCannotRemoveGroupWrongClassArg = 'Cannot remove group. [%s] should be instance of [%s] class.';
  SCannotGetGroupNameGroupRefNil = 'Cannot get group name. GroupRef is nil';
  SCannotSetGroupName = 'Cannot set group name. %s';
  SCannotSetGroupNameGroupRefNil = 'Cannot set group name. GroupRef is nil';
  // Contacts in Group
  SCannotAddContactIntoGroup = 'Cannot add contact to group. %s';
  SCannotAddContactIntoGroupNilArg = 'Cannot add contact to group. [%s] cannot be nil.';
  SCannotAddContactIntoGroupWrongClassArg = 'Cannot add contact to group. [%s] should be instance of [%s] class.';
  SCannotAddContactIntoGroupContactIsNotInAddressBook = 'Cannot add contact to group. Contact is not yet in an AddressBook.';
  SCannotAddContactIntoGroupGroupIsNotInAddressBook = 'Cannot add contact to group. Group is not yet in an AddressBook.';
  SCannotRemoveContactFromGroup = 'Cannot remove contact from group. %s';
  SCannotRemoveContactFromGroupNilArg = 'Cannot remove contact from group. [%s] cannot be nil.';
  SCannotRemoveContactFromGroupWrongClassArg = 'Cannot remove contact from group. [%s] should be instance of [%s] class.';
  SCannotFetchContactInGroup = 'Cannot fetch contacts in group with ID = [%d]. %s';
  SCannotFetchContactsInGroupNilArg = 'Cannot retrieve list of contacts. [%s] cannot be nil.';

  { Address fields kinds }

  SFirstName = '名字';
  SLastName = '姓氏';
  SMiddleName = '小名';
  SPrefix = '前缀';
  SSuffix = '后缀';
  SNickName = '昵称';
  SFirstNamePhonetic = '名字拼音';
  SLastNamePhonetic = '姓氏拼音';
  SMiddleNamePhonetic = '小名拼音';
  SOrganization = '组织';
  SJobTitle = 'Job Title';
  SDepartment = 'Department';
  SPhoto = '照片';
  SPhotoThumbnail = '照片缩略图';
  SNote = 'Note';
  SURLs = 'URLs';
  SEMails = '邮箱';
  SAddresses = '地址';
  SPhones = '手机';
  SDates = '日期';
  SRelatedNames = 'Related Names';
  SMessagingServices = 'Messaging Services';
  SBirthday = '生日';
  SCreationDate = 'Creation Date';
  SModificationDate = 'Modification Date';
  SSocialProfiles = 'Social Profiles';
  SUnknowType = 'Unknown type value';

  { Sources }

  SSourceLocal = 'Local source';
  SSourceExchange = 'Exchange ';
  SSourceExchangeGAL = 'Exchange Global Address List';
  SSourceMobileMe = 'MobileMe';
  SSourceLDAP = 'LDAP';
  SSourceCardDAV = 'CardDAV';
  SSourceCardDAVSearch = 'Searchable CardDAV';

  { Label types }

  SAddressBookHomeLabel = '家庭地址';
  SAddressBookWorkLabel = '工作地址';
  SAddressBookOtherLabel = '其他地址';

  { Phones types }

  SPhoneMain = '主号码';
  SPhoneHome = '座机';
  SPhoneMobile = '手机';
  SPhoneWork = '工作电话';
  SPhoneFaxWork = '工作传真';
  SPhoneFaxHome = '家庭传真';
  SPhoneFaxOther = '其他传真';
  SPhonePager = 'Pager';
  SPhoneOther = '其他号码';
  SPhoneCallback = 'Callback';
  SPhoneCar = '车载电话';
  SPhoneCompanyMain = '公司主号码';
  SPhoneISDN = 'ISDN';
  SPhoneRadio = 'Radio';
  SPhoneTelex = 'Telex';
  SPhoneTTYTDD = 'TTY TDD';
  SPhoneWorkMobile = '工作手机';
  SPhoneWorkPager = 'Work pager';
  SPhoneAssistant = '助手';
  SPhoneIPhone = 'iPhone';

  { Dates types }

  SDateAnniversary = '周年纪念日';
  SDateBirthday = '生日';
  SDateOther = '其他';

  { EMails types }

  SEmailsMobile = '手机邮件';

  { Urls }

  SURLHomePage = '主页';
  SURLBlog = '博客';
  SURLProfile = '个人资料';
  SURLFTP = 'FTP';

  { Related names }

  SRelationAssistant = '助手';
  SRelationBrother = '兄弟';
  SRelationChild = '子女';
  SRelationDomesticPartner = '国内合作伙伴';
  SRelationFather = '父亲';
  SRelationFriend = '朋友';
  SRelationManager = '经理';
  SRelationMother = '母亲';
  SRelationParent = '父母';
  SRelationPartner = '合作伙伴';
  SRelationReferredBy = 'RefferedBy';
  SRelationRelative = '亲戚';
  SRelationSister = '姐妹';
  SRelationSpouse = '配偶';

  { IM Protocol names }

  SProtocolAIM = 'AIM';
  SProtocolMSN = 'MSN';
  SProtocolYahoo = 'Yahoo';
  SProtocolSkype = 'Skype';
  SProtocolQQ = 'QQ';
  SProtocolGoogleTalk = 'Google Talk';
  SProtocolICQ = 'ICQ';
  SProtocolJabber = 'Jabber';
  SProtocolNetMeeting = 'Net meeting';
  SProtocolFacebook = 'Facebook';
  SProtocolGaduGadu = 'Gadu Gadu';

  { Social profile }

  SSocialProfileTwitter = 'Twitter';
  SSocialProfileGameCenter = '游戏中心';
  SSocialProfileSinaWeibo = '新浪微博';
  SSocialProfileFacebook = 'Facebook';
  SSocialProfileMySpace = 'MySpace';
  SSocialProfileLinkedIn = '领英';
  SSocialProfileFlickr = 'Flickr';

  { TListView }
  SUseItemsPropertyToSetAdapter = 'Use Items property to set TAppearanceListView adapter';

  { Control/Object Helpers }
  SCannotFindParentBySpecifiedCriteria = 'Cannot find parent by specified criteria';

implementation

end.

