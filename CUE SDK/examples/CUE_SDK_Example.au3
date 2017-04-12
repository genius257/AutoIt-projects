#include "CUE_SDK.au3"

#AutoIt3Wrapper_UseX64=Y

$hCUESDKDLL=DllOpen(@AutoItX64?"CUESDK.x64_2015.dll":"CUESDK_2015.dll")

CorsairPerformProtocolHandshake($hCUESDKDLL)
If @error<>0 Then Exit MsgBox(0, @error, "Handshake failed")

$iDeviceCount=CorsairGetDeviceCount($hCUESDKDLL)
MsgBox(0, "CorsairGetDeviceCount", "@error: "&@error&@CRLF&"Return: "&$iDeviceCount)

$tCorsairLedPositions=CorsairGetLedPositions($hCUESDKDLL)
MsgBox(0, "numberOfLed", $tCorsairLedPositions.numberOfLed)

$tCorsairLedColor=DllStructCreate($tagCorsairLedColor)
$tCorsairLedPosition=DllStructCreate($tagCorsairLedPosition, $tCorsairLedPositions.pLedPosition)
For $i=1 To $tCorsairLedPositions.numberOfLed
	$tCorsairLedColor.ledId=$tCorsairLedPosition.ledId
	$tCorsairLedColor.r=Mod($i, 2)?255:0
	$tCorsairLedColor.g=Mod($i, 2)?0:255
	$tCorsairLedColor.b=Mod($i, 2)?255:0
	$bSuccess = CorsairSetLedsColors($hCUESDKDLL, $tCorsairLedColor)
	If $bSuccess=0 Then Exit MsgBox(0, "["&$i&"] : "&$tCorsairLedColor.ledId, _CorsairErrorToString(CorsairGetLastError($hCUESDKDLL)))
	$tCorsairLedPosition=DllStructCreate($tagCorsairLedPosition, DllStructGetPtr($tCorsairLedPosition)+DllStructGetSize($tCorsairLedPosition))
	Sleep(100)
Next
MsgBox(0, "", "pause")

$tCorsairLedColor=DllStructCreate("INT["&(($tCorsairLedPositions.numberOfLed)*4)&"]")
$tCorsairLedPosition=DllStructCreate($tagCorsairLedPosition, $tCorsairLedPositions.pLedPosition)
For $i=1 To $tCorsairLedPositions.numberOfLed
	DllStructSetData($tCorsairLedColor, 1, $tCorsairLedPosition.ledId, 1+(($i-1)*4))
	DllStructSetData($tCorsairLedColor, 1, 255, 2+(($i-1)*4))
	DllStructSetData($tCorsairLedColor, 1, 0, 3+(($i-1)*4))
	DllStructSetData($tCorsairLedColor, 1, 0, 4+(($i-1)*4))
	$tCorsairLedPosition=DllStructCreate($tagCorsairLedPosition, DllStructGetPtr($tCorsairLedPosition)+DllStructGetSize($tCorsairLedPosition))
Next

$bSuccess = CorsairSetLedsColors($hCUESDKDLL, $tCorsairLedColor)
If $bSuccess=0 Then MsgBox(0, "", _CorsairErrorToString(CorsairGetLastError($hCUESDKDLL)))
MsgBox(0, "CorsairSetLedsColors", "@error: "&@error&@CRLF&"Return: "&$bSuccess)
Sleep(1000)

CorsairReleaseControl($hCUESDKDLL, $CAM_ExclusiveLightingControl)
DllClose($hCUESDKDLL)
Exit

Func _CorsairErrorToString($i)
	Switch $i
		Case $CE_Success
			Return "previously called function completed successfully"
		Case $CE_ServerNotFound
			Return "CUE is not running or was shut down or third-party control is disabled in CUE settings(runtime error)"
		Case $CE_NoControl
			Return "some other client has or took over exclusive control (runtime error)"
		Case $CE_ProtocolHandshakeMissing
			Return "developer did not perform protocol handshake(developer error)"
		Case $CE_IncompatibleProtocol
			Return " developer is calling the function that is not supported by the server(either because protocol has broken by server or client or because the function is new and server is too old. Check CorsairProtocolDetails for details) (developer error)"
		Case $CE_InvalidArguments
			Return "developer supplied invalid arguments to the function(for specifics look at function descriptions). (developer error)"
		Case Else
			Return SetError(1, 1, 0)
	EndSwitch
EndFunc
