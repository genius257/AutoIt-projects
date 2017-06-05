#include-once

Global Const $HGLRC="PTR"

Global Const $tagGLYPHMETRICSFLOAT="FLOAT gmfBlackBoxX;FLOAT gmfBlackBoxY;FLOAT gmfptGlyphOriginX;FLOAT gmfptGlyphOriginY;FLOAT gmfCellIncX;FLOAT gmfCellIncY;";https://msdn.microsoft.com/en-us/library/dd374209(v=vs.85).aspx
Global Const $tagLAYERPLANEDESCRIPTOR="WORD nSize;WORD nVersion;DWORD dwFlags;BYTE iPixelType;BYTE cColorBits;BYTE cRedBits;BYTE cRedShift;BYTE cGreenBits;BYTE cGreenShift;BYTE cBlueBits;BYTE cBlueShift;BYTE cAlphaBits;BYTE cAlphaShift;BYTE cAccumBits;BYTE cAccumRedBits;BYTE cAccumGreenBits;BYTE cAccumBlueBits;BYTE cAccumAlphaBits;BYTE cDepthBits;BYTE cStencilBits;BYTE cAuxBuffers;BYTE iLayerType;BYTE bReserved;DWORD crTransparent;";https://msdn.microsoft.com/en-us/library/dd374244(v=vs.85).aspx
Global Const $tagPIXELFORMATDESCRIPTOR="WORD nSize;WORD nVersion;DWORD dwFlags;BYTE iPixelType;BYTE cColorBits;BYTE cRedBits;BYTE cRedShift;BYTE cGreenBits;BYTE cGreenShift;BYTE cBlueBits;BYTE cBlueShift;BYTE cAlphaBits;BYTE cAlphaShift;BYTE cAccumBits;BYTE cAccumRedBits;BYTE cAccumGreenBits;BYTE cAccumBlueBits;BYTE cAccumAlphaBits;BYTE cDepthBits;BYTE cStencilBits;BYTE cAuxBuffers;BYTE iLayerType;BYTE bReserved;DWORD dwLayerMask;DWORD dwVisibleMask;DWORD dwDamageMask;";https://msdn.microsoft.com/en-us/library/dd368826(v=vs.85).aspx
Global Const $tagPOINTFLOAT="FLOAT x;FLOAT y;";https://msdn.microsoft.com/en-us/library/dd368970(v=vs.85).aspx

;ChoosePixelFormat
;https://msdn.microsoft.com/en-us/library/dd318284(v=vs.85).aspx
Func ChoosePixelFormat($hdc,$ppfd)
	Local $a=DllCall("Gdi32.dll","INT","ChoosePixelFormat","PTR",$hdc,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;DescribePixelFormat
;https://msdn.microsoft.com/en-us/library/dd318302(v=vs.85).aspx
Func DescribePixelFormat($hdc,$iPixelFormat,$nBytes,$ppfd)
	Local $a=DllCall("Gdi32.dll","INT","DescribePixelFormat","PTR",$hdc,"INT",$iPixelFormat,"UINT",$nBytes,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;GetEnhMetaFilePixelFormat
;https://msdn.microsoft.com/en-us/library/dd318347(v=vs.85).aspx
Func GetEnhMetaFilePixelFormat($hemf,$cbBuffer,$ppfd)
	Local $a=DllCall("Gdi32.dll","UINT","GetEnhMetaFilePixelFormat","PTR",$hemf,"DWORD",$cbBuffer,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;GetPixelFormat
;https://msdn.microsoft.com/en-us/library/dd318349(v=vs.85).aspx
Func GetPixelFormat($hdc)
	Local $a=DllCall("Gdi32.dll","INT","GetPixelFormat","PTR",$hdc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;SetPixelFormat
;https://msdn.microsoft.com/en-us/library/dd369049(v=vs.85).aspx
Func SetPixelFormat($hdc,$iPixelFormat,$ppfd)
	Local $a=DllCall("Gdi32.dll","BOOLEAN","SetPixelFormat","PTR",$hdc,"INT",$iPixelFormat,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;SwapBuffers
;https://msdn.microsoft.com/en-us/library/dd369060(v=vs.85).aspx
Func SwapBuffers($hdc)
	Local $a=DllCall("Gdi32.dll","BOOLEAN","SwapBuffers","PTR",$hdc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc



;wglCreateContext
;https://msdn.microsoft.com/en-us/library/dd374379(v=vs.85).aspx
Func wglCreateContext($hdc)
	Local $a=DllCall("Opengl32.dll",$HGLRC,"wglCreateContext","PTR",$hdc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglCreateLayerContext
;https://msdn.microsoft.com/en-us/library/dd374380(v=vs.85).aspx
Func wglCreateLayerContext($hdc,$iLayerPlane)
	Local $a=DllCall("Opengl32.dll",$HGLRC,"wglCreateLayerContext","PTR",$hdc,"INT",$iLayerPlane)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglCopyContext
;https://msdn.microsoft.com/en-us/library/dd374378(v=vs.85).aspx
Func wglCopyContext($hglrcSrc,$hglrcDst,$mask)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglCopyContext",$HGLRC,$hglrcSrc,$HGLRC,$hglrcDst,"UINT",$mask)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglDeleteContext
;https://msdn.microsoft.com/en-us/library/dd374381(v=vs.85).aspx
Func wglDeleteContext($hglrc)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglDeleteContext",$HGLRC,$hglrc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglDescribeLayerPlane
;https://msdn.microsoft.com/en-us/library/dd374382(v=vs.85).aspx
Func wglDescribeLayerPlane($hdc,$iPixelFormat,$iLayerPlane,$nBytes,$plpd)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglDescribeLayerPlane","PTR",$hdc,"INT",$iPixelFormat,"INT",$iLayerPlane,"UINT",$nBytes,"PTR",$plpd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglGetCurrentContext
;https://msdn.microsoft.com/en-us/library/dd374383(v=vs.85).aspx
Func wglGetCurrentContext()
	Local $a=DllCall("Opengl32.dll",$HGLRC,"wglGetCurrentContext")
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglGetCurrentDC
;https://msdn.microsoft.com/en-us/library/dd374384(v=vs.85).aspx
Func wglGetCurrentDC()
	Local $a=DllCall("Opengl32.dll","PTR","wglGetCurrentDC")
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglGetLayerPaletteEntries
;https://msdn.microsoft.com/en-us/library/dd374385(v=vs.85).aspx
Func wglGetLayerPaletteEntries($hdc,$iLayerPlane,$iStart,$cEntries,$pcr)
	Local $a=DllCall("Opengl32.dll","INT","wglGetLayerPaletteEntries","PTR",$hdc,"INT",$iLayerPlane,"INT",$iStart,"INT",$cEntries,"PTR",$pcr)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglGetProcAddress
;https://msdn.microsoft.com/en-us/library/dd374386(v=vs.85).aspx
Func wglGetProcAddress($lpszProc)
	Local $a=DllCall("Opengl32.dll","PTR","wglGetProcAddress","STR",$lpszProc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglMakeCurrent
;https://msdn.microsoft.com/en-us/library/dd374387(v=vs.85).aspx
Func wglMakeCurrent($hdc,$hglrc)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglMakeCurrent","PTR",$hdc,$HGLRC,$hglrc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglRealizeLayerPalette
;https://msdn.microsoft.com/en-us/library/dd374388(v=vs.85).aspx
Func wglRealizeLayerPalette($hdc,$iLayerPlane,$bRealize)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglRealizeLayerPalette","PTR",$hdc,"INT",$iLayerPlane,"BOOLEAN",$bRealize)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglSetLayerPaletteEntries
;https://msdn.microsoft.com/en-us/library/dd374389(v=vs.85).aspx
Func wglSetLayerPaletteEntries($hdc,$iLayerPlane,$iStart,$cEntries,$pcr)
	Local $a=DllCall("Opengl32.dll","INT","wglSetLayerPaletteEntries","PTR",$hdc,"INT",$iLayerPlane,"INT",$iStart,"INT",$cEntries,"PTR",$pcr)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglShareLists
;https://msdn.microsoft.com/en-us/library/dd374390(v=vs.85).aspx
Func wglShareLists($hglrc1,$hglrc2)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglShareLists",$HGLRC,$hglrc1,$HGLRC,$hglrc2)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglSwapLayerBuffers
;https://msdn.microsoft.com/en-us/library/dd374391(v=vs.85).aspx
Func wglSwapLayerBuffers($hdc,$fuPlanes)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglSwapLayerBuffers","PTR",$hdc,"UINT",$fuPlanes)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglUseFontBitmaps
;https://msdn.microsoft.com/en-us/library/dd374392(v=vs.85).aspx
Func wglUseFontBitmaps($hdc,$first,$count,$listBase)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglUseFontBitmapsW","PTR",$hdc,"DWORD",$first,"DWORD",$count,"DWORD",$listBase)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc
;wglUseFontOutlines
;https://msdn.microsoft.com/en-us/library/dd374393(v=vs.85).aspx
Func wglUseFontOutlines($hdc,$first,$count,$listBase,$deviation,$extrusion,$format,$lpgmf)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglUseFontOutlinesW","PTR",$hdc,"DWORD",$first,"DWORD",$count,"DWORD",$listBase,"FLOAT",$deviation,"FLOAT",$extrusion,"INT",$format,"PTR",$lpgmf)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a[0]
EndFunc