#include "..\CUE_SDK.au3"
#include "..\CUE_SDK_LFX.au3"

#AutoIt3Wrapper_UseX64=Y
$hCUESDKDLL=DllOpen(@AutoItX64?"CUESDK.x64_2015.dll":"CUESDK_2015.dll")
$hCUESDK_LFXDLL=DllOpen(@AutoItX64?"CUELFX.x64_2013.dll":"CUELFX_2013.dll")

$tHandshake=CorsairPerformProtocolHandshake($hCUESDKDLL)
CorsairRequestControl($hCUESDKDLL, $CAM_ExclusiveLightingControl)
If @error<>0 Or $tHandshake=0 Then Exit MsgBox(0, @error, "Handshake failed")
$iDeviceCount=CorsairGetDeviceCount($hCUESDKDLL)
If @error<>0 Or $iDeviceCount=0 Then Exit MsgBox(0, @error, "No devices")
$tCorsairLedPositions=CorsairGetLedPositions($hCUESDKDLL)
CUELFXSetLedPositions($hCUESDK_LFXDLL, DllStructGetPtr($tCorsairLedPositions))
$tLeds=DllStructCreate("INT["&( $CLK_Application - $CLK_GraveAccentAndTilde + $CLK_Backspace - $CLK_BracketRight + 3 )&"]")
$j=1
For $i=$CLK_GraveAccentAndTilde To $CLK_Application
	DllStructSetData($tLeds, 1, $i, $j)
	$j+=1
Next
For $i=$CLK_BracketRight To $CLK_Backspace
	DllStructSetData($tLeds, 1, $i, $j)
	$j+=1
Next

DllStructSetData($tLeds, 1, $CLK_RightShift, $j)
$j+=1
DllStructSetData($tLeds, 1, $CLK_RightCtrl, $j)
$j+=1
DllStructSetData($tLeds, 1, $CLK_Fn, $j)

$pEffect=CUELFXCreateSpiralRainbowEffect($hCUESDK_LFXDLL, $tLeds, $CLES_Slow, $CLECD_CounterClockwise)
If $pEffect=0 Then Exit MsgBox(0, "", "Failed to create spiral rainbow effect")
$tEffect=DllStructCreate($tagCorsairEffect, $pEffect)

;play
$hTime=TimerInit()
Sleep(100)
$iTime=TimerDiff($hTime)
While 1
	$pFrame=CUELFXGetFrame($hCUESDK_LFXDLL, $tEffect.effectId, $iTime)
	$tFrame=DllStructCreate($tagCorsairFrame, $pFrame)
	If $pFrame>0 And $tFrame.ledsColors Then
		$tCorsairLedColors=DllStructCreate("INT["&$tFrame.Size*4&"]", $tFrame.ledsColors)
		$bSuccess=CorsairSetLedsColors($hCUESDKDLL, $tCorsairLedColors)
	EndIf
	$iTime=TimerDiff($hTime)
	If $iTime>10000 Then ExitLoop
	Sleep(25)
WEnd
CorsairReleaseControl($hCUESDKDLL, $CAM_ExclusiveLightingControl)

DllClose($hCUESDK_LFXDLL)
DllClose($hCUESDKDLL)
