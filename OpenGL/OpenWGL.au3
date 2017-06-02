;ChoosePixelFormat
;https://msdn.microsoft.com/en-us/library/dd318284(v=vs.85).aspx
Func ChoosePixelFormat($hdc,$ppfd)
	Local $a=DllCall("Gdi32.dll","INT","ChoosePixelFormat","PTR",$hdc,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc
;DescribePixelFormat
;https://msdn.microsoft.com/en-us/library/dd318302(v=vs.85).aspx
Func DescribePixelFormat($hdc,$iPixelFormat,$nBytes,$ppfd)
	Local $a=DllCall("Gdi32.dll","INT","DescribePixelFormat","PTR",$hdc,"INT",$iPixelFormat,"UINT",$nBytes,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc
;GetEnhMetaFilePixelFormat
;https://msdn.microsoft.com/en-us/library/dd318347(v=vs.85).aspx
Func GetEnhMetaFilePixelFormat($hemf,$cbBuffer,$ppfd)
	Local $a=DllCall("Gdi32.dll","UINT","GetEnhMetaFilePixelFormat","PTR",$hemf,"DWORD",$cbBuffer,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc
;GetPixelFormat
;https://msdn.microsoft.com/en-us/library/dd318349(v=vs.85).aspx
Func GetPixelFormat($hdc)
	Local $a=DllCall("Gdi32.dll","INT","GetPixelFormat","PTR",$hdc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc
;SetPixelFormat
;https://msdn.microsoft.com/en-us/library/dd369049(v=vs.85).aspx
Func SetPixelFormat($hdc,$iPixelFormat,$ppfd)
	Local $a=DllCall("Gdi32.dll","BOOLEAN","SetPixelFormat","PTR",$hdc,"INT",$iPixelFormat,"PTR",$ppfd)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc
;SwapBuffers
;https://msdn.microsoft.com/en-us/library/dd369060(v=vs.85).aspx
Func SwapBuffers($hdc)
	Local $a=DllCall("Gdi32.dll","BOOLEAN","SwapBuffers","PTR",$hdc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc



;wglCreateContext
;https://msdn.microsoft.com/en-us/library/dd374379(v=vs.85).aspx
Func wglCreateContext($hdc)
	Local $a=DllCall("Opengl32.dll",$HGLRC,"wglCreateContext","PTR",$hdc)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc
;wglCreateLayerContext
;https://msdn.microsoft.com/en-us/library/dd374380(v=vs.85).aspx
Func wglCreateLayerContext($hdc,$iLayerPlane)
	Local $a=DllCall("Opengl32.dll",$HGLRC,"wglCreateLayerContext","PTR",$hdc,"INT",$iLayerPlane)
	If @error<>0 Then Return SetError(@error,@extended,0)
	Return $a
EndFunc