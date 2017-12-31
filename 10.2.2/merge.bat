@echo off
cd /d "%~dp0"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit
:Admin
for /f "tokens=1,2,* " %%i in ('REG QUERY HKEY_CURRENT_USER\Software\Embarcadero\BDS\19.0 /v RootDir ^| find /i "RootDir"') do set "BDS=%%k"
if "%BDS%"=="" got NotInstall
cd Final
if ErrorLevel 1 goto CreateDir
goto CopyFiles
:CreateDir
echo Create Final output directory
mkdir Final
cd Final
:CopyFiles
echo Prepare patch files from %BDS%Source
copy ..\..\tool\patch.exe patch.exe
echo Fix RSP-19525 and RSP-19552
copy "%BDS%\Source\fmx\FMX.Platform.Android.pas" FMX.Platform.Android.pas /Y
copy "%BDS%\Source\fmx\FMX.Platform.Timer.Android.pas" FMX.Platform.Timer.Android.pas /Y 
copy "%BDS%\Source\fmx\FMX.Context.GLES.Android.pas" FMX.Context.GLES.Android.pas /Y
patch -i ..\0002-Fix-RPS-19525-Waitable-Animation-make-the-program-ha.patch
echo Fix RSP-10443
copy "%BDS%\Source\fmx\FMX.Dialogs.Win.pas" FMX.Dialogs.Win.pas /Y
patch -i ..\0004-Fix-RPS-10443-Printer-s-copies-is-not-return-by-dial.patch
echo Fix RSP-16670
copy "%BDS%\Source\fmx\FMX.DialogHelper.pas" FMX.DialogHelper.pas /Y
patch -i ..\0003-Fix-RPS-16670-TDialogService.InputQuery-Cancel-butto.patch
echo Fix RSP-17890
copy "%BDS%\Source\fmx\FMX.Graphics.pas" FMX.Graphics.pas /Y
patch -i ..\0007-Fix-RSP-17890-compile-error-on-prior-version.patch
echo Fix Chinese text input and wordbreak/trim error(By Aone) 
copy "%BDS%\Source\fmx\FMX.Edit.Style.pas" FMX.Edit.Style.pas /Y
copy "%BDS%\Source\fmx\FMX.Memo.Style.pas" FMX.Memo.Style.pas /Y
copy "%BDS%\Source\fmx\FMX.TextLayout.GPU.pas" FMX.TextLayout.GPU.pas /Y
patch -i ..\0005-Fix-Chinese-and-English-words-typesetting-not-approp.patch
echo Fix Andorid bold and italic font out of range error(by Aone)
copy "%BDS%\Source\fmx\FMX.FontGlyphs.Android.pas" FMX.FontGlyphs.Android.pas /Y
patch -i ..\0006-Fix-Bold-and-Italic-Character-display-By-Aone.patch
echo Fix Windows minimize and restore button can't click error
copy "%BDS%\Source\fmx\FMX.Platform.Win.pas" FMX.Platform.Win.pas /Y
patch -i ..\0009-Fix-WinForm-cannot-minimize-and-restore-by-clicking-.patch
copy "%BDS%\Source\fmx\FMX.Media.Android.pas" FMX.Media.Android.pas /Y
patch -i ..\0010-Fix-RSP-19678-MediaPlayer-Time-Resolution.patch

del patch.exe
echo Patch done.If output any erorr,please manual process it.

goto Done
:Not Install
echo Delphi/Rad Studio 10.2.2 not found.Please install and run it first.
:Done
pause
  