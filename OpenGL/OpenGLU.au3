#include-once
#include <OpenGL.au3>

$GLU_TESS_BEGIN=100100
$GLU_TESS_VERTEX=100101
$GLU_TESS_END=100102
$GLU_TESS_ERROR=100103
$GLU_TESS_EDGE_FLAG=100104
$GLU_TESS_COMBINE=100105
$GLU_TESS_BEGIN_DATA=100106
$GLU_TESS_VERTEX_DATA=100107
$GLU_TESS_END_DATA=100108
$GLU_TESS_ERROR_DATA=100109
$GLU_TESS_EDGE_FLAG_DATA=100110
$GLU_TESS_COMBINE_DATA=100111

$GLU_NURBS_MODE=100160

$GLU_NURBS_TESSELLATOR=100161
$GLU_NURBS_RENDERER=100162

$GLU_NURBS_BEGIN=100164
$GLU_NURBS_VERTEX=100165
$GLU_NURBS_NORMAL=100166
$GLU_NURBS_COLOR=100167
$GLU_NURBS_TEXTURE_COORD=100168
$GLU_NURBS_END=100169

$GLU_NURBS_BEGIN_DATA=100170
$GLU_NURBS_VERTEX_DATA=100171
$GLU_NURBS_NORMAL_DATA=100172
$GLU_NURBS_COLOR_DATA=100173
$GLU_NURBS_TEXTURE_COORD_DATA=100174
$GLU_NURBS_END_DATA=100175

$GLU_VERSION_1_1=1

$GLU_VERSION_1_2=1

$GLU_VERSION_1_3=1

; Errors: (return value 0 = no error)
$GLU_INVALID_ENUM=100900
$GLU_INVALID_VALUE=100901
$GLU_OUT_OF_MEMORY=100902
$GLU_INCOMPATIBLE_GL_VERSION=100903

; StringName
$GLU_VERSION=100800
$GLU_EXTENSIONS=100801

; Boolean
$GLU_TRUE=$GL_TRUE
$GLU_FALSE=$GL_FALSE

; Quadric constants

; QuadricNormal
$GLU_SMOOTH=100000
$GLU_FLAT=100001
$GLU_NONE=100002

; QuadricDrawStyle
$GLU_POINT=100010
$GLU_LINE=100011
$GLU_FILL=100012
$GLU_SILHOUETTE=100013

; QuadricOrientation
$GLU_OUTSIDE=100020
$GLU_INSIDE=100021

; Tesselation constants

$GLU_TESS_MAX_COORD=1.0e150

; TessProperty
$GLU_TESS_WINDING_RULE=100140
$GLU_TESS_BOUNDARY_ONLY=100141
$GLU_TESS_TOLERANCE=100142

; TessWinding
$GLU_TESS_WINDING_ODD=100130
$GLU_TESS_WINDING_NONZERO=100131
$GLU_TESS_WINDING_POSITIVE=100132
$GLU_TESS_WINDING_NEGATIVE=100133
$GLU_TESS_WINDING_ABS_GEQ_TWO=100134

; TessCallback
$GLU_TESS_BEGIN=100100
$GLU_TESS_VERTEX=100101
$GLU_TESS_END=100102
$GLU_TESS_ERROR=100103
$GLU_TESS_EDGE_FLAG=100104
$GLU_TESS_COMBINE=100105
$GLU_TESS_BEGIN_DATA=100106
$GLU_TESS_VERTEX_DATA=100107
$GLU_TESS_END_DATA=100108
$GLU_TESS_ERROR_DATA=100109
$GLU_TESS_EDGE_FLAG_DATA=100110
$GLU_TESS_COMBINE_DATA=100111

; TessError
$GLU_TESS_ERROR1=100151
$GLU_TESS_ERROR2=100152
$GLU_TESS_ERROR3=100153
$GLU_TESS_ERROR4=100154
$GLU_TESS_ERROR5=100155
$GLU_TESS_ERROR6=100156
$GLU_TESS_ERROR7=100157
$GLU_TESS_ERROR8=100158

$GLU_TESS_MISSING_BEGIN_POLYGON=$GLU_TESS_ERROR1
$GLU_TESS_MISSING_BEGIN_CONTOUR=$GLU_TESS_ERROR2
$GLU_TESS_MISSING_END_POLYGON=$GLU_TESS_ERROR3
$GLU_TESS_MISSING_END_CONTOUR=$GLU_TESS_ERROR4
$GLU_TESS_COORD_TOO_LARGE=$GLU_TESS_ERROR5
$GLU_TESS_NEED_COMBINE_CALLBACK=$GLU_TESS_ERROR6

; NURBS constants

; NurbsProperty
$GLU_AUTO_LOAD_MATRIX=100200
$GLU_CULLING=100201
$GLU_SAMPLING_TOLERANCE=100203
$GLU_DISPLAY_MODE=100204

$GLU_PARAMETRIC_TOLERANCE=100202
$GLU_SAMPLING_METHOD=100205
$GLU_U_STEP=100206
$GLU_V_STEP=100207

; NurbsSampling
$GLU_PATH_LENGTH=100215
$GLU_PARAMETRIC_ERROR=100216
$GLU_DOMAIN_DISTANCE=100217


; NurbsTrim
$GLU_MAP1_TRIM_2=100210
$GLU_MAP1_TRIM_3=100211

; NurbsDisplay
$GLU_OUTLINE_POLYGON=100240
$GLU_OUTLINE_PATCH=100241

; NurbsErrors
$GLU_NURBS_ERROR1=100251
$GLU_NURBS_ERROR2=100252
$GLU_NURBS_ERROR3=100253
$GLU_NURBS_ERROR4=100254
$GLU_NURBS_ERROR5=100255
$GLU_NURBS_ERROR6=100256
$GLU_NURBS_ERROR7=100257
$GLU_NURBS_ERROR8=100258
$GLU_NURBS_ERROR9=100259
$GLU_NURBS_ERROR10=100260
$GLU_NURBS_ERROR11=100261
$GLU_NURBS_ERROR12=100262
$GLU_NURBS_ERROR13=100263
$GLU_NURBS_ERROR14=100264
$GLU_NURBS_ERROR15=100265
$GLU_NURBS_ERROR16=100266
$GLU_NURBS_ERROR17=100267
$GLU_NURBS_ERROR18=100268
$GLU_NURBS_ERROR19=100269
$GLU_NURBS_ERROR20=100270
$GLU_NURBS_ERROR21=100271
$GLU_NURBS_ERROR22=100272
$GLU_NURBS_ERROR23=100273
$GLU_NURBS_ERROR24=100274
$GLU_NURBS_ERROR25=100275
$GLU_NURBS_ERROR26=100276
$GLU_NURBS_ERROR27=100277
$GLU_NURBS_ERROR28=100278
$GLU_NURBS_ERROR29=100279
$GLU_NURBS_ERROR30=100280
$GLU_NURBS_ERROR31=100281
$GLU_NURBS_ERROR32=100282
$GLU_NURBS_ERROR33=100283
$GLU_NURBS_ERROR34=100284
$GLU_NURBS_ERROR35=100285
$GLU_NURBS_ERROR36=100286
$GLU_NURBS_ERROR37=100287

; Contours types -- obsolete!
$GLU_CW=100120
$GLU_CCW=100121
$GLU_INTERIOR=100122
$GLU_EXTERIOR=100123
$GLU_UNKNOWN=100124

; Names without "TESS_" prefix
$GLU_BEGIN=$GLU_TESS_BEGIN
$GLU_VERTEX=$GLU_TESS_VERTEX
$GLU_END=$GLU_TESS_END
$GLU_ERROR=$GLU_TESS_ERROR
$GLU_EDGE_FLAG=$GLU_TESS_EDGE_FLAG

; Nurbs tesselator
$GLU_NURBS_MODE=100160

$GLU_NURBS_TESSELLATOR=100161
$GLU_NURBS_RENDERER=100162

$GLU_NURBS_BEGIN=100164
$GLU_NURBS_VERTEX=100165
$GLU_NURBS_NORMAL=100166
$GLU_NURBS_COLOR=100167
$GLU_NURBS_TEXTURE_COORD=100168
$GLU_NURBS_END=100169

$GLU_NURBS_BEGIN_DATA=100170
$GLU_NURBS_VERTEX_DATA=100171
$GLU_NURBS_NORMAL_DATA=100172
$GLU_NURBS_COLOR_DATA=100173
$GLU_NURBS_TEXTURE_COORD_DATA=100174
$GLU_NURBS_END_DATA=100175

; Object space tess
$GLU_OBJECT_PARAMETRIC_ERROR=100208
$GLU_OBJECT_PATH_LENGTH=100209

;gluBeginCurve
;https://msdn.microsoft.com/en-us/library/ee872067(v=vs.85).aspx
Func gluBeginCurve($nobj)
	DllCall("Glu32.dll","NONE","gluBeginCurve","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluEndCurve
;https://msdn.microsoft.com/en-us/library/ee872071(v=vs.85).aspx
Func gluEndCurve($nobj)
	DllCall("Glu32.dll","NONE","gluEndCurve","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluBeginPolygon
;https://msdn.microsoft.com/en-us/library/ee872068(v=vs.85).aspx
Func gluBeginPolygon($tess)
	DllCall("Glu32.dll","NONE","gluBeginPolygon","PTR",$tess)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluEndPolygon
;https://msdn.microsoft.com/en-us/library/ee872072(v=vs.85).aspx
Func gluEndPolygon($tess)
	DllCall("Glu32.dll","NONE","gluEndPolygon","PTR",$tess)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluBeginSurface
;https://msdn.microsoft.com/en-us/library/ee872069(v=vs.85).aspx
Func gluBeginSurface($nobj)
	DllCall("Glu32.dll","NONE","gluBeginSurface","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluEndSurface
;https://msdn.microsoft.com/en-us/library/ee872073(v=vs.85).aspx
Func gluEndSurface($nobj)
	DllCall("Glu32.dll","NONE","gluEndSurface","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluBeginTrim
;https://msdn.microsoft.com/en-us/library/ee872070(v=vs.85).aspx
Func gluBeginTrim($nobj)
	DllCall("Glu32.dll","NONE","gluBeginTrim","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluEndTrim
;https://msdn.microsoft.com/en-us/library/ee872074(v=vs.85).aspx
Func gluEndTrim($nobj)
	DllCall("Glu32.dll","NONE","gluEndTrim","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluBuild1DMipmaps
;https://msdn.microsoft.com/en-us/library/dd368651(v=vs.85).aspx
Func gluBuild1DMipmaps($target,$components,$width,$format,$type,$data)
	DllCall("Glu32.dll","NONE","gluBuild1DMipmaps",$GLenum,$target,$GLint,$components,$GLint,$width,$GLenum,$format,$GLenum,$type,"PTR",$data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluBuild2DMipmaps
;https://msdn.microsoft.com/en-us/library/dd368652(v=vs.85).aspx
Func gluBuild2DMipmaps($target,$components,$width,$height,$format,$type,$data)
	DllCall("Glu32.dll","NONE","gluBuild2DMipmaps",$GLenum,$target,$GLint,$components,$GLint,$width,$GLInt,$height,$GLenum,$format,$GLenum,$type,"PTR",$data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluCylinder
;https://msdn.microsoft.com/en-us/library/dd368653(v=vs.85).aspx
Func gluCylinder($qobj,$baseRadius,$topRadius,$height,$slices,$stacks)
	DllCall("Glu32.dll","NONE","gluCylinder","PTR",$qobj,$GLdouble,$baseRadius,$GLdouble,$topRadius,$GLdouble,$height,$GLint,$slices,$GLint,$stacks)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluDeleteNurbsRenderer
;https://msdn.microsoft.com/en-us/library/dd368654(v=vs.85).aspx
Func gluDeleteNurbsRenderer($nobj)
	DllCall("Glu32.dll","NONE","gluDeleteNurbsRenderer","PTR",$nobj)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluDeleteQuadric
;https://msdn.microsoft.com/en-us/library/dd368655(v=vs.85).aspx
Func gluDeleteQuadric($state)
	DllCall("Glu32.dll","NONE","gluDeleteQuadric","PTR",$state)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluDeleteTess
;https://msdn.microsoft.com/en-us/library/dd368656(v=vs.85).aspx
Func gluDeleteTess($tess)
	DllCall("Glu32.dll","NONE","gluDeleteTess","PTR",$tess)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluDisk
;https://msdn.microsoft.com/en-us/library/dd368657(v=vs.85).aspx
Func gluDisk($qobj,$innerRadius,$outerRadius,$slices,$loops)
	DllCall("Glu32.dll","NONE","gluDisk","PTR",$qobj,$GLdouble,$innerRadius,$GLdouble,$outerRadius,$GLint,$slices,$GLint,$loops)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluErrorString
;https://msdn.microsoft.com/en-us/library/dd368658(v=vs.85).aspx
Func gluErrorString($errCode)
	Local $a=DllCall("Glu32.dll","STR","gluErrorString",$GLenum,$errCode)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluGetNurbsProperty
;https://msdn.microsoft.com/en-us/library/dd368659(v=vs.85).aspx
Func gluGetNurbsProperty($nobj,$property,$value)
	DllCall("Glu32.dll","NONE","gluGetNurbsProperty","PTR",$nobj,$GLenum,$property,"PTR",$value)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluGetString
;https://msdn.microsoft.com/en-us/library/dd368660(v=vs.85).aspx
Func gluGetString($name)
	Local $a=DllCall("Glu32.dll","STR","gluGetString",$GLenum,$name)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluGetTessProperty
;https://msdn.microsoft.com/en-us/library/dd368661(v=vs.85).aspx
Func gluGetTessProperty($tess,$which,$value)
	DllCall("Glu32.dll","NONE","gluGetTessProperty","PTR",$tess,$GLenum,$which,"PTR",$value)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluLoadSamplingMatrices
;https://msdn.microsoft.com/en-us/library/dd368662(v=vs.85).aspx
Func gluLoadSamplingMatrices($nobj,$modelMatrix,$projMatrix,$viewport)
	DllCall("Glu32.dll","NONE","gluLoadSamplingMatrices","PTR",$nobj,"PTR",$modelMatrix,"PTR",$projMatrix,"PTR",$viewport)
EndFunc
;gluLookAt
;https://msdn.microsoft.com/en-us/library/dd368663(v=vs.85).aspx
Func gluLookAt($eyex,$eyey,$eyez,$centerx,$centery,$centerz,$upx,$upy,$upz)
	DllCall("Glu32.dll","NONE","gluLookAt",$GLdouble,$eyex,$GLdouble,$eyey,$GLdouble,$eyez,$GLdouble,$centerx,$GLdouble,$centery,$GLdouble,$centerz,$GLdouble,$upx,$GLdouble,$upy,$GLdouble,$upz)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluNewNurbsRenderer
;https://msdn.microsoft.com/en-us/library/dd368664(v=vs.85).aspx
Func gluNewNurbsRenderer()
	Local $a=DllCall("Glu32.dll","PTR","gluNewNurbsRenderer")
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluNewQuadric
;https://msdn.microsoft.com/en-us/library/dd368665(v=vs.85).aspx
Func gluNewQuadric()
	Local $a=DllCall("Glu32.dll","PTR","gluNewQuadric")
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluNewTess
;https://msdn.microsoft.com/en-us/library/dd368667(v=vs.85).aspx
Func gluNewTess()
	Local $a=DllCall("Glu32.dll","PTR","gluNewTess")
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluNextContour
;https://msdn.microsoft.com/en-us/library/dd368668(v=vs.85).aspx
Func gluNextContour($tess,$type)
	DllCall("Glu32.dll","NONE","gluNextContour","PTR",$tess,$GLenum,$type)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluNurbsCallback
;https://msdn.microsoft.com/en-us/library/dd368669(v=vs.85).aspx
Func gluNurbsCallback($nobj,$which,$fn)
	DllCall("Glu32.dll","NONE","gluNurbsCallback","PTR",$nobj,$GLenum,$which,"PTR",$fn)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluNurbsCurve
;https://msdn.microsoft.com/en-us/library/dd368670(v=vs.85).aspx
Func gluNurbsCurve($nobj,$nknots,$knot,$stride,$ctlarray,$order,$type)
	DllCall("Glu32.dll","NONE","gluNurbsCurve","PTR",$nobj,$GLint,$nknots,"PTR",$knot,$GLint,$stride,"PTR",$ctlarray,$GLint,$order,$GLenum,$type)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluNurbsProperty
;https://msdn.microsoft.com/en-us/library/dd368671(v=vs.85).aspx
Func gluNurbsProperty($nobj,$property,$value)
	DllCall("Glu32.dll","NONE","gluNurbsProperty","PTR",$nobj,$GLenum,$property,$GLfloat,$value)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluNurbsSurface
;https://msdn.microsoft.com/en-us/library/dd368672(v=vs.85).aspx
Func gluNurbsSurface($nobj,$sknot_count,$sknot,$tknot_count,$tknot,$s_stride,$t_stride,$ctlarray,$sorder,$torder,$type)
	DllCall("Glu32.dll","NONE","gluNurbsSurface","PTR",$nobj,$GLInt,$sknot_count,"PTR",$sknot,$GLint,$tknot_count,"PTR",$tknot,$GLint,$s_stride,$GLint,$t_stride,"PTR",$ctlarray,$GLint,$sorder,$GLint,$torder,$GLenum,$type)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluOrtho2D
;https://msdn.microsoft.com/en-us/library/dd368673(v=vs.85).aspx
Func gluOrtho2D($left,$right,$top,$bottom)
	DllCall("Glu32.dll","NONE","gluOrtho2D",$GLdouble,$left,$GLdouble,$right,$GLdouble,$top,$GLdouble,$bottom)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluPartialDisk
;https://msdn.microsoft.com/en-us/library/dd368674(v=vs.85).aspx
Func gluPartialDisk($qobj,$innerRadius,$outerRadius,$slices,$loops,$startAngle,$sweepAngle)
	DllCall("Glu32.dll","NONE","gluPartialDisk","PTR",$qobj,$GLdouble,$innerRadius,$GLdouble,$outerRadius,$GLint,$slices,$GLint,$loops,$GLdouble,$startAngle,$GLdouble,$sweepAngle)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluPerspective
;https://msdn.microsoft.com/en-us/library/dd368675(v=vs.85).aspx
Func gluPerspective($fovy,$aspect,$zNear,$zFar)
	DllCall("Glu32.dll","NONE","gluPerspective",$GLdouble,$fovy,$GLdouble,$aspect,$GLdouble,$zNear,$GLdouble,$zFar)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluPickMatrix
;https://msdn.microsoft.com/en-us/library/dd368676(v=vs.85).aspx
Func gluPickMatrix($x,$y,$height,$width,$viewport)
	DllCall("Glu32.dll","NONE","gluPickMatrix",$GLdouble,$x,$GLdouble,$y,$GLdouble,$height,$GLdouble,$width,"PTR",$viewport)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluProject
;https://msdn.microsoft.com/en-us/library/dd368677(v=vs.85).aspx
Func gluProject($objx,$objy,$objz,$modelMatrix,$projMatrix,$viewport,$winx,$winy,$winz)
	Local $a=DllCall("Glu32.dll","INT","gluProject",$GLdouble,$objx,$GLdouble,$objy,$GLdouble,$objz,"PTR",$modelMatrix,"PTR",$projMatrix,"PTR",$viewport,"PTR",$winx,"PTR",$winy,"PTR",$winz)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluPwlCurve
;https://msdn.microsoft.com/en-us/library/dd368678(v=vs.85).aspx
Func gluPwlCurve($nobj,$count,$array,$stride,$type)
	DllCall("Glu32.dll","NONE","gluPwlCurve","PTR",$nobj,$GLint,$count,"PTR",$array,$GLint,$stride,$GLenum,$type)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluQuadricCallback
;https://msdn.microsoft.com/en-us/library/dd368679(v=vs.85).aspx
Func gluQuadricCallback($qobj,$which,$fn)
	DllCall("Glu32.dll","NONE","gluQuadricCallback","PTR",$qobj,$GLenum,$which,"PTR",$fn)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluQuadricDrawStyle
;https://msdn.microsoft.com/en-us/library/dd368680(v=vs.85).aspx
Func gluQuadricDrawStyle($quadObject,$drawStyle)
	DllCall("Glu32.dll","NONE","gluQuadricDrawStyle","PTR",$quadObject,$GLenum,$drawStyle)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluQuadricNormals
;https://msdn.microsoft.com/en-us/library/dd368681(v=vs.85).aspx
Func gluQuadricNormals($quadObject,$normals)
	DllCall("Glu32.dll","NONE","gluQuadricNormals","PTR",$quadObject,$GLenum,$normals)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluQuadricOrientation
;https://msdn.microsoft.com/en-us/library/dd368682(v=vs.85).aspx
Func gluQuadricOrientation($quadObject,$orientation)
	DllCall("Glu32.dll","NONE","gluQuadricOrientation","PTR",$quadObject,$GLenum,$orientation)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluQuadricTexture
;https://msdn.microsoft.com/en-us/library/dd374148(v=vs.85).aspx
Func gluQuadricTexture($quadObject,$textureCoords)
	DllCall("Glu32.dll","NONE","gluQuadricTexture","PTR",$quadObject,$GLboolean,$textureCoords)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluScaleImage
;https://msdn.microsoft.com/en-us/library/dd374149(v=vs.85).aspx
Func gluScaleImage($format,$widthin,$heightin,$typein,$datain,$widthout,$heightout,$typeout,$dataout)
	Local $a=DllCall("Glu32.dll","INT","gluScaleImage",$GLenum,$format,$GLint,$widthin,$GLint,$heightin,$GLenum,$typein,"PTR",$datain,$GLint,$widthout,$GLint,$heightout,$GLenum,$typeout,"PTR",$dataout)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc
;gluSphere
;https://msdn.microsoft.com/en-us/library/dd374150(v=vs.85).aspx
Func gluSphere($qobj,$radius,$slices,$stacks)
	DllCall("Glu32.dll","NONE","gluSphere","PTR",$qobj,$GLdouble,$radius,$GLint,$slices,$GLint,$stacks)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessBeginContour
;https://msdn.microsoft.com/en-us/library/ee872075(v=vs.85).aspx
Func gluTessBeginContour($tess)
	DllCall("Glu32.dll","NONE","gluTessBeginContour","PTR",$tess)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessEndContour
;https://msdn.microsoft.com/en-us/library/ee872077(v=vs.85).aspx
Func gluTessEndContour($tess)
	DllCall("Glu32.dll","NONE","gluTessEndContour","PTR",$tess)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessBeginPolygon
;https://msdn.microsoft.com/en-us/library/ee872076(v=vs.85).aspx
Func gluTessBeginPolygon($tess,$polygon_data)
	DllCall("Glu32.dll","NONE","gluTessBeginPolygon","PTR",$tess,"PTR",$polygon_data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessEndPolygon
;https://msdn.microsoft.com/en-us/library/ee872078(v=vs.85).aspx
Func gluTessEndPolygon($tess)
	DllCall("Glu32.dll","NONE","gluTessEndPolygon","PTR",$tess)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessCallback
;https://msdn.microsoft.com/en-us/library/dd374151(v=vs.85).aspx
Func gluTessCallback($tess,$which,$fn)
	DllCall("Glu32.dll","NONE","gluTessCallback","PTR",$tess,$GLenum,$which,"PTR",$fn)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessNormal
;https://msdn.microsoft.com/en-us/library/dd374154(v=vs.85).aspx
Func gluTessNormal($tess,$x,$y,$z)
	DllCall("Glu32.dll","NONE","gluTessNormal","PTR",$tess,$GLdouble,$x,$GLdouble,$y,$GLdouble,$z)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessProperty
;https://msdn.microsoft.com/en-us/library/dd374155(v=vs.85).aspx
Func gluTessProperty($tess,$which,$value)
	DllCall("Glu32.dll","NONE","gluTessProperty","PTR",$tess,$GLenum,$which,$GLdouble,$value)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluTessVertex
;https://msdn.microsoft.com/en-us/library/dd374156(v=vs.85).aspx
Func gluTessVertex($tess,$coords,$data)
	DllCall("Glu32.dll","NONE","gluTessVertex","PTR",$tess,"PTR",$coords,"PTR",$data)
	If @error<>0 Then Return SetError(@error, @extended, 0)
EndFunc
;gluUnProject
;https://msdn.microsoft.com/en-us/library/dd374157(v=vs.85).aspx
Func gluUnProject($winx,$winy,$winz,$modelMatrix,$projMatrix,$viewport,$objx,$objy,$objz)
	Local $a=DllCall("Glu32.dll","INT","gluUnProject",$GLdouble,$winx,$GLdouble,$winy,$GLdouble,$winz,"PTR",$modelMatrix,"PTR",$projMatrix,"PTR",$viewport,"PTR",$objx,"PTR",$objy,"PTR",$objz)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $a
EndFunc