#include <GDIPlus.au3>
#include <GDIP.au3>
#include <WinAPISys.au3>

$oSC = ObjCreate("ScriptControl")
ObjEvent($oSC, "_ScriptControl_")
$oSC.language = "JScript"

$oSC.addcode(FileRead("3D.js"))

$oSC.addcode('var o={"a":"1","b":"2","c":"3"},a={add:function(o,s,m){try{o[s]=m;}catch(e){return false;}return true;}},arr=["a","b","c"];')

$oSC.eval("Array.prototype.item = function(i){return this[i];}")

$a = $oSC.eval("a")
$o = $oSC.eval("o")
$arr = $oSC.eval("arr")

#cs
;~ $name = $oSC.eval("typeof o.constructor.name")
$name = $oSC.eval("typeof o")
$name = $oSC.eval("typeof lib.GetScriptEngineInfo")
;~ $name = $oSC.eval("typeof lib")
ConsoleWrite(VarGetType($name) & ": " &'"'&$name&'"' & @CRLF)
;~ ConsoleWrite('"'&$oSC.eval("o.constructor.name")&'"' & " " & $oSC.eval("JSON.stringify(o);") & @CRLF)

;~ ConsoleWrite( @TAB & $oSC.eval('(function(){var a = [];for(key in o){a.push(key+": "+o[key]);}return a.join("\n\t");})();') & @CRLF )
;~ ConsoleWrite( @TAB & $oSC.eval('(function(){var a = [];for(key in o){a.push(key);}return a.join("\n\t");})();') & @CRLF )

;~ ConsoleWrite($oSC.eval('Debug.writeln("test")') & @CRLF)
#ce

#cs
 source: http://codentronix.com/2011/05/10/html5-experiment-a-rotating-solid-cube/
#ce

;~ $vertices = $oSC.eval('[new Point3D(-1,1,-1),new Point3D(1,1,-1),new Point3D(1,-1,-1),new Point3D(-1,-1,-1),new Point3D(-1,1,1),new Point3D(1,1,1),new Point3D(1,-1,1),new Point3D(-1,-1,1)]')
;~ $vertices = $oSC.eval('[new Point3D(-1,1,1),new Point3D(1,1,1),new Point3D(1,1,-1),new Point3D(-1,1,-1),new Point3D(0,-0.5,0)]')
$vertices = $oSC.eval('[new Point3D(-1,-1,-1),new Point3D(1,-1,-1),new Point3D(1,0,-1),new Point3D(0,0,-1),new Point3D(0,1,-1),new Point3D(-1,1,-1),new Point3D(-1,1,0),new Point3D(-1,0,0),new Point3D(-1,0,1),new Point3D(-1,-1,1),new Point3D(0,-1,1),new Point3D(0,-1,0),new Point3D(1,-1,0)]')
;~ $faces = $oSC.eval('[[0,1,2,3],[1,5,6,2],[5,4,7,6],[4,0,3,7],[0,4,5,1],[3,2,6,7]]')
;~ $faces = $oSC.eval('[[0,1,2,3],[4,0,1],[4,1,2],[4,2,3],[4,3,0]]')
$faces = $oSC.eval('[[0,1,2,3,4,5],[5,6,7,8,9,0],[0,1,12,11,10,9],[4,5,6],[8,9,10],[12,1,2]]')
;~ $colors = $oSC.eval('[[255,0,0],[0,255,0],[0,0,255],[255,255,0],[0,255,255],[255,0,255]]')
;~ $colors = $oSC.eval('[[255,0,0],[0,255,0],[0,0,255],[255,255,0],[0,255,255]]')
$colors = $oSC.eval('[[255,0,0],[0,255,0],[0,0,255],[255,255,0],[0,255,255],[255,0,255]]')
;~ $angle = $oSC.eval('0')
$angle = $oSC.eval('0')

_GDIPlus_Startup()

Opt("GuiOnEventMode", 1)
$hWnd = GUICreate("3D", 400, 250)
GUISetState(@SW_SHOW, $hWnd)
GUISetOnEvent(-3, "_MyExit", $hWnd)
$hGraphicsHWnd = _GDIPlus_GraphicsCreateFromHWND($hWnd)

$hPath = _GDIPlus_PathCreate()
$hBitmap = _GDIPlus_BitmapCreateFromScan0(400, 250)
$hGraphics = _GDIPlus_ImageGetGraphicsContext($hBitmap)

$hImage = _GDIPlus_ImageLoadFromFile("1.png")

$hPen = _GDIPlus_PenCreate(0xFFFFFFFF)
$hBrush = _GDIPlus_BrushCreateSolid(0)

OnAutoItExitRegister("_CleanUp")

$avg_z_sort = $oSC.eval('new Function("a","b","return b.z - a.z;")')

_GDIPlus_GraphicsSetCompositingQuality($hGraphics, 1)
_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 1)
_GDIPlus_GraphicsSetSmoothingMode($hGraphics, 2)

$hFamily = _GDIPlus_FontFamilyCreate("Arial")
$hFont = _GDIPlus_FontCreate($hFamily, 12, 1, 2)
$tLayout = _GDIPlus_RectFCreate(0, 0, 200, 20)
$hFormat = _GDIPlus_StringFormatCreate()

Global $hTime = _WinAPI_GetTickCount()
Global $iFPS = 0
Global $iFrames = 0

While 1
	_GDIPlus_GraphicsClear($hGraphics, Dec("FF"&"00"&"00"&"00"))

	$t = $oSC.eval('new Array();')

	For $i=0 To $vertices.length-1
		$v = $vertices.item($i)
		$r = $v.rotateX($angle).rotateY($angle)
		$p = $r.project(400,250,200,4)
		$t.push($p)
	Next
	$avg_z = $oSC.eval('new Array();')
	For $i=0 To $faces.length-1
		$f = $faces.item($i)

		$a.add($avg_z, $i, $oSC.eval('new Object()'))

		$a.add($avg_z.item($i), "index", $oSC.eval($i))
		$a.add($avg_z.item($i), "z", ($t.item($f.item(0)).z + $t.item($f.item(1)).z + $t.item($f.item(2)).z + $t.item($f.item(3)).z) / 4.0)
	Next
	$avg_z.sort($avg_z_sort)
	For $i=0 To $faces.length-1
		$f = $faces.item($avg_z.item($i).index)
		_GDIPlus_PathReset($hPath)
		_GDIPlus_PathAddPolygon2($hPath, $t, $f)
		_GDIPlus_BrushSetSolidColor($hBrush, Dec("80" & Hex($colors.item($avg_z.item($i).index).item(0),2) & Hex($colors.item($avg_z.item($i).index).item(1),2) & Hex($colors.item($avg_z.item($i).index).item(2),2)))
		_GDIPlus_GraphicsFillPath($hGraphics, $hPath, $hBrush)
		_GDIPlus_GraphicsDrawPath($hGraphics, $hPath, $hPen)
	Next

	$iTime = _WinAPI_GetTickCount() - $hTime
	$iFrames+=1
	If $iTime>1000 Then
		$iFPS = ($iFrames/($iTime/1000))
		$hTime = _WinAPI_GetTickCount()
		$iFrames = 0
	EndIf

	_GDIPlus_BrushSetSolidColor($hBrush, 0xFF00FF00)
	_GDIPlus_GraphicsDrawStringEx($hGraphics, $iFPS, $hFont, $tLayout, $hFormat, $hBrush)

	$angle=Mod($angle+2, 361)
	_GDIPlus_GraphicsDrawImage($hGraphicsHWnd, $hBitmap, 0, 0)
WEnd

Func _CleanUp()
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphicsHWnd)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_ImageDispose($hBitmap)
	_GDIPlus_ImageDispose($hImage)

	_GDIPlus_Shutdown()
EndFunc

Func _MyExit()
	Exit
EndFunc

Func _ScriptControl_Error()
	Local $oError = $oSc.Error
	ConsoleWrite("ScriptControl Error"&@CRLF& _
	@TAB&"Column: "&$oError.Column&@CRLF& _
	@TAB&"Description: "&$oError.Description&@CRLF& _
	@TAB&"HelpContext: "&$oError.HelpContext&@CRLF& _
	@TAB&"HelpFile: "&$oError.HelpFile&@CRLF& _
	@TAB&"Line: "&$oError.Line&@CRLF& _
	@TAB&"Number: "&$oError.Number&@CRLF& _
	@TAB&"Source: "&$oError.Source&@CRLF& _
	@TAB&"Text: "&$oError.Text&@CRLF _
	)
	Return SetError($oError.Number, 0, 0)
EndFunc

Func _ScriptControl_Timeout()
	ConsoleWrite("ScriptControl Timeout"&@CRLF)
EndFunc

Func _GDIPlus_PathAddPolygon2($hPath, $t, $f)
	Local $iCount = $f.length
	Local $tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $t.item($f.item($iI-1)).x, (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $t.item($f.item($iI-1)).y, (($iI - 1) * 2) + 2)
	Next
	Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipAddPathPolygon", "handle", $hPath, "struct*", $tPoints, "int", $iCount)
	If @error Then Return SetError(@error, @extended, False)
	If $aResult[0] Then Return SetError(10, $aResult[0], False)

	Return True
EndFunc   ;==>_GDIPlus_PathAddPolygon2