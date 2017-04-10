#AutoIt3Wrapper_Run_Au3Check=n

#include <GDIPlus.au3>
#include <Array.au3>
#include <WinAPISys.au3>
#include <Memory.au3>

Global Const $PI = 3.141592653589793

Global Const $tagARGB = "BYTE A;BYTE R;BYTE G;BYTE B;"
;~ Global Const $tagPoint3D = "DOUBLE x;DOUBLE y;DOUBLE z;"
Global Const $tagPoint3D = "FLOAT x;FLOAT y;FLOAT z;"
Global Const $tagFace = "UINT a"
Global Const $tagAvg_zItem = "UINT index;DOUBLE z;"

Func Point3D($x, $y, $z)
	Local $t = DllStructCreate($tagPoint3D)
	$t.x=$x
	$t.y=$y
	$t.z=$z
	Return $t
EndFunc

Func Point3D_rotateX($this, $angle)
	Local $rad, $cosa, $sina, $y, $z
	$rad = $angle * $PI / 180
	$cosa = Cos($rad)
	$sina = Sin($rad)
	$y = $this.y * $cosa - $this.z * $sina
	$z = $this.y * $sina + $this.z * $cosa
	return Point3D($this.x, $y, $z)
EndFunc

Func Point3D_rotateY($this, $angle)
	Local $rad, $cosa, $sina, $x, $z
	$rad = $angle * $PI / 180
	$cosa = Cos($rad)
	$sina = Sin($rad)
	$z = $this.z * $cosa - $this.x * $sina
	$x = $this.z * $sina + $this.x * $cosa
	return Point3D($x,$this.y, $z)
EndFunc

Func Point3D_rotateZ($this, $angle)
	Local $rad, $cosa, $sina, $x, $y
	$rad = $angle * $PI / 180
	$cosa = Cos($rad)
	$sina = Sin($rad)
	$x = $this.x * $cosa - $this.y * $sina
	$y = $this.x * $sina + $this.y * $cosa
	return Point3D($x, $y, $this.z)
EndFunc

Func Point3D_project($this, $viewWidth, $viewHeight, $fov, $viewDistance)
	Local $factor, $x, $y
	$factor = $fov / ($viewDistance + $this.z)
	$x = $this.x * $factor + $viewWidth / 2
	$y = $this.y * $factor + $viewHeight / 2
	return Point3D($x, $y, $this.z)
EndFunc

Func Face($sString)
	Local $i
	Local $a = StringSplit($sString, ",", 1+2)
	Local $t = DllStructCreate($tagFace&"["&UBound($a,1)&"]")
	For $i=0 To UBound($a, 1)-1
		DllStructSetData($t, 1, $a[$i], $i+1)
	Next
	Return $t
EndFunc

;~ Global $tVertices = DllStructCreate("DOUBLE a["&3*8&"]")
Global $tVertices = DllStructCreate("FLOAT a["&3*8&"]")
	$tVertices.a(1) = -1
	$tVertices.a(2) = 1
	$tVertices.a(3) = -1

	$tVertices.a(4) = 1
	$tVertices.a(5) = 1
	$tVertices.a(6) = -1

	$tVertices.a(7) = 1
	$tVertices.a(8) = -1
	$tVertices.a(9) = -1

	$tVertices.a(10) = -1
	$tVertices.a(11) = -1
	$tVertices.a(12) = -1

	$tVertices.a(13) = -1
	$tVertices.a(14) = 1
	$tVertices.a(15) = 1

	$tVertices.a(16) = 1
	$tVertices.a(17) = 1
	$tVertices.a(18) = 1

	$tVertices.a(19) = 1
	$tVertices.a(20) = -1
	$tVertices.a(21) = 1

	$tVertices.a(22) = -1
	$tVertices.a(23) = -1
	$tVertices.a(24) = 1
;~ #cs
;~ Global $vertices = DllStructCreate("DOUBLE a["&3*13&"]")
Global $tVertices = DllStructCreate("FLOAT a["&3*13&"]")
	$tVertices.a(01) = -1
	$tVertices.a(02) = -1
	$tVertices.a(03) = -1

	$tVertices.a(04) = 1
	$tVertices.a(05) = -1
	$tVertices.a(06) = -1

	$tVertices.a(07) = 1
	$tVertices.a(08) = 0
	$tVertices.a(09) = -1

	$tVertices.a(10) = 0
	$tVertices.a(11) = 0
	$tVertices.a(12) = -1

	$tVertices.a(13) = 0
	$tVertices.a(14) = 1
	$tVertices.a(15) = -1

	$tVertices.a(16) = -1
	$tVertices.a(17) = 1
	$tVertices.a(18) = -1

	$tVertices.a(19) = -1
	$tVertices.a(20) = 1
	$tVertices.a(21) = 0

	$tVertices.a(22) = -1
	$tVertices.a(23) = 0
	$tVertices.a(24) = 0

	$tVertices.a(25) = -1
	$tVertices.a(26) = 0
	$tVertices.a(27) = 1

	$tVertices.a(28) = -1
	$tVertices.a(29) = -1
	$tVertices.a(30) = 1

	$tVertices.a(31) = 0
	$tVertices.a(32) = -1
	$tVertices.a(33) = 1

	$tVertices.a(34) = 0
	$tVertices.a(35) = -1
	$tVertices.a(36) = 0

	$tVertices.a(37) = 1
	$tVertices.a(38) = -1
	$tVertices.a(39) = 0
;~ #ce

;~ $iVertices = DllStructGetSize($tVertices)/8/3
$iVertices = DllStructGetSize($tVertices)/4/3

Global $aFaces = ["0,1,2,3","1,5,6,2","5,4,7,6","4,0,3,7","0,4,5,1","3,2,6,7"]
Global $aFaces = ["0,1,2,3,4,5","5,6,7,8,9,0","0,1,12,11,10,9","4,5,6","8,9,10","12,1,2"]
Global $iFaces = UBound($aFaces)
Global $tFaces = DllStructCreate("PTR["&$iFaces&"]")
	For $i=0 To $iFaces-1
		$tFace = Face($aFaces[$i])
		$iFace = DllStructGetSize($tFace)
		DllStructSetData($tFaces, 1, _MemGlobalAlloc($iFace, $GPTR), $i+1)
		_MemMoveMemory(DllStructGetPtr($tFace), DllStructGetData($tFaces, 1, $i+1), $iFace)
	Next
Global $aColors = [0x55FF0000,0x5500FF00,0x550000FF,0x55FFFF00,0x5500FFFF,0x55FF00FF]
;~ Global $aColors = [0xFFFF0000,0xFF00FF00,0xFF0000FF,0xFFFFFF00,0xFF00FFFF,0xFFFF00FF]
Global $iColors = UBound($aColors)

Global $angle = 0

Opt("GuiOnEventMode", 1)

$hWnd = GUICreate("", 700, 320)
GUISetState(@SW_SHOW, $hWnd)
_GDIPlus_Startup()
$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)
$hPath = _GDIPlus_PathCreate()
$hBrush = _GDIPlus_BrushCreateSolid()
$hBitmap = _GDIPlus_BitmapCreateFromScan0(_WinAPI_GetClientWidth($hWnd), _WinAPI_GetClientHeight($hWnd), $GDIP_PXF32ARGB)
$hGraphics2 = _GDIPlus_ImageGetGraphicsContext($hBitmap)

_GDIPlus_GraphicsSetCompositingQuality($hGraphics, 1)
_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 1)
_GDIPlus_GraphicsSetSmoothingMode($hGraphics, 0)
_GDIPlus_GraphicsSetCompositingMode($hGraphics2, 1)

_GDIPlus_GraphicsSetCompositingQuality($hGraphics2, 2)
_GDIPlus_GraphicsSetInterpolationMode($hGraphics2, 2)
_GDIPlus_GraphicsSetSmoothingMode($hGraphics2, 2)
_GDIPlus_GraphicsSetTextRenderingHint($hGraphics, 2)
_GDIPlus_GraphicsSetCompositingMode($hGraphics2, 0)
_GDIPlus_GraphicsSetPixelOffsetMode($hGraphics2, 2)

$hFamily = _GDIPlus_FontFamilyCreate("Arial")
$hFont = _GDIPlus_FontCreate($hFamily, 12, 1, 2)
$tLayout = _GDIPlus_RectFCreate(0, 0, 200, 20)
$hFormat = _GDIPlus_StringFormatCreate()

Global $exit = False

GUISetOnEvent(-3, "_Exit", $hWnd)

Func _Exit()
	Global $exit = True
EndFunc

Global $hTime = _WinAPI_GetTickCount()
Global $iFPS = 0
Global $iFrames = 0

Global $t = DllStructCreate("PTR["&$iVertices&"]")
Global $avg_z = DllStructCreate("PTR["&$iFaces&"]")
Global $tAvg_zItem = DllStructCreate($tagAvg_zItem)
Global $pAvg_zItem = DllStructGetPtr($tAvg_zItem)
Global $iAvg_zItem = DllStructGetSize($tAvg_zItem)
	For $i=0 To $iFaces-1
		DllStructSetData($avg_z, 1, _MemGlobalAlloc($iAvg_zItem, $GPTR), $i+1)
	Next
Global $tV = DllStructCreate($tagPoint3D)
Global $pV = DllStructGetPtr($tV)
Global $iV = DllStructGetSize($tV)
	For $i=0 To $iVertices-1
		DllStructSetData($t, 1, _MemGlobalAlloc($iV, $GPTR), $i+1)
	Next

While 1
	_GDIPlus_GraphicsClear($hGraphics2, 0xFF000000)
	For $i=0 To $iVertices-1
;~ 		_MemMoveMemory( DllStructGetPtr( $tVertices )+$i*3*8, $pV, $iV )
		_MemMoveMemory( DllStructGetPtr( $tVertices )+$i*(3*4), $pV, $iV )
		$_ = Point3D_project( Point3D_rotateY( Point3D_rotateX( $tV, $angle ), $angle ), 700, 320, 200, 4 )
;~ 		$_ = Point3D_project( Point3D_rotateY( Point3D_rotateX( $tV, $angle ), $angle ), 320, 320, 200, 4 )
		_MemMoveMemory( DllStructGetPtr($_), DllStructGetData($t, 1, $i+1), DllStructGetSize($_) )
	Next

	For $i=0 To $iFaces-1
		$tAvg_zItem.index = $i
		$pFace = DllStructGetData($tFaces, 1, $i+1)
		$iFace = _MemGlobalSize(_MemGlobalHandle(DllStructGetData($tFaces, 1, $i+1)))
		$tFace = DllStructCreate($tagFace&"["&$iFace/4&"]")
		_MemMoveMemory($pFace, DllStructGetPtr($tFace), $iFace)
		$tAvg_zItem.z=0
		For $j=0 To $iFace/4-1
			_MemMoveMemory(DllStructGetData($t, 1, DllStructGetData($tFace, 1, $j+1)+1), $pV, $iV)
			$tAvg_zItem.z += $tV.z
		Next
		$tAvg_zItem.z = $tAvg_zItem.z/($iFace/4)

		_MemMoveMemory( $pAvg_zItem, DllStructGetData($avg_z, 1, $i+1), $iAvg_zItem)
	Next

	avg_sort($avg_z)

	For $i=0 To $iFaces-1
		_MemMoveMemory(DllStructGetData($avg_z, 1, $i+1), $pAvg_zItem, $iAvg_zItem)
		_GDIPlus_BrushSetSolidColor($hBrush, $aColors[$tAvg_zItem.index])
		_GDIPlus_PathReset($hPath)

		$iFace = _MemGlobalSize(_MemGlobalHandle(DllStructGetData($tFaces, 1, $tAvg_zItem.index+1)))/4
		$tFace = DllStructCreate($tagFace&"["&$iFace&"]")
		_MemMoveMemory(DllStructGetData($tFaces, 1, $tAvg_zItem.index+1), DllStructGetPtr($tFace), $iFace*4)
		$tPoints=DllStructCreate("FLOAT["&$iFace*2&"]")
		$pPoints=DllStructGetPtr($tPoints)
		For $j=0 To $iFace-1
			_MemMoveMemory(DllStructGetData($t, 1, DllStructGetData($tFace, 1, $j+1)+1), $pPoints+8*$j, 8)
			_GDIPlus_GraphicsFillEllipse($hGraphics2, DllStructGetData($tPoints, 1, $j*2+1)-2.5, DllStructGetData($tPoints, 1, $j*2+2)-2.5, 5, 5, $hBrush)
		Next

		_GDIPlus_PathAddPolygon2($hPath, $tPoints)
		_GDIPlus_GraphicsFillPath($hGraphics2, $hPath, $hBrush)
;~ 		Sleep(100)
	Next

	$iTime = _WinAPI_GetTickCount() - $hTime
	$iFrames+=1
	If $iTime>1000 Then
		$iFPS = ($iFrames/($iTime/1000))
		$hTime = _WinAPI_GetTickCount()
		$iFrames = 0
	EndIf

	_GDIPlus_BrushSetSolidColor($hBrush, 0xFF00FF00)
	_GDIPlus_GraphicsDrawStringEx($hGraphics2, $iFPS, $hFont, $tLayout, $hFormat, $hBrush)

	_GDIPlus_GraphicsDrawImage($hGraphics, $hBitmap, 0, 0)

	$angle = Mod($angle+0.5, 360)

	If $exit Then ExitLoop

;~ 	Sleep(100)
WEnd

_GDIPlus_FontDispose($hFont)
_GDIPlus_FontFamilyDispose($hFamily)
_GDIPlus_StringFormatDispose($hFormat)

_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_BitmapDispose($hBitmap)
_GDIPlus_GraphicsDispose($hGraphics2)
_GDIPlus_PathDispose($hPath)
_GDIPlus_BrushDispose($hBrush)
_GDIPlus_Shutdown()

Exit

Func avg_sort(ByRef $tArray)
	Local $i, $j, $tmp
	Local $tItem1 = DllStructCreate($tagAvg_zItem)
	Local $pItem1 = DllStructGetPtr($tItem1)
	Local $iItem1 = DllStructGetSize($tItem1)
	Local $tItem2 = DllStructCreate($tagAvg_zItem)
	Local $pItem2 = DllStructGetPtr($tItem2)
	Local $iItem2 = DllStructGetSize($tItem2)
	For $i=0 To $iFaces-1
		For $j=0 To $iFaces-$i-2
			_MemMoveMemory(DllStructGetData($tArray, 1, $j+1), $pItem1, $iItem1)
			_MemMoveMemory(DllStructGetData($tArray, 1, $j+2), $pItem2, $iItem2)
			If ( ( $tItem2.z - $tItem1.z ) > 0 ) Then
				$tmp = DllStructGetData($tArray, 1, $j+2)
				DllStructSetData($tArray, 1, DllStructGetData($tArray, 1, $j+1), $j+2)
				DllStructSetData($tArray, 1, $tmp, $j+1)
			EndIf
		Next
	Next
EndFunc

Func _GDIPlus_PathAddPolygon2($hPath, $tPoints)
	Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipAddPathPolygon", "handle", $hPath, "struct*", $tPoints, "int", DllStructGetSize($tPoints)/4/2)
	If @error Then Return SetError(@error, @extended, False)
	If $aResult[0] Then Return SetError(10, $aResult[0], False)
	Return True
EndFunc

Func _MemGlobalHandle($pMem)
	$aRet = DllCall("Kernel32.dll", "ptr", "GlobalHandle", "ptr", $pMem)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	If $aRet[0]=0 Then Return SetError(-1, @extended, 0)
	Return $aRet[0]
EndFunc