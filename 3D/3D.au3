#AutoIt3Wrapper_Run_Au3Check=n

Global Const $PI = 3.141592653589793

Global Const $tagARGB = "BYTE A;BYTE R;BYTE G;BYTE B;"
Global Const $tagPoint3D = "DOUBLE x;DOUBLE y;DOUBLE z;"
Global Const $tagFace = "UINT a"

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

Global $vertices = DllStructCreate("DOUBLE a["&3*8&"]")
	$vertices.a(1) = -1
	$vertices.a(2) = 1
	$vertices.a(3) = -1

	$vertices.a(4) = 1
	$vertices.a(5) = 1
	$vertices.a(6) = -1

	$vertices.a(7) = 1
	$vertices.a(8) = -1
	$vertices.a(9) = -1

	$vertices.a(10) = -1
	$vertices.a(11) = -1
	$vertices.a(12) = -1

	$vertices.a(13) = -1
	$vertices.a(14) = 1
	$vertices.a(15) = 1

	$vertices.a(16) = 1
	$vertices.a(17) = 1
	$vertices.a(18) = 1

	$vertices.a(19) = 1
	$vertices.a(20) = -1
	$vertices.a(21) = 1

	$vertices.a(22) = -1
	$vertices.a(23) = -1
	$vertices.a(24) = 1

$iVertices = DllStructGetSize($vertices)/8/3

Global $faces[6][4] = [[0,1,2,3],[1,5,6,2],[5,4,7,6],[4,0,3,7],[0,4,5,1],[3,2,6,7]]
Global $colors[6][3] = [[255,0,0],[0,255,0],[0,0,255],[255,255,0],[0,255,255],[255,0,255]]

#cs
Global $faces[6][6] = [[0,1,2,3,4,5],[5,6,7,8,9,0],[0,1,12,11,10,9],[4,5,6],[8,9,10],[12,1,2]]
Global $colors[6][3] = [[255,0,0],[0,255,0],[0,0,255],[255,255,0],[0,255,255],[255,0,255]]
#ce

$iFaces = UBound($faces, 1)
$iColors = UBound($colors, 1)

Global $angle = 0

#include <GDIPlus.au3>
#include <Array.au3>
#include <WinAPISys.au3>
#include <Memory.au3>

Opt("GuiOnEventMode", 1)

$hWnd = GUICreate("", 700, 320)
GUISetState(@SW_SHOW, $hWnd)
_GDIPlus_Startup()
$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)
$hPath = _GDIPlus_PathCreate()
$hBrush = _GDIPlus_BrushCreateSolid()
$hBitmap = _GDIPlus_BitmapCreateFromScan0(_WinAPI_GetClientWidth($hWnd), _WinAPI_GetClientHeight($hWnd))
$hGraphics2 = _GDIPlus_ImageGetGraphicsContext($hBitmap)

_GDIPlus_GraphicsSetCompositingQuality($hGraphics, 1)
_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 1)
_GDIPlus_GraphicsSetSmoothingMode($hGraphics, 2)

_GDIPlus_GraphicsSetCompositingQuality($hGraphics2, 1)
_GDIPlus_GraphicsSetInterpolationMode($hGraphics2, 1)
_GDIPlus_GraphicsSetSmoothingMode($hGraphics2, 2)

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

Global $t[$iVertices]
Global $avg_z = DllStructCreate("PTR["&$iFaces&"]")
;~ Global $v =

While 1
	_GDIPlus_GraphicsClear($hGraphics2, 0xFF000000)
	For $i=0 To $iVertices-1
		$v = DllStructCreate($tagPoint3D, DllStructGetPtr($vertices)+($i*3)*8)
		$r = Point3D_rotateY(Point3D_rotateX($v, $angle), $angle)
		$p = Point3D_project($r, 700, 320, 200, 4)
		$t[$i] = $p
	Next

	Global $avg_z[$iFaces]

	For $i=0 To $iFaces-1
		$avg_z[$i] = DllStructCreate("UINT index;DOUBLE z;")
		$avg_z[$i].index = $i
		$avg_z[$i].z = ( $t[$faces[$i][0]].z + $t[$faces[$i][1]].z + $t[$faces[$i][2]].z + $t[$faces[$i][3]].z ) / 4.0
	Next

	avg_sort($avg_z)

	For $i = 0 To $iFaces-1
		_GDIPlus_BrushSetSolidColor($hBrush, Dec("55"&Hex($colors[$avg_z[$i].index][0], 2)&Hex($colors[$avg_z[$i].index][1], 2)&Hex($colors[$avg_z[$i].index][2], 2)))
		_GDIPlus_PathReset($hPath)
		Dim $aPoints[UBound($faces, 2)+1][2]
		$aPoints[0][0]=UBound($faces, 2)
		For $j = 1 To UBound($aPoints)-1
			$aPoints[$j][0]=$t[$faces[$avg_z[$i].index][$j-1]].x
			$aPoints[$j][1]=$t[$faces[$avg_z[$i].index][$j-1]].y
			_GDIPlus_GraphicsFillEllipse($hGraphics2, $t[$faces[$avg_z[$i].index][$j-1]].x-2.5, $t[$faces[$avg_z[$i].index][$j-1]].y-2.5, 5, 5, $hBrush)
		Next

		_GDIPlus_PathAddPolygon($hPath, $aPoints)
		_GDIPlus_GraphicsFillPath($hGraphics2, $hPath, $hBrush)
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

Func avg_sort(ByRef $aArray)
	Local $i, $j, $tmp, $iLength = UBound($aArray, 1)-1
	For $i=0 To $iLength
		For $j=0 To $iLength-$i-1
			If ( ( $aArray[$j+1].z - $aArray[$j].z ) > 0 ) Then
				$tmp = $aArray[$j+1]
				$aArray[$j+1] = $aArray[$j]
				$aArray[$j] = $tmp
			EndIf
		Next
	Next
	Return

	Local $swapped
	Do
		$swapped = False
		For $i=0 To UBound($aArray, 1)-2 Step +1
			If ( ( $aArray[$i+1].z - $aArray[$i].z ) > 0 ) Then
				_ArraySwap($aArray, $i, $i+1)
				$swapped = True
			EndIf
		Next
	Until Not $swapped
EndFunc

Func _GDIPlus_PathAddPolygon2($hPath, $tPoints)
	Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipAddPathPolygon", "handle", $hPath, "struct*", $tPoints, "int", DllStructGetSize($tPoints)/4)
	If @error Then Return SetError(@error, @extended, False)
	If $aResult[0] Then Return SetError(10, $aResult[0], False)
	Return True
EndFunc