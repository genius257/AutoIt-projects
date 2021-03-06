#cs ----------------------------------------------------------------------------
 AutoIt Version ....: 3.3.14.2
 Author ............: genius257
 Version ...........: 0.1.0
#ce ----------------------------------------------------------------------------

#Region enum CorsairLedId	// contains shared list of all leds on all devices (kb, mouse, hs) and all models/physical layouts.
	Global Const $CLI_Invalid=0,$CLK_Escape=1,$CLK_F1=2,$CLK_F2=3,$CLK_F3=4,$CLK_F4=5,$CLK_F5=6,$CLK_F6=7,$CLK_F7=8,$CLK_F8=9,$CLK_F9=10,$CLK_F10=11,$CLK_F11=12,$CLK_GraveAccentAndTilde=13,$CLK_1=14,$CLK_2=15,$CLK_3=16,$CLK_4=17,$CLK_5=18,$CLK_6=19,$CLK_7=20,$CLK_8=21,$CLK_9=22,$CLK_0=23,$CLK_MinusAndUnderscore=24,$CLK_Tab=25,$CLK_Q=26,$CLK_W=27,$CLK_E=28,$CLK_R=29,$CLK_T=30,$CLK_Y=31,$CLK_U=32,$CLK_I=33,$CLK_O=34,$CLK_P=35,$CLK_BracketLeft=36,$CLK_CapsLock=37,$CLK_A=38,$CLK_S=39,$CLK_D=40,$CLK_F=41,$CLK_G=42,$CLK_H=43,$CLK_J=44,$CLK_K=45,$CLK_L=46,$CLK_SemicolonAndColon=47,$CLK_ApostropheAndDoubleQuote=48,$CLK_LeftShift=49,$CLK_NonUsBackslash=50,$CLK_Z=51,$CLK_X=52,$CLK_C=53,$CLK_V=54,$CLK_B=55,$CLK_N=56,$CLK_M=57,$CLK_CommaAndLessThan=58,$CLK_PeriodAndBiggerThan=59,$CLK_SlashAndQuestionMark=60,$CLK_LeftCtrl=61,$CLK_LeftGui=62,$CLK_LeftAlt=63,$CLK_Lang2=64,$CLK_Space=65,$CLK_Lang1=66,$CLK_International2=67,$CLK_RightAlt=68,$CLK_RightGui=69,$CLK_Application=70,$CLK_LedProgramming=71,$CLK_Brightness=72,$CLK_F12=73,$CLK_PrintScreen=74,$CLK_ScrollLock=75,$CLK_PauseBreak=76,$CLK_Insert=77,$CLK_Home=78,$CLK_PageUp=79,$CLK_BracketRight=80,$CLK_Backslash=81,$CLK_NonUsTilde=82,$CLK_Enter=83,$CLK_International1=84,$CLK_EqualsAndPlus=85,$CLK_International3=86,$CLK_Backspace=87,$CLK_Delete=88,$CLK_End=89,$CLK_PageDown=90,$CLK_RightShift=91,$CLK_RightCtrl=92,$CLK_UpArrow=93,$CLK_LeftArrow=94,$CLK_DownArrow=95,$CLK_RightArrow=96,$CLK_WinLock=97,$CLK_Mute=98,$CLK_Stop=99,$CLK_ScanPreviousTrack=100,$CLK_PlayPause=101,$CLK_ScanNextTrack=102,$CLK_NumLock=103,$CLK_KeypadSlash=104,$CLK_KeypadAsterisk=105,$CLK_KeypadMinus=106,$CLK_KeypadPlus=107,$CLK_KeypadEnter=108,$CLK_Keypad7=109,$CLK_Keypad8=110,$CLK_Keypad9=111,$CLK_KeypadComma=112,$CLK_Keypad4=113,$CLK_Keypad5=114,$CLK_Keypad6=115,$CLK_Keypad1=116,$CLK_Keypad2=117,$CLK_Keypad3=118,$CLK_Keypad0=119,$CLK_KeypadPeriodAndDelete=120,$CLK_G1=121,$CLK_G2=122,$CLK_G3=123,$CLK_G4=124,$CLK_G5=125,$CLK_G6=126,$CLK_G7=127,$CLK_G8=128,$CLK_G9=129,$CLK_G10=130,$CLK_VolumeUp=131,$CLK_VolumeDown=132,$CLK_MR=133,$CLK_M1=134,$CLK_M2=135,$CLK_M3=136,$CLK_G11=137,$CLK_G12=138,$CLK_G13=139,$CLK_G14=140,$CLK_G15=141,$CLK_G16=142,$CLK_G17=143,$CLK_G18=144,$CLK_International5=145,$CLK_International4=146,$CLK_Fn=147,$CLM_1=148,$CLM_2=149,$CLM_3=150,$CLM_4=151,$CLH_LeftLogo=152,$CLH_RightLogo=153,$CLK_Logo=154,$CLI_Last=$CLK_Logo
#EndRegion enum CorsairLedId
#Region enum CorsairDeviceType	// contains list of available device types
	Global Const $CDT_Unknown=0,$CDT_Mouse=1,$CDT_Keyboard=2,$CDT_Headset=3
#EndRegion enum CorsairDeviceType
#Region enum CorsairPhysicalLayout	// contains list of available physical layouts for keyboards
	Global Const $CPL_Invalid=0, _;// dummy value
		$CPL_US=1,$CPL_UK=2,$CPL_BR=3,$CPL_JP=4,$CPL_KR=5, _;// valid values for keyboard
		$CPL_Zones1=6,$CPL_Zones2=7,$CPL_Zones3=8,$CPL_Zones4=9;// valid values for mouse
#EndRegion enum CorsairPhysicalLayout
#Region enum CorsairLogicalLayout	// contains list of available logical layouts for keyboards
	Global Const $CLL_Invalid=0, _;// dummy value
		$CLL_US_Int=1,$CLL_NA=2,$CLL_EU=3,$CLL_UK=4,$CLL_BE=5,$CLL_BR=6,$CLL_CH=7,$CLL_CN=8,$CLL_DE=9,$CLL_ES=10,$CLL_FR=11,$CLL_IT=12,$CLL_ND=13,$CLL_RU=14,$CLL_JP=15,$CLL_KR=16,$CLL_TW=17,$CLL_MEX=18
#EndRegion enum CorsairLogicalLayout
#Region enum CorsairDeviceCaps	// contains list of device capabilities
	Global Const $CDC_None=0, _;// for devices that do not support any SDK functions
		$CDC_Lighting=1;// for devices that has controlled lighting
#EndRegion enum CorsairDeviceCaps
#Region enum CorsairAccessMode	// contains list of available SDK access modes
	Global Const $CAM_ExclusiveLightingControl=0
#EndRegion enum CorsairAccessMode
#Region enum CorsairError	// contains shared list of all errors which could happen during calling of Corsair* functions
	Global Const $CE_Success=0, _;// if previously called function completed successfully
		$CE_ServerNotFound=1, _;// CUE is not running or was shut down or third-party control is disabled in CUE settings(runtime error)
		$CE_NoControl=2, _;// if some other client has or took over exclusive control (runtime error)
		$CE_ProtocolHandshakeMissing=3, _;// if developer did not perform protocol handshake(developer error)
		$CE_IncompatibleProtocol=4, _;// if developer is calling the function that is not supported by the server(either because protocol has broken by server or client or because the function is new and server is too old. Check CorsairProtocolDetails for details) (developer error)
		$CE_InvalidArguments=5;// if developer supplied invalid arguments to the function(for specifics look at function descriptions). (developer error)
#EndRegion enum CorsairError

Global Const $tagCorsairDeviceInfo="INT type;PTR model;INT physicalLayout;INT logicalLayout;INT capsMask;";// contains information about device
Global Const $tagCorsairLedPosition="INT ledId;DOUBLE top;DOUBLE left;DOUBLE height;DOUBLE width;";// contains led id and position of led rectangle.Most of the keys are rectangular.In case if key is not rectangular(like Enter in ISO / UK layout) it returns the smallest rectangle that fully contains the key
Global Const $tagCorsairLedPositions="INT numberOfLed;PTR pLedPosition;";// contains number of leds and arrays with their positions
Global Const $tagCorsairLedColor="INT ledId;INT r;INT g;INT b;";//  contains information about led and its color
Global Const $tagCorsairProtocolDetails="PTR sdkVersion;PTR serverVersion;INT sdkProtocolVersion;INT serverProtocolVersion;BOOLEAN breakingChanges;";// contains information about SDK and CUE versions

Func CorsairSetLedsColors($hCUESDKDLL, $tLedColors)
	Local $iSize=(DllStructGetSize($tLedColors)/16)
	If $iSize<1 Or Mod($iSize, 1)>0 Then Return SetError(1, 1, 0)
	Local $aRet=DllCall($hCUESDKDLL, "BOOLEAN", "CorsairSetLedsColors", "INT", $iSize, "PTR", DllStructGetPtr($tLedColors))
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func CorsairSetLedsColorsAsync($hCUESDKDLL, $tLedColors, $pCallbackProc=Null, $pContext=Null)
	Local $iSize=(DllStructGetSize($tLedColors)/16)
	If $iSize<1 Or Mod($iSize, 1)>0 Then Return SetError(1, 1, 0)
	Local $aRet=DllCall($hCUESDKDLL, "BOOLEAN", "CorsairSetLedsColorsAsync", "INT", $iSize, "PTR", DllStructGetPtr($tLedColors), "PTR", $pCallbackProc, "PTR", $pContext)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func CorsairGetDeviceCount($hCUESDKDLL)
	Local $aRet=DllCall($hCUESDKDLL, "INT", "CorsairGetDeviceCount")
	If @error<>0 Then Return SetError(@error, @extended, -1)
	Return $aRet[0]
EndFunc

Func CorsairGetDeviceInfo($hCUESDKDLL, $iDeviceIndex)
	Local $aRet=DllCall($hCUESDKDLL, "PTR", "CorsairGetDeviceInfo", "INT", $iDeviceIndex)
	If @error<>0 Then Return SetError(@error, @extended, -1)
	$tCorsairDeviceInfo=DllStructCreate($tagCorsairDeviceInfo, $aRet[0])
	Return $tCorsairDeviceInfo
EndFunc

Func CorsairGetLedPositions($hCUESDKDLL)
	Local $aRet=DllCall($hCUESDKDLL, "PTR", "CorsairGetLedPositions")
	If @error<>0 Then Return SetError(@error, @extended, -1)
	Local $tCorsairLedPositions=DllStructCreate($tagCorsairLedPositions, $aRet[0])
	Return $tCorsairLedPositions
EndFunc

Func CorsairGetLedPositionsByDeviceIndex($hCUESDKDLL)
	Local $aRet=DllCall($hCUESDKDLL, "PTR", "CorsairGetLedPositionsByDeviceIndex")
	If @error<>0 Then Return SetError(@error, @extended, -1)
	MsgBox(0, "", $aRet[0])
	Local $tCorsairLedPositionsByDeviceIndex=DllStructCreate($tagCorsairLedPositions, $aRet[0])
	Return $tCorsairLedPositionsByDeviceIndex
EndFunc

Func CorsairGetLedIdForKeyName($hCUESDKDLL, $sKeyName)
	Local $aRet=DllCall($hCUESDKDLL, "INT", "CorsairGetLedIdForKeyName", "CHAR", $sKeyName)
	If @error<>0 Then Return SetError(@error, @extended, -1)
	Return $aRet[0]
EndFunc

Func CorsairRequestControl($hCUESDKDLL, $iAccessMode)
	Local $aRet=DllCall($hCUESDKDLL, "BOOLEAN", "CorsairRequestControl", "INT", $iAccessMode)
	If @error<>0 Then Return SetError(@error, @extended, -1)
	Return $aRet[0]
EndFunc

Func CorsairReleaseControl($hCUESDKDLL, $iAccessMode)
	Local $aRet=DllCall($hCUESDKDLL, "BOOLEAN", "CorsairReleaseControl", "INT", $iAccessMode)
	If @error<>0 Then Return SetError(@error, @extended, -1)
	Return $aRet[0]
EndFunc

Func CorsairPerformProtocolHandshake($hCUESDKDLL)
	Local $aRet=DllCall($hCUESDKDLL, "PTR", "CorsairPerformProtocolHandshake")
	If @error<>0 Then Return SetError(@error, @extended, -1)
	;TODO
;~ 	Local $tCorsairProtocolDetails=DllStructCreate($tagCorsairProtocolDetails, $aRet[0])
;~ 	Return $tCorsairProtocolDetails
	Return $aRet[0]
EndFunc

Func CorsairGetLastError($hCUESDKDLL)
	Local $aRet=DllCall($hCUESDKDLL, "INT", "CorsairGetLastError")
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc
