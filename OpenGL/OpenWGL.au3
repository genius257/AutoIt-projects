#include-once

;pixel types
Global Const $PFD_TYPE_RGBA=0
Global Const $PFD_TYPE_COLORINDEX=1

;layer types
Global Const $PFD_MAIN_PLANE=0
Global Const $PFD_OVERLAY_PLANE=1
Global Const $PFD_UNDERLAY_PLANE=-1

;PIXELFORMATDESCRIPTOR flags
Global Const $PFD_DOUBLEBUFFER=0x00000001
Global Const $PFD_STEREO=0x00000002
Global Const $PFD_DRAW_TO_WINDOW=0x00000004
Global Const $PFD_DRAW_TO_BITMAP=0x00000008
Global Const $PFD_SUPPORT_GDI=0x00000010
Global Const $PFD_SUPPORT_OPENGL=0x00000020
Global Const $PFD_GENERIC_FORMAT=0x00000040
Global Const $PFD_NEED_PALETTE=0x00000080
Global Const $PFD_NEED_SYSTEM_PALETTE=0x00000100
Global Const $PFD_SWAP_EXCHANGE=0x00000200
Global Const $PFD_SWAP_COPY=0x00000400
Global Const $PFD_SWAP_LAYER_BUFFERS=0x00000800
Global Const $PFD_GENERIC_ACCELERATED=0x00001000
Global Const $PFD_SUPPORT_DIRECTDRAW=0x00002000

;PIXELFORMATDESCRIPTOR flags for use in ChoosePixelFormat only
Global Const $PFD_DEPTH_DONTCARE=0x20000000
Global Const $PFD_DOUBLEBUFFER_DONTCARE=0x40000000
Global Const $PFD_STEREO_DONTCARE=0x80000000

;LAYERPLANEDESCRIPTOR flags
Global Const $LPD_DOUBLEBUFFER=0x00000001
Global Const $LPD_STEREO=0x00000002
Global Const $LPD_SUPPORT_GDI=0x00000010
Global Const $LPD_SUPPORT_OPENGL=0x00000020
Global Const $LPD_SHARE_DEPTH=0x00000040
Global Const $LPD_SHARE_STENCIL=0x00000080
Global Const $LPD_SHARE_ACCUM=0x00000100
Global Const $LPD_SWAP_EXCHANGE=0x00000200
Global Const $LPD_SWAP_COPY=0x00000400
Global Const $LPD_TRANSPARENT=0x00001000

Global Const $LPD_TYPE_RGBA=0
Global Const $LPD_TYPE_COLORINDEX=1

;wglSwapLayerBuffers flags
Global Const $WGL_SWAP_MAIN_PLANE=0x00000001
Global Const $WGL_SWAP_OVERLAY1=0x00000002
Global Const $WGL_SWAP_OVERLAY2=0x00000004
Global Const $WGL_SWAP_OVERLAY3=0x00000008
Global Const $WGL_SWAP_OVERLAY4=0x00000010
Global Const $WGL_SWAP_OVERLAY5=0x00000020
Global Const $WGL_SWAP_OVERLAY6=0x00000040
Global Const $WGL_SWAP_OVERLAY7=0x00000080
Global Const $WGL_SWAP_OVERLAY8=0x00000100
Global Const $WGL_SWAP_OVERLAY9=0x00000200
Global Const $WGL_SWAP_OVERLAY10=0x00000400
Global Const $WGL_SWAP_OVERLAY11=0x00000800
Global Const $WGL_SWAP_OVERLAY12=0x00001000
Global Const $WGL_SWAP_OVERLAY13=0x00002000
Global Const $WGL_SWAP_OVERLAY14=0x00004000
Global Const $WGL_SWAP_OVERLAY15=0x00008000
Global Const $WGL_SWAP_UNDERLAY1=0x00010000
Global Const $WGL_SWAP_UNDERLAY2=0x00020000
Global Const $WGL_SWAP_UNDERLAY3=0x00040000
Global Const $WGL_SWAP_UNDERLAY4=0x00080000
Global Const $WGL_SWAP_UNDERLAY5=0x00100000
Global Const $WGL_SWAP_UNDERLAY6=0x00200000
Global Const $WGL_SWAP_UNDERLAY7=0x00400000
Global Const $WGL_SWAP_UNDERLAY8=0x00800000
Global Const $WGL_SWAP_UNDERLAY9=0x01000000
Global Const $WGL_SWAP_UNDERLAY10=0x02000000
Global Const $WGL_SWAP_UNDERLAY11=0x04000000
Global Const $WGL_SWAP_UNDERLAY12=0x08000000
Global Const $WGL_SWAP_UNDERLAY13=0x10000000
Global Const $WGL_SWAP_UNDERLAY14=0x20000000
Global Const $WGL_SWAP_UNDERLAY15=0x40000000

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
Func wglDeleteContext($_hglrc)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglDeleteContext",$HGLRC,$_hglrc)
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
Func wglMakeCurrent($hdc,$_hglrc)
	Local $a=DllCall("Opengl32.dll","BOOLEAN","wglMakeCurrent","PTR",$hdc,$HGLRC,$_hglrc)
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