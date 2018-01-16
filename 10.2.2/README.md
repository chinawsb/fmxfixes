# FMX fix for Delphi 10.2.2

Fixed bug list
==============
* [RSP-10443](https://quality.embarcadero.com/browse/RSP-10443)
  FMX.Dialogs.Win.DialogPrint not set copies result.
* [RSP-16670](https://quality.embarcadero.com/browse/RSP-16670)
  FMX.DialogHelper not enable Cancel button for work.
* [RSP-17890](https://quality.embarcadero.com/browse/RSP-17890)
  FMX.Graphics.TPathData.SetPathString not process Q/q/T/t command and A/a command implementation miss loop check.
* [RSP-19525](https://quality.embarcadero.com/browse/RSP-19525)
  FMX.Platform.Timer.Android have a not complete timer impementation,and FMX.Platform.Android not call ProcessQueueTimers on InternalProcessMessages.This make any call message loop and wait timer action blocked,such as AnimateXXXWait function.
* [RSP-19552](https://quality.embarcadero.com/browse/RSP-19552)
  FMX.Context.GLES.Android not check application terminate and on finalization recreate share context.This make a 'DoFinalizeShader' error during android application exit.
* [RSP-19768](https://quality.embarcadero.com/browse/RSP-19552)
  In android JMediaPlayer resolution is 1ms,But other platform and Help say the CurrentTime/DuringTime properrty should resolution at 100ns.We fix then FMX.Media.Android.pas for CurrentTime/DuringTime for work at same resolution.
* [RSP-12694](https://quality.embarcadero.com/browse/RSP-12694) 
  In iOS 9.0+,TIOSFontGlyphManager.GetDefaultBaseline calc baseline incorrect.This cause if your app have chinese and english characters in a single line,vertical alignment has a error effect.
* Other fixes
  Other fixes is not my fix,but verified by other friends.I have not check RSP code. 