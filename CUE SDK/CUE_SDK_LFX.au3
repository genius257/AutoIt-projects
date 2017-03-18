#cs ----------------------------------------------------------------------------
 AutoIt Version ....: 3.3.14.2
 Author ............: genius257
 Version ...........: 0.0.1
#ce ----------------------------------------------------------------------------
#Region CorsairLightingEffectSpeed /// Contains list of effect speeds.
	Global Enum $CLES_Slow,$CLES_Medium,$CLES_Fast
#EndRegion CorsairLightingEffectSpeed
#Region CorsairLightingEffectCircularDirection /// Contains list of circular effect directions.
	Global Enum $CLECD_Clockwise,$CLECD_CounterClockwise
#EndRegion CorsairLightingEffectCircularDirection
#Region CorsairLightingEffectLinearDirection /// Contains list of linear effect directions.
	Global Enum $CLELD_Left,$CLELD_Right,$CLELD_Up,$CLELD_Down
#EndRegion CorsairLightingEffectLinearDirection
#Region CorsairLightingEffectColorMode /// Contains list of color modes.
	Global Enum $CLECM_Random,$CLECM_Alternating
#EndRegion CorsairLightingEffectColorMode

$tagCorsairLightingEffectColorOptions="INT mode;INT color1[3];INT color2[3];"
$tagCorsairColor="INT r;INT g;INT b;"; /// Contains r, g and b components of the color.
$tagCorsairFrame="INT size;PTR ledsColors;"; /// Contains information about the frame.
$tagCorsairEffect="PTR effectId;PTR CorsairFrame;PTR freeFrameFunction;"; /// Contains information about effect.

Func CUELFXAddPointToEffect($hCUESDKLFXDLL)
;~ 	Local $aRet=DllCall($hCUESDKLFXDLL, "NONE", "CUELFXAddPointToEffect",
EndFunc

Func CUELFXSetLedPositions($hCUESDKLFXDLL, $pledPositions)
	DllCall($hCUESDKLFXDLL, "NONE", "CUELFXSetLedPositions", "PTR", $pledPositions)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return 1
EndFunc

Func CUELFXCreateSpiralRainbowEffect($hCUESDKLFXDLL, $tLeds, $iSpeed, $iDirection)
	Local $iSize=(DllStructGetSize($tLeds)/4)
	If $iSize<1 Or Mod($iSize, 1)>0 Then Return SetError(1, 1, 0)
	Local $aRet=DllCall($hCUESDKLFXDLL, "PTR", "CUELFXCreateSpiralRainbowEffect", "INT", $iSize, "PTR", DllStructGetPtr($tLeds), "INT", $iSpeed, "INT", $iDirection)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func CUELFXGetFrame($hCUESDKLFXDLL, $pGuid, $iOffset)
	Local $aRet=DllCall($hCUESDKLFXDLL, "PTR", "CUELFXGetFrame", "PTR", $pGuid, "INT", $iOffset)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc
