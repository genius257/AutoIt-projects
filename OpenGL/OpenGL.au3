#include-once
#include <OpenWGL.au3>

#Region
Global Const $WIN32_LEAN_AND_MEAN=1

;Extensions
Global Const $GL_OES_VERSION_1_0=1
Global Const $GL_OES_read_format=1
Global Const $GL_OES_compressed_paletted_texture=1

;ClearBufferMask
Global Const $GL_DEPTH_BUFFER_BIT=0x00000100
Global Const $GL_STENCIL_BUFFER_BIT=0x00000400
Global Const $GL_COLOR_BUFFER_BIT=0x00004000

;Boolean
Global Const $GL_FALSE=0
Global Const $GL_TRUE=1

;BeginMode
Global Const $GL_POINTS=0x0000
Global Const $GL_LINES=0x0001
Global Const $GL_LINE_LOOP=0x0002
Global Const $GL_LINE_STRIP=0x0003
Global Const $GL_TRIANGLES=0x0004
Global Const $GL_TRIANGLE_STRIP=0x0005
Global Const $GL_TRIANGLE_FAN=0x0006

;AlphaFunction
Global Const $GL_NEVER=0x0200
Global Const $GL_LESS=0x0201
Global Const $GL_EQUAL=0x0202
Global Const $GL_LEQUAL=0x0203
Global Const $GL_GREATER=0x0204
Global Const $GL_NOTEQUAL=0x0205
Global Const $GL_GEQUAL=0x0206
Global Const $GL_ALWAYS=0x0207

;BlendingFactorDest
Global Const $GL_ZERO=0
Global Const $GL_ONE=1
Global Const $GL_SRC_COLOR=0x0300
Global Const $GL_ONE_MINUS_SRC_COLOR=0x0301
Global Const $GL_SRC_ALPHA=0x0302
Global Const $GL_ONE_MINUS_SRC_ALPHA=0x0303
Global Const $GL_DST_ALPHA=0x0304
Global Const $GL_ONE_MINUS_DST_ALPHA=0x0305

;BlendingFactorSrc
;	GL_ZERO
;	GL_ONE
Global Const $GL_DST_COLOR=0x0306
Global Const $GL_ONE_MINUS_DST_COLOR=0x0307
Global Const $GL_SRC_ALPHA_SATURATE=0x0308
;	GL_SRC_ALPHA
;	GL_ONE_MINUS_SRC_ALPHA
;	GL_DST_ALPHA
;	GL_ONE_MINUS_DST_ALPHA

;ColorMaterialFace
;	GL_FRONT_AND_BACK

;ColorMaterialParameter
;	GL_AMBIENT_AND_DIFFUSE

;ColorPointerType
;	GL_UNSIGNED_BYTE
;	GL_FLOAT
;	GL_FIXED

;CullFaceMode
Global Const $GL_FRONT=0x0404
Global Const $GL_BACK=0x0405
Global Const $GL_FRONT_AND_BACK=0x0408

;DepthFunction
;	GL_NEVER
;	GL_LESS
;	GL_EQUAL
;	GL_LEQUAL
;	GL_GREATER
;	GL_NOTEQUAL
;	GL_GEQUAL
;	GL_ALWAYS

;EnableCap
Global Const $GL_FOG=0x0B60
Global Const $GL_LIGHTING=0x0B50
Global Const $GL_TEXTURE_2D=0x0DE1
Global Const $GL_CULL_FACE=0x0B44
Global Const $GL_ALPHA_TEST=0x0BC0
Global Const $GL_BLEND=0x0BE2
Global Const $GL_COLOR_LOGIC_OP=0x0BF2
Global Const $GL_DITHER=0x0BD0
Global Const $GL_STENCIL_TEST=0x0B90
Global Const $GL_DEPTH_TEST=0x0B71
;	GL_LIGHT0
;	GL_LIGHT1
;	GL_LIGHT2
;	GL_LIGHT3
;	GL_LIGHT4
;	GL_LIGHT5
;	GL_LIGHT6
;	GL_LIGHT7
Global Const $GL_POINT_SMOOTH=0x0B10
Global Const $GL_LINE_SMOOTH=0x0B20
Global Const $GL_SCISSOR_TEST=0x0C11
Global Const $GL_COLOR_MATERIAL=0x0B57
Global Const $GL_NORMALIZE=0x0BA1
Global Const $GL_RESCALE_NORMAL=0x803A
Global Const $GL_POLYGON_OFFSET_FILL=0x8037
Global Const $GL_VERTEX_ARRAY=0x8074
Global Const $GL_NORMAL_ARRAY=0x8075
Global Const $GL_COLOR_ARRAY=0x8076
Global Const $GL_TEXTURE_COORD_ARRAY=0x8078
Global Const $GL_MULTISAMPLE=0x809D
Global Const $GL_SAMPLE_ALPHA_TO_COVERAGE=0x809E
Global Const $GL_SAMPLE_ALPHA_TO_ONE=0x809F
Global Const $GL_SAMPLE_COVERAGE=0x80A0

;ErrorCode
Global Const $GL_NO_ERROR=0
Global Const $GL_INVALID_ENUM=0x0500
Global Const $GL_INVALID_VALUE=0x0501
Global Const $GL_INVALID_OPERATION=0x0502
Global Const $GL_STACK_OVERFLOW=0x0503
Global Const $GL_STACK_UNDERFLOW=0x0504
Global Const $GL_OUT_OF_MEMORY=0x0505

;FogMode
;	GL_LINEAR
Global Const $GL_EXP=0x0800
Global Const $GL_EXP2=0x0801

;FogParameter
Global Const $GL_FOG_DENSITY=0x0B62
Global Const $GL_FOG_START=0x0B63
Global Const $GL_FOG_END=0x0B64
Global Const $GL_FOG_MODE=0x0B65
Global Const $GL_FOG_COLOR=0x0B66

;FrontFaceDirection
Global Const $GL_CW=0x0900
Global Const $GL_CCW=0x0901

;GetPName
Global Const $GL_SMOOTH_POINT_SIZE_RANGE=0x0B12
Global Const $GL_SMOOTH_LINE_WIDTH_RANGE=0x0B22
Global Const $GL_ALIASED_POINT_SIZE_RANGE=0x846D
Global Const $GL_ALIASED_LINE_WIDTH_RANGE=0x846E
Global Const $GL_IMPLEMENTATION_COLOR_READ_TYPE_OES=0x8B9A
Global Const $GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES=0x8B9B
Global Const $GL_MAX_LIGHTS=0x0D31
Global Const $GL_MAX_TEXTURE_SIZE=0x0D33
Global Const $GL_MAX_MODELVIEW_STACK_DEPTH=0x0D36
Global Const $GL_MAX_PROJECTION_STACK_DEPTH=0x0D38
Global Const $GL_MAX_TEXTURE_STACK_DEPTH=0x0D39
Global Const $GL_MAX_VIEWPORT_DIMS=0x0D3A
Global Const $GL_MAX_ELEMENTS_VERTICES=0x80E8
Global Const $GL_MAX_ELEMENTS_INDICES=0x80E9
Global Const $GL_MAX_TEXTURE_UNITS=0x84E2
Global Const $GL_NUM_COMPRESSED_TEXTURE_FORMATS=0x86A2
Global Const $GL_COMPRESSED_TEXTURE_FORMATS=0x86A3
Global Const $GL_SUBPIXEL_BITS=0x0D50
Global Const $GL_RED_BITS=0x0D52
Global Const $GL_GREEN_BITS=0x0D53
Global Const $GL_BLUE_BITS=0x0D54
Global Const $GL_ALPHA_BITS=0x0D55
Global Const $GL_DEPTH_BITS=0x0D56
Global Const $GL_STENCIL_BITS=0x0D57

;HintMode
Global Const $GL_DONT_CARE=0x1100
Global Const $GL_FASTEST=0x1101
Global Const $GL_NICEST=0x1102

;HintTarget
Global Const $GL_PERSPECTIVE_CORRECTION_HINT=0x0C50
Global Const $GL_POINT_SMOOTH_HINT=0x0C51
Global Const $GL_LINE_SMOOTH_HINT=0x0C52
Global Const $GL_POLYGON_SMOOTH_HINT=0x0C53
Global Const $GL_FOG_HINT=0x0C54

;LightModelParameter
Global Const $GL_LIGHT_MODEL_AMBIENT=0x0B53
Global Const $GL_LIGHT_MODEL_TWO_SIDE=0x0B52

;LightParameter
Global Const $GL_AMBIENT=0x1200
Global Const $GL_DIFFUSE=0x1201
Global Const $GL_SPECULAR=0x1202
Global Const $GL_POSITION=0x1203
Global Const $GL_SPOT_DIRECTION=0x1204
Global Const $GL_SPOT_EXPONENT=0x1205
Global Const $GL_SPOT_CUTOFF=0x1206
Global Const $GL_CONSTANT_ATTENUATION=0x1207
Global Const $GL_LINEAR_ATTENUATION=0x1208
Global Const $GL_QUADRATIC_ATTENUATION=0x1209

;DataType
Global Const $GL_BYTE=0x1400
Global Const $GL_UNSIGNED_BYTE=0x1401
Global Const $GL_SHORT=0x1402
Global Const $GL_UNSIGNED_SHORT=0x1403
Global Const $GL_FLOAT=0x1406
Global Const $GL_FIXED=0x140C

;LogicOp
Global Const $GL_CLEAR=0x1500
Global Const $GL_AND=0x1501
Global Const $GL_AND_REVERSE=0x1502
Global Const $GL_COPY=0x1503
Global Const $GL_AND_INVERTED=0x1504
Global Const $GL_NOOP=0x1505
Global Const $GL_XOR=0x1506
Global Const $GL_OR=0x1507
Global Const $GL_NOR=0x1508
Global Const $GL_EQUIV=0x1509
Global Const $GL_INVERT=0x150A
Global Const $GL_OR_REVERSE=0x150B
Global Const $GL_COPY_INVERTED=0x150C
Global Const $GL_OR_INVERTED=0x150D
Global Const $GL_NAND=0x150E
Global Const $GL_SET=0x150F

;MaterialFace
;	GL_FRONT_AND_BACK

;MaterialParameter
Global Const $GL_EMISSION=0x1600
Global Const $GL_SHININESS=0x1601
Global Const $GL_AMBIENT_AND_DIFFUSE=0x1602
;	GL_AMBIENT
;	GL_DIFFUSE
;	GL_SPECULAR

;MatrixMode
Global Const $GL_MODELVIEW=0x1700
Global Const $GL_PROJECTION=0x1701
Global Const $GL_TEXTURE=0x1702

;NormalPointerType
;	GL_BYTE
;	GL_SHORT
;	GL_FLOAT
;	GL_FIXED

;PixelFormat
Global Const $GL_ALPHA=0x1906
Global Const $GL_RGB=0x1907
Global Const $GL_RGBA=0x1908
Global Const $GL_LUMINANCE=0x1909
Global Const $GL_LUMINANCE_ALPHA=0x190A

;PixelStoreParameter
Global Const $GL_UNPACK_ALIGNMENT=0x0CF5
Global Const $GL_PACK_ALIGNMENT=0x0D05

;PixelType
;	GL_UNSIGNED_BYTE
Global Const $GL_UNSIGNED_SHORT_4_4_4_4=0x8033
Global Const $GL_UNSIGNED_SHORT_5_5_5_1=0x8034
Global Const $GL_UNSIGNED_SHORT_5_6_5=0x8363

;ShadingModel
Global Const $GL_FLAT=0x1D00
Global Const $GL_SMOOTH=0x1D01

;StencilFunction
;	GL_NEVER
;	GL_LESS
;	GL_EQUAL
;	GL_LEQUAL
;	GL_GREATER
;	GL_NOTEQUAL
;	GL_GEQUAL
;	GL_ALWAYS

;StencilOp
;	GL_ZERO
Global Const $GL_KEEP=0x1E00
Global Const $GL_REPLACE=0x1E01
Global Const $GL_INCR=0x1E02
Global Const $GL_DECR=0x1E03
;	GL_INVERT

;StringName
Global Const $GL_VENDOR=0x1F00
Global Const $GL_RENDERER=0x1F01
Global Const $GL_VERSION=0x1F02
Global Const $GL_EXTENSIONS=0x1F03

;TexCoordPointerType
;	GL_SHORT
;	GL_FLOAT
;	GL_FIXED
;	GL_BYTE

;TextureEnvMode
Global Const $GL_MODULATE=0x2100
Global Const $GL_DECAL=0x2101
;	GL_BLEND
Global Const $GL_ADD=0x0104
;	GL_REPLACE

;TextureEnvParameter
Global Const $GL_TEXTURE_ENV_MODE=0x2200
Global Const $GL_TEXTURE_ENV_COLOR=0x2201

;TextureEnvTarget
Global Const $GL_TEXTURE_ENV=0x2300

;TextureMagFilter
Global Const $GL_NEAREST=0x2600
Global Const $GL_LINEAR=0x2601

;TextureMinFilter
;	GL_NEAREST
;	GL_LINEAR
Global Const $GL_NEAREST_MIPMAP_NEAREST=0x2700
Global Const $GL_LINEAR_MIPMAP_NEAREST=0x2701
Global Const $GL_NEAREST_MIPMAP_LINEAR=0x2702
Global Const $GL_LINEAR_MIPMAP_LINEAR=0x2703

;TextureParameterName
Global Const $GL_TEXTURE_MAG_FILTER=0x2800
Global Const $GL_TEXTURE_MIN_FILTER=0x2801
Global Const $GL_TEXTURE_WRAP_S=0x2802
Global Const $GL_TEXTURE_WRAP_T=0x2803

;TextureTarget
;	GL_TEXTURE_2D

;TextureUnit
Global Const $GL_TEXTURE0=0x84C0
Global Const $GL_TEXTURE1=0x84C1
Global Const $GL_TEXTURE2=0x84C2
Global Const $GL_TEXTURE3=0x84C3
Global Const $GL_TEXTURE4=0x84C4
Global Const $GL_TEXTURE5=0x84C5
Global Const $GL_TEXTURE6=0x84C6
Global Const $GL_TEXTURE7=0x84C7
Global Const $GL_TEXTURE8=0x84C8
Global Const $GL_TEXTURE9=0x84C9
Global Const $GL_TEXTURE10=0x84CA
Global Const $GL_TEXTURE11=0x84CB
Global Const $GL_TEXTURE12=0x84CC
Global Const $GL_TEXTURE13=0x84CD
Global Const $GL_TEXTURE14=0x84CE
Global Const $GL_TEXTURE15=0x84CF
Global Const $GL_TEXTURE16=0x84D0
Global Const $GL_TEXTURE17=0x84D1
Global Const $GL_TEXTURE18=0x84D2
Global Const $GL_TEXTURE19=0x84D3
Global Const $GL_TEXTURE20=0x84D4
Global Const $GL_TEXTURE21=0x84D5
Global Const $GL_TEXTURE22=0x84D6
Global Const $GL_TEXTURE23=0x84D7
Global Const $GL_TEXTURE24=0x84D8
Global Const $GL_TEXTURE25=0x84D9
Global Const $GL_TEXTURE26=0x84DA
Global Const $GL_TEXTURE27=0x84DB
Global Const $GL_TEXTURE28=0x84DC
Global Const $GL_TEXTURE29=0x84DD
Global Const $GL_TEXTURE30=0x84DE
Global Const $GL_TEXTURE31=0x84DF

;TextureWrapMode
Global Const $GL_REPEAT=0x2901
Global Const $GL_CLAMP_TO_EDGE=0x812F

;PixelInternalFormat
Global Const $GL_PALETTE4_RGB8_OES=0x8B90
Global Const $GL_PALETTE4_RGBA8_OES=0x8B91
Global Const $GL_PALETTE4_R5_G6_B5_OES=0x8B92
Global Const $GL_PALETTE4_RGBA4_OES=0x8B93
Global Const $GL_PALETTE4_RGB5_A1_OES=0x8B94
Global Const $GL_PALETTE8_RGB8_OES=0x8B95
Global Const $GL_PALETTE8_RGBA8_OES=0x8B96
Global Const $GL_PALETTE8_R5_G6_B5_OES=0x8B97
Global Const $GL_PALETTE8_RGBA4_OES=0x8B98
Global Const $GL_PALETTE8_RGB5_A1_OES=0x8B99

;VertexPointerType
;	GL_SHORT
;	GL_FLOAT
;	GL_FIXED
;	GL_BYTE

;LightName
Global Const $GL_LIGHT0=0x4000
Global Const $GL_LIGHT1=0x4001
Global Const $GL_LIGHT2=0x4002
Global Const $GL_LIGHT3=0x4003
Global Const $GL_LIGHT4=0x4004
Global Const $GL_LIGHT5=0x4005
Global Const $GL_LIGHT6=0x4006
Global Const $GL_LIGHT7=0x4007

Global Const $GLenum="UINT"
Global Const $GLboolean="BYTE"
Global Const $GLbitfield="UINT"
Global Const $GLshort="SHORT"
Global Const $GLint="INT"
Global Const $GLsizei="INT"
Global Const $GLubyte="BYTE"
Global Const $GLushort="USHORT"
Global Const $GLuint="UINT"
Global Const $GLfloat="FLOAT"
Global Const $GLclampf="FLOAT"
Global Const $GLvoid="NONE"
Global Const $GLintptrARB="INT"
Global Const $GLsizeiptrARB="INT"
Global Const $GLfixed="INT"
Global Const $GLclampx="INT"
#EndRegion

Global Const $GL_WIN_swap_hint=1
Global Const $GL_DLL = "Opengl32.dll"
Global Const $GLbyte = "BYTE";ATTENTION! GLbyte is signed, whereas AutoIt only works with unsigned 8bit integers. Keep this in mind, when sending and retriving data of this type
Global Const $GLdouble = "DOUBLE"
Global Const $GLclampd = "DOUBLE"
;~ Global Const $void = "NONE"

;glAccum
;https://msdn.microsoft.com/en-us/library/dd318351(v=vs.85).aspx
Func glAccum($op,$value)
	DllCall("Opengl32.dll","NONE","glAccum",$GLenum,$op,$GLfloat,$value)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glAddSwapHintRectWIN
;https://msdn.microsoft.com/en-us/library/dd318352(v=vs.85).aspx
Func glAddSwapHintRectWIN($x,$y,$width,$height)
;~ 	DllCall("Gl.h","NONE","glAddSwapHintRectWIN",$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height)
	If Not (glGetString($GL_EXTENSIONS) == $GL_WIN_swap_hint) Then Return SetError(1, 1, 0)
	$pProc = wglGetProcAddress("glAddSwapHintRectWIN")
	DllCallAddress("NONE",$pProc,$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glAlphaFunc
;https://msdn.microsoft.com/en-us/library/dd318354(v=vs.85).aspx
Func glAlphaFunc($func,$ref)
	DllCall("Opengl32.dll","NONE","glAlphaFunc",$GLenum,$func,$GLclampf,$ref)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glAreTexturesResident
;https://msdn.microsoft.com/en-us/library/dd318356(v=vs.85).aspx
Func glAreTexturesResident($n,$textures,$residences)
	Local $a=DllCall("Opengl32.dll",$GLboolean,"glAreTexturesResident",$GLsizei,$n,"PTR",$textures,"PTR",$residences)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glArrayElement
;https://msdn.microsoft.com/en-us/library/dd318359(v=vs.85).aspx
Func glArrayElement($index)
	DllCall("Opengl32.dll","NONE","glArrayElement",$GLint,$index)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glBegin, glEnd
;https://msdn.microsoft.com/en-us/library/dd318361(v=vs.85).aspx
Func glBegin($mode)
	DllCall("Opengl32.dll","NONE","glBegin",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glBindTexture
;https://msdn.microsoft.com/en-us/library/dd318364(v=vs.85).aspx
Func glBindTexture($target,$texture)
	DllCall("Opengl32.dll","NONE","glBindTexture",$GLenum,$target,$GLuint,$texture)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glBitmap
;https://msdn.microsoft.com/en-us/library/dd318365(v=vs.85).aspx
Func glBitmap($width,$height,$xorig,$yorig,$xmove,$ymove,$bitmap)
	DllCall("Opengl32.dll","NONE","glBitmap",$GLSizei,$width,$GLSizei,$height,$GLfloat,$xorig,$GLfloat,$yorig,$GLfloat,$xmove,$GLfloat,$ymove,"PTR",$bitmap)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glBlendFunc
;https://msdn.microsoft.com/en-us/library/dd318368(v=vs.85).aspx
Func glBlendFunc($sfactor,$dfactor)
	DllCall("Opengl32.dll","NONE","glBlendFunc",$GLenum,$sfactor,$GLenum,$dfactor)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCallList
;https://msdn.microsoft.com/en-us/library/dd318369(v=vs.85).aspx
Func glCallList($list)
	DllCall("Opengl32.dll","NONE","glCallList",$GLuint,$list)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCallLists
;https://msdn.microsoft.com/en-us/library/dd318371(v=vs.85).aspx
Func glCallLists($n,$type,$lists)
	DllCall("Opengl32.dll","NONE","glCallLists",$GLsizei,$n,$GLenum,$type,"PTR",$lists)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClear
;https://msdn.microsoft.com/en-us/library/dd318372(v=vs.85).aspx
Func glClear($mask)
	DllCall("Opengl32.dll","NONE","glClear",$GLbitfield,$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClearAccum
;https://msdn.microsoft.com/en-us/library/dd318375(v=vs.85).aspx
Func glClearAccum($red,$green,$blue,$alpha)
	DllCall("Opengl32.dll","NONE","glClearAccum",$GLfloat,$red,$GLfloat,$green,$GLfloat,$blue,$GLfloat,$alpha)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClearColor
;https://msdn.microsoft.com/en-us/library/dd318377(v=vs.85).aspx
Func glClearColor($red,$green,$blue,$alpha)
	DllCall("Opengl32.dll","NONE","glClearColor",$GLclampf,$red,$GLclampf,$green,$GLclampf,$blue,$GLclampf,$alpha)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClearDepth
;https://msdn.microsoft.com/en-us/library/dd318381(v=vs.85).aspx
Func glClearDepth($depth)
	DllCall("Opengl32.dll","NONE","glClearDepth",$GLclampd,$depth)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClearIndex
;https://msdn.microsoft.com/en-us/library/dd318383(v=vs.85).aspx
Func glClearIndex($c)
	DllCall("Opengl32.dll","NONE","glClearIndex",$GLfloat,$c)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClearStencil
;https://msdn.microsoft.com/en-us/library/dd318385(v=vs.85).aspx
Func glClearStencil($s)
	DllCall("Opengl32.dll","NONE","glClearStencil",$GLint,$s)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glClipPlane
;https://msdn.microsoft.com/en-us/library/dd318387(v=vs.85).aspx
Func glClipPlane($plane,$equation)
	DllCall("Opengl32.dll","NONE","glClipPlane",$GLenum,$plane,"PTR",$equation)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glColor functions
;https://msdn.microsoft.com/en-us/library/dd318816(v=vs.85).aspx
	;glColor3b
	;https://msdn.microsoft.com/en-us/library/dd318390(v=vs.85).aspx
	Func glColor3b($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3b",$GLbyte,$red,$GLbyte,$green,$GLbyte,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3d
	;https://msdn.microsoft.com/en-us/library/dd318396(v=vs.85).aspx
	Func glColor3d($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3d",$GLdouble,$red,$GLdouble,$green,$GLdouble,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3f
	;https://msdn.microsoft.com/en-us/library/dd318399(v=vs.85).aspx
	Func glColor3f($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3f",$GLfloat,$red,$GLfloat,$green,$GLfloat,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3i
	;https://msdn.microsoft.com/en-us/library/dd318403(v=vs.85).aspx
	Func glColor3i($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3i",$GLint,$red,$GLint,$green,$GLint,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3s
	;https://msdn.microsoft.com/en-us/library/dd318406(v=vs.85).aspx
	Func glColor3s($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3s",$GLshort,$red,$GLshort,$green,$GLshort,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3ub
	;https://msdn.microsoft.com/en-us/library/dd318410(v=vs.85).aspx
	Func glColor3ub($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3ub",$GLubyte,$red,$GLubyte,$green,$GLubyte,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3ui
	;https://msdn.microsoft.com/en-us/library/dd318413(v=vs.85).aspx
	Func glColor3ui($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3ui",$GLuint,$red,$GLuint,$green,$GLuint,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3us
	;https://msdn.microsoft.com/en-us/library/dd318418(v=vs.85).aspx
	Func glColor3us($red,$green,$blue)
		DllCall("Opengl32.dll","NONE","glColor3us",$GLushort,$red,$GLushort,$green,$GLushort,$blue)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4b
	;https://msdn.microsoft.com/en-us/library/dd318421(v=vs.85).aspx
	Func glColor4b($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4b",$GLbyte,$red,$GLbyte,$green,$GLbyte,$blue,$GLbyte,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4d
	;https://msdn.microsoft.com/en-us/library/dd318425(v=vs.85).aspx
	Func glColor4d($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4d",$GLdouble,$red,$GLdouble,$green,$GLdouble,$blue,$GLdouble,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4f
	;https://msdn.microsoft.com/en-us/library/dd318429(v=vs.85).aspx
	Func glColor4f($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4f",$GLfloat,$red,$GLfloat,$green,$GLfloat,$blue,$GLfloat,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4i
	;https://msdn.microsoft.com/en-us/library/dd318432(v=vs.85).aspx
	Func glColor4i($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4i",$GLint,$red,$GLint,$green,$GLint,$blue,$GLint,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4s
	;https://msdn.microsoft.com/en-us/library/dd318436(v=vs.85).aspx
	Func glColor4s($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4s",$GLshort,$red,$GLshort,$green,$GLshort,$blue,$GLshort,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4ub
	;https://msdn.microsoft.com/en-us/library/dd318440(v=vs.85).aspx
	Func glColor4ub($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4ub",$GLubyte,$red,$GLubyte,$green,$GLubyte,$blue,$GLubyte,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4ui
	;https://msdn.microsoft.com/en-us/library/dd318442(v=vs.85).aspx
	Func glColor4ui($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4ui",$GLuint,$red,$GLuint,$green,$GLuint,$blue,$GLuint,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4us
	;https://msdn.microsoft.com/en-us/library/dd318802(v=vs.85).aspx
	Func glColor4us($red,$green,$blue,$alpha)
		DllCall("Opengl32.dll","NONE","glColor4us",$GLushort,$red,$GLushort,$green,$GLushort,$blue,$GLushort,$alpha)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3bv
	;https://msdn.microsoft.com/en-us/library/dd318393(v=vs.85).aspx
	Func glColor3bv($v)
		DllCall("Opengl32.dll","NONE","glColor3bv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3dv
	;https://msdn.microsoft.com/en-us/library/dd318398(v=vs.85).aspx
	Func glColor3dv($v)
		DllCall("Opengl32.dll","NONE","glColor3dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3fv
	;https://msdn.microsoft.com/en-us/library/dd318401(v=vs.85).aspx
	Func glColor3fv($v)
		DllCall("Opengl32.dll","NONE","glColor3fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3iv
	;https://msdn.microsoft.com/en-us/library/dd318404(v=vs.85).aspx
	Func glColor3iv($v)
		DllCall("Opengl32.dll","NONE","glColor3iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3sv
	;https://msdn.microsoft.com/en-us/library/dd318408(v=vs.85).aspx
	Func glColor3sv($v)
		DllCall("Opengl32.dll","NONE","glColor3sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3ubv
	;https://msdn.microsoft.com/en-us/library/dd318411(v=vs.85).aspx
	Func glColor3ubv($v)
		DllCall("Opengl32.dll","NONE","glColor3ubv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3uiv
	;https://msdn.microsoft.com/en-us/library/dd318416(v=vs.85).aspx
	Func glColor3uiv($v)
		DllCall("Opengl32.dll","NONE","glColor3uiv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor3usv
	;https://msdn.microsoft.com/en-us/library/dd318419(v=vs.85).aspx
	Func glColor3usv($v)
		DllCall("Opengl32.dll","NONE","glColor3usv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4bv
	;https://msdn.microsoft.com/en-us/library/dd318424(v=vs.85).aspx
	Func glColor4bv($v)
		DllCall("Opengl32.dll","NONE","glColor4bv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4dv
	;https://msdn.microsoft.com/en-us/library/dd318427(v=vs.85).aspx
	Func glColor4dv($v)
		DllCall("Opengl32.dll","NONE","glColor4dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4fv
	;https://msdn.microsoft.com/en-us/library/dd318430(v=vs.85).aspx
	Func glColor4fv($v)
		DllCall("Opengl32.dll","NONE","glColor4fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4iv
	;https://msdn.microsoft.com/en-us/library/dd318434(v=vs.85).aspx
	Func glColor4iv($v)
		DllCall("Opengl32.dll","NONE","glColor4iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4sv
	;https://msdn.microsoft.com/en-us/library/dd318438(v=vs.85).aspx
	Func glColor4sv($v)
		DllCall("Opengl32.dll","NONE","glColor4sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4ubv
	;https://msdn.microsoft.com/en-us/library/dd318441(v=vs.85).aspx
	Func glColor4ubv($v)
		DllCall("Opengl32.dll","NONE","glColor4ubv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4uiv
	;https://msdn.microsoft.com/en-us/library/dd318800(v=vs.85).aspx
	Func glColor4uiv($v)
		DllCall("Opengl32.dll","NONE","glColor4uiv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glColor4usv
	;https://msdn.microsoft.com/en-us/library/dd318804(v=vs.85).aspx
	Func glColor4usv($v)
		DllCall("Opengl32.dll","NONE","glColor4usv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glColorMask
;https://msdn.microsoft.com/en-us/library/dd318807(v=vs.85).aspx
Func glColorMask($red,$green,$blue,$alpha)
	DllCall("Opengl32.dll","NONE","glColorMask",$GLboolean,$red,$GLboolean,$green,$GLboolean,$blue,$GLboolean,$alpha)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glColorMaterial
;https://msdn.microsoft.com/en-us/library/dd318809(v=vs.85).aspx
Func glColorMaterial($face,$mode)
	DllCall("Opengl32.dll","NONE","glColorMaterial",$GLenum,$face,$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glColorPointer
;https://msdn.microsoft.com/en-us/library/dd318811(v=vs.85).aspx
Func glColorPointer($size,$type,$stride,$pointer)
	DllCall("Opengl32.dll","NONE","glColorPointer",$GLint,$size,$GLenum,$type,$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glColorTableEXT
;https://msdn.microsoft.com/en-us/library/dd318814(v=vs.85).aspx
Func glColorTableEXT($target,$internalFormat,$width,$format,$type,$data)
	DllCall("Gl.h","NONE","glColorTableEXT",$GLenum,$target,$GLenum,$internalFormat,$GLsizei,$width,$GLenum,$format,$GLenum,$type,"PTR",$data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glColorSubTableEXT
;https://msdn.microsoft.com/en-us/library/dd318812(v=vs.85).aspx
Func glColorSubTableEXT($target,$start,$count,$format,$type,$data)
	DllCall("Gl.h","NONE","glColorSubTableEXT",$GLenum,$target,$GLsizei,$start,$GLsizei,$count,$GLenum,$format,$GLenum,$type,"PTR",$data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCopyPixels
;https://msdn.microsoft.com/en-us/library/dd318818(v=vs.85).aspx
Func glCopyPixels($x,$y,$width,$height,$type)
	DllCall("Opengl32.dll","NONE","glCopyPixels",$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height,$GLenum,$type)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCopyTexImage1D
;https://msdn.microsoft.com/en-us/library/dd318821(v=vs.85).aspx
Func glCopyTexImage1D($target,$level,$internalFormat,$x,$y,$width,$border)
	DllCall("Opengl32.dll","NONE","glCopyTexImage1D",$GLenum,$target,$GLint,$level,$GLenum,$internalFormat,$GLint,$x,$GLint,$y,$GLsizei,$width,$GLint,$border)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCopyTexImage2D
;https://msdn.microsoft.com/en-us/library/dd318822(v=vs.85).aspx
Func glCopyTexImage2D($target,$level,$internalFormat,$x,$y,$width,$height,$border)
	DllCall("Opengl32.dll","NONE","glCopyTexImage2D",$GLenum,$target,$GLint,$level,$GLenum,$internalFormat,$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height,$GLint,$border)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCopyTexSubImage1D
;https://msdn.microsoft.com/en-us/library/dd318824(v=vs.85).aspx
Func glCopyTexSubImage1D($target,$level,$xoffset,$x,$y,$width)
	DllCall("Opengl32.dll","NONE","glCopyTexSubImage1D",$GLenum,$target,$GLint,$level,$GLint,$xoffset,$GLint,$x,$GLint,$y,$GLsizei,$width)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCopyTexSubImage2D
;https://msdn.microsoft.com/en-us/library/dd318826(v=vs.85).aspx
Func glCopyTexSubImage2D($target,$level,$xoffset,$yoffset,$x,$y,$width,$height)
	DllCall("Opengl32.dll","NONE","glCopyTexSubImage2D",$GLenum,$target,$GLint,$level,$GLint,$xoffset,$GLint,$yoffset,$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glCullFace
;https://msdn.microsoft.com/en-us/library/dd318828(v=vs.85).aspx
Func glCullFace($mode)
	DllCall("Opengl32.dll","NONE","glCullFace",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDeleteLists
;https://msdn.microsoft.com/en-us/library/dd318830(v=vs.85).aspx
Func glDeleteLists($list,$range)
	DllCall("Opengl32.dll","NONE","glDeleteLists",$GLuint,$list,$GLsizei,$range)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDeleteTextures
;https://msdn.microsoft.com/en-us/library/dd318831(v=vs.85).aspx
Func glDeleteTextures($n,$textures)
	DllCall("Opengl32.dll","NONE","glDeleteTextures",$GLsizei,$n,"PTR",$textures)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDepthFunc
;https://msdn.microsoft.com/en-us/library/dd318832(v=vs.85).aspx
Func glDepthFunc($func)
	DllCall("Opengl32.dll","NONE","glDepthFunc",$GLenum,$func)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDepthMask
;https://msdn.microsoft.com/en-us/library/dd318833(v=vs.85).aspx
Func glDepthMask($flag)
	DllCall("Opengl32.dll","NONE","glDepthMask",$GLboolean,$flag)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDepthRange
;https://msdn.microsoft.com/en-us/library/dd318834(v=vs.85).aspx
Func glDepthRange($zNear,$zFar)
	DllCall("Opengl32.dll","NONE","glDepthRange",$GLclampd,$zNear,$GLclampd,$zFar)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDrawArrays
;https://msdn.microsoft.com/en-us/library/dd318837(v=vs.85).aspx
Func glDrawArrays($mode,$first,$count)
	DllCall("Opengl32.dll","NONE","glDrawArrays",$GLenum,$mode,$GLint,$first,$GLsizei,$count)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDrawBuffer
;https://msdn.microsoft.com/en-us/library/dd318838(v=vs.85).aspx
Func glDrawBuffer($mode)
	DllCall("Opengl32.dll","NONE","glDrawBuffer",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDrawElements
;https://msdn.microsoft.com/en-us/library/dd318839(v=vs.85).aspx
Func glDrawElements($mode,$count,$type,$indices)
	DllCall("Opengl32.dll","NONE","glDrawElements",$GLenum,$mode,$GLsizei,$count,$GLenum,$type,"PTR",$indices)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDrawPixels
;https://msdn.microsoft.com/en-us/library/dd318840(v=vs.85).aspx
Func glDrawPixels($width,$height,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glDrawPixels",$GLsizei,$width,$GLsizei,$height,$GLenum,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glEdgeFlag functions
;https://msdn.microsoft.com/en-us/library/dd318844(v=vs.85).aspx
	;glEdgeFlag
	;https://msdn.microsoft.com/en-us/library/dd318841(v=vs.85).aspx
	Func glEdgeFlag($flag)
		DllCall("Opengl32.dll","NONE","glEdgeFlag",$GLboolean,$flag)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEdgeFlagv
	;https://msdn.microsoft.com/en-us/library/dd318843(v=vs.85).aspx
	Func glEdgeFlagv($flag)
		DllCall("Opengl32.dll","NONE","glEdgeFlagv","PTR",$flag)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glEdgeFlagPointer
;https://msdn.microsoft.com/en-us/library/dd318842(v=vs.85).aspx
Func glEdgeFlagPointer($stride,$pointer)
	DllCall("Opengl32.dll","NONE","glEdgeFlagPointer",$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glEnable, glDisable
;https://msdn.microsoft.com/en-us/library/dd318845(v=vs.85).aspx
Func glEnable($cap)
	DllCall("Opengl32.dll","NONE","glEnable",$GLenum,$cap)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glEnableClientState
;https://msdn.microsoft.com/en-us/library/dd318846(v=vs.85).aspx
Func glEnableClientState($array)
	DllCall("Opengl32.dll","NONE","glEnableClientState",$GLenum,$array)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glDisableClientState
;https://msdn.microsoft.com/en-us/library/dd318836(v=vs.85).aspx
Func glDisableClientState($array)
	DllCall("Opengl32.dll","NONE","glDisableClientState",$GLenum,$array)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glEvalCoord functions
;https://msdn.microsoft.com/en-us/library/dd373527(v=vs.85).aspx
	;glEvalCoord1d
	;https://msdn.microsoft.com/en-us/library/dd318851(v=vs.85).aspx
	Func glEvalCoord1d($u)
		DllCall("Opengl32.dll","NONE","glEvalCoord1d",$GLdouble,$u)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord1f
	;https://msdn.microsoft.com/en-us/library/dd318853(v=vs.85).aspx
	Func glEvalCoord1f($u)
		DllCall("Opengl32.dll","NONE","glEvalCoord1f",$GLfloat,$u)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord2d
	;https://msdn.microsoft.com/en-us/library/dd318855(v=vs.85).aspx
	Func glEvalCoord2d($u,$v)
		DllCall("Opengl32.dll","NONE","glEvalCoord2d",$GLdouble,$u,$GLdouble,$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord2f
	;https://msdn.microsoft.com/en-us/library/dd373525(v=vs.85).aspx
	Func glEvalCoord2f($u,$v)
		DllCall("Opengl32.dll","NONE","glEvalCoord2f",$GLfloat,$u,$GLfloat,$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord1dv
	;https://msdn.microsoft.com/en-us/library/dd318852(v=vs.85).aspx
	Func glEvalCoord1dv($u)
		DllCall("Opengl32.dll","NONE","glEvalCoord1dv","PTR",$u)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord2dv
	;https://msdn.microsoft.com/en-us/library/dd373524(v=vs.85).aspx
	Func glEvalCoord2dv($u)
		DllCall("Opengl32.dll","NONE","glEvalCoord2dv","PTR",$u)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord1fv
	;https://msdn.microsoft.com/en-us/library/dd318854(v=vs.85).aspx
	Func glEvalCoord1fv($u)
		DllCall("Opengl32.dll","NONE","glEvalCoord1fv","PTR",$u)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalCoord2fv
	;https://msdn.microsoft.com/en-us/library/dd373526(v=vs.85).aspx
	Func glEvalCoord2fv($u)
		DllCall("Opengl32.dll","NONE","glEvalCoord2fv","PTR",$u)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glEvalMesh functions
;https://msdn.microsoft.com/en-us/library/dd373530(v=vs.85).aspx
	;glEvalMesh1
	;https://msdn.microsoft.com/en-us/library/dd373528(v=vs.85).aspx
	Func glEvalMesh1($mode,$i1,$i2)
		DllCall("Opengl32.dll","NONE","glEvalMesh1",$GLenum,$mode,$GLint,$i1,$GLint,$i2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalMesh2
	;https://msdn.microsoft.com/en-us/library/dd373529(v=vs.85).aspx
	Func glEvalMesh2($mode,$i1,$i2,$j1,$j2)
		DllCall("Opengl32.dll","NONE","glEvalMesh2",$GLenum,$mode,$GLint,$i1,$GLint,$i2,$GLint,$j1,$GLint,$j2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glEvalPoint functions
;https://msdn.microsoft.com/en-us/library/dd373531(v=vs.85).aspx
	;glEvalPoint1
	;https://msdn.microsoft.com/en-us/library/ee872018(v=vs.85).aspx
	Func glEvalPoint1($i)
		DllCall("Opengl32.dll","NONE","glEvalPoint1",$GLint,$i)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glEvalPoint2
	;https://msdn.microsoft.com/en-us/library/ee872019(v=vs.85).aspx
	Func glEvalPoint2($i,$j)
		DllCall("Opengl32.dll","NONE","glEvalPoint2",$GLint,$i,$GLint,$j)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glFeedbackBuffer
;https://msdn.microsoft.com/en-us/library/dd373532(v=vs.85).aspx
Func glFeedbackBuffer($size,$type,$buffer)
	DllCall("Opengl32.dll","NONE","glFeedbackBuffer",$GLsizei,$size,$GLenum,$type,"PTR",$buffer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glFinish
;https://msdn.microsoft.com/en-us/library/dd373533(v=vs.85).aspx
Func glFinish()
	DllCall("Opengl32.dll","NONE","glFinish")
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glFlush
;https://msdn.microsoft.com/en-us/library/dd373534(v=vs.85).aspx
Func glFlush()
	DllCall("Opengl32.dll","NONE","glFlush")
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glFog functions
;https://msdn.microsoft.com/en-us/library/dd373535(v=vs.85).aspx
	;glFogf
	;https://msdn.microsoft.com/en-us/library/ee872020(v=vs.85).aspx
	Func glFogf($pname,$param)
		DllCall("Opengl32.dll","NONE","glFogf",$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glFogi
	;https://msdn.microsoft.com/en-us/library/ee872022(v=vs.85).aspx
	Func glFogi($pname,$param)
		DllCall("Opengl32.dll","NONE","glFogi",$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glFogfv
	;https://msdn.microsoft.com/en-us/library/ee872021(v=vs.85).aspx
	Func glFogfv($pname,$params)
		DllCall("Opengl32.dll","NONE","glFogfv",$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glFogiv
	;https://msdn.microsoft.com/en-us/library/ee872023(v=vs.85).aspx
	Func glFogiv($pname,$params)
		DllCall("Opengl32.dll","NONE","glFogiv",$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glFrontFace
;https://msdn.microsoft.com/en-us/library/dd373536(v=vs.85).aspx
Func glFrontFace($mode)
	DllCall("Opengl32.dll","NONE","glFrontFace",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glFrustum
;https://msdn.microsoft.com/en-us/library/dd373537(v=vs.85).aspx
Func glFrustum($left,$right,$bottom,$top,$zNear,$zFar)
	DllCall("Opengl32.dll","NONE","glFrustum",$GLdouble,$left,$GLdouble,$right,$GLdouble,$bottom,$GLdouble,$top,$GLdouble,$zNear,$GLdouble,$zFar)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGenLists
;https://msdn.microsoft.com/en-us/library/dd373538(v=vs.85).aspx
Func glGenLists($range)
	Local $a=DllCall("Opengl32.dll",$GLuint,"glGenLists",$GLsizei,$range)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glGenTextures
;https://msdn.microsoft.com/en-us/library/dd373539(v=vs.85).aspx
Func glGenTextures($n,$textures)
	DllCall("Opengl32.dll","NONE","glGenTextures",$GLsizei,$n,"PTR",$textures)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetBooleanv
;https://msdn.microsoft.com/en-us/library/ee872024(v=vs.85).aspx
Func glGetBooleanv($pname,$params)
	DllCall("Opengl32.dll","NONE","glGetBooleanv",$GLenum,$pname,"PTR",$params)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetClipPlane
;https://msdn.microsoft.com/en-us/library/dd373541(v=vs.85).aspx
Func glGetClipPlane($plane,$equation)
	DllCall("Opengl32.dll","NONE","glGetClipPlane",$GLenum,$plane,"PTR",$equation)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetColorTableEXT
;https://msdn.microsoft.com/en-us/library/dd373542(v=vs.85).aspx
Func glGetColorTableEXT($target,$format,$type,$data)
	DllCall("Gl.h","NONE","glGetColorTableEXT",$GLenum,$target,$GLenum,$format,$GLenum,$type,"PTR",$data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetColorTableParameterfvEXT
;https://msdn.microsoft.com/en-us/library/dd373543(v=vs.85).aspx
Func glGetColorTableParameterfvEXT($target,$pname,$params)
	DllCall("Gl.h","NONE","glGetColorTableParameterfvEXT",$GLenum,$target,$GLenum,$pname,"PTR",$params)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetColorTableParameterivEXT
;https://msdn.microsoft.com/en-us/library/dd373545(v=vs.85).aspx
Func glGetColorTableParameterivEXT($target,$pname,$params)
	DllCall("Gl.h","NONE","glGetColorTableParameterivEXT",$GLenum,$target,$GLenum,$pname,"PTR",$params)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetDoublev
;https://msdn.microsoft.com/en-us/library/ee872025(v=vs.85).aspx
Func glGetDoublev($pname,$params)
	DllCall("Opengl32.dll","NONE","glGetDoublev",$GLenum,$pname,"PTR",$params)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetError
;https://msdn.microsoft.com/en-us/library/dd373546(v=vs.85).aspx
Func glGetError()
	Local $a=DllCall("Opengl32.dll",$GLenum,"glGetError")
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glGetFloatv
;https://msdn.microsoft.com/en-us/library/ee872026(v=vs.85).aspx
Func glGetFloatv($pname,$params)
	DllCall("Opengl32.dll","NONE","glGetFloatv",$GLenum,$pname,"PTR",$params)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetIntegerv
;https://msdn.microsoft.com/en-us/library/ee872027(v=vs.85).aspx
Func glGetIntegerv($pname,$params)
	DllCall("Opengl32.dll","NONE","glGetIntegerv",$GLenum,$pname,"PTR",$params)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetLight functions
;https://msdn.microsoft.com/en-us/library/dd373547(v=vs.85).aspx
	;glGetLightfv
	;https://msdn.microsoft.com/en-us/library/ee872028(v=vs.85).aspx
	Func glGetLightfv($light,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetLightfv",$GLenum,$light,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetLightiv
	;https://msdn.microsoft.com/en-us/library/ee872029(v=vs.85).aspx
	Func glGetLightiv($light,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetLightiv",$GLenum,$light,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetMap functions
;https://msdn.microsoft.com/en-us/library/dd373548(v=vs.85).aspx
	;glGetMapdv
	;https://msdn.microsoft.com/en-us/library/ee872030(v=vs.85).aspx
	Func glGetMapdv($target,$query,$v)
		DllCall("Opengl32.dll","NONE","glGetMapdv",$GLenum,$target,$GLenum,$query,"PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetMapfv
	;https://msdn.microsoft.com/en-us/library/ee872031(v=vs.85).aspx
	Func glGetMapfv($target,$query,$v)
		DllCall("Opengl32.dll","NONE","glGetMapfv",$GLenum,$target,$GLenum,$query,"PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetMapiv
	;https://msdn.microsoft.com/en-us/library/ee872032(v=vs.85).aspx
	Func glGetMapiv($target,$query,$v)
		DllCall("Opengl32.dll","NONE","glGetMapiv",$GLenum,$target,$GLenum,$query,"PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetMaterial functions
;https://msdn.microsoft.com/en-us/library/dd373549(v=vs.85).aspx
	;glGetMaterialfv
	;https://msdn.microsoft.com/en-us/library/ee872033(v=vs.85).aspx
	Func glGetMaterialfv($face,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetMaterialfv",$GLenum,$face,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetMaterialiv
	;https://msdn.microsoft.com/en-us/library/ee872035(v=vs.85).aspx
	Func glGetMaterialiv($face,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetMaterialiv",$GLenum,$face,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetPixelMap functions
;https://msdn.microsoft.com/en-us/library/dd373550(v=vs.85).aspx
	;glGetPixelMapfv
	;https://msdn.microsoft.com/en-us/library/ee872036(v=vs.85).aspx
	Func glGetPixelMapfv($map,$values)
		DllCall("Opengl32.dll","NONE","glGetPixelMapfv",$GLenum,$map,"PTR",$values)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetPixelMapuiv
	;https://msdn.microsoft.com/en-us/library/ee872037(v=vs.85).aspx
	Func glGetPixelMapuiv($map,$values)
		DllCall("Opengl32.dll","NONE","glGetPixelMapuiv",$GLenum,$map,"PTR",$values)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetPixelMapusv
	;https://msdn.microsoft.com/en-us/library/ee872038(v=vs.85).aspx
	Func glGetPixelMapusv($map,$values)
		DllCall("Opengl32.dll","NONE","glGetPixelMapusv",$GLenum,$map,"PTR",$values)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetPointerv
;https://msdn.microsoft.com/en-us/library/dd373551(v=vs.85).aspx
Func glGetPointerv($pname)
	DllCall("Opengl32.dll","NONE","glGetPointerv",$GLenum,$pname)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetPolygonStipple
;https://msdn.microsoft.com/en-us/library/dd373552(v=vs.85).aspx
Func glGetPolygonStipple($mask)
	DllCall("Opengl32.dll","NONE","glGetPolygonStipple","PTR",$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetString
;https://msdn.microsoft.com/en-us/library/dd373553(v=vs.85).aspx
Func glGetString($name)
	Local $a=DllCall("Opengl32.dll","STR","glGetString",$GLenum,$name)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glGetTexEnv functions
;https://msdn.microsoft.com/en-us/library/dd373554(v=vs.85).aspx
	;glGetTexEnvfv
	;https://msdn.microsoft.com/en-us/library/ee872039(v=vs.85).aspx
	Func glGetTexEnvfv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexEnvfv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetTexEnviv
	;https://msdn.microsoft.com/en-us/library/ee872040(v=vs.85).aspx
	Func glGetTexEnviv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexEnviv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetTexGen functions
;https://msdn.microsoft.com/en-us/library/dd373556(v=vs.85).aspx
	;glGetTexGendv
	;https://msdn.microsoft.com/en-us/library/ee872041(v=vs.85).aspx
	Func glGetTexGendv($coord,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexGendv",$GLenum,$coord,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetTexGenfv
	;https://msdn.microsoft.com/en-us/library/ee872042(v=vs.85).aspx
	Func glGetTexGenfv($coord,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexGenfv",$GLenum,$coord,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetTexGeniv
	;https://msdn.microsoft.com/en-us/library/ee872043(v=vs.85).aspx
	Func glGetTexGeniv($coord,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexGeniv",$GLenum,$coord,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetTexImage
;https://msdn.microsoft.com/en-us/library/dd373557(v=vs.85).aspx
Func glGetTexImage($target,$level,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glGetTexImage",$GLenum,$target,$GLint,$level,$GLenum,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glGetTexLevelParameter functions
;https://msdn.microsoft.com/en-us/library/dd373558(v=vs.85).aspx
	;glGetTexLevelParameterfv
	;https://msdn.microsoft.com/en-us/library/ee872044(v=vs.85).aspx
	Func glGetTexLevelParameterfv($target,$level,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexLevelParameterfv",$GLenum,$target,$GLint,$level,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetTexLevelParameteriv
	;https://msdn.microsoft.com/en-us/library/ee872045(v=vs.85).aspx
	Func glGetTexLevelParameteriv($target,$level,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexLevelParameteriv",$GLenum,$target,$GLint,$level,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glGetTexParameter functions
;https://msdn.microsoft.com/en-us/library/dd373559(v=vs.85).aspx
	;glGetTexParameterfv
	;https://msdn.microsoft.com/en-us/library/ee872046(v=vs.85).aspx
	Func glGetTexParameterfv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexParameterfv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glGetTexParameteriv
	;https://msdn.microsoft.com/en-us/library/ee872047(v=vs.85).aspx
	Func glGetTexParameteriv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glGetTexParameteriv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glHint
;https://msdn.microsoft.com/en-us/library/dd373560(v=vs.85).aspx
Func glHint($target,$mode)
	DllCall("Opengl32.dll","NONE","glHint",$GLenum,$target,$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glIndex functions
;https://msdn.microsoft.com/en-us/library/dd373571(v=vs.85).aspx
	;glIndexd
	;https://msdn.microsoft.com/en-us/library/dd373561(v=vs.85).aspx
	Func glIndexd($c)
		DllCall("Opengl32.dll","NONE","glIndexd",$GLdouble,$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexf
	;https://msdn.microsoft.com/en-us/library/dd373563(v=vs.85).aspx
	Func glIndexf($c)
		DllCall("Opengl32.dll","NONE","glIndexf",$GLfloat,$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexi
	;https://msdn.microsoft.com/en-us/library/dd373565(v=vs.85).aspx
	Func glIndexi($c)
		DllCall("Opengl32.dll","NONE","glIndexi",$GLint,$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexs
	;https://msdn.microsoft.com/en-us/library/dd373569(v=vs.85).aspx
	Func glIndexs($c)
		DllCall("Opengl32.dll","NONE","glIndexs",$GLshort,$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexdv
	;https://msdn.microsoft.com/en-us/library/dd373562(v=vs.85).aspx
	Func glIndexdv($c)
		DllCall("Opengl32.dll","NONE","glIndexdv","PTR",$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexfv
	;https://msdn.microsoft.com/en-us/library/dd373564(v=vs.85).aspx
	Func glIndexfv($c)
		DllCall("Opengl32.dll","NONE","glIndexfv","PTR",$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexiv
	;https://msdn.microsoft.com/en-us/library/dd373566(v=vs.85).aspx
	Func glIndexiv($c)
		DllCall("Opengl32.dll","NONE","glIndexiv","PTR",$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glIndexsv
	;https://msdn.microsoft.com/en-us/library/dd373570(v=vs.85).aspx
	Func glIndexsv($c)
		DllCall("Opengl32.dll","NONE","glIndexsv","PTR",$c)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glIndexMask
;https://msdn.microsoft.com/en-us/library/dd373567(v=vs.85).aspx
Func glIndexMask($mask)
	DllCall("Opengl32.dll","NONE","glIndexMask",$GLuint,$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glIndexPointer
;https://msdn.microsoft.com/en-us/library/dd373568(v=vs.85).aspx
Func glIndexPointer($type,$stride,$pointer)
	DllCall("Opengl32.dll","NONE","glIndexPointer",$GLenum,$type,$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glInitNames
;https://msdn.microsoft.com/en-us/library/dd373572(v=vs.85).aspx
Func glInitNames()
	DllCall("Opengl32.dll","NONE","glInitNames")
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glInterleavedArrays
;https://msdn.microsoft.com/en-us/library/dd373573(v=vs.85).aspx
Func glInterleavedArrays($format,$stride,$pointer)
	DllCall("Opengl32.dll","NONE","glInterleavedArrays",$GLenum,$format,$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glIsEnabled
;https://msdn.microsoft.com/en-us/library/dd373574(v=vs.85).aspx
Func glIsEnabled($cap)
	Local $a=DllCall("Opengl32.dll",$GLboolean,"glIsEnabled",$GLenum,$cap)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glIsList
;https://msdn.microsoft.com/en-us/library/dd373575(v=vs.85).aspx
Func glIsList($list)
	Local $a=DllCall("Opengl32.dll",$GLboolean,"glIsList",$GLuint,$list)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glIsTexture
;https://msdn.microsoft.com/en-us/library/dd373576(v=vs.85).aspx
Func glIsTexture($texture)
	Local $a=DllCall("Opengl32.dll",$GLboolean,"glIsTexture",$GLuint,$texture)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glLight functions
;https://msdn.microsoft.com/en-us/library/dd373929(v=vs.85).aspx
	;glLightf
	;https://msdn.microsoft.com/en-us/library/dd373577(v=vs.85).aspx
	Func glLightf($light,$pname,$param)
		DllCall("Opengl32.dll","NONE","glLightf",$GLenum,$light,$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLighti
	;https://msdn.microsoft.com/en-us/library/dd373579(v=vs.85).aspx
	Func glLighti($light,$pname,$param)
		DllCall("Opengl32.dll","NONE","glLighti",$GLenum,$light,$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLightfv
	;https://msdn.microsoft.com/en-us/library/dd373578(v=vs.85).aspx
	Func glLightfv($light,$pname,$params)
		DllCall("Opengl32.dll","NONE","glLightfv",$GLenum,$light,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLightiv
	;https://msdn.microsoft.com/en-us/library/dd373580(v=vs.85).aspx
	Func glLightiv($light,$pname,$params)
		DllCall("Opengl32.dll","NONE","glLightiv",$GLenum,$light,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glLightModel functions
;https://msdn.microsoft.com/en-us/library/dd373928(v=vs.85).aspx
	;glLightModelf
	;https://msdn.microsoft.com/en-us/library/dd373581(v=vs.85).aspx
	Func glLightModelf($pname,$param)
		DllCall("Opengl32.dll","NONE","glLightModelf",$GLenum,$pname,"PTR",$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLightModelfv
	;https://msdn.microsoft.com/en-us/library/dd373582(v=vs.85).aspx
	Func glLightModelfv($pname,$params)
		DllCall("Opengl32.dll","NONE","glLightModelfv",$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLightModeli
	;https://msdn.microsoft.com/en-us/library/dd373583(v=vs.85).aspx
	Func glLightModeli($pname,$param)
		DllCall("Opengl32.dll","NONE","glLightModeli",$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLightModeliv
	;https://msdn.microsoft.com/en-us/library/dd373927(v=vs.85).aspx
	Func glLightModeliv($pname,$params)
		DllCall("Opengl32.dll","NONE","glLightModeliv",$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glLineStipple
;https://msdn.microsoft.com/en-us/library/dd373930(v=vs.85).aspx
Func glLineStipple($factor,$pattern)
	DllCall("Opengl32.dll","NONE","glLineStipple",$GLint,$factor,$GLushort,$pattern)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glLineWidth
;https://msdn.microsoft.com/en-us/library/dd373931(v=vs.85).aspx
Func glLineWidth($width)
	DllCall("Opengl32.dll","NONE","glLineWidth",$GLfloat,$width)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glListBase
;https://msdn.microsoft.com/en-us/library/dd373932(v=vs.85).aspx
Func glListBase($base)
	DllCall("Opengl32.dll","NONE","glListBase",$GLuint,$base)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glLoadIdentity
;https://msdn.microsoft.com/en-us/library/dd373933(v=vs.85).aspx
Func glLoadIdentity()
	DllCall("Opengl32.dll","NONE","glLoadIdentity")
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glLoadMatrix functions
;https://msdn.microsoft.com/en-us/library/dd373934(v=vs.85).aspx
	;glLoadMatrixd
	;https://msdn.microsoft.com/en-us/library/ee872048(v=vs.85).aspx
	Func glLoadMatrixd($m)
		DllCall("Opengl32.dll","NONE","glLoadMatrixd","PTR",$m)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glLoadMatrixf
	;https://msdn.microsoft.com/en-us/library/ee872049(v=vs.85).aspx
	Func glLoadMatrixf($m)
		DllCall("Opengl32.dll","NONE","glLoadMatrixf","PTR",$m)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glLoadName
;https://msdn.microsoft.com/en-us/library/dd373935(v=vs.85).aspx
Func glLoadName($name)
	DllCall("Opengl32.dll","NONE","glLoadName",$GLuint,$name)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glLogicOp
;https://msdn.microsoft.com/en-us/library/dd373936(v=vs.85).aspx
Func glLogicOp($opcode)
	DllCall("Opengl32.dll","NONE","glLogicOp",$GLenum,$opcode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glMap1 functions
;https://msdn.microsoft.com/en-us/library/dd373937(v=vs.85).aspx
	;glMap1d
	;https://msdn.microsoft.com/en-us/library/ee872050(v=vs.85).aspx
	Func glMap1d($target,$u1,$u2,$stride,$order,$points)
		DllCall("Opengl32.dll","NONE","glMap1d",$GLenum,$target,$GLdouble,$u1,$GLdouble,$u2,$GLint,$stride,$GLint,$order,"PTR",$points)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMap1f
	;https://msdn.microsoft.com/en-us/library/ee872051(v=vs.85).aspx
	Func glMap1f($target,$u1,$u2,$stride,$order,$points)
		DllCall("Opengl32.dll","NONE","glMap1f",$GLenum,$target,$GLfloat,$u1,$GLfloat,$u2,$GLint,$stride,$GLint,$order,"PTR",$points)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glMap2 functions
;https://msdn.microsoft.com/en-us/library/dd373938(v=vs.85).aspx
	;glMap2d
	;https://msdn.microsoft.com/en-us/library/ee872052(v=vs.85).aspx
	Func glMap2d($target,$u1,$u2,$ustride,$uorder,$v1,$v2,$vstride,$vorder,$points)
		DllCall("Opengl32.dll","NONE","glMap2d",$GLenum,$target,$GLdouble,$u1,$GLdouble,$u2,$GLint,$ustride,$GLint,$uorder,$GLdouble,$v1,$GLdouble,$v2,$GLint,$vstride,$GLint,$vorder,"PTR",$points)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMap2f
	;https://msdn.microsoft.com/en-us/library/ee872053(v=vs.85).aspx
	Func glMap2f($target,$u1,$u2,$ustride,$uorder,$v1,$v2,$vstride,$vorder,$points)
		DllCall("Opengl32.dll","NONE","glMap2f",$GLenum,$target,$GLfloat,$u1,$GLfloat,$u2,$GLint,$ustride,$GLint,$uorder,$GLfloat,$v1,$GLfloat,$v2,$GLint,$vstride,$GLint,$vorder,"PTR",$points)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glMapGrid functions
;https://msdn.microsoft.com/en-us/library/dd373943(v=vs.85).aspx
	;glMapGrid1d
	;https://msdn.microsoft.com/en-us/library/dd373939(v=vs.85).aspx
	Func glMapGrid1d($un,$u1,$u2)
		DllCall("Opengl32.dll","NONE","glMapGrid1d",$GLint,$un,$GLdouble,$u1,$GLdouble,$u2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMapGrid1f
	;https://msdn.microsoft.com/en-us/library/dd373940(v=vs.85).aspx
	Func glMapGrid1f($un,$u1,$u2)
		DllCall("Opengl32.dll","NONE","glMapGrid1f",$GLint,$un,$GLfloat,$u1,$GLfloat,$u2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMapGrid2d
	;https://msdn.microsoft.com/en-us/library/dd373941(v=vs.85).aspx
	Func glMapGrid2d($un,$u1,$u2,$vn,$v1,$v2)
		DllCall("Opengl32.dll","NONE","glMapGrid2d",$GLint,$un,$GLdouble,$u1,$GLdouble,$u2,$GLint,$vn,$GLdouble,$v1,$GLdouble,$v2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMapGrid2f
	;https://msdn.microsoft.com/en-us/library/dd373942(v=vs.85).aspx
	Func glMapGrid2f($un,$u1,$u2,$vn,$v1,$v2)
		DllCall("Opengl32.dll","NONE","glMapGrid2f",$GLint,$un,$GLfloat,$u1,$GLfloat,$u2,$GLint,$vn,$GLfloat,$v1,$GLfloat,$v2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glMaterial functions
;https://msdn.microsoft.com/en-us/library/dd373948(v=vs.85).aspx
	;glMaterialf
	;https://msdn.microsoft.com/en-us/library/dd373944(v=vs.85).aspx
	Func glMaterialf($face,$pname,$param)
		DllCall("Opengl32.dll","NONE","glMaterialf",$GLenum,$face,$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMateriali
	;https://msdn.microsoft.com/en-us/library/dd373946(v=vs.85).aspx
	Func glMateriali($face,$pname,$param)
		DllCall("Opengl32.dll","NONE","glMateriali",$GLenum,$face,$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMaterialfv
	;https://msdn.microsoft.com/en-us/library/dd373945(v=vs.85).aspx
	Func glMaterialfv($face,$pname,$params)
		DllCall("Opengl32.dll","NONE","glMaterialfv",$GLenum,$face,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMaterialiv
	;https://msdn.microsoft.com/en-us/library/dd373947(v=vs.85).aspx
	Func glMaterialiv($face,$pname,$params)
		DllCall("Opengl32.dll","NONE","glMaterialiv",$GLenum,$face,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glMatrixMode
;https://msdn.microsoft.com/en-us/library/dd373949(v=vs.85).aspx
Func glMatrixMode($mode)
	DllCall("Opengl32.dll","NONE","glMatrixMode",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glMultMatrix functions
;https://msdn.microsoft.com/en-us/library/dd373950(v=vs.85).aspx
	;glMultMatrixd
	;https://msdn.microsoft.com/en-us/library/ee872054(v=vs.85).aspx
	Func glMultMatrixd($m)
		DllCall("Opengl32.dll","NONE","glMultMatrixd","PTR",$m)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glMultMatrixf
	;https://msdn.microsoft.com/en-us/library/ee872055(v=vs.85).aspx
	Func glMultMatrixf($m)
		DllCall("Opengl32.dll","NONE","glMultMatrixf","PTR",$m)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glNewList, glEndList
;https://msdn.microsoft.com/en-us/library/dd373951(v=vs.85).aspx
Func glNewList($list,$mode)
	DllCall("Opengl32.dll","NONE","glNewList",$GLuint,$list,$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glNormal functions
;https://msdn.microsoft.com/en-us/library/dd373964(v=vs.85).aspx
	;glNormal3b
	;https://msdn.microsoft.com/en-us/library/dd373953(v=vs.85).aspx
	Func glNormal3b($nx,$ny,$nz)
		DllCall("Opengl32.dll","NONE","glNormal3b",$GLbyte,$nx,$GLbyte,$ny,$GLbyte,$nz)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3d
	;https://msdn.microsoft.com/en-us/library/dd373955(v=vs.85).aspx
	Func glNormal3d($nx,$ny,$nz)
		DllCall("Opengl32.dll","NONE","glNormal3d",$GLdouble,$nx,$GLdouble,$ny,$GLdouble,$nz)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3f
	;https://msdn.microsoft.com/en-us/library/dd373957(v=vs.85).aspx
	Func glNormal3f($nx,$ny,$nz)
		DllCall("Opengl32.dll","NONE","glNormal3f",$GLfloat,$nx,$GLfloat,$ny,$GLfloat,$nz)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3i
	;https://msdn.microsoft.com/en-us/library/dd373959(v=vs.85).aspx
	Func glNormal3i($nx,$ny,$nz)
		DllCall("Opengl32.dll","NONE","glNormal3i",$GLint,$nx,$GLint,$ny,$GLint,$nz)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3s
	;https://msdn.microsoft.com/en-us/library/dd373961(v=vs.85).aspx
	Func glNormal3s($nx,$ny,$nz)
		DllCall("Opengl32.dll","NONE","glNormal3s",$GLshort,$nx,$GLshort,$ny,$GLshort,$nz)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3bv
	;https://msdn.microsoft.com/en-us/library/dd373954(v=vs.85).aspx
	Func glNormal3bv($v)
		DllCall("Opengl32.dll","NONE","glNormal3bv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3dv
	;https://msdn.microsoft.com/en-us/library/dd373956(v=vs.85).aspx
	Func glNormal3dv($v)
		DllCall("Opengl32.dll","NONE","glNormal3dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3fv
	;https://msdn.microsoft.com/en-us/library/dd373958(v=vs.85).aspx
	Func glNormal3fv($v)
		DllCall("Opengl32.dll","NONE","glNormal3fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3iv
	;https://msdn.microsoft.com/en-us/library/dd373960(v=vs.85).aspx
	Func glNormal3iv($v)
		DllCall("Opengl32.dll","NONE","glNormal3iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glNormal3sv
	;https://msdn.microsoft.com/en-us/library/dd373962(v=vs.85).aspx
	Func glNormal3sv($v)
		DllCall("Opengl32.dll","NONE","glNormal3sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glNormalPointer
;https://msdn.microsoft.com/en-us/library/dd373963(v=vs.85).aspx
Func glNormalPointer($type,$stride,$pointer)
	DllCall("Opengl32.dll","NONE","glNormalPointer",$GLenum,$type,$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glOrtho
;https://msdn.microsoft.com/en-us/library/dd373965(v=vs.85).aspx
Func glOrtho($left,$right,$bottom,$top,$zNear,$zFar)
	DllCall("Opengl32.dll","NONE","glOrtho",$GLdouble,$left,$GLdouble,$right,$GLdouble,$bottom,$GLdouble,$top,$GLdouble,$zNear,$GLdouble,$zFar)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPassThrough
;https://msdn.microsoft.com/en-us/library/dd373966(v=vs.85).aspx
Func glPassThrough($token)
	DllCall("Opengl32.dll","NONE","glPassThrough",$GLfloat,$token)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPixelMap functions
;https://msdn.microsoft.com/en-us/library/dd373967(v=vs.85).aspx
	;glPixelMapfv
	;https://msdn.microsoft.com/en-us/library/ee872056(v=vs.85).aspx
	Func glPixelMapfv($map,$mapsize,$values)
		DllCall("Opengl32.dll","NONE","glPixelMapfv",$GLenum,$map,$GLsizei,$mapsize,"PTR",$values)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glPixelMapuiv
	;https://msdn.microsoft.com/en-us/library/ee872057(v=vs.85).aspx
	Func glPixelMapuiv($map,$mapsize,$values)
		DllCall("Opengl32.dll","NONE","glPixelMapuiv",$GLenum,$map,$GLsizei,$mapsize,"PTR",$values)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glPixelMapusv
	;https://msdn.microsoft.com/en-us/library/ee872058(v=vs.85).aspx
	Func glPixelMapusv($map,$mapsize,$values)
		DllCall("Opengl32.dll","NONE","glPixelMapusv",$GLenum,$map,$GLsizei,$mapsize,"PTR",$values)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glPixelStore functions
;https://msdn.microsoft.com/en-us/library/dd940387(v=vs.85).aspx
	;glPixelStoref
	;https://msdn.microsoft.com/en-us/library/dd940385(v=vs.85).aspx
	Func glPixelStoref($pname,$param)
		DllCall("Opengl32.dll","NONE","glPixelStoref",$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glPixelStorei
	;https://msdn.microsoft.com/en-us/library/dd940386(v=vs.85).aspx
	Func glPixelStorei($pname,$param)
		DllCall("Opengl32.dll","NONE","glPixelStorei",$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glPixelTransfer functions
;https://msdn.microsoft.com/en-us/library/dd373969(v=vs.85).aspx
	;glPixelTransferf
	;https://msdn.microsoft.com/en-us/library/ee872059(v=vs.85).aspx
	Func glPixelTransferf($pname,$param)
		DllCall("Opengl32.dll","NONE","glPixelTransferf",$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glPixelTransferi
	;https://msdn.microsoft.com/en-us/library/ee872060(v=vs.85).aspx
	Func glPixelTransferi($pname,$param)
		DllCall("Opengl32.dll","NONE","glPixelTransferi",$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glPixelZoom
;https://msdn.microsoft.com/en-us/library/dd373970(v=vs.85).aspx
Func glPixelZoom($xfactor,$yfactor)
	DllCall("Opengl32.dll","NONE","glPixelZoom",$GLfloat,$xfactor,$GLfloat,$yfactor)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPointSize
;https://msdn.microsoft.com/en-us/library/dd373971(v=vs.85).aspx
Func glPointSize($size)
	DllCall("Opengl32.dll","NONE","glPointSize",$GLfloat,$size)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPolygonMode
;https://msdn.microsoft.com/en-us/library/dd373972(v=vs.85).aspx
Func glPolygonMode($face,$mode)
	DllCall("Opengl32.dll","NONE","glPolygonMode",$GLenum,$face,$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPolygonOffset
;https://msdn.microsoft.com/en-us/library/dd373973(v=vs.85).aspx
Func glPolygonOffset($factor,$units)
	DllCall("Opengl32.dll","NONE","glPolygonOffset",$GLfloat,$factor,$GLfloat,$units)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPolygonStipple
;https://msdn.microsoft.com/en-us/library/dd373974(v=vs.85).aspx
Func glPolygonStipple($mask)
	DllCall("Opengl32.dll","NONE","glPolygonStipple","PTR",$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPrioritizeTextures
;https://msdn.microsoft.com/en-us/library/dd373979(v=vs.85).aspx
Func glPrioritizeTextures($n,$textures,$priorities)
	DllCall("Opengl32.dll","NONE","glPrioritizeTextures",$GLsizei,$n,"PTR",$textures,"PTR",$priorities)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPushAttrib, glPopAttrib
;https://msdn.microsoft.com/en-us/library/dd373980(v=vs.85).aspx
Func glPushAttrib($mask)
	DllCall("Opengl32.dll","NONE","glPushAttrib",$GLbitfield,$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPushClientAttrib, glPopClientAttrib
;https://msdn.microsoft.com/en-us/library/dd373982(v=vs.85).aspx
Func glPushClientAttrib($mask)
	DllCall("Opengl32.dll","NONE","glPushClientAttrib",$GLbitfield,$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPushMatrix, glPopMatrix
;https://msdn.microsoft.com/en-us/library/dd373984(v=vs.85).aspx
Func glPushMatrix()
	DllCall("Opengl32.dll","NONE","glPushMatrix")
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glPushName, glPopName
;https://msdn.microsoft.com/en-us/library/dd373986(v=vs.85).aspx
Func glPushName($name)
	DllCall("Opengl32.dll","NONE","glPushName",$GLuint,$name)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glRasterPos functions
;https://msdn.microsoft.com/en-us/library/dd374014(v=vs.85).aspx
	;glRasterPos2d
	;https://msdn.microsoft.com/en-us/library/dd373988(v=vs.85).aspx
	Func glRasterPos2d($x,$y)
		DllCall("Opengl32.dll","NONE","glRasterPos2d",$GLdouble,$x,$GLdouble,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2f
	;https://msdn.microsoft.com/en-us/library/dd373990(v=vs.85).aspx
	Func glRasterPos2f($x,$y)
		DllCall("Opengl32.dll","NONE","glRasterPos2f",$GLfloat,$x,$GLfloat,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2i
	;https://msdn.microsoft.com/en-us/library/dd373992(v=vs.85).aspx
	Func glRasterPos2i($x,$y)
		DllCall("Opengl32.dll","NONE","glRasterPos2i",$GLint,$x,$GLint,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2s
	;https://msdn.microsoft.com/en-us/library/dd373994(v=vs.85).aspx
	Func glRasterPos2s($x,$y)
		DllCall("Opengl32.dll","NONE","glRasterPos2s",$GLshort,$x,$GLshort,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3d
	;https://msdn.microsoft.com/en-us/library/dd373996(v=vs.85).aspx
	Func glRasterPos3d($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glRasterPos3d",$GLdouble,$x,$GLdouble,$y,$GLdouble,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3f
	;https://msdn.microsoft.com/en-us/library/dd373998(v=vs.85).aspx
	Func glRasterPos3f($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glRasterPos3f",$GLfloat,$x,$GLfloat,$y,$GLfloat,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3i
	;https://msdn.microsoft.com/en-us/library/dd374002(v=vs.85).aspx
	Func glRasterPos3i($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glRasterPos3i",$GLint,$x,$GLint,$y,$GLint,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3s
	;https://msdn.microsoft.com/en-us/library/dd374004(v=vs.85).aspx
	Func glRasterPos3s($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glRasterPos3s",$GLshort,$x,$GLshort,$y,$GLshort,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4d
	;https://msdn.microsoft.com/en-us/library/dd374006(v=vs.85).aspx
	Func glRasterPos4d($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glRasterPos4d",$GLdouble,$x,$GLdouble,$y,$GLdouble,$z,$GLdouble,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4f
	;https://msdn.microsoft.com/en-us/library/dd374008(v=vs.85).aspx
	Func glRasterPos4f($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glRasterPos4f",$GLfloat,$x,$GLfloat,$y,$GLfloat,$z,$GLfloat,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4i
	;https://msdn.microsoft.com/en-us/library/dd374010(v=vs.85).aspx
	Func glRasterPos4i($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glRasterPos4i",$GLint,$x,$GLint,$y,$GLint,$z,$GLint,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4s
	;https://msdn.microsoft.com/en-us/library/dd374012(v=vs.85).aspx
	Func glRasterPos4s($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glRasterPos4s",$GLshort,$x,$GLshort,$y,$GLshort,$z,$GLshort,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2dv
	;https://msdn.microsoft.com/en-us/library/dd373989(v=vs.85).aspx
	Func glRasterPos2dv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos2dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2fv
	;https://msdn.microsoft.com/en-us/library/dd373991(v=vs.85).aspx
	Func glRasterPos2fv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos2fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2iv
	;https://msdn.microsoft.com/en-us/library/dd373993(v=vs.85).aspx
	Func glRasterPos2iv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos2iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos2sv
	;https://msdn.microsoft.com/en-us/library/dd373995(v=vs.85).aspx
	Func glRasterPos2sv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos2sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3dv
	;https://msdn.microsoft.com/en-us/library/dd373997(v=vs.85).aspx
	Func glRasterPos3dv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos3dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3fv
	;https://msdn.microsoft.com/en-us/library/dd374001(v=vs.85).aspx
	Func glRasterPos3fv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos3fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3iv
	;https://msdn.microsoft.com/en-us/library/dd374003(v=vs.85).aspx
	Func glRasterPos3iv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos3iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos3sv
	;https://msdn.microsoft.com/en-us/library/dd374005(v=vs.85).aspx
	Func glRasterPos3sv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos3sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4dv
	;https://msdn.microsoft.com/en-us/library/dd374007(v=vs.85).aspx
	Func glRasterPos4dv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos4dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4fv
	;https://msdn.microsoft.com/en-us/library/dd374009(v=vs.85).aspx
	Func glRasterPos4fv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos4fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4iv
	;https://msdn.microsoft.com/en-us/library/dd374011(v=vs.85).aspx
	Func glRasterPos4iv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos4iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRasterPos4sv
	;https://msdn.microsoft.com/en-us/library/dd374013(v=vs.85).aspx
	Func glRasterPos4sv($v)
		DllCall("Opengl32.dll","NONE","glRasterPos4sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glReadBuffer
;https://msdn.microsoft.com/en-us/library/dd374015(v=vs.85).aspx
Func glReadBuffer($mode)
	DllCall("Opengl32.dll","NONE","glReadBuffer",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glReadPixels
;https://msdn.microsoft.com/en-us/library/dd374016(v=vs.85).aspx
Func glReadPixels($x,$y,$width,$height,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glReadPixels",$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height,$GLenum,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glRect functions
;https://msdn.microsoft.com/en-us/library/dd374025(v=vs.85).aspx
	;glRectd
	;https://msdn.microsoft.com/en-us/library/dd374017(v=vs.85).aspx
	Func glRectd($x1,$y1,$x2,$y2)
		DllCall("Opengl32.dll","NONE","glRectd",$GLdouble,$x1,$GLdouble,$y1,$GLdouble,$x2,$GLdouble,$y2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRectf
	;https://msdn.microsoft.com/en-us/library/dd374019(v=vs.85).aspx
	Func glRectf($x1,$y1,$x2,$y2)
		DllCall("Opengl32.dll","NONE","glRectf",$GLfloat,$x1,$GLfloat,$y1,$GLfloat,$x2,$GLfloat,$y2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRecti
	;https://msdn.microsoft.com/en-us/library/dd374021(v=vs.85).aspx
	Func glRecti($x1,$y1,$x2,$y2)
		DllCall("Opengl32.dll","NONE","glRecti",$GLint,$x1,$GLint,$y1,$GLint,$x2,$GLint,$y2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRects
	;https://msdn.microsoft.com/en-us/library/dd374023(v=vs.85).aspx
	Func glRects($x1,$y1,$x2,$y2)
		DllCall("Opengl32.dll","NONE","glRects",$GLshort,$x1,$GLshort,$y1,$GLshort,$x2,$GLshort,$y2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRectdv
	;https://msdn.microsoft.com/en-us/library/dd374018(v=vs.85).aspx
	Func glRectdv($v1,$v2)
		DllCall("Opengl32.dll","NONE","glRectdv","PTR",$v1,"PTR",$v2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRectfv
	;https://msdn.microsoft.com/en-us/library/dd374020(v=vs.85).aspx
	Func glRectfv($v1,$v2)
		DllCall("Opengl32.dll","NONE","glRectfv","PTR",$v1,"PTR",$v2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRectiv
	;https://msdn.microsoft.com/en-us/library/dd374022(v=vs.85).aspx
	Func glRectiv($v1,$v2)
		DllCall("Opengl32.dll","NONE","glRectiv","PTR",$v1,"PTR",$v2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRectsv
	;https://msdn.microsoft.com/en-us/library/dd374024(v=vs.85).aspx
	Func glRectsv($v1,$v2)
		DllCall("Opengl32.dll","NONE","glRectsv","PTR",$v1,"PTR",$v2)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glRenderMode
;https://msdn.microsoft.com/en-us/library/dd374026(v=vs.85).aspx
Func glRenderMode($mode)
	Local $a=DllCall("Opengl32.dll",$GLint,"glRenderMode",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;glRotate functions
;https://msdn.microsoft.com/en-us/library/dd374027(v=vs.85).aspx
	;glRotated
	;https://msdn.microsoft.com/en-us/library/dd374028(v=vs.85).aspx
	Func glRotated($angle,$x,$y,$z)
		DllCall("Opengl32.dll","NONE","glRotated",$GLdouble,$angle,$GLdouble,$x,$GLdouble,$y,$GLdouble,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glRotatef
	;https://msdn.microsoft.com/en-us/library/dd368577(v=vs.85).aspx
	Func glRotatef($angle,$x,$y,$z)
		DllCall("Opengl32.dll","NONE","glRotatef",$GLfloat,$angle,$GLfloat,$x,$GLfloat,$y,$GLfloat,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glScale functions
;https://msdn.microsoft.com/en-us/library/dd368578(v=vs.85).aspx
	;glScaled
	;https://msdn.microsoft.com/en-us/library/dd368579(v=vs.85).aspx
	Func glScaled($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glScaled",$GLdouble,$x,$GLdouble,$y,$GLdouble,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glScalef
	;https://msdn.microsoft.com/en-us/library/dd368580(v=vs.85).aspx
	Func glScalef($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glScalef",$GLfloat,$x,$GLfloat,$y,$GLfloat,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glScissor
;https://msdn.microsoft.com/en-us/library/dd368581(v=vs.85).aspx
Func glScissor($x,$y,$width,$height)
	DllCall("Opengl32.dll","NONE","glScissor",$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glSelectBuffer
;https://msdn.microsoft.com/en-us/library/dd368582(v=vs.85).aspx
Func glSelectBuffer($size,$buffer)
	DllCall("Opengl32.dll","NONE","glSelectBuffer",$GLsizei,$size,"PTR",$buffer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glShadeModel
;https://msdn.microsoft.com/en-us/library/dd368583(v=vs.85).aspx
Func glShadeModel($mode)
	DllCall("Opengl32.dll","NONE","glShadeModel",$GLenum,$mode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glStencilFunc
;https://msdn.microsoft.com/en-us/library/dd368584(v=vs.85).aspx
Func glStencilFunc($func,$ref,$mask)
	DllCall("Opengl32.dll","NONE","glStencilFunc",$GLenum,$func,$GLint,$ref,$GLuint,$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glStencilMask
;https://msdn.microsoft.com/en-us/library/dd368585(v=vs.85).aspx
Func glStencilMask($mask)
	DllCall("Opengl32.dll","NONE","glStencilMask",$GLuint,$mask)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glStencilOp
;https://msdn.microsoft.com/en-us/library/dd368586(v=vs.85).aspx
Func glStencilOp($fail,$zfail,$zpass)
	DllCall("Opengl32.dll","NONE","glStencilOp",$GLenum,$fail,$GLenum,$zfail,$GLenum,$zpass)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glTexCoord functions
;https://msdn.microsoft.com/en-us/library/dd368624(v=vs.85).aspx
	;glTexCoord1d
	;https://msdn.microsoft.com/en-us/library/dd368587(v=vs.85).aspx
	Func glTexCoord1d($s)
		DllCall("Opengl32.dll","NONE","glTexCoord1d",$GLdouble,$s)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1f
	;https://msdn.microsoft.com/en-us/library/dd368589(v=vs.85).aspx
	Func glTexCoord1f($s)
		DllCall("Opengl32.dll","NONE","glTexCoord1f",$GLfloat,$s)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1i
	;https://msdn.microsoft.com/en-us/library/dd368591(v=vs.85).aspx
	Func glTexCoord1i($s)
		DllCall("Opengl32.dll","NONE","glTexCoord1i",$GLint,$s)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1s
	;https://msdn.microsoft.com/en-us/library/dd368593(v=vs.85).aspx
	Func glTexCoord1s($s)
		DllCall("Opengl32.dll","NONE","glTexCoord1s",$GLshort,$s)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2d
	;https://msdn.microsoft.com/en-us/library/dd368595(v=vs.85).aspx
	Func glTexCoord2d($s,$t)
		DllCall("Opengl32.dll","NONE","glTexCoord2d",$GLdouble,$s,$GLdouble,$t)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2i
	;https://msdn.microsoft.com/en-us/library/dd368598(v=vs.85).aspx
	Func glTexCoord2i($s,$t)
		DllCall("Opengl32.dll","NONE","glTexCoord2i",$GLint,$s,$GLint,$t)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2s
	;https://msdn.microsoft.com/en-us/library/dd368600(v=vs.85).aspx
	Func glTexCoord2s($s,$t)
		DllCall("Opengl32.dll","NONE","glTexCoord2s",$GLshort,$s,$GLshort,$t)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3d
	;https://msdn.microsoft.com/en-us/library/dd368602(v=vs.85).aspx
	Func glTexCoord3d($s,$t,$r)
		DllCall("Opengl32.dll","NONE","glTexCoord3d",$GLdouble,$s,$GLdouble,$t,$GLdouble,$r)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3f
	;https://msdn.microsoft.com/en-us/library/dd368604(v=vs.85).aspx
	Func glTexCoord3f($s,$t,$r)
		DllCall("Opengl32.dll","NONE","glTexCoord3f",$GLfloat,$s,$GLfloat,$t,$GLfloat,$r)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3i
	;https://msdn.microsoft.com/en-us/library/dd368606(v=vs.85).aspx
	Func glTexCoord3i($s,$t,$r)
		DllCall("Opengl32.dll","NONE","glTexCoord3i",$GLint,$s,$GLint,$t,$GLint,$r)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3s
	;https://msdn.microsoft.com/en-us/library/dd368608(v=vs.85).aspx
	Func glTexCoord3s($s,$t,$r)
		DllCall("Opengl32.dll","NONE","glTexCoord3s",$GLshort,$s,$GLshort,$t,$GLshort,$r)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4d
	;https://msdn.microsoft.com/en-us/library/dd368610(v=vs.85).aspx
	Func glTexCoord4d($s,$t,$r,$q)
		DllCall("Opengl32.dll","NONE","glTexCoord4d",$GLdouble,$s,$GLdouble,$t,$GLdouble,$r,$GLdouble,$q)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4f
	;https://msdn.microsoft.com/en-us/library/dd368612(v=vs.85).aspx
	Func glTexCoord4f($s,$t,$r,$q)
		DllCall("Opengl32.dll","NONE","glTexCoord4f",$GLfloat,$s,$GLfloat,$t,$GLfloat,$r,$GLfloat,$q)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4i
	;https://msdn.microsoft.com/en-us/library/dd368616(v=vs.85).aspx
	Func glTexCoord4i($s,$t,$r,$q)
		DllCall("Opengl32.dll","NONE","glTexCoord4i",$GLint,$s,$GLint,$t,$GLint,$r,$GLint,$q)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4s
	;https://msdn.microsoft.com/en-us/library/dd368620(v=vs.85).aspx
	Func glTexCoord4s($s,$t,$r,$q)
		DllCall("Opengl32.dll","NONE","glTexCoord4s",$GLshort,$s,$GLshort,$t,$GLshort,$r,$GLshort,$q)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1dv
	;https://msdn.microsoft.com/en-us/library/dd368588(v=vs.85).aspx
	Func glTexCoord1dv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord1dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1fv
	;https://msdn.microsoft.com/en-us/library/dd368590(v=vs.85).aspx
	Func glTexCoord1fv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord1fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1iv
	;https://msdn.microsoft.com/en-us/library/dd368592(v=vs.85).aspx
	Func glTexCoord1iv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord1iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord1sv
	;https://msdn.microsoft.com/en-us/library/dd368594(v=vs.85).aspx
	Func glTexCoord1sv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord1sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2dv
	;https://msdn.microsoft.com/en-us/library/dd368596(v=vs.85).aspx
	Func glTexCoord2dv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord2dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2fv
	;https://msdn.microsoft.com/en-us/library/dd368597(v=vs.85).aspx
	Func glTexCoord2fv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord2fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2iv
	;https://msdn.microsoft.com/en-us/library/dd368599(v=vs.85).aspx
	Func glTexCoord2iv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord2iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord2sv
	;https://msdn.microsoft.com/en-us/library/dd368601(v=vs.85).aspx
	Func glTexCoord2sv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord2sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3dv
	;https://msdn.microsoft.com/en-us/library/dd368603(v=vs.85).aspx
	Func glTexCoord3dv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord3dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3fv
	;https://msdn.microsoft.com/en-us/library/dd368605(v=vs.85).aspx
	Func glTexCoord3fv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord3fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3iv
	;https://msdn.microsoft.com/en-us/library/dd368607(v=vs.85).aspx
	Func glTexCoord3iv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord3iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord3sv
	;https://msdn.microsoft.com/en-us/library/dd368609(v=vs.85).aspx
	Func glTexCoord3sv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord3sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4dv
	;https://msdn.microsoft.com/en-us/library/dd368611(v=vs.85).aspx
	Func glTexCoord4dv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord4dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4fv
	;https://msdn.microsoft.com/en-us/library/dd368615(v=vs.85).aspx
	Func glTexCoord4fv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord4fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4iv
	;https://msdn.microsoft.com/en-us/library/dd368618(v=vs.85).aspx
	Func glTexCoord4iv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord4iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexCoord4sv
	;https://msdn.microsoft.com/en-us/library/dd368622(v=vs.85).aspx
	Func glTexCoord4sv($v)
		DllCall("Opengl32.dll","NONE","glTexCoord4sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glTexCoordPointer
;https://msdn.microsoft.com/en-us/library/dd368623(v=vs.85).aspx
Func glTexCoordPointer($size,$type,$stride,$pointer)
	DllCall("Opengl32.dll","NONE","glTexCoordPointer",$GLint,$size,$GLenum,$type,$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glTexEnv functions
;https://msdn.microsoft.com/en-us/library/dd368629(v=vs.85).aspx
	;glTexEnvf
	;https://msdn.microsoft.com/en-us/library/dd368625(v=vs.85).aspx
	Func glTexEnvf($target,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexEnvf",$GLenum,$target,$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexEnvi
	;https://msdn.microsoft.com/en-us/library/dd368627(v=vs.85).aspx
	Func glTexEnvi($target,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexEnvi",$GLenum,$target,$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexEnvfv
	;https://msdn.microsoft.com/en-us/library/dd368626(v=vs.85).aspx
	Func glTexEnvfv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexEnvfv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexEnviv
	;https://msdn.microsoft.com/en-us/library/dd368628(v=vs.85).aspx
	Func glTexEnviv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexEnviv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glTexGen functions
;https://msdn.microsoft.com/en-us/library/dd368636(v=vs.85).aspx
	;glTexGend
	;https://msdn.microsoft.com/en-us/library/dd368630(v=vs.85).aspx
	Func glTexGend($coord,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexGend",$GLenum,$coord,$GLenum,$pname,$GLdouble,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexGenf
	;https://msdn.microsoft.com/en-us/library/dd368632(v=vs.85).aspx
	Func glTexGenf($coord,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexGenf",$GLenum,$coord,$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexGeni
	;https://msdn.microsoft.com/en-us/library/dd368634(v=vs.85).aspx
	Func glTexGeni($coord,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexGeni",$GLenum,$coord,$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexGendv
	;https://msdn.microsoft.com/en-us/library/dd368631(v=vs.85).aspx
	Func glTexGendv($coord,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexGendv",$GLenum,$coord,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexGenfv
	;https://msdn.microsoft.com/en-us/library/dd368633(v=vs.85).aspx
	Func glTexGenfv($coord,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexGenfv",$GLenum,$coord,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexGeniv
	;https://msdn.microsoft.com/en-us/library/dd368635(v=vs.85).aspx
	Func glTexGeniv($coord,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexGeniv",$GLenum,$coord,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glTexImage1D
;https://msdn.microsoft.com/en-us/library/dd368637(v=vs.85).aspx
Func glTexImage1D($target,$level,$internalformat,$width,$border,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glTexImage1D",$GLenum,$target,$GLint,$level,$GLint,$internalformat,$GLsizei,$width,$GLint,$border,$GLint,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glTexImage2D
;https://msdn.microsoft.com/en-us/library/dd368638(v=vs.85).aspx
Func glTexImage2D($target,$level,$internalformat,$width,$height,$border,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glTexImage2D",$GLenum,$target,$GLint,$level,$GLint,$internalformat,$GLsizei,$width,$GLsizei,$height,$GLint,$border,$GLint,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glTexParameter functions
;https://msdn.microsoft.com/en-us/library/dd368643(v=vs.85).aspx
	;glTexParameterf
	;https://msdn.microsoft.com/en-us/library/dd368639(v=vs.85).aspx
	Func glTexParameterf($target,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexParameterf",$GLenum,$target,$GLenum,$pname,$GLfloat,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexParameteri
	;https://msdn.microsoft.com/en-us/library/dd368641(v=vs.85).aspx
	Func glTexParameteri($target,$pname,$param)
		DllCall("Opengl32.dll","NONE","glTexParameteri",$GLenum,$target,$GLenum,$pname,$GLint,$param)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexParameterfv
	;https://msdn.microsoft.com/en-us/library/dd368640(v=vs.85).aspx
	Func glTexParameterfv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexParameterfv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTexParameteriv
	;https://msdn.microsoft.com/en-us/library/dd368642(v=vs.85).aspx
	Func glTexParameteriv($target,$pname,$params)
		DllCall("Opengl32.dll","NONE","glTexParameteriv",$GLenum,$target,$GLenum,$pname,"PTR",$params)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glTexSubImage1D
;https://msdn.microsoft.com/en-us/library/dd368644(v=vs.85).aspx
Func glTexSubImage1D($target,$level,$xoffset,$width,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glTexSubImage1D",$GLenum,$target,$GLint,$level,$GLint,$xoffset,$GLsizei,$width,$GLenum,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glTexSubImage2D
;https://msdn.microsoft.com/en-us/library/dd368645(v=vs.85).aspx
Func glTexSubImage2D($target,$level,$xoffset,$yoffset,$width,$height,$format,$type,$pixels)
	DllCall("Opengl32.dll","NONE","glTexSubImage2D",$GLenum,$target,$GLint,$level,$GLint,$xoffset,$GLint,$yoffset,$GLsizei,$width,$GLsizei,$height,$GLenum,$format,$GLenum,$type,"PTR",$pixels)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glTranslate functions
;https://msdn.microsoft.com/en-us/library/dd368646(v=vs.85).aspx
	;glTranslated
	;https://msdn.microsoft.com/en-us/library/ee872065(v=vs.85).aspx
	Func glTranslated($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glTranslated",$GLdouble,$x,$GLdouble,$y,$GLdouble,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glTranslatef
	;https://msdn.microsoft.com/en-us/library/ee872066(v=vs.85).aspx
	Func glTranslatef($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glTranslatef",$GLfloat,$x,$GLfloat,$y,$GLfloat,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glVertex
;https://msdn.microsoft.com/en-us/library/dd374200(v=vs.85).aspx
	;glVertex2d
	;https://msdn.microsoft.com/en-us/library/dd374159(v=vs.85).aspx
	Func glVertex2d($x,$y)
		DllCall("Opengl32.dll","NONE","glVertex2d",$GLdouble,$x,$GLdouble,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2f
	;https://msdn.microsoft.com/en-us/library/dd374161(v=vs.85).aspx
	Func glVertex2f($x,$y)
		DllCall("Opengl32.dll","NONE","glVertex2f",$GLfloat,$x,$GLfloat,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2i
	;https://msdn.microsoft.com/en-us/library/dd374164(v=vs.85).aspx
	Func glVertex2i($x,$y)
		DllCall("Opengl32.dll","NONE","glVertex2i",$GLint,$x,$GLint,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2s
	;https://msdn.microsoft.com/en-us/library/dd374168(v=vs.85).aspx
	Func glVertex2s($x,$y)
		DllCall("Opengl32.dll","NONE","glVertex2s",$GLshort,$x,$GLshort,$y)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3d
	;https://msdn.microsoft.com/en-us/library/dd374172(v=vs.85).aspx
	Func glVertex3d($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glVertex3d",$GLdouble,$x,$GLdouble,$y,$GLdouble,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3f
	;https://msdn.microsoft.com/en-us/library/dd374176(v=vs.85).aspx
	Func glVertex3f($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glVertex3f",$GLfloat,$x,$GLfloat,$y,$GLfloat,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3i
	;https://msdn.microsoft.com/en-us/library/dd374180(v=vs.85).aspx
	Func glVertex3i($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glVertex3i",$GLint,$x,$GLint,$y,$GLint,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3s
	;https://msdn.microsoft.com/en-us/library/dd374184(v=vs.85).aspx
	Func glVertex3s($x,$y,$z)
		DllCall("Opengl32.dll","NONE","glVertex3s",$GLshort,$x,$GLshort,$y,$GLshort,$z)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4d
	;https://msdn.microsoft.com/en-us/library/dd374186(v=vs.85).aspx
	Func glVertex4d($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glVertex4d",$GLdouble,$x,$GLdouble,$y,$GLdouble,$z,$GLdouble,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4f
	;https://msdn.microsoft.com/en-us/library/dd374190(v=vs.85).aspx
	Func glVertex4f($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glVertex4f",$GLfloat,$x,$GLfloat,$y,$GLfloat,$z,$GLfloat,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4i
	;https://msdn.microsoft.com/en-us/library/dd374192(v=vs.85).aspx
	Func glVertex4i($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glVertex4i",$GLint,$x,$GLint,$y,$GLint,$z,$GLint,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4s
	;https://msdn.microsoft.com/en-us/library/dd374195(v=vs.85).aspx
	Func glVertex4s($x,$y,$z,$w)
		DllCall("Opengl32.dll","NONE","glVertex4s",$GLshort,$x,$GLshort,$y,$GLshort,$z,$GLshort,$w)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2dv
	;https://msdn.microsoft.com/en-us/library/dd374160(v=vs.85).aspx
	Func glVertex2dv($v)
		DllCall("Opengl32.dll","NONE","glVertex2dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2fv
	;https://msdn.microsoft.com/en-us/library/dd374162(v=vs.85).aspx
	Func glVertex2fv($v)
		DllCall("Opengl32.dll","NONE","glVertex2fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2iv
	;https://msdn.microsoft.com/en-us/library/dd374166(v=vs.85).aspx
	Func glVertex2iv($v)
		DllCall("Opengl32.dll","NONE","glVertex2iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex2sv
	;https://msdn.microsoft.com/en-us/library/dd374170(v=vs.85).aspx
	Func glVertex2sv($v)
		DllCall("Opengl32.dll","NONE","glVertex2sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3dv
	;https://msdn.microsoft.com/en-us/library/dd374174(v=vs.85).aspx
	Func glVertex3dv($v)
		DllCall("Opengl32.dll","NONE","glVertex3dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3fv
	;https://msdn.microsoft.com/en-us/library/dd374178(v=vs.85).aspx
	Func glVertex3fv($v)
		DllCall("Opengl32.dll","NONE","glVertex3fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3iv
	;https://msdn.microsoft.com/en-us/library/dd374182(v=vs.85).aspx
	Func glVertex3iv($v)
		DllCall("Opengl32.dll","NONE","glVertex3iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex3sv
	;https://msdn.microsoft.com/en-us/library/dd374185(v=vs.85).aspx
	Func glVertex3sv($v)
		DllCall("Opengl32.dll","NONE","glVertex3sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4dv
	;https://msdn.microsoft.com/en-us/library/dd374188(v=vs.85).aspx
	Func glVertex4dv($v)
		DllCall("Opengl32.dll","NONE","glVertex4dv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4fv
	;https://msdn.microsoft.com/en-us/library/dd374191(v=vs.85).aspx
	Func glVertex4fv($v)
		DllCall("Opengl32.dll","NONE","glVertex4fv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4iv
	;https://msdn.microsoft.com/en-us/library/dd374194(v=vs.85).aspx
	Func glVertex4iv($v)
		DllCall("Opengl32.dll","NONE","glVertex4iv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
	;glVertex4sv
	;https://msdn.microsoft.com/en-us/library/dd374196(v=vs.85).aspx
	Func glVertex4sv($v)
		DllCall("Opengl32.dll","NONE","glVertex4sv","PTR",$v)
		If @error<>0 Then Return SetError(@error, @extended, 0)
	EndFunc
;glVertexPointer
;https://msdn.microsoft.com/en-us/library/dd374198(v=vs.85).aspx
Func glVertexPointer($size,$type,$stride,$pointer)
	DllCall("Opengl32.dll","NONE","glVertexPointer",$GLint,$size,$GLenum,$type,$GLsizei,$stride,"PTR",$pointer)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;glViewport
;https://msdn.microsoft.com/en-us/library/dd374202(v=vs.85).aspx
Func glViewport($x,$y,$width,$height)
	DllCall("Opengl32.dll","NONE","glViewport",$GLint,$x,$GLint,$y,$GLsizei,$width,$GLsizei,$height)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc