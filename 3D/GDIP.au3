#include-once
#include <GDIPlus.au3>
#include <GDIPConstants.au3>

; #INDEX# =======================================================================================================================
; Title .........: GDI+
; AutoIt Version:  3.3.6.1
; Language:        English
; Description ...: GDI + allows you to easily manipulate 2D, without having to select from the dc, the pen, the font, so the brush
;                  can restore the DC to its original state before returning (it's hard enough with GDI). We can manipulate images,
;                  scale, rotate, translate, shear, or mix these functions quite easily. The pen have several functionsto make
;                  indents. You can define preset tips for lines such as the tips of arrows or creating custom tips. The brushes
;                  are quite numerous and diverse, we can make very easily degraded by passing the color of departure and arrival.
;                  You can also set a texture to a brush from an image. Regions can be combined to obtain the desired effects
;                  (exclusion, intersection, union and others). Different types of forms are easily achievable (Bezier curves, pie,
;                  polygon), these forms can be filled with all kinds of brushes. There are also management transparency with the
;                  interpolation mode, composite quality, all these functions can act on the final rendering.
; ===============================================================================================================================


; #VARIABLES# ===================================================================================================================
Global $ghGDIPMatrix = 0
Global $GDIP_STATUS = 0
Global $GDIP_ERROR = 0
; ===============================================================================================================================

;================================================================================================================================
; #CURRENT# =====================================================================================================================
; _GDIPlus_BitmapCreateFromFileICM
; _GDIPlus_BitmapCreateFromGdiDib
; _GDIPlus_BitmapCreateFromHICON
; _GDIPlus_BitmapCreateFromResource
; _GDIPlus_BitmapCreateFromScan0
; _GDIPlus_BitmapCreateFromStream
; _GDIPlus_BitmapCreateFromStreamICM
; _GDIPlus_BitmapGetPixel
; _GDIPlus_BitmapSetPixel
; _GDIPlus_BitmapSetResolution
; _GDIPlus_HICONCreateFromBitmap
; _GDIPlus_CachedBitmapCreate
; _GDIPlus_CachedBitmapDispose
; _GDIPlus_ColorMatrixCreate
; _GDIPlus_ColorMatrixCreateGrayScale
; _GDIPlus_ColorMatrixCreateNegative
; _GDIPlus_ColorMatrixCreateSaturation
; _GDIPlus_ColorMatrixCreateScale
; _GDIPlus_ColorMatrixCreateTranslate
; _GDIPlus_ColorMatrixInitHue
; _GDIPlus_ColorMatrixMultiply
; _GDIPlus_ColorMatrixRotateBlue
; _GDIPlus_ColorMatrixRotateColor
; _GDIPlus_ColorMatrixRotateGreen
; _GDIPlus_ColorMatrixRotateHue
; _GDIPlus_ColorMatrixRotateRed
; _GDIPlus_ColorMatrixScale
; _GDIPlus_ColorMatrixSetSaturation
; _GDIPlus_ColorMatrixShearBlue
; _GDIPlus_ColorMatrixShearColor
; _GDIPlus_ColorMatrixShearGreen
; _GDIPlus_ColorMatrixShearRed
; _GDIPlus_ColorMatrixTranslate
; _GDIPlus_ColorMatrixTransformLuminance
; _GDIPlus_CustomLineCapClone
; _GDIPlus_CustomLineCapCreate
; _GDIPlus_CustomLineCapGetBaseCap
; _GDIPlus_CustomLineCapGetBaseInset
; _GDIPlus_CustomLineCapGetStrokeCaps
; _GDIPlus_CustomLineCapGetStrokeJoin
; _GDIPlus_CustomLineCapGetType
; _GDIPlus_CustomLineCapGetWidthScale
; _GDIPlus_CustomLineCapSetBaseCap
; _GDIPlus_CustomLineCapSetBaseInset
; _GDIPlus_CustomLineCapSetStrokeCaps
; _GDIPlus_CustomLineCapSetStrokeJoin
; _GDIPlus_CustomLineCapSetWidthScale
; _GDIPlus_FontClone
; _GDIPlus_FontCollectionCreate
; _GDIPlus_FontCollectionGetFamilyCount
; _GDIPlus_FontCollectionGetFamilyList
; _GDIPlus_FontCreateFromDC
; _GDIPlus_FontCreateFromLogfont
; _GDIPlus_FontGetFamily
; _GDIPlus_FontGetHeight
; _GDIPlus_FontGetHeightGivenDPI
; _GDIPlus_FontGetLogFont
; _GDIPlus_FontGetSize
; _GDIPlus_FontGetStyle
; _GDIPlus_FontGetUnit
; _GDIPlus_PrivateCollectionAddFontFile
; _GDIPlus_PrivateCollectionAddMemoryFont
; _GDIPlus_PrivateCollectionCreate
; _GDIPlus_PrivateFontCollectionDispose
; _GDIPlus_FontFamilyClone
; _GDIPlus_FontFamilyCreate2
; _GDIPlus_FontFamilyCreateGenericMonospace
; _GDIPlus_FontFamilyCreateGenericSansSerif
; _GDIPlus_FontFamilyCreateGenericSerif
; _GDIPlus_FontFamilyGetCellAscent
; _GDIPlus_FontFamilyGetCellDescent
; _GDIPlus_FontFamilyGetEmHeight
; _GDIPlus_FontFamilyGetFamilyName
; _GDIPlus_FontFamilyGetLineSpacing
; _GDIPlus_FontFamilyIsStyleAvailable
; _GDIPlus_CreateHalftonePalette
; _GDIPlus_GraphicsBeginContainer
; _GDIPlus_GraphicsBeginContainer2
; _GDIPlus_GraphicsComment
; _GDIPlus_GraphicsCreateFromHDC2
; _GDIPlus_GraphicsCreateFromHWNDICM
; _GDIPlus_GraphicsDrawBeziers
; _GDIPlus_GraphicsDrawCachedBitmap
; _GDIPlus_GraphicsDrawClosedCurve2
; _GDIPlus_GraphicsDrawCurve2
; _GDIPlus_GraphicsDrawCurve3
; _GDIPlus_GraphicsDrawImagePointRect
; _GDIPlus_GraphicsDrawImagePointsRect
; _GDIPlus_GraphicsDrawImageRectRectIA
; _GDIPlus_GraphicsDrawLines
; _GDIPlus_GraphicsDrawPath
; _GDIPlus_GraphicsDrawRectangles
; _GDIPlus_GraphicsEndContainer
; _GDIPlus_GraphicsFillClosedCurve2
; _GDIPlus_GraphicsFillPath
; _GDIPlus_GraphicsFillPolygon2
; _GDIPlus_GraphicsFillRectangles
; _GDIPlus_GraphicsFillRegion
; _GDIPlus_GraphicsFlush
; _GDIPlus_GraphicsGetClip
; _GDIPlus_GraphicsGetClipBounds
; _GDIPlus_GraphicsGetCompositingMode
; _GDIPlus_GraphicsGetCompositingQuality
; _GDIPlus_GraphicsGetDpiX
; _GDIPlus_GraphicsGetDpiY
; _GDIPlus_GraphicsGetInterpolationMode
; _GDIPlus_GraphicsGetNearestColor
; _GDIPlus_GraphicsGetPageScale
; _GDIPlus_GraphicsGetPageUnit
; _GDIPlus_GraphicsGetPixelOffsetMode
; _GDIPlus_GraphicsGetRenderingOrigin
; _GDIPlus_GraphicsGetTextContrast
; _GDIPlus_GraphicsGetTextRenderingHint
; _GDIPlus_GraphicsGetTransform
; _GDIPlus_GraphicsGetVisibleClipBounds
; _GDIPlus_GraphicsIsClipEmpty
; _GDIPlus_GraphicsIsVisibleClipEmpty
; _GDIPlus_GraphicsIsVisiblePoint
; _GDIPlus_GraphicsIsVisibleRect
; _GDIPlus_GraphicsMultiplyTransform
; _GDIPlus_GraphicsResetClip
; _GDIPlus_GraphicsResetPageTransform
; _GDIPlus_GraphicsResetTransform
; _GDIPlus_GraphicsRestore
; _GDIPlus_GraphicsRotateTransform
; _GDIPlus_GraphicsSave
; _GDIPlus_GraphicsScaleTransform
; _GDIPlus_GraphicsSetClipGraphics
; _GDIPlus_GraphicsSetClipHrgn
; _GDIPlus_GraphicsSetClipPath
; _GDIPlus_GraphicsSetClipRect
; _GDIPlus_GraphicsSetClipRegion
; _GDIPlus_GraphicsSetCompositingMode
; _GDIPlus_GraphicsSetCompositingQuality
; _GDIPlus_GraphicsSetInterpolationMode
; _GDIPlus_GraphicsSetPageScale
; _GDIPlus_GraphicsSetPageUnit
; _GDIPlus_GraphicsSetPixelOffsetMode
; _GDIPlus_GraphicsSetRenderingOrigin
; _GDIPlus_GraphicsSetTextContrast
; _GDIPlus_GraphicsSetTextRenderingHint
; _GDIPlus_GraphicsTransformPoints
; _GDIPlus_GraphicsTransformPointsI
; _GDIPlus_GraphicsTranslateClip
; _GDIPlus_GraphicsTranslateTransform
; _GDIPlus_StreamCreateOnFile
; _GDIPlus_MetafileCreateFromEmf
; _GDIPlus_MetafileCreateFromFile
; _GDIPlus_MetafileCreateFromStream
; _GDIPlus_MetafileCreateFromWmf
; _GDIPlus_MetafileCreateFromWmfFile
; _GDIPlus_MetafileCreateHENMETAFILEFromMetafile
; _GDIPlus_MetafileEmfToWmfBits
; _GDIPlus_MetafileEnumerateDestPoint
; _GDIPlus_MetafileEnumerateDestPoints
; _GDIPlus_MetafileEnumerateDestRect
; _GDIPlus_MetafileEnumerateSrcRectDestPoint
; _GDIPlus_MetafileEnumerateSrcRectDestPoints
; _GDIPlus_MetafileEnumerateSrcRectDestRect
; _GDIPlus_MetafileGetDownLevelRasterizationLimit
; _GDIPlus_MetafileHeaderFromEmf
; _GDIPlus_MetafileHeaderFromFile
; _GDIPlus_MetafileHeaderFromMetafile
; _GDIPlus_MetafileHeaderFromStream
; _GDIPlus_MetafileHeaderFromWmf
; _GDIPlus_MetafilePlayRecord
; _GDIPlus_MetafileRecord
; _GDIPlus_MetafileRecordFileName
; _GDIPlus_MetafileRecordStream
; _GDIPlus_MetafileSetDownLevelRasterizationLimit
; _GDIPlus_PathAddArc
; _GDIPlus_PathAddBezier
; _GDIPlus_PathAddBeziers
; _GDIPlus_PathAddClosedCurve
; _GDIPlus_PathAddClosedCurves
; _GDIPlus_PathAddCurve
; _GDIPlus_PathAddCurves
; _GDIPlus_PathAddCurvesSubset
; _GDIPlus_PathAddEllipse
; _GDIPlus_PathAddLine
; _GDIPlus_PathAddLines
; _GDIPlus_PathAddPath
; _GDIPlus_PathAddPie
; _GDIPlus_PathAddPolygon
; _GDIPlus_PathAddRectangle
; _GDIPlus_PathAddRectangles
; _GDIPlus_PathAddString
; _GDIPlus_PathClearMarkers
; _GDIPlus_PathClone
; _GDIPlus_PathCloseFigure
; _GDIPlus_PathCloseFigures
; _GDIPlus_PathCreate
; _GDIPlus_PathCreate2
; _GDIPlus_PathDispose
; _GDIPlus_PathFlatten
; _GDIPlus_PathGetData
; _GDIPlus_PathGetFillMode
; _GDIPlus_PathGetLastPoint
; _GDIPlus_PathGetPointCount
; _GDIPlus_PathGetPoints
; _GDIPlus_PathGetPointsI
; _GDIPlus_PathGetTypes
; _GDIPlus_PathGetWorldBounds
; _GDIPlus_PathIsOutlineVisiblePoint
; _GDIPlus_PathIsVisiblePoint
; _GDIPlus_PathReset
; _GDIPlus_PathReverse
; _GDIPlus_PathSetFillMode
; _GDIPlus_PathSetMarker
; _GDIPlus_PathStartFigure
; _GDIPlus_PathTransform
; _GDIPlus_PathWarp
; _GDIPlus_PathWiden
; _GDIPlus_PathWindingModeOutline
; _GDIPlus_PathIterCopyData
; _GDIPlus_PathIterCreate
; _GDIPlus_PathIterDispose
; _GDIPlus_PathIterEnumerate
; _GDIPlus_PathIterGetCount
; _GDIPlus_PathIterGetSubpathCount
; _GDIPlus_PathIterHasCurve
; _GDIPlus_PathIterIsValid
; _GDIPlus_PathIterNextMarker
; _GDIPlus_PathIterNextMarkerPath
; _GDIPlus_PathIterNextPathType
; _GDIPlus_PathIterNextSubpath
; _GDIPlus_PathIterNextSubpathPath
; _GDIPlus_PathIterRewind
; _GDIPlus_HatchBrushCreate
; _GDIPlus_HatchBrushGetBackgroundColor
; _GDIPlus_HatchBrushGetForegroundColor
; _GDIPlus_HatchBrushGetStyle
; _GDIPlus_ImageClone
; _GDIPlus_ImageForceValidation
; _GDIPlus_ImageGetAllPropertyItems
; _GDIPlus_ImageGetBounds
; _GDIPlus_ImageGetDimension
; _GDIPlus_ImageGetFrameCount
; _GDIPlus_ImageGetFrameDimensionsCount
; _GDIPlus_ImageGetFrameDimensionsList
; _GDIPlus_ImageGetPalette
; _GDIPlus_ImageGetPaletteSize
; _GDIPlus_ImageGetPropertyCount
; _GDIPlus_ImageGetPropertyIdList
; _GDIPlus_ImageGetPropertyItem
; _GDIPlus_ImageGetPropertyItemSize
; _GDIPlus_ImageGetPropertySize
; _GDIPlus_ImageGetThumbnail
; _GDIPlus_ImageLoadFromFileICM
; _GDIPlus_ImageLoadFromStream
; _GDIPlus_ImageLoadFromStreamICM
; _GDIPlus_ImageRemovePropertyItem
; _GDIPlus_ImageRotateFlip
; _GDIPlus_ImageSaveAdd
; _GDIPlus_ImageSaveAddImage
; _GDIPlus_ImageSaveToStream
; _GDIPlus_ImageSelectActiveFrame
; _GDIPlus_ImageSetPalette
; _GDIPlus_ImageSetPropertyItem
; _GDIPlus_ImageAttributesClone
; _GDIPlus_ImageAttributesCreate
; _GDIPlus_ImageAttributesDispose
; _GDIPlus_ImageAttributesGetAdjustedPalette
; _GDIPlus_ImageAttributesReset
; _GDIPlus_ImageAttributesSetColorKeys
; _GDIPlus_ImageAttributesSetColorMatrix
; _GDIPlus_ImageAttributesSetGamma
; _GDIPlus_ImageAttributesSetNoOp
; _GDIPlus_ImageAttributesSetOutputChannel
; _GDIPlus_ImageAttributesSetOutputChannelColorProfile
; _GDIPlus_ImageAttributesSetRemapTable
; _GDIPlus_ImageAttributesSetThreshold
; _GDIPlus_ImageAttributesSetToIdentity
; _GDIPlus_ImageAttributesSetWrapMode
; _GDIPlus_LineBrushCreate
; _GDIPlus_LineBrushCreateFromRect
; _GDIPlus_LineBrushCreateFromRectWithAngle
; _GDIPlus_LineBrushGetBlend
; _GDIPlus_LineBrushGetBlendCount
; _GDIPlus_LineBrushGetColors
; _GDIPlus_LineBrushGetGammaCorrection
; _GDIPlus_LineBrushGetPresetBlend
; _GDIPlus_LineBrushGetPresetBlendCount
; _GDIPlus_LineBrushGetRect
; _GDIPlus_LineBrushGetTransform
; _GDIPlus_LineBrushGetWrapMode
; _GDIPlus_LineBrushMultiplyTransform
; _GDIPlus_LineBrushResetTransform
; _GDIPlus_LineBrushRotateTransform
; _GDIPlus_LineBrushScaleTransform
; _GDIPlus_LineBrushSetBlend
; _GDIPlus_LineBrushSetColors
; _GDIPlus_LineBrushSetGammaCorrection
; _GDIPlus_LineBrushSetLinearBlend
; _GDIPlus_LineBrushSetPresetBlend
; _GDIPlus_LineBrushSetSigmaBlend
; _GDIPlus_LineBrushSetTransform
; _GDIPlus_LineBrushSetWrapMode
; _GDIPlus_LineBrushTranslateTransform
; _GDIPlus_MatrixClone
; _GDIPlus_MatrixCreate2
; _GDIPlus_MatrixCreate3
; _GDIPlus_MatrixGetElements
; _GDIPlus_MatrixInvert
; _GDIPlus_MatrixIsEqual
; _GDIPlus_MatrixIsIdentity
; _GDIPlus_MatrixIsInvertible
; _GDIPlus_MatrixMultiply
; _GDIPlus_MatrixSetElements
; _GDIPlus_MatrixShear
; _GDIPlus_MatrixTransformPoints
; _GDIPlus_MatrixTransformPointsI
; _GDIPlus_MatrixVectorTransformPoints
; _GDIPlus_MatrixVectorTransformPointsI
; _GDIPlus_PathBrushCreate
; _GDIPlus_PathBrushCreateFromPath
; _GDIPlus_PathBrushGetBlend
; _GDIPlus_PathBrushGetBlendCount
; _GDIPlus_PathBrushGetCenterColor
; _GDIPlus_PathBrushGetCenterPoint
; _GDIPlus_PathBrushGetCenterPointI
; _GDIPlus_PathBrushGetFocusScales
; _GDIPlus_PathBrushGetGammaCorrection
; _GDIPlus_PathBrushGetPointCount
; _GDIPlus_PathBrushGetPresetBlend
; _GDIPlus_PathBrushGetPresetBlendCount
; _GDIPlus_PathBrushGetRect
; _GDIPlus_PathBrushGetSurroundColorCount
; _GDIPlus_PathBrushGetSurroundColorsWithCount
; _GDIPlus_PathBrushGetTransform
; _GDIPlus_PathBrushGetWrapMode
; _GDIPlus_PathBrushMultiplyTransform
; _GDIPlus_PathBrushResetTransform
; _GDIPlus_PathBrushRotateTransform
; _GDIPlus_PathBrushScaleTransform
; _GDIPlus_PathBrushSetBlend
; _GDIPlus_PathBrushSetCenterColor
; _GDIPlus_PathBrushSetCenterPoint
; _GDIPlus_PathBrushSetFocusScales
; _GDIPlus_PathBrushSetGammaCorrection
; _GDIPlus_PathBrushSetLinearBlend
; _GDIPlus_PathBrushSetPresetBlend
; _GDIPlus_PathBrushSetSigmaBlend
; _GDIPlus_PathBrushSetSurroundColorsWithCount
; _GDIPlus_PathBrushSetTransform
; _GDIPlus_PathBrushSetWrapMode
; _GDIPlus_PathBrushTranslateTransform
; _GDIPlus_PenClone
; _GDIPlus_PenCreate2
; _GDIPlus_PenGetBrushFill
; _GDIPlus_PenGetCompoundArray
; _GDIPlus_PenGetCompoundCount
; _GDIPlus_PenGetCustomStartCap
; _GDIPlus_PenGetDashArray
; _GDIPlus_PenGetDashCount
; _GDIPlus_PenGetDashOffset
; _GDIPlus_PenGetFillType
; _GDIPlus_PenGetLineJoin
; _GDIPlus_PenGetMiterLimit
; _GDIPlus_PenGetStartCap
; _GDIPlus_PenGetTransform
; _GDIPlus_PenGetUnit
; _GDIPlus_PenMultiplyTransform
; _GDIPlus_PenResetTransform
; _GDIPlus_PenRotateTransform
; _GDIPlus_PenScaleTransform
; _GDIPlus_PenSetBrushFill
; _GDIPlus_PenSetCompoundArray
; _GDIPlus_PenSetCustomStartCap
; _GDIPlus_PenSetDashArray
; _GDIPlus_PenSetDashOffset
; _GDIPlus_PenSetLineCap
; _GDIPlus_PenSetLineJoin
; _GDIPlus_PenSetMiterLimit
; _GDIPlus_PenSetStartCap
; _GDIPlus_PenSetTransform
; _GDIPlus_PenSetUnit
; _GDIPlus_PenTranslateTransform
; _GDIPlus_RegionClone
; _GDIPlus_RegionCombinePath
; _GDIPlus_RegionCombineRect
; _GDIPlus_RegionCombineRegion
; _GDIPlus_RegionCreate
; _GDIPlus_RegionCreateFromHrgn
; _GDIPlus_RegionCreateFromPath
; _GDIPlus_RegionCreateFromRect
; _GDIPlus_RegionCreateFromRgnData
; _GDIPlus_RegionDispose
; _GDIPlus_RegionGetBounds
; _GDIPlus_RegionGetData
; _GDIPlus_RegionGetDataSize
; _GDIPlus_RegionGetHRgn
; _GDIPlus_RegionGetScans
; _GDIPlus_RegionGetScansCount
; _GDIPlus_RegionIsEmpty
; _GDIPlus_RegionIsEqual
; _GDIPlus_RegionIsInfinite
; _GDIPlus_RegionIsVisiblePoint
; _GDIPlus_RegionIsVisibleRect
; _GDIPlus_RegionSetEmpty
; _GDIPlus_RegionSetInfinite
; _GDIPlus_RegionTransform
; _GDIPlus_RegionTranslate
; _GDIPlus_BrushGetFillColor
; _GDIPlus_BrushSetFillColor
; _GDIPlus_StringFormatClone
; _GDIPlus_StringFormatCreateDefault
; _GDIPlus_StringFormatCreateTypographic
; _GDIPlus_StringFormatGetAlign
; _GDIPlus_StringFormatGetDigitSubstitution
; _GDIPlus_StringFormatGetFlags
; _GDIPlus_StringFormatGetHotkeyPrefix
; _GDIPlus_StringFormatGetLineAlign
; _GDIPlus_StringFormatGetMeasurableCharacterRangeCount
; _GDIPlus_StringFormatGetTabStopCount
; _GDIPlus_StringFormatGetTabStops
; _GDIPlus_StringFormatGetTrimming
; _GDIPlus_StringFormatSetDigitSubstitution
; _GDIPlus_StringFormatSetFlags
; _GDIPlus_StringFormatSetHotkeyPrefix
; _GDIPlus_StringFormatSetLineAlign
; _GDIPlus_StringFormatSetMeasurableCharacterRanges
; _GDIPlus_StringFormatSetTabStops
; _GDIPlus_StringFormatSetTrimming
; _GDIPlus_GraphicsDrawDriverString
; _GDIPlus_GraphicsMeasureCharacterRanges
; _GDIPlus_GraphicsMeasureDriverString
; _GDIPlus_TextureCreate
; _GDIPlus_TextureCreate2
; _GDIPlus_TextureCreateIA
; _GDIPlus_TextureGetImage
; _GDIPlus_TextureGetTransform
; _GDIPlus_TextureGetWrapMode
; _GDIPlus_TextureMultiplyTransform
; _GDIPlus_TextureResetTransform
; _GDIPlus_TextureRotateTransform
; _GDIPlus_TextureScaleTransform
; _GDIPlus_TextureSetTransform
; _GDIPlus_TextureSetWrapMode
; _GDIPlus_TextureTranslateTransform
; ===============================================================================================================================

; #INTERNAL_USE_ONLY#============================================================================================================
;_GDIPlus_MatrixDefCreate
;_GDIPlus_MatrixDefDispose
;================================================================================================================================



#Region Bitmap Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_BitmapCreateFromFileICM
; Description ...: Creates a Bitmap object based on an image file. This function uses ICM
; Syntax.........: _GDIPlus_BitmapCreateFromFileICM($sFileName)
; Parameters ....: $sFileName - The name of the image file
; Return values .: Success      - Returns a handle to a new Bitmap object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The graphics file formats supported by GDI+ are BMP, GIF, JPEG, PNG, TIFF, Exif, WMF, and EMF.
;                  After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipCreateBitmapFromFileICM
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_BitmapCreateFromFileICM($sFileName)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateBitmapFromFileICM", "wstr", $sFileName, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_BitmapCreateFromFileICM

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_BitmapCreateFromGdiDib
; Description ...: Creates a Bitmap object based on a $tagBITMAPINFO structure and an array of pixel data
; Syntax.........: _GDIPlus_BitmapCreateFromGdiDib($tBitmapInfo, $pBitmapData)
; Parameters ....: $tBitmapInfo - A $tagBITMAPINFO structure variable. This structure defines several bitmap attributes, such as
;                  size and pixel format
;                  $pBitmapData - Pointer to an array of bytes that contains the pixel data
; Return values .: Success      - Returns a handle to a new Bitmap object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose, _WinAPI_CreateDIBSection, $tagBITMAPINFO
; Link ..........; @@MsdnLink@@ GdipCreateBitmapFromGdiDib
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_BitmapCreateFromGdiDib($tBitmapInfo, $pBitmapData)
	Local $pBitmapInfo, $aResult

	$pBitmapInfo = DllStructGetPtr($tBitmapInfo)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateBitmapFromGdiDib", "ptr", $pBitmapInfo, "ptr", $pBitmapData, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_BitmapCreateFromGdiDib
; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_BitmapCreateFromStreamICM
; Description ...: Creates a Bitmap object based on an IStream COM interface. This function uses ICM
; Syntax.........: _GDIPlus_BitmapCreateFromStreamICM($pStream)
; Parameters ....: $pStream - Pointer to an IStream COM interface
; Return values .: Success      - Returns a handle to a new Bitmap object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose, _WinAPI_CreateStreamOnHGlobal
; Link ..........; @@MsdnLink@@ GdipCreateBitmapFromStreamICM
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_BitmapCreateFromStreamICM($pStream)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateBitmapFromStreamICM", "ptr", $pStream, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_BitmapCreateFromStreamICM

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_BitmapSetResolution
; Description ...: Sets the resolution of this Bitmap object
; Syntax.........: _GDIPlus_BitmapSetResolution($hBitmap, $nDpiX, $nDpiY)
; Parameters ....: $hBitmap - Pointer to the Bitmap object
;                  $nDpiX	- Value that specifies the horizontal resolution in dots per inch.
;                  $nDpiX	- Value that specifies the vertical resolution in dots per inch.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......:
; Link ..........; @@MsdnLink@@ GdipBitmapSetResolution
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_BitmapSetResolution($hBitmap, $nDpiX, $nDpiY)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipBitmapSetResolution", "hwnd", $hBitmap, "float", $nDpiX, "float", $nDpiY)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_BitmapSetResolution
#EndRegion Bitmap Functions

#Region CachedBitmap Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CachedBitmapCreate
; Description ...: Creates a CachedBitmap object based on a Bitmap object and a Graphics object. The cached bitmap takes the
;                  +pixel data from the Bitmap object and stores it in a format that is optimized for the display device
;                  +associated with the Graphics object
; Syntax.........: _GDIPlus_CachedBitmapCreate($hBitmap, $hGraphics)
; Parameters ....: $hBitmap		- Pointer to a Bitmap object that contains the pixel data to be optimized
;                  $hGraphics	- Pointer to a Graphics object that is associated with a display device for which the image
;                  +will be optimized
; Return values .: Success      - Returns a handle to a new CachedBitmap object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_CachedBitmapDispose to release the object resources
; Related .......: _GDIPlus_CachedBitmapDispose, _GDIPlus_GraphicsCreateFromHDC2, _GDIPlus_GraphicsDrawCachedBitmap
; Link ..........; @@MsdnLink@@ GdipCreateCachedBitmap
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CachedBitmapCreate($hBitmap, $hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateCachedBitmap", "hwnd", $hBitmap, "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_CachedBitmapCreate

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CachedBitmapDispose
; Description ...: Release a CachedBitmap object
; Syntax.........: _GDIPlus_CachedBitmapDispose($hCachedBitmap)
; Parameters ....: $hCachedBitmap	- Pointer to a CachedBitmap object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......:
; Link ..........; @@MsdnLink@@ GdipDeleteCachedBitmap
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CachedBitmapDispose($hCachedBitmap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipDeleteCachedBitmap", "hwnd", $hCachedBitmap)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_CachedBitmapDispose

#EndRegion CachedBitmap Functions

#Region ColorMatrix Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixInitHue
; Description ...: Initializes pre- and post-hue color matrices
; Syntax.........: _GDIPlus_ColorMatrixInitHue(ByRef $tPreHueCM, ByRef $tCMPostHue)
;                  $tPreHueCM  - The pre-hue color matrix that will be initialized
;                  $tPostHueCM - The post-hue color matrix that will be initialized
; Return values .: None
; Remarks .......: None
; Related .......: _GDIPlus_ColorMatrixRotateHue, $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixInitHue(ByRef $tPreHueCM, ByRef $tPostHueCM)
	Local $nGreenRotation, $nRed, $nGreen, $aLums

	$nGreenRotation = 35

	_GDIPlus_ColorMatrixRotateRed($tPreHueCM, 45)
	_GDIPlus_ColorMatrixRotateGreen($tPreHueCM, -$nGreenRotation, 1)
	$aLums = _GDIPlus_ColorMatrixTransformLuminance($tPreHueCM, $GDIP_RLUM, $GDIP_GLUM, $GDIP_BLUM, 1)

	$nRed = $aLums[0] / $aLums[2]
	$nGreen = $aLums[1] / $aLums[2]

	_GDIPlus_ColorMatrixShearBlue($tPreHueCM, $nRed, $nGreen, 1)
	_GDIPlus_ColorMatrixShearBlue($tPostHueCM, -$nRed, -$nGreen)
	_GDIPlus_ColorMatrixRotateGreen($tPostHueCM, $nGreenRotation, 1)
	_GDIPlus_ColorMatrixRotateRed($tPostHueCM, -45, 1)
EndFunc   ;==>_GDIPlus_ColorMatrixInitHue

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixMultiply
; Description ...: Multiplies a color matrix by another color matrix
; Syntax.........: _GDIPlus_ColorMatrixMultiply(ByRef $tCM1, $tCM2[, $iOrder = 0])
; Parameters ....: $tCM1   - The color matrix to be updated
;                  $tCM2   - The color matrix to be multiplied by
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The $CM2 color matrix is on the left
;                  |1 - The $CM2 color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixMultiply(ByRef $tCM1, $tCM2, $iOrder = 0)
	Local $iX, $iY, $iI, $iOffset, $nT, $tA, $tB, $tTmpCM

	If $iOrder Then
		$tA = $tCM2
		$tB = $tCM1
	Else
		$tA = $tCM1
		$tB = $tCM2
	EndIf

	$tTmpCM = DllStructCreate($tagGDIPCOLORMATRIX)

	For $iY = 0 To 4
		For $iX = 0 To 3
			$nT = 0

			For $iI = 0 To 4
				$nT += DllStructGetData($tB, "m", $iY * 5 + $iI + 1) * DllStructGetData($tA, "m", $iI * 5 + $iX + 1)
			Next
			DllStructSetData($tTmpCM, "m", $nT, $iY * 5 + $iX + 1)
		Next
	Next

	For $iY = 0 To 4
		For $iX = 0 To 3
			$iOffset = $iY * 5 + $iX + 1
			DllStructSetData($tCM1, "m", DllStructGetData($tTmpCM, "m", $iOffset), $iOffset)
		Next
	Next
EndFunc   ;==>_GDIPlus_ColorMatrixMultiply

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixRotateBlue
; Description ...: Rotates a color matrix around the blue axis
; Syntax.........: _GDIPlus_ColorMatrixRotateBlue(ByRef $tCM, $nPhi[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be rotated around the blue axis
;                  $nPhi   - Rotation value in degrees
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed blue rotation color matrix is on the left
;                  |1 - The passed blue rotation color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixRotateBlue(ByRef $tCM, $nPhi, $iOrder = 0)
	_GDIPlus_ColorMatrixRotateColor($tCM, $nPhi, 1, 0, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixRotateBlue

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixRotateColor
; Description ...: Updates a color matrix by the product of itself and a rotation color matrix
; Syntax.........: _GDIPlus_ColorMatrixRotateColor(ByRef $tCM, $nPhi, $iX, $iY[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be color rotated
;                  $nPhi   - Rotation value in degrees
;                  $iX     - Row zero-based index into the color matrix, the range is 0 to 4
;                  $iY     - Column zero-based index into the color matrix, the range is 0 to 4
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed rotation color matrix is on the left
;                  |1 - The passed rotation color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixRotateColor(ByRef $tCM, $nPhi, $iX, $iY, $iOrder = 0)
	Local $nVal, $tRotateCM

	$nPhi *= $GDIP_RAD
	$tRotateCM = _GDIPlus_ColorMatrixCreate()

	$nVal = Cos($nPhi)
	DllStructSetData($tRotateCM, "m", $nVal, $iX * 5 + $iX + 1)
	DllStructSetData($tRotateCM, "m", $nVal, $iY * 5 + $iY + 1)

	$nVal = Sin($nPhi)
	DllStructSetData($tRotateCM, "m", $nVal, $iY * 5 + $iX + 1)
	DllStructSetData($tRotateCM, "m", -$nVal, $iX * 5 + $iY + 1)
	_GDIPlus_ColorMatrixMultiply($tCM, $tRotateCM, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixRotateColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixRotateGreen
; Description ...: Rotates a color matrix around the green axis
; Syntax.........: _GDIPlus_ColorMatrixRotateGreen(ByRef $tCM, $nPhi[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be rotated around the green axis
;                  $nPhi   - Rotation value in degrees
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed green rotation color matrix is on the left
;                  |1 - The passed green rotation color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixRotateGreen(ByRef $tCM, $nPhi, $iOrder = 0)
	_GDIPlus_ColorMatrixRotateColor($tCM, $nPhi, 0, 2, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixRotateGreen

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixRotateHue
; Description ...: Rotates a color matrix around the grey matrix axis
; Syntax.........: _GDIPlus_ColorMatrixRotateHue(ByRef $tCM, $tPreHueCM, $tPostHueCM, $nPhi)
; Parameters ....: $tCM        - The color matrix to be rotated around the grey matrix axis
;                  $tPreHueCM  - The pre-hue color matrix to be multiplied by
;                  $tPostHueCM - The post-hue color matrix to be multiplied by
;                  $nPhi       - Rotation value in degrees
; Return values .: None
; Remarks .......: None
; Related .......: _GDIPlus_ColorMatrixInitHue, $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixRotateHue(ByRef $tCM, $tPreHueCM, $tPostHueCM, $nPhi)
	_GDIPlus_ColorMatrixMultiply($tCM, $tPreHueCM, 1)
	_GDIPlus_ColorMatrixRotateBlue($tCM, $nPhi, 1)
	_GDIPlus_ColorMatrixMultiply($tCM, $tPostHueCM, 1)
EndFunc   ;==>_GDIPlus_ColorMatrixRotateHue

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixRotateRed
; Description ...: Rotates a color matrix around the red axis
; Syntax.........: _GDIPlus_ColorMatrixRotateRed(ByRef $tCM, $nPhi[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be rotated around the red axis
;                  $nPhi   - Rotation value in degrees
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed red rotation color matrix is on the left
;                  |1 - The passed red rotation color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixRotateRed(ByRef $tCM, $nPhi, $iOrder = 0)
	_GDIPlus_ColorMatrixRotateColor($tCM, $nPhi, 2, 1, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixRotateRed

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixScale
; Description ...: Updatess a color matrix by the product of itself and a scaling color matrix
; Syntax.........: _GDIPlus_ColorMatrixScale(ByRef $tCM, $nScaleRed, $nScaleGreen, $nScaleBlue, $nScaleAlpha[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be scaled
;                  $nScaleRed   - Red component scaling factor
;                  $nScaleGreen - Green component scaling factor
;                  $nScaleBlue  - Blue component scaling factor
;                  $nScaleAlpha - Alpha component scaling factor
;                  $iOrder 	   	- Order of matrices multiplication:
;                  |0 - The passed scaling color matrix is on the left
;                  |1 - The passed scaling color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixScale(ByRef $tCM, $nScaleRed, $nScaleGreen, $nScaleBlue, $nScaleAlpha = 1, $iOrder = 0)
	Local $tScaleCM

	$tScaleCM = _GDIPlus_ColorMatrixCreateScale($nScaleRed, $nScaleGreen, $nScaleBlue, $nScaleAlpha)
	_GDIPlus_ColorMatrixMultiply($tCM, $tScaleCM, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixScale

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixSetSaturation
; Description ...: Updates a color matrix by the product of itself and a saturation color matrix
; Syntax.........: _GDIPlus_ColorMatrixSetSaturation(ByRef $tCM, $nSat[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be color saturated
;                  $nSat   - Color saturation factor
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed saturation color matrix is on the left
;                  |1 - The passed saturation color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixSetSaturation(ByRef $tCM, $nSat, $iOrder = 0)
	Local $tSaturateCM

	$tSaturateCM = _GDIPlus_ColorMatrixCreateSaturation($nSat)
	_GDIPlus_ColorMatrixMultiply($tCM, $tSaturateCM, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixSetSaturation

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixShearBlue
; Description ...: Increases or decreases the blue component of a color by an amount proportional to the red and the green
; Syntax.........: _GDIPlus_ColorMatrixShearBlue(ByRef $tCM, $nRed, $nGreen[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be sheared
;                  $nRed   - The amount to shear in the red direction
;                  $ngreen - The amount to shear in the green direction
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The shearing color matrix is on the left
;                  |1 - The shearing color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: _GDIPlus_ColorMatrixShearGreen, _GDIPlus_ColorMatrixShearRed
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixShearBlue(ByRef $tCM, $nRed, $nGreen, $iOrder = 0)
	_GDIPlus_ColorMatrixShearColor($tCM, 2, 0, $nRed, 1, $nGreen, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixShearBlue

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixShearColor
; Description ...: Updates a color matrix by the product of itself and a shearing color matrix
; Syntax.........: _GDIPlus_ColorMatrixShearColor(ByRef $tCM, $iX, $iY1, $nD1, $iY2, $nD2[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be sheared
;                  $iX	   - Zero-based index into the color component to be sheared proportionally to $iY1 and $iY2
;                  $iY1    - Zero-based index into the color component scale factor
;                  $nD1	   - The amount to shear in the $iY1 direction
;                  $iY2    - Zero-based index into the color component scale factor
;                  $nD2	   - The amount to shear in the $iY2 direction
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed shearing color matrix is on the left
;                  |1 - The passed shearing color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: _GDIPlus_ColorMatrixShearBlue, _GDIPlus_ColorMatrixShearGreen, _GDIPlus_ColorMatrixShearRed
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixShearColor(ByRef $tCM, $iX, $iY1, $nD1, $iY2, $nD2, $iOrder = 0)
	Local $tShearCM

	$tShearCM = _GDIPlus_ColorMatrixCreate()

	DllStructSetData($tShearCM, "m", $nD1, $iY1 * 5 + $iX + 1)
	DllStructSetData($tShearCM, "m", $nD2, $iY2 * 5 + $iX + 1)

	_GDIPlus_ColorMatrixMultiply($tCM, $tShearCM, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixShearColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixShearGreen
; Description ...: Increases or decreases the green component of a color by an amount proportional to the red and the blue
; Syntax.........: _GDIPlus_ColorMatrixShearGreen(ByRef $tCM, $nRed, $nBlue[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be sheared
;                  $nRed   - The amount to shear in the red direction
;                  $nBlue  - The amount to shear in the blue direction
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The shearing color matrix is on the left
;                  |1 - The shearing color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixShearGreen(ByRef $tCM, $nRed, $nBlue, $iOrder = 0)
	_GDIPlus_ColorMatrixShearColor($tCM, 1, 0, $nRed, 2, $nBlue, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixShearGreen

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixShearRed
; Description ...: Increases or decreases the red component of a color by an amount proportional to the green and the blue
; Syntax.........: _GDIPlus_ColorMatrixShearRed(ByRef $tCM, $nGreen, $nBlue[, $iOrder = 0])
; Parameters ....: $tCM    - The color matrix to be sheared
;                  $nGreen - The amount to shear in the green direction
;                  $nBlue  - The amount to shear in the blue direction
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The shearing color matrix is on the left
;                  |1 - The shearing color matrix is on the right
; Return values .: None
; Remarks .......: None
; Related .......: _GDIPlus_ColorMatrixShearBlue, _GDIPlus_ColorMatrixShearGreen
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixShearRed(ByRef $tCM, $nGreen, $nBlue, $iOrder = 0)
	_GDIPlus_ColorMatrixShearColor($tCM, 0, 1, $nGreen, 2, $nBlue, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixShearRed

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixTranslate
; Description ...: Updates a color matrix by the product of itself and a translation color matrix
; Syntax.........: _GDIPlus_ColorMatrixTranslate(ByRef $tCM, $nOffsetRed, $nOffsetGreen, $nOffsetBlue[, $nOffsetAlpha = 0[, $iOrder = 0]])
; Parameters ....: $tCM          - The color matrix to be translated
;                  $nOffsetRed   - Red component translation factor
;                  $nOffsetGreen - Green component translation factor
;                  $nOffsetBlue  - Blue component translation factor
;                  $nOffsetAlpha - Alpha component translation factor
;                  $iOrder 	   	 - Order of matrices multiplication:
;                  |0 - The passed translation color matrix is on the left
;                  |1 - The passed translation color matrix is on the right
; Return values .: None
; Remarks .......: Translating all color components evenly produces brightness tuning
; Related .......: $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixTranslate(ByRef $tCM, $nOffsetRed, $nOffsetGreen, $nOffsetBlue, $nOffsetAlpha = 0, $iOrder = 0)
	Local $tTranslateCM

	$tTranslateCM = _GDIPlus_ColorMatrixCreateTranslate($nOffsetRed, $nOffsetGreen, $nOffsetBlue, $nOffsetAlpha)
	_GDIPlus_ColorMatrixMultiply($tCM, $tTranslateCM, $iOrder)
EndFunc   ;==>_GDIPlus_ColorMatrixTranslate

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ColorMatrixTransformLuminance
; Description ...: Updates a color matrix by the product of itself and a luminance transformation color matrix
; Syntax.........: _GDIPlus_ColorMatrixTransformLuminance(ByRef $tCM[, $nRed = $GDIP_RLUM[, $nGreen = $GDIP_GLUM[, $nBlue = $GDIP_BLUM[, $nAlpha = 1]]]])
; Parameters ....: $tCM          - The color matrix to be luminace transformed
;                  $nOffsetRed   - Red component luminance transformation factor
;                  $nOffsetGreen - Green component luminance transformation factor
;                  $nOffsetBlue  - Blue component luminance transformation factor
;                  $nOffsetAlpha - Alpha component luminance transformation factor
; Return values .: None
; Remarks .......: None
; Related .......: _GDIPlus_ColorMatrixInitHue, $tagGDIPCOLORMATRIX
; Link ..........:
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ColorMatrixTransformLuminance(ByRef $tCM, $nRed = $GDIP_RLUM, $nGreen = $GDIP_GLUM, $nBlue = $GDIP_BLUM, $nAlpha = 1)
	Local $iX, $iY, $aRet[4], $aLums[4] = [$nRed, $nGreen, $nBlue, $nAlpha]

	For $iX = 0 To 3
		$aRet[$iX] = DllStructGetData($tCM, "m", 21 + $iX)

		For $iY = 0 To 3
			$aRet[$iX] += $aLums[$iY] * DllStructGetData($tCM, "m", $iY * 5 + $iX + 1)
		Next
	Next

	Return $aRet
EndFunc   ;==>_GDIPlus_ColorMatrixTransformLuminance

#EndRegion ColorMatrix Functions

#Region CustomLineCap Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapGetBaseCap
; Description ...: Gets the style of the CustomLineCap base cap
; Syntax.........: _GDIPlus_CustomLineCapGetBaseCap($hCustomLineCap)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
; Return values .: Success      - Returns the style of the CustomLineCap base cap
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapSetBaseCap
; Link ..........; @@MsdnLink@@ GdipGetCustomLineCapBaseCap
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapGetBaseCap($hCustomLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetCustomLineCapBaseCap", "hwnd", $hCustomLineCap, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_CustomLineCapGetBaseCap

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapGetBaseInset
; Description ...: Gets the distance between the base cap to the start of the line
; Syntax.........: _GDIPlus_CustomLineCapGetBaseInset($hCustomLineCap)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
; Return values .: Success      - Returns the distance number
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapSetBaseInset
; Link ..........; @@MsdnLink@@ GdipGetCustomLineCapBaseInset
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapGetBaseInset($hCustomLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetCustomLineCapBaseInset", "hwnd", $hCustomLineCap, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_CustomLineCapGetBaseInset

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapGetStrokeJoin
; Description ...: Returns the style of line join used to join multiple lines in the same Path object
; Syntax.........: _GDIPlus_CustomLineCapGetStrokeJoin($hCustomLineCap)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
; Return values .: Success      - Returns the line join style:
;                  |0 - Line join produces a sharp corner or a clipped corner
;                  |1 - Line join produces a diagonal corner.
;                  |2 - Line join produces a smooth, circular arc between the lines.
;                  |3 - Line join produces a sharp corner or a clipped corner
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapSetStrokeJoin
; Link ..........; @@MsdnLink@@ GdipGetCustomLineCapStrokeJoin
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapGetStrokeJoin($hCustomLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetCustomLineCapStrokeJoin", "hwnd", $hCustomLineCap, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_CustomLineCapGetStrokeJoin

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapGetType
; Description ...: Gets the type of a line cap object
; Syntax.........: _GDIPlus_CustomLineCapGetType($hCustomLineCap)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
; Return values .: Success      - Returns the type of the line cap:
;                  |0 - The Cap is an end personalized CustomLineCap
;                  |1 - The Cap is defined by an AdjustableArrowCap object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......:
; Link ..........; @@MsdnLink@@ GdipGetCustomLineCapType
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapGetType($hCustomLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetCustomLineCapType", "hwnd", $hCustomLineCap, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_CustomLineCapGetType

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapGetWidthScale
; Description ...: Gets the value of the scale width. This is the amount to scale the custom line cap relative to the width of
;                  +the Pen object used to draw a line
; Syntax.........: _GDIPlus_CustomLineCapGetWidthScale($hCustomLineCap)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
; Return values .: Success      - Returns the value of the width-scaling factor
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapSetWidthScale
; Link ..........; @@MsdnLink@@ GdipGetCustomLineCapWidthScale
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapGetWidthScale($hCustomLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetCustomLineCapWidthScale", "hwnd", $hCustomLineCap, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_CustomLineCapGetWidthScale

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapSetBaseCap
; Description ...: Sets the style of the CustomLineCap base cap
; Syntax.........: _GDIPlus_CustomLineCapSetBaseCap($hCustomLineCap, $iLineCap)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
;                  $iLineCap 	   - Line cap used on the ends of the line to be drawn. Line cap styles:
;                  |$LineCapFlat			-  Line ends at the last point. The end is squared off
;                  |$LineCapSquare			-  Square cap. The center of the square is the last point in the line. The height
;                  +and width of the square are the line width.
;                  |$LineCapRound			-  Circular cap. The center of the circle is the last point in the line. The diameter
;                  +of the circle is the line width.
;                  |$LineCapTriangle		-  Triangular cap. The base of the triangle is the last point in the line. The base
;                  +of the triangle is the line width.
;                  |$LineCapNoAnchor		-  Line ends are not anchored.
;                  |$LineCapSquareAnchor	-  Line ends are anchored with a square. The center of the square is the last point in
;                  +the line. The height and width of the square are the line width.
;                  |$LineCapRoundAnchor		-  Line ends are anchored with a circle. The center of the circle is at the last point
;                  +in the line. The circle is wider than the line.
;                  |$LineCapDiamondAnchor	-  Line ends are anchored with a diamond (a square turned at 45 degrees). The center of the diamond is at the last point in the line. The diamond is wider than the line.
;                  |$LineCapArrowAnchor		-  Line ends are anchored with arrowheads. The arrowhead point is located at the last
;                  +point in the line. The arrowhead is wider than the line.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapGetBaseCap
; Link ..........; @@MsdnLink@@ GdipSetCustomLineCapBaseCap
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapSetBaseCap($hCustomLineCap, $iLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetCustomLineCapBaseCap", "hwnd", $hCustomLineCap, "int", $iLineCap)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_CustomLineCapSetBaseCap

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapSetBaseInset
; Description ...: Sets the distance between the base cap to the start of the line
; Syntax.........: _GDIPlus_CustomLineCapSetBaseInset($hCustomLineCap, $nInset)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
;                  $nInset		   - Distance, in units, from the base cap to the start of the line
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapGetBaseInset
; Link ..........; @@MsdnLink@@ GdipSetCustomLineCapBaseInset
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapSetBaseInset($hCustomLineCap, $nInset)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetCustomLineCapBaseInset", "hwnd", $hCustomLineCap, "float", $nInset)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_CustomLineCapSetBaseInset

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapSetStrokeJoin
; Description ...: Sets the style of line join for the stroke. The line join specifies how two lines that intersect within the
;                  +Path object that makes up the custom line cap are joined
; Syntax.........: _GDIPlus_CustomLineCapSetStrokeJoin($hCustomLineCap, $iLineJoin)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
;                  $iLineJoin	   - Line join that will be used for two lines that are drawn by the same pen and that have
;                  +overlapping ends
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapGetStrokeJoin
; Link ..........; @@MsdnLink@@ GdipSetCustomLineCapStrokeJoin
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapSetStrokeJoin($hCustomLineCap, $iLineJoin)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetCustomLineCapStrokeJoin", "hwnd", $hCustomLineCap, "int", $iLineJoin)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_CustomLineCapSetStrokeJoin

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CustomLineCapSetWidthScale
; Description ...: Sets the value of the scale width. This is the amount to scale the custom line cap relative to the width of
;                  +the Pen object used to draw a line
; Syntax.........: _GDIPlus_CustomLineCapSetWidthScale($hCustomLineCap, $nWidthScale)
; Parameters ....: $hCustomLineCap - Pointer to a CustomLineCap object
;                  $nWidthScale	   - Value of the width-scaling factor
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CustomLineCapGetWidthScale
; Link ..........; @@MsdnLink@@ GdipSetCustomLineCapWidthScale
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_CustomLineCapSetWidthScale($hCustomLineCap, $nWidthScale)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetCustomLineCapWidthScale", "hwnd", $hCustomLineCap, "float", $nWidthScale)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_CustomLineCapSetWidthScale

#EndRegion CustomLineCap Functions

#Region Font Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontClone
; Description ...: Clones a font
; Syntax.........: _GDIPlus_FontClone($hFont)
; Parameters ....: $hFont	- Pointer to a font object
; Return values .: Success      - Returns the handle to a new cloned font
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontDispose to release the object resources
; Related .......: _GDIPlus_FontDispose
; Link ..........; @@MsdnLink@@ GdipCloneFont
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_FontClone($hFont)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCloneFont", "hwnd", $hFont, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontClone

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontCollectionCreate
; Description ...: Creates an InstalledFontCollection object which can then be used to enumerate fonts installed on the system
; Syntax.........: _GDIPlus_FontCollectionCreate()
; Parameters ....: None
; Return values .: Success      - Returns a handle to a new InstalledFontCollection
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: FontFamily objects belong to the collection, they should not be destroyed.
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipNewInstalledFontCollection
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontCollectionCreate()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipNewInstalledFontCollection", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_FontCollectionCreate

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontCollectionGetFamilyCount
; Description ...: Gets the number of font families contained in a font collection
; Syntax.........: _GDIPlus_FontCollectionGetFamilyCount($hFontCollection)
; Parameters ....: $hFontCollection	- A pointer to a FontCollection object
; Return values .: Success      - Returns the number of font families contained in this font collection
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_FontCollectionGetFamilyList
; Link ..........; @@MsdnLink@@ GdipGetFontCollectionFamilyCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontCollectionGetFamilyCount($hFontCollection)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFontCollectionFamilyCount", "hwnd", $hFontCollection, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontCollectionGetFamilyCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontCollectionGetFamilyList
; Description ...: Gets the font families contained in a font collection
; Syntax.........: _GDIPlus_FontCollectionGetFamilyList($hFontCollection)
; Parameters ....: $hFontCollection	- A pointer to a FontCollection object
; Return values .: Success      - Returns an array of FontFamily objects:
;                  |[0] - Number of font families in the array
;                  |[1] - First FontFamily object
;                  |[2] - Second FontFamily object
;                  |[n] - nth FontFamily object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - _GDIPlus_FontCollectionGetFamilyCount failed
;                  |    2 - The font collection is empty
;                  |    3 - $GDIP_STATUS contains the error code of the _GDIPlus_FontCollectionGetFamilyList function
; Remarks .......: None
; Related .......: _GDIPlus_FontCollectionGetFamilyCount
; Link ..........; @@MsdnLink@@ GdipGetFontCollectionFamilyList
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontCollectionGetFamilyList($hFontCollection)
	Local $iI, $iCount, $tFontFamilies, $pFontFamilies, $aFontFamilies[1], $aResult

	$iCount = _GDIPlus_FontCollectionGetFamilyCount($hFontCollection)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tFontFamilies = DllStructCreate("hwnd[" & $iCount & "]")
	$pFontFamilies = DllStructGetPtr($tFontFamilies)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFontCollectionFamilyList", "hwnd", $hFontCollection, "int", $iCount, "ptr", $pFontFamilies, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aFontFamilies[$iCount + 1]
	$aFontFamilies[0] = $iCount
	For $iI = 1 To $iCount
		$aFontFamilies[$iI] = DllStructGetData($tFontFamilies, 1, $iI)
	Next

	Return $aFontFamilies
EndFunc   ;==>_GDIPlus_FontCollectionGetFamilyList

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontCreateFromDC
; Description ...: Creates a Font object based on the font object that is currently selected into a specified device context
; Syntax.........: _GDIPlus_FontCreateFromDC($hDC)
; Parameters ....: $hDC - Handle to a device context
; Return values .: Success      - Returns a handle to a new Font object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontDispose to release the object resources
; Related .......: _GDIPlus_FontDispose
; Link ..........; @@MsdnLink@@ GdipCreateFontFromDC
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontCreateFromDC($hDC)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateFontFromDC", "hwnd", $hDC, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontCreateFromDC

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontCreateFromLogfont
; Description ...: Creates a Font object directly from a logical font
; Syntax.........: _GDIPlus_FontCreateFromLogfont($hDC, $tLogFont[, $fUnicode = True])
; Parameters ....: $hDC 	 - Handle to a device context
;                  $tLogFont - $tagLOGFONTA or $tagLOGFONTW structure that contains attributes of the font
;                  $fUnicode - If True then the structure used is $tagLOGFONTW, otherwise it's a $tagLOGFONTA structure
; Return values .: Success      - Returns a handle to a new Font object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontDispose to release the object resources
; Related .......: _GDIPlus_FontDispose, $tagLOGFONT
; Link ..........; @@MsdnLink@@ GdipCreateFontFromLogfontW
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontCreateFromLogfont($hDC, $tLogFont, $fUnicode = True)
	Local $pLogFont, $aResult

	$pLogFont = DllStructGetPtr($tLogFont)

	If $fUnicode Then
		DllCall($__g_hGDIPDll, "uint", "GdipCreateFontFromLogfontW", "hwnd", $hDC, "ptr", $pLogFont, "int*", 0)
	Else
		DllCall($__g_hGDIPDll, "uint", "GdipCreateFontFromLogfontA", "hwnd", $hDC, "ptr", $pLogFont, "int*", 0)
	EndIf

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_FontCreateFromLogfont

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontGetFamily
; Description ...: Gets the font family on which a font is based
; Syntax.........: _GDIPlus_FontGetFamily($hFont)
; Parameters ....: $hFont - Pointer to a Font object
; Return values .: Success      - Returns a handle to a FontFamily object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetFamily
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontGetFamily($hFont)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFamily", "hwnd", $hFont, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontGetFamily

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontGetHeightGivenDPI
; Description ...: Gets the line spacing, in pixels, of a font
; Syntax.........: _GDIPlus_FontGetHeightGivenDPI($hFont[, $nDPI = 96])
; Parameters ....: $hFont - Pointer to a Font object
;                  $nDPI  - Number that specifies the vertical resolution, in dots per inch, of the device that displays the font
; Return values .: Success      - Returns the line spacing of the font in pixels
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The line spacing is the vertical distance between the base lines of two consecutive lines of text. Thus, the
;                  +line spacing includes the blank space between lines along with the height of the character itself
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetFontHeightGivenDPI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontGetHeightGivenDPI($hFont, $nDPI = 96)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFontHeightGivenDPI", "hwnd", $hFont, "float", $nDPI, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_FontGetHeightGivenDPI

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontGetLogFont
; Description ...: Gets the logical font of a font
; Syntax.........: _GDIPlus_FontGetLogFont($hFont, $hGraphics[, $fUnicode = True])
; Parameters ....: $hFont 	  - Pointer to a Font object
;                  $hGraphics - Pointer to a Graphics object
;                  $fUnicode  - If true then the unicode version of the logical font is used. ASCII version otherwise
; Return values .: Success      - Returns a $tagLOGFONTW or $tagLOGFONTA structure that contains attributes of the font
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagLOGFONT
; Link ..........; @@MsdnLink@@ GdipGetLogFontW
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontGetLogFont($hFont, $hGraphics, $fUnicode = True)
	Local $tLogFont, $pLogFont
	Local $aResult

	If $fUnicode Then
		$tLogFont = DllStructCreate($tagLOGFONTW)
		$pLogFont = DllStructGetPtr($tLogFont)
		DllCall($__g_hGDIPDll, "uint", "GdipGetLogFontW", "hwnd", $hFont, "hwnd", $hGraphics, "ptr", $pLogFont)
	Else
		$tLogFont = DllStructCreate($tagLOGFONTA)
		$pLogFont = DllStructGetPtr($tLogFont)
		DllCall($__g_hGDIPDll, "uint", "GdipGetLogFontA", "hwnd", $hFont, "hwnd", $hGraphics, "ptr", $pLogFont)
	EndIf

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tLogFont
EndFunc   ;==>_GDIPlus_FontGetLogFont

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontGetSize
; Description ...: Gets the font size (commonly called the em size) of a Font object
; Syntax.........: _GDIPlus_FontGetSize($hFont)
; Parameters ....: $hFont 	  - Pointer to a Font object
; Return values .: Success      - Returns the em size of the font
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The size is in the units of the Font object
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetFontSize
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontGetSize($hFont)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFontSize", "hwnd", $hFont, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontGetSize

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontGetStyle
; Description ...: Gets the style of a font's typeface
; Syntax.........: _GDIPlus_FontGetStyle($hFont)
; Parameters ....: $hFont 	  - Pointer to a Font object
; Return values .: Success      - The style of the typeface. Can be a combination of the following:
;                  |0 - Normal weight or thickness of the typeface
;                  |1 - Bold typeface
;                  |2 - Italic typeface
;                  |4 - Underline
;                  |8 - Strikethrough
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetFontStyle
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontGetStyle($hFont)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFontStyle", "hwnd", $hFont, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontGetStyle

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontGetUnit
; Description ...: Gets the unit of measure of a Font object
; Syntax.........: _GDIPlus_FontGetUnit($hFont)
; Parameters ....: $hFont  - Pointer to a Font object
; Return values .: Success		- Returns unit of measurement:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetFontUnit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontGetUnit($hFont)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFontUnit", "hwnd", $hFont, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontGetUnit

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PrivateCollectionAddFontFile
; Description ...: Adds a font file to this private font collection
; Syntax.........: _GDIPlus_PrivateCollectionAddFontFile($hFontCollection, $sFileName)
; Parameters ....: $hFontCollection - Pointer to a PrivateFontCollection object
;                  $sFileName		- Name of a font file
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipPrivateAddFontFile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PrivateCollectionAddFontFile($hFontCollection, $sFileName)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipPrivateAddFontFile", "hwnd", $hFontCollection, "wstr", $sFileName)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PrivateCollectionAddFontFile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PrivateCollectionAddMemoryFont
; Description ...: Adds a font that is contained in system memory
; Syntax.........: _GDIPlus_PrivateCollectionAddMemoryFont($hFontCollection, $pMemory, $iLength)
; Parameters ....: $hFontCollection - Pointer to a PrivateFontCollection object
;                  $pMemory			- Pointer to a font that is contained in memory
;                  $iLength			- Number of bytes of data in the font
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipPrivateAddMemoryFont
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PrivateCollectionAddMemoryFont($hFontCollection, $pMemory, $iLength)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipPrivateAddMemoryFont", "hwnd", $hFontCollection, "ptr", $pMemory, "int", $iLength)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PrivateCollectionAddMemoryFont

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PrivateCollectionCreate
; Description ...: Creates a PrivateFontCollection object
; Syntax.........: _GDIPlus_PrivateCollectionCreate()
; Parameters ....: None
; Return values .: Success      - Handle to a new PrivateFontCollection object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: FontFamily objects belong to the collection, they should not be destroyed.
;                  After you are done with the object, call _GDIPlus_PrivateFontCollectionDispose to release the object resources
; Related .......: _GDIPlus_PrivateFontCollectionDispose
; Link ..........; @@MsdnLink@@ GdipNewPrivateFontCollection
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PrivateCollectionCreate()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipNewPrivateFontCollection", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_PrivateCollectionCreate

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PrivateFontCollectionDispose
; Description ...: Releases a PrivateFontCollection object
; Syntax.........: _GDIPlus_PrivateFontCollectionDispose($hFontCollection)
; Parameters ....: $hFontCollection - Pointer to a PrivateFontCollection object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipDeletePrivateFontCollection
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PrivateFontCollectionDispose($hFontCollection)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipDeletePrivateFontCollection", "hwnd*", $hFontCollection)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PrivateFontCollectionDispose

#EndRegion Font Functions

#Region FontFamily Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyClone
; Description ...: Clones a FontFamily object
; Syntax.........: _GDIPlus_FontFamilyClone($hFontFamily)
; Parameters ....: $hFontFamily - Pointer to a FontFamily object
; Return values .: Success      - Handle to the a new cloned FontFamily object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontFamilyDispose to release the object resources
; Related .......: _GDIPlus_FontFamilyDispose
; Link ..........; @@MsdnLink@@ GdipCloneFontFamily
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyClone($hFontFamily)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCloneFontFamily", "hwnd", $hFontFamily, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_FontFamilyClone

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyCreate2
; Description ...: Creates a FontFamily object
; Syntax.........: _GDIPlus_FontFamilyCreate2($sFamily[, $hCollection = 0])
; Parameters ....: $sFamily     - Name of the Font Family
;                  $hcollection - Pointer to a FontCollection object that specifies the collection that the font family belongs to.
;                  +If FontCollection is 0, this font family is not part of a collection
; Return values .: Success      - Handle to a FontFamily object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: When you are done with the Font Family object, call _GDIPlus_FontFamilyDispose to release the resources
; Related .......: _GDIPlus_FontFamilyDispose
; Link ..........: @@MsdnLink@@ GdipCreateFontFamilyFromName
; Example .......: No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyCreate2($sFamily, $hCollection = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateFontFamilyFromName", "wstr", $sFamily, "hwnd", $hCollection, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_FontFamilyCreate2

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyCreateGenericMonospace
; Description ...: Creates a generic monospace typeface FontFamily object
; Syntax.........: _GDIPlus_FontFamilyCreateGenericMonospace()
; Parameters ....: None
; Return values .: Success      - Handle to the a new FontFamily object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontFamilyDispose to release the object resources
; Related .......: _GDIPlus_FontFamilyDispose
; Link ..........; @@MsdnLink@@ GdipGetGenericFontFamilyMonospace
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyCreateGenericMonospace()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetGenericFontFamilyMonospace", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_FontFamilyCreateGenericMonospace

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyCreateGenericSansSerif
; Description ...: Creates a generic sans serif typeface FontFamily object
; Syntax.........: _GDIPlus_FontFamilyCreateGenericSansSerif()
; Parameters ....: None
; Return values .: Success      - Handle to the a new FontFamily object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontFamilyDispose to release the object resources
; Related .......: _GDIPlus_FontFamilyDispose
; Link ..........; @@MsdnLink@@ GdipGetGenericFontFamilySansSerif
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyCreateGenericSansSerif()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetGenericFontFamilySansSerif", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_FontFamilyCreateGenericSansSerif

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyCreateGenericSerif
; Description ...: Creates a generic serif typeface FontFamily object
; Syntax.........: _GDIPlus_FontFamilyCreateGenericSerif()
; Parameters ....: None
; Return values .: Success      - Handle to the a new FontFamily object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_FontFamilyDispose to release the object resources
; Related .......: _GDIPlus_FontFamilyDispose
; Link ..........; @@MsdnLink@@ GdipGetGenericFontFamilySerif
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyCreateGenericSerif()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetGenericFontFamilySerif", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_FontFamilyCreateGenericSerif

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyGetFamilyName
; Description ...: Gets the name of a font family
; Syntax.........: _GDIPlus_FontFamilyGetFamilyName($hFontFamily[, $iLANGID = 0])
; Parameters ....: $hFontFamily - Pointer to a FontFamily object
;                  $iLANGID		- LANG_* value specifying the language to use, the default is the user's default language
; Return values .: Success      - The name of the font family
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Language ID constants are declared in Constants.au3
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetFamilyName
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyGetFamilyName($hFontFamily, $iLANGID = 0)
	Local $tName, $pName, $sName, $aResult

	$tName = DllStructCreate("wchar[" & $GDIP_LF_FACESIZE & "]")
	$pName = DllStructGetPtr($tName)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetFamilyName", "hwnd", $hFontFamily, "ptr", $pName, "ushort", $iLANGID)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return 0

	$sName = DllStructGetData($tName, 1)
	Return $sName
EndFunc   ;==>_GDIPlus_FontFamilyGetFamilyName

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_FontFamilyIsStyleAvailable
; Description ...: Gets the line spacing, in design units, of this font family for the specified style or style combination
; Syntax.........: _GDIPlus_FontFamilyIsStyleAvailable($hFontFamily, $iStyle)
; Parameters ....: $hFontFamily - Pointer to a FontFamily object
;                  $iStyle		- The style of the typeface. Can be a combination of the following:
;                  |0 - Normal weight or thickness of the typeface
;                  |1 - Bold typeface
;                  |2 - Italic typeface
;                  |4 - Underline
;                  |8 - Strikethrough
; Return values .: Success      - True or False
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipIsStyleAvailable
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_FontFamilyIsStyleAvailable($hFontFamily, $iStyle)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsStyleAvailable", "hwnd", $hFontFamily, "int", $iStyle, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_FontFamilyIsStyleAvailable

#EndRegion FontFamily Functions

#Region Graphics Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_CreateHalftonePalette
; Description ...: Gets a Windows halftone palette
; Syntax.........: _GDIPlus_CreateHalftonePalette()
; Parameters ....: None
; Return values .: Success      - Returns a handle to a Windows halftone palette
;                  Failure      - -1 - DllCall failed; 0 - Call _WinAPI_GetLastError to receive the function error code
; Remarks .......: The purpose of the GetHalftonePalette method is to enable GDI+ to produce a better quality halftone when the
;                  +display uses 8 bits per pixel.
;                  After you are done with the object, call _WinAPI_DeleteObject to release the object resources
; Related .......: _WinAPI_DeleteObject
; Link ..........; @@MsdnLink@@ GdipCreateHalftonePalette
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_CreateHalftonePalette()
	Local $aResult = DllCall($__g_hGDIPDll, "hwnd", "GdipCreateHalftonePalette")

	If @error Then Return SetError(@error, @extended, -1)
	Return $aResult[0]
EndFunc   ;==>_GDIPlus_CreateHalftonePalette

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsBeginContainer
; Description ...: Begins a new graphics container
; Syntax.........: _GDIPlus_GraphicsBeginContainer($hGraphics, $tRectFDst, $tRectFSrc[, $iUnit = 2])
; Parameters ....: $hGraphics	- Pointer to a Graphics object
;                  $tRectFDst	- $tagGDIPRECTF structure that, together with $tRectFSrc, specifies a transformation for the
;                  +container
;                  $tRectFSrc	- $tagGDIPRECTF structure that, together with $tRectFDst, specifies a transformation for the
;                  +container
;                  $iUnit		- Unit of measurement:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
; Return values .: Success      - GraphicsContainer that can be passed to _GDIPlus_GraphicsEndContainer to restore the previous
;                                 +state of the Graphics object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Use this function to create nested graphics containers. Graphics containers are used to retain graphics state,
;                  such as transformations, clipping regions, and various rendering properties
; Related .......: _GDIPlus_GraphicsEndContainer
; Link ..........; @@MsdnLink@@ GdipBeginContainer
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsBeginContainer($hGraphics, $tRectFDst, $tRectFSrc, $iUnit = 2)
	Local $pRectFDst, $pRectFSrc, $aResult

	$pRectFDst = DllStructGetPtr($tRectFDst)
	$pRectFSrc = DllStructGetPtr($tRectFSrc)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipBeginContainer", "hwnd", $hGraphics, "ptr", $pRectFDst, "ptr", $pRectFSrc, "uint", $iUnit, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[5]
EndFunc   ;==>_GDIPlus_GraphicsBeginContainer

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsBeginContainer2
; Description ...: Begins a new graphics container
; Syntax.........: _GDIPlus_GraphicsBeginContainer2($hGraphics)
; Parameters ....: $hGraphics	- Pointer to a Graphics object
; Return values .: Success      - GraphicsContainer that can be passed to _GDIPlus_GraphicsEndContainer to restore the previous
;                                 +state of the Graphics object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Use this function to create nested graphics containers. Graphics containers are used to retain graphics state,
;                  such as transformations, clipping regions, and various rendering properties
; Related .......: _GDIPlus_GraphicsEndContainer
; Link ..........; @@MsdnLink@@ GdipBeginContainer2
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsBeginContainer2($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipBeginContainer2", "hwnd", $hGraphics, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsBeginContainer2

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsComment
; Description ...: Adds a text comment to an existing metafile
; Syntax.........: _GDIPlus_GraphicsComment($hGraphics, $pData, $iData)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $pData 	  - Pointer to a buffer that contains the comment
;                  $iData 	  - The number of bytes pointed to by $pData
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsCreateFromHDC, _GDIPlus_MetafileRecordFileName
; Link ..........; @@MsdnLink@@ GdipComment
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsComment($hGraphics, $pData, $iData)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipComment", "hwnd", $hGraphics, "uint", $iData, "ptr", $pData)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsComment

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsCreateFromHDC2
; Description ...: Creates a Graphics object that is associated with a specified device context and a specified device
; Syntax.........: _GDIPlus_GraphicsCreateFromHDC2($hDC, $hDevice)
; Parameters ....: $hDC 	- Handle to a device context that will be associated with the new Graphics object
;                  $hDevice - Handle to a device that will be associated with the new Graphics object
; Return values .: Success      - Handle to a new Graphics object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_GraphicsDispose to release the object resources
; Related .......: _GDIPlus_GraphicsCreateFromHDC, _GDIPlus_GraphicsDispose
; Link ..........; @@MsdnLink@@ GdipCreateFromHDC2
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsCreateFromHDC2($hDC, $hDevice)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateFromHDC2", "hwnd", $hDC, "hwnd", $hDevice, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_GraphicsCreateFromHDC2

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsCreateFromHWNDICM
; Description ...: Creates a Graphics object that is associated with a specified window. The function uses ICM
; Syntax.........: _GDIPlus_GraphicsCreateFromHWNDICM($hWnd)
; Parameters ....: $hWnd - Handle to a window that will be associated with the new Graphics object
; Return values .: Success      - Handle to a new Graphics object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_GraphicsDispose to release the object resources
; Related .......: _GDIPlus_GraphicsCreateFromHWND, _GDIPlus_GraphicsDispose
; Link ..........; @@MsdnLink@@ GdipCreateFromHWNDICM
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsCreateFromHWNDICM($hWnd)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateFromHWNDICM", "hwnd", $hWnd, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsCreateFromHWNDICM

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawBeziers
; Description ...: Draws a sequence of connected Bezier splines
; Syntax.........: _GDIPlus_GraphicsDrawBeziers($hGraphics, $aPoints[, $hPen = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $aPoints	  - Array of points that specify the starting, ending, and control points of the Bezier splines:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $hPen      - Handle to a pen object that is used to draw the splines. If 0, a solid black pen with a width of
;                  +1 will be used.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsDrawBezier
; Link ..........; @@MsdnLink@@ GdipDrawBeziers
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawBeziers($hGraphics, $aPoints, $hPen = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pPoints, $tPoints, $aResult

	__GDIPlus_PenDefCreate($hPen)

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawBeziers", "hwnd", $hGraphics, "hwnd", $hPen, "ptr", $pPoints, "int", $iCount)
	$iTmpErr = @error
	$iTmpExt = @extended

	__GDIPlus_PenDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawBeziers

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawCachedBitmap
; Description ...: Draws an image stored in a CachedBitmap object
; Syntax.........: _GDIPlus_GraphicsDrawCachedBitmap($hGraphics, $hCachedBitmap, $iX, $iY)
; Parameters ....: $hGraphics     - Pointer to a Graphics object
;                  $hCachedBitmap - Pointer to a CachedBitmap object
;                  $iX            - The X coordinate of the upper left corner of the rendered image
;                  $iY            - The Y coordinate of the upper left corner of the rendered image
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_CachedBitmapCreate
; Link ..........; @@MsdnLink@@ GdipDrawCachedBitmap
; Example .......; Yes
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawCachedBitmap($hGraphics, $hCachedBitmap, $iX, $iY)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawCachedBitmap", "hwnd", $hGraphics, "hwnd", $hCachedBitmap, "int", $iX, "int", $iY)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawCachedBitmap

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawCurve3
; Description ...: Draws a cardinal spline
; Syntax.........: _GDIPlus_GraphicsDrawCurve3($hGraphics, $aPoints, $iOffset, $iNumOfSegments, $nTension[, $hPen = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $aPoints	  - Array of points that specify the coordinates that the cardinal spline passes through:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $iOffset	  - Zero-based index of the array of points used as the first point of the curve
;                  $iNumOfSegments - Number of segments used to draw the curve. This value must be at least 1
;                  $nTension  - Number that specifies how tightly the curve bends through the coordinates of the closed cardinal
;                  +spline
;                  $hPen      - Handle to a pen object that is used to draw the splines. If 0, a solid black pen with a width of
;                  +1 will be used.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsDrawCurve
; Link ..........; @@MsdnLink@@ GdipDrawCurve3
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawCurve3($hGraphics, $aPoints, $iOffset, $iNumOfSegments, $nTension, $hPen = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pPoints, $tPoints, $aResult

	__GDIPlus_PenDefCreate($hPen)

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawCurve3", "hwnd", $hGraphics, "hwnd", $hPen, "ptr", $pPoints, "int", $iCount, "int", $iOffset, "int", $iNumOfSegments, "float", $nTension)
	$iTmpErr = @error
	$iTmpExt = @extended

	__GDIPlus_PenDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawCurve3

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawImagePointRect
; Description ...: Draws an image
; Syntax.........: _GDIPlus_GraphicsDrawImagePointRect($hGraphics, $hImage, $nX, $nY, $nSrcX, $nSrcY, $nSrcWidth, $nSrcHeight[, $iUnit = 2])
; Parameters ....: $hGraphics  - Pointer to a Graphics object
;                  $hImage	   - Pointer to an Image object
;                  $nX         - The X coordinate of the upper left corner of the rendered image
;                  $nY         - The Y coordinate of the upper left corner of the rendered image
;                  $nSrcX	   - The X coordinate of the upper-left corner of the portion of the source image to be drawn
;                  $nSrcY      - The Y coordinate of the upper-left corner of the portion of the source image to be drawn
;                  $nSrcWidth  - The width of the portion of the source image to be drawn
;                  $nSrcHeight - The height of the portion of the source image to be drawn
;                  $iUnit	   - Unit of measurement:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsDrawImage
; Link ..........; @@MsdnLink@@ GdipDrawImagePointRect
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawImagePointRect($hGraphics, $hImage, $nX, $nY, $nSrcX, $nSrcY, $nSrcWidth, $nSrcHeight, $iUnit = 2)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawImagePointRect", "hwnd", $hGraphics, "hwnd", $hImage, "float", $nX, "float", $nY, "float", $nSrcX, "float", $nSrcY, "float", $nSrcWidth, "float", $nSrcHeight, "int", $iUnit)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawImagePointRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawImageRectRectIA
; Description ...: Draws an image
; Syntax.........: _GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hImage, $nSrcX, $nSrcY, $nSrcWidth, $nSrcHeight, $nDstX, $nDstY, $nDstWidth, $nDstHeight[, $hImageAttributes = 0[, $iUnit = 2]])
; Parameters ....: $hGraphics   - Pointer to a Graphics object
;                  $hImage      - Pointer to an Image object
;                  $iSrcX       - The X coordinate of the upper left corner of the source image
;                  $iSrcY       - The Y coordinate of the upper left corner of the source image
;                  $iSrcWidth   - Width of the source image
;                  $iSrcHeight  - Height of the source image
;                  $iDstX       - The X coordinate of the upper left corner of the destination image
;                  $iDstY       - The Y coordinate of the upper left corner of the destination image
;                  $iDstWidth   - Width of the destination image
;                  $iDstHeight  - Height of the destination image
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies the color and size attributes of the image to be drawn
;                  $iUnit	   - Unit of measurement:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipDrawImageRectRect
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hImage, $nSrcX, $nSrcY, $nSrcWidth, $nSrcHeight, $nDstX, $nDstY, $nDstWidth, $nDstHeight, $hImageAttributes = 0, $iUnit = 2)
	Local $aResult = DllCall($__g_hGDIPDll, "int", "GdipDrawImageRectRect", "hwnd", $hGraphics, "hwnd", $hImage, "float", $nDstX, "float", _
			$nDstY, "float", $nDstWidth, "float", $nDstHeight, "float", $nSrcX, "float", $nSrcY, "float", $nSrcWidth, "float", _
			$nSrcHeight, "int", $iUnit, "hwnd", $hImageAttributes, "int", 0, "int", 0)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawImageRectRectIA

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawLines
; Description ...: Draws a sequence of connected lines
; Syntax.........: _GDIPlus_GraphicsDrawLines($hGraphics, $aPoints[, $hPen = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $aPoints	  - Array of points that specify the starting and ending points of the lines:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $hPen      - Handle to a pen object that is used to draw the splines. If 0, a solid black pen with a width of
;                  +1 will be used.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsDrawLine
; Link ..........; @@MsdnLink@@ GdipDrawLines
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawLines($hGraphics, $aPoints, $hPen = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pPoints, $tPoints, $aResult

	__GDIPlus_PenDefCreate($hPen)

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawLines", "hwnd", $hGraphics, "hwnd", $hPen, "ptr", $pPoints, "int", $iCount)
	$iTmpErr = @error
	$iTmpExt = @extended

	__GDIPlus_PenDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawLines

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawRectangles
; Description ...: Draws a sequence of connected lines
; Syntax.........: _GDIPlus_GraphicsDrawRectangles($hGraphics, $aRects[, $hPen = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $aRects	  - Array of rectangles that specify the rectangles to be drawn:
;                  |[0][0] - Number of rectangles
;                  |[1][0] - Rectangle 1 X position
;                  |[1][1] - Rectangle 1 Y position
;                  |[1][2] - Rectangle 1 Width
;                  |[1][3] - Rectangle 1 Height
;                  |[n][0] - Rectangle n X position
;                  |[n][1] - Rectangle n Y position
;                  |[n][2] - Rectangle n Width
;                  |[n][3] - Rectangle n Height
;                  $hPen      - Handle to a pen object that is used to draw the splines. If 0, a solid black pen with a width of
;                  +1 will be used.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsDrawRect
; Link ..........; @@MsdnLink@@ GdipDrawRectangles
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawRectangles($hGraphics, $aRects, $hPen = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pRects, $tRects, $aResult

	__GDIPlus_PenDefCreate($hPen)

	$iCount = $aRects[0][0]
	$tRects = DllStructCreate("float[" & $iCount * 4 & "]")
	$pRects = DllStructGetPtr($tRects)
	For $iI = 1 To $iCount
		DllStructSetData($tRects, 1, $aRects[$iI][0], (($iI - 1) * 4) + 1)
		DllStructSetData($tRects, 1, $aRects[$iI][1], (($iI - 1) * 4) + 2)
		DllStructSetData($tRects, 1, $aRects[$iI][2], (($iI - 1) * 4) + 3)
		DllStructSetData($tRects, 1, $aRects[$iI][3], (($iI - 1) * 4) + 4)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawRectangles", "hwnd", $hGraphics, "hwnd", $hPen, "ptr", $pRects, "int", $iCount)
	$iTmpErr = @error
	$iTmpExt = @extended

	__GDIPlus_PenDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawRectangles

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsEndContainer
; Description ...: Closes a graphics container that was previously opened.
; Syntax.........: _GDIPlus_GraphicsEndContainer($hGraphics, $iGraphicsContainer)
; Parameters ....: $hGraphics 		   - Pointer to a Graphics object
;                  $iGraphicsContainer - Value that identifies the container to be closed
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Use this function to close a previously created graphic container.
;                  Caution: When you call _GDIPlus_GraphicsEndContainer, all information blocks placed on the stack
;                  (by _GDIPlus_GraphicsSave or by _GDIPlus_GraphicsBeginContainer) after the corresponding call to
;                  _GDIPlus_GraphicsBeginContainer are removed from the stack. Likewise, when you call _GDIPlus_GraphicsRestore,
;                  all information blocks placed on the stack after the corresponding call to _GDIPlus_GraphicsSave are removed
;                  from the stack.
; Related .......: _GDIPlus_GraphicsBeginContainer, _GDIPlus_GraphicsBeginContainer2
; Link ..........; @@MsdnLink@@ GdipEndContainer
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsEndContainer($hGraphics, $iGraphicsContainer)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipEndContainer", "hwnd", $hGraphics, "uint", $iGraphicsContainer)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsEndContainer

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsFillPolygon2
; Description ...: Uses a brush to fill the interior of a polygon
; Syntax.........: _GDIPlus_GraphicsFillPolygon2($hGraphics, $aPoints[, $hBrush = 0[, $iFillMode = 0]])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $aPoints	  - Array that specify the vertices of the polygon:
;                  |[0][0] - Number of vertices
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $hBrush    - Pointer to a Brush object that is used to paint the interior of the polygon. If 0, a black brush
;                  +will be used.
;                  $iFillMode - Fill mode of the interior of the polygon:
;                  |0 - The areas are filled according to the even-odd parity rule
;                  |1 - The areas are filled according to the nonzero winding rule
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsFillPolygon
; Link ..........; @@MsdnLink@@ GdipFillPolygon
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsFillPolygon2($hGraphics, $aPoints, $hBrush = 0, $iFillMode = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pPoints, $tPoints, $aResult

	__GDIPlus_BrushDefCreate($hBrush)

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipFillPolygon", "hwnd", $hGraphics, "hwnd", $hBrush, "ptr", $pPoints, "int", $iCount, "int", $iFillMode)
	$iTmpErr = @error
	$iTmpExt = @extended

	__GDIPlus_BrushDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsFillPolygon2

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsFillRectangles
; Description ...: Uses a brush to fill the interior of a sequence of rectangles
; Syntax.........: _GDIPlus_GraphicsFillRectangles($hGraphics, $aRects[, $hBrush = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $aRects	  - Array of rectangles that specify the rectangles to be filled:
;                  |[0][0] - Number of rectangles
;                  |[1][0] - Rectangle 1 X position
;                  |[1][1] - Rectangle 1 Y position
;                  |[1][2] - Rectangle 1 Width
;                  |[1][3] - Rectangle 1 Height
;                  |[n][0] - Rectangle n X position
;                  |[n][1] - Rectangle n Y position
;                  |[n][2] - Rectangle n Width
;                  |[n][3] - Rectangle n Height
;                  $hBrush    - Pointer to a Brush that is used to fill the interior of each rectangle. If 0, a black brush will
;                  +be used.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsFillRect
; Link ..........; @@MsdnLink@@ GdipFillRectangles
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsFillRectangles($hGraphics, $aRects, $hBrush = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pRects, $tRects, $aResult

	__GDIPlus_BrushDefCreate($hBrush)

	$iCount = $aRects[0][0]
	$tRects = DllStructCreate("float[" & $iCount * 4 & "]")
	$pRects = DllStructGetPtr($tRects)
	For $iI = 1 To $iCount
		DllStructSetData($tRects, 1, $aRects[$iI][0], (($iI - 1) * 4) + 1)
		DllStructSetData($tRects, 1, $aRects[$iI][1], (($iI - 1) * 4) + 2)
		DllStructSetData($tRects, 1, $aRects[$iI][2], (($iI - 1) * 4) + 3)
		DllStructSetData($tRects, 1, $aRects[$iI][3], (($iI - 1) * 4) + 4)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipFillRectangles", "hwnd", $hGraphics, "hwnd", $hBrush, "ptr", $pRects, "int", $iCount)
	$iTmpErr = @error
	$iTmpExt = @extended

	__GDIPlus_BrushDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsFillRectangles

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsFlush
; Description ...: Forces execution of all pending graphics operations with the method waiting or not waiting, as specified, to
;                  +return before the operations finish
; Syntax.........: _GDIPlus_GraphicsFlush($hGraphics[, $iIntention = 1])
; Parameters ....: $hGraphics  - Pointer to a Graphics object
;                  $iIntention - Specifies whether the method returns immediately or waits for any existing operations to finish:
;                  |0 - Flush all batched rendering operations and return immediately
;                  |1 - Flush all batched rendering operations and wait for them to complete
; Return values .: None
; Remarks .......: The main reason to use this function is to avoid rare cases such trying to release a Graphics object
;                  and in the mean time the engine is trying to draw it's content
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipFlush
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsFlush($hGraphics, $iIntention = 1)
	DllCall($__g_hGDIPDll, "none", "GdipFlush", "hwnd", $hGraphics, "int", $iIntention)
EndFunc   ;==>_GDIPlus_GraphicsFlush

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetClip
; Description ...: Gets the clipping region of a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetClip($hGraphics, $hRegion)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $hRegion	  - Pointer to a Region object that receives the clipping region
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionCreate
; Link ..........; @@MsdnLink@@ GdipGetClip
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetClip($hGraphics, $hRegion)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetClip", "hwnd", $hGraphics, "hwnd", $hRegion)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsGetClip

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetClipBounds
; Description ...: Gets a rectangle that encloses the clipping region of a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetClipBounds($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Array that contains the rectangle coordinates and dimensions:
;                  |[0] - X coordinate of the upper-left corner of the rectangle
;                  |[1] - Y coordinate of the upper-left corner of the rectangle
;                  |[2] - Width of the rectangle
;                  |[3] - Height of the rectangle
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetClipBounds
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetClipBounds($hGraphics)
	Local $tRectF, $pRectF, $iI, $aRectF[4], $aResult

	$tRectF = DllStructCreate($tagGDIPRECTF)
	$pRectF = DllStructGetPtr($tRectF)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetClipBounds", "hwnd", $hGraphics, "ptr", $pRectF)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To 4
		$aRectF[$iI - 1] = DllStructGetData($tRectF, $iI)
	Next
	Return $aRectF
EndFunc   ;==>_GDIPlus_GraphicsGetClipBounds

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetDpiX
; Description ...: Gets the horizontal resolution, in dots per inch, of the display device associated with a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetDpiX($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Horizontal resolution, in dots per inch
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetDpiX
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetDpiX($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetDpiX", "hwnd", $hGraphics, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetDpiX

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetDpiY
; Description ...: Gets the vertical resolution, in dots per inch, of the display device associated with a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetDpiY($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Vertical resolution, in dots per inch
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetDpiY
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetDpiY($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetDpiY", "hwnd", $hGraphics, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetDpiY

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetNearestColor
; Description ...: Gets the nearest color to the color that is passed in
; Syntax.........: _GDIPlus_GraphicsGetNearestColor($hGraphics, $iARGB)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $iARGB     - Alpha, Red, Green and Blue components of a color
; Return values .: Success      - Returns the nearest color found in the color palette
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetNearestColor
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetNearestColor($hGraphics, $iARGB)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetNearestColor", "hwnd", $hGraphics, "uint*", $iARGB)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetNearestColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetPageScale
; Description ...: Gets the scaling factor currently set for the page transformation of a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetPageScale($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - The scaling factor currently set for the page transformation of the Graphics object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The page transformation converts page coordinates to device coordinates
; Related .......: _GDIPlus_GraphicsSetPageScale
; Link ..........; @@MsdnLink@@ GdipGetPageScale
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetPageScale($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPageScale", "hwnd", $hGraphics, "float*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetPageScale

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetPageUnit
; Description ...: Gets the unit of measure currently set for a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetPageUnit($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Returns unit of measuremnet:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsSetPageUnit
; Link ..........; @@MsdnLink@@ GdipGetPageUnit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetPageUnit($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPageUnit", "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetPageUnit

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetPixelOffsetMode
; Description ...: Gets the pixel offset mode currently set for a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetPixelOffsetMode($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Returns the pixel offset mode:
;                  |0,1,3 - Pixel centers have integer coordinates
;                  |2,4	  - Pixel centers have coordinates that are half way between integer values (i.e. 0.5, 20, 105.5, etc...)
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsSetPixelOffsetMode
; Link ..........; @@MsdnLink@@ GdipGetPixelOffsetMode
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetPixelOffsetMode($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPixelOffsetMode", "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetPixelOffsetMode

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetRenderingOrigin
; Description ...: Gets the rendering origin currently set for a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetRenderingOrigin($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Array containing the origin coordinate
;                  |[0] - The X coordinate of the rendering origin
;                  |[1] - The Y coordinate of the rendering origin
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The rendering origin is used to set the dither origin for 8-bits per pixel and 16-bits per pixel dithering
;                  +and is also used to set the origin for hatch brushes
; Related .......: _GDIPlus_GraphicsSetRenderingOrigin
; Link ..........; @@MsdnLink@@ GdipGetRenderingOrigin
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetRenderingOrigin($hGraphics)
	Local $aPoint[2], $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetRenderingOrigin", "hwnd", $hGraphics, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	$aPoint[0] = $aResult[2]
	$aPoint[1] = $aResult[3]
	Return $aPoint
EndFunc   ;==>_GDIPlus_GraphicsGetRenderingOrigin

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetTextContrast
; Description ...: Gets the contrast value currently set for a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetTextContrast($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - The contrast used for antialiasing text graph which is a positive integer between 0 and 12
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The contrast value is used for antialiasing text
; Related .......: _GDIPlus_GraphicsSetTextContrast
; Link ..........; @@MsdnLink@@ GdipGetTextContrast
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetTextContrast($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetTextContrast", "hwnd", $hGraphics, "uint*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetTextContrast

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetTextRenderingHint
; Description ...: Gets the text rendering mode currently set for a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetTextRenderingHint($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Text rendering mode:
;                  |0 - Character is drawn using the currently selected system font smoothing mode (also called a rendering hint)
;                  |1 - Character is drawn using its glyph bitmap and hinting to improve character appearance on stems and
;                  +curvature
;                  |2 - Character is drawn using its glyph bitmap and no hinting. This results in better performance at the
;                  +expense of quality
;                  |3 - Character is drawn using its antialiased glyph bitmap and hinting. This results in much better quality
;                  +due to antialiasing at a higher performance cost
;                  |4 - Character is drawn using its antialiased glyph bitmap and no hinting. Stem width differences may be
;                  +noticeable because hinting is turned off
;                  |5 - Character is drawn using its glyph Microsoft ClearType bitmap and hinting. This type of text rendering
;                  +cannot be used along with $CompositingModeSourceCopy
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsSetTextRenderingHint
; Link ..........; @@MsdnLink@@ GdipGetTextRenderingHint
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetTextRenderingHint($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetTextRenderingHint", "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_GraphicsGetTextRenderingHint

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsGetVisibleClipBounds
; Description ...: Gets the rectangle that encloses the visible clipping region of a Graphics object
; Syntax.........: _GDIPlus_GraphicsGetVisibleClipBounds($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - Array that contains the rectangle coordinates and dimensions:
;                  |[0] - X coordinate of the upper-left corner of the rectangle
;                  |[1] - Y coordinate of the upper-left corner of the rectangle
;                  |[2] - Width of the rectangle
;                  |[3] - Height of the rectangle
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The visible clipping region is the intersection of the clipping region of a Graphics object and the clipping
;                  +region of the window
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetVisibleClipBounds
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsGetVisibleClipBounds($hGraphics)
	Local $tRectF, $pRectF, $iI, $aRectF[4], $aResult

	$tRectF = DllStructCreate($tagGDIPRECTF)
	$pRectF = DllStructGetPtr($tRectF)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetVisibleClipBounds", "hwnd", $hGraphics, "ptr", $pRectF)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To 4
		$aRectF[$iI - 1] = DllStructGetData($tRectF, $iI)
	Next
	Return $aRectF
EndFunc   ;==>_GDIPlus_GraphicsGetVisibleClipBounds

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsIsClipEmpty
; Description ...: Determines whether the clipping region of a Graphics object is empty
; Syntax.........: _GDIPlus_GraphicsIsClipEmpty($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - True if the clipping region of a Graphics object is empty, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: If the clipping region of a Graphics object is empty, there is no area left in which to draw. Consequently,
;                  +nothing will be drawn when the clipping region is empty
; Related .......: _GDIPlus_GraphicsIsVisibleClipEmpty
; Link ..........; @@MsdnLink@@ GdipIsClipEmpty
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsIsClipEmpty($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsClipEmpty", "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2] <> 0
EndFunc   ;==>_GDIPlus_GraphicsIsClipEmpty

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsIsVisibleClipEmpty
; Description ...: Determines whether the visible clipping region of a Graphics object is empty
; Syntax.........: _GDIPlus_GraphicsIsVisibleClipEmpty($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - True if the visible clipping region of a Graphics object is empty, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: If the visible clipping region of a Graphics object is empty, there is no area left in which to draw.
;                  +Consequently, nothing will be drawn when the cvisible lipping region is empty
; Related .......: _GDIPlus_GraphicsIsClipEmpty
; Link ..........; @@MsdnLink@@ GdipIsVisibleClipEmpty
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsIsVisibleClipEmpty($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsVisibleClipEmpty", "hwnd", $hGraphics, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2] <> 0
EndFunc   ;==>_GDIPlus_GraphicsIsVisibleClipEmpty

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsIsVisiblePoint
; Description ...: Determines whether the specified point is inside the visible clipping region of a Graphics object
; Syntax.........: _GDIPlus_GraphicsIsVisiblePoint($hGraphics, $nX, $nY)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $nX        - X coordinate of the point to check for visibility
;                  $nY        - Y coordinate of the point to check for visibility
; Return values .: Success      - True if the specified point is inside the visible clipping region, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsIsVisibleRect
; Link ..........; @@MsdnLink@@ GdipIsVisiblePoint
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsIsVisiblePoint($hGraphics, $nX, $nY)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsVisiblePoint", "hwnd", $hGraphics, "float", $nX, "float", $nY, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[4] <> 0
EndFunc   ;==>_GDIPlus_GraphicsIsVisiblePoint

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsIsVisibleRect
; Description ...: Determines whether the specified rectangle intersects the visible clipping region of a Graphics object
; Syntax.........: _GDIPlus_GraphicsIsVisibleRect($hGraphics, $nX, $nY, $nWidth, $nHeight)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $nX        - X coordinate of the upper-left corner of the rectangle
;                  $nY        - Y coordinate of the upper-left corner of the rectangle
;                  $nWidth	  - Width of the rectangle
;                  $nHeight	  - Height of the rectangle
; Return values .: Success      - True if the specified rectangle intersects the visible clipping region, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsIsVisiblePoint
; Link ..........; @@MsdnLink@@ GdipIsVisibleRect
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsIsVisibleRect($hGraphics, $nX, $nY, $nWidth, $nHeight)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsVisibleRect", "hwnd", $hGraphics, "float", $nX, "float", $nY, "float", $nWidth, "float", $nHeight, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[6] <> 0
EndFunc   ;==>_GDIPlus_GraphicsIsVisibleRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsMultiplyTransform
; Description ...: Updates a Graphics object's world transformation matrix with the product of itself and another matrix
; Syntax.........: _GDIPlus_GraphicsMultiplyTransform($hGraphics, $hMatrix[, $iOrder = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $hMatrix   - Pointer to a matrix that will be multiplied by the world transformation matrix of the Graphics
;                  +object
;                  $iOrder    - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_MatrixCreate, _GDIPlus_GraphicsRotateTransform
; Link ..........; @@MsdnLink@@ GdipMultiplyWorldTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsMultiplyTransform($hGraphics, $hMatrix, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipMultiplyWorldTransform", "hwnd", $hGraphics, "hwnd", $hMatrix, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsMultiplyTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsResetPageTransform
; Description ...: Resets the page transform matrix to the identity matrix
; Syntax.........: _GDIPlus_GraphicsResetPageTransform($hGraphics)
; Parameters ....: $hGraphics - Pointer to a Graphics object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipResetPageTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsResetPageTransform($hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipResetPageTransform", "hwnd", $hGraphics)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsResetPageTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsSetClipGraphics
; Description ...: Updates the clipping region of a Graphics object to a region that is the combination of itself and the
;                  +clipping region of another Graphics object
; Syntax.........: _GDIPlus_GraphicsSetClipGraphics($hGraphics, $hGraphicsSrc[, $iCombineMode = 0])
; Parameters ....: $hGraphics 	 - Pointer to a Graphics object
;                  $hGrahpicsSrc - Pointer to a Graphics object that contains the clipping region to be combined with the
;                  +clipping region of the $hGraphics object
;                  $iCombineMode - Regions combination mode:
;                  |0 - The existing region is replaced by the new region
;                  |1 - The existing region is replaced by the intersection of itself and the new region
;                  |2 - The existing region is replaced by the union of itself and the new region
;                  |3 - The existing region is replaced by the result of performing an XOR on the two regions
;                  |4 - The existing region is replaced by the portion of itself that is outside of the new region
;                  |5 - The existing region is replaced by the portion of the new region that is outside of the existing region
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetClipGraphics
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsSetClipGraphics($hGraphics, $hGraphicsSrc, $iCombineMode = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetClipGraphics", "hwnd", $hGraphics, "hwnd", $hGraphicsSrc, "int", $iCombineMode)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsSetClipGraphics

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsSetClipHrgn
; Description ...: Updates the clipping region of a Graphics object to a region that is the combination of itself and a GDI
;                  +region
; Syntax.........: _GDIPlus_GraphicsSetClipHrgn($hGraphics, $hRgn[, $iCombineMode = 0])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $hRgn 	  - Handle to a GDI region to be combined with the clipping region of the Graphics object
;                  $iCombineMode - Regions combination mode:
;                  |0 - The existing region is replaced by the new region
;                  |1 - The existing region is replaced by the intersection of itself and the new region
;                  |2 - The existing region is replaced by the union of itself and the new region
;                  |3 - The existing region is replaced by the result of performing an XOR on the two regions
;                  |4 - The existing region is replaced by the portion of itself that is outside of the new region
;                  |5 - The existing region is replaced by the portion of the new region that is outside of the existing region
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetClipHrgn
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsSetClipHrgn($hGraphics, $hRgn, $iCombineMode = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetClipHrgn", "hwnd", $hGraphics, "hwnd", $hRgn, "int", $iCombineMode)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsSetClipHrgn

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsSetPageScale
; Description ...: Sets the scaling factor for the page transformation of a Graphics object
; Syntax.........: _GDIPlus_GraphicsSetPageScale($hGraphics, $nScale)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $nScale 	  - The scaling factor
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The page transformation converts page coordinates to device coordinates
; Related .......: _GDIPlus_GraphicsGetPageScale
; Link ..........; @@MsdnLink@@ GdipSetPageScale
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsSetPageScale($hGraphics, $nScale)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPageScale", "hwnd", $hGraphics, "float", $nScale)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsSetPageScale

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsSetPageUnit
; Description ...: Sets the unit of measurement for a Graphics object
; Syntax.........: _GDIPlus_GraphicsSetPageUnit($hGraphics, $iUnit)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $iUnit 	  - Unit of measuremnet:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsGetPageUnit
; Link ..........; @@MsdnLink@@ GdipSetPageUnit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsSetPageUnit($hGraphics, $iUnit)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPageUnit", "hwnd", $hGraphics, "int", $iUnit)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsSetPageUnit

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsSetRenderingOrigin
; Description ...: Sets the rendering origin of a Graphics object
; Syntax.........: _GDIPlus_GraphicsSetRenderingOrigin($hGraphics, $iX, $iY)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $iX  	  - X coordinate of the rendering origin
;                  $iY  	  - Y coordinate of the rendering origin
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The rendering origin is used to set the dither origin for 8-bits-per-pixel and 16-bits-per-pixel dithering
;                  +and is also used to set the origin for hatch brushes
; Related .......: _GDIPlus_GraphicsGetRenderingOrigin
; Link ..........; @@MsdnLink@@ GdipSetRenderingOrigin
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsSetRenderingOrigin($hGraphics, $iX, $iY)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetRenderingOrigin", "hwnd", $hGraphics, "int", $iX, "int", $iY)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsSetRenderingOrigin

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsSetTextContrast
; Description ...: Seets the contrast value of a Graphics object
; Syntax.........: _GDIPlus_GraphicsSetTextContrast($hGraphics, $iContrast)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $iContrast - A number between 0 and 12, which defines the value of contrast used for antialiasing text
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsGetTextContrast
; Link ..........; @@MsdnLink@@ GdipSetTextContrast
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsSetTextContrast($hGraphics, $iContrast)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetTextContrast", "hwnd", $hGraphics, "uint", $iContrast)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsSetTextContrast

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsTransformPointsI
; Description ...: Converts an array of points from one coordinate space to another
; Syntax.........: _GDIPlus_GraphicsTransformPointsI($hGraphics, $aPoints, $iCoordSpaceTo, $iCoordSpaceFrom)
; Parameters ....: $hGraphics 	    - Pointer to a Graphics object
;                  $aPoints	  	    - Array of points to be converted:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $iCoordSpaceTo   - Destination coordinate space
;                  $iCoordSpaceFrom - Source coordinate space:
;                  |0 - World coordinate space, not physical coordinates
;                  |1 - Page coordinate space, read-world coordinates
;                  |2 - Device coordinate space, physical coordinates
; Return values .: Success      - Array of converted points:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: This version supports integer numbers only.
; Related .......: _GDIPlus_GraphicsTransformPoints
; Link ..........; @@MsdnLink@@ GdipTransformPointsI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsTransformPointsI($hGraphics, $aPoints, $iCoordSpaceTo, $iCoordSpaceFrom)
	Local $iI, $iCount, $tPoints, $pPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("int[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)

	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], ($iI - 1) * 2 + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], ($iI - 1) * 2 + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipTransformPointsI", "hwnd", $hGraphics, "int", $iCoordSpaceTo, "int", $iCoordSpaceFrom, "ptr", $pPoints, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To $iCount
		$aPoints[$iI][0] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 1)
		$aPoints[$iI][1] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 2)
	Next

	Return $aPoints
EndFunc   ;==>_GDIPlus_GraphicsTransformPointsI

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsTranslateClip
; Description ...: Translates the clipping region of a Graphics object
; Syntax.........: _GDIPlus_GraphicsTranslateClip($hGraphics, $nDX, $nDY)
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $nDX	  	  - Horizontal component of the translation
;                  $nDY	  	  - Vertical component of the translation
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipTranslateClip
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsTranslateClip($hGraphics, $nDX, $nDY)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipTranslateClip", "hwnd", $hGraphics, "float", $nDX, "float", $nDY)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsTranslateClip

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StreamCreateOnFile
; Description ...: Returns a pointer to an IStream interface based on a file
; Syntax.........: _GDIPlus_StreamCreateOnFile($sFileName[, $iAccess = 0x80000000])
; Parameters ....: $sFileName - Name of the file (metafile, bitmap or image)
;                  $iAccess   - Generic file access flags combination:
;                  |$GENERIC_ALL   	 - Read, write, and execute access
;                  |$GENERIC_EXECUTE - Execute access
;                  |$GENERIC_READ  	 - Read access
;                  |$GENERIC_WRITE 	 - Write access
; Return values .: Success      - A pointer the an IStream interface
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The file access mask must contain $GENERIC_READ or $GENERIC_WRITE. Include Constants.au3 for the constants
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipCreateStreamOnFile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StreamCreateOnFile($sFileName, $iAccess = 0x80000000)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateStreamOnFile", "wstr", $sFileName, "uint", $iAccess, "ptr*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_StreamCreateOnFile

#EndRegion Graphics Functions

#Region Metafile Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileCreateFromEmf
; Description ...: Creates a Metafile object for playback based on a GDI Enhanced Metafile (EMF) file.
; Syntax.........: _GDIPlus_MetafileCreateFromEmf($hEnMetaFile[, $fReleasehEnMetaFile = False])
; Parameters ....: $hEnMetaFile 		- Handle to a GDI enhanced metafile
;                  $fReleasehEnMetaFile - If True, the GDI object is deleted, otherwise, it's not deleted.
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: GDI+ owns the metafile handle, which should not be used by other portions of your code, until the Metafile
;                  +object is deleted or goes out of scope.
;                  After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose, _WinAPI_GetEnhMetaFile, _WinAPI_DeleteEnhMetaFile
; Link ..........; @@MsdnLink@@ GdipCreateMetafileFromEmf
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileCreateFromEmf($hEnMetaFile, $fReleasehEnMetaFile = False)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMetafileFromEmf", "hwnd", $hEnMetaFile, "int", $fReleasehEnMetaFile, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_MetafileCreateFromEmf

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileCreateFromFile
; Description ...: Creates a Metafile object for playback from a file
; Syntax.........: _GDIPlus_MetafileCreateFromFile($sFileName)
; Parameters ....: $sFileName - File name used to create the Metafile object for playback
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipCreateMetafileFromFile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileCreateFromFile($sFileName)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMetafileFromFile", "wstr", $sFileName, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_MetafileCreateFromFile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileCreateFromStream
; Description ...: Creates a Metafile object for playback from an IStream interface
; Syntax.........: _GDIPlus_MetafileCreateFromStream($pStream)
; Parameters ....: $pStream - Pointer to an IStream interface that points to a data stream in a file
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipCreateMetafileFromStream
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileCreateFromStream($pStream)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMetafileFromStream", "ptr", $pStream, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_MetafileCreateFromStream

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileCreateFromWmf
; Description ...: Creates a Metafile object for recording. The format will be placeable metafile
; Syntax.........: _GDIPlus_MetafileCreateFromWmf($hWMetaFile[, $pWmfPlaceableFileHeader = 0[, $fReleasehWMetaFile = False]])
; Parameters ....: $hWMetaFile 				- Windows handle to a metafile
;                  $pWmfPlaceableFileHeader - Pointer to a $tagWmfPlaceableFileHeader structure that specifies a preheader
;                  +preceding the metafile header
;                  $fReleasehEnMetaFile 	- If True, the GDI object is deleted, otherwise, it's not deleted.
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipCreateMetafileFromWmf
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileCreateFromWmf($hWMetaFile, $pWmfPlaceableFileHeader = 0, $fReleasehWMetaFile = False)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMetafileFromWmf", "hwnd", $hWMetaFile, "int", $fReleasehWMetaFile, "ptr", $pWmfPlaceableFileHeader, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[4]
EndFunc   ;==>_GDIPlus_MetafileCreateFromWmf

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileCreateFromWmfFile
; Description ...: Creates a Metafile object for playback
; Syntax.........: _GDIPlus_MetafileCreateFromWmfFile($sFileName[, $pWmfPlaceableFileHeader = 0])
; Parameters ....: $sFileName 				- File name used to create the Metafile object for playback
;                  $pWmfPlaceableFileHeader - Pointer to a $tagWmfPlaceableFileHeader structure that specifies a preheader
;                  +preceding the metafile header
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipCreateMetafileFromWmfFile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileCreateFromWmfFile($sFileName, $pWmfPlaceableFileHeader = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMetafileFromWmfFile", "wstr", $sFileName, "ptr", $pWmfPlaceableFileHeader, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_MetafileCreateFromWmfFile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileCreateHENMETAFILEFromMetafile
; Description ...: Gets a Windows handle to an Enhanced Metafile object from an existing Metafile object
; Syntax.........: _GDIPlus_MetafileCreateHENMETAFILEFromMetafile($hMetaFile)
; Parameters ....: $hMetaFile - Pointer to a Metafile object
; Return values .: Success      - Pointer to a new Windows Enhanced Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _WinAPI_DeleteEnhMetaFile to release the object resources
; Related .......: _WinAPI_DeleteEnhMetaFile
; Link ..........; @@MsdnLink@@ GdipGetHemfFromMetafile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileCreateHENMETAFILEFromMetafile($hMetaFile)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetHemfFromMetafile", "hwnd", $hMetaFile, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_MetafileCreateHENMETAFILEFromMetafile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEmfToWmfBits
; Description ...: Converts an enhanced-format metafile to a Microsoft Windows Metafile Format (WMF) metafile
; Syntax.........: _GDIPlus_MetafileEmfToWmfBits($hEnMetaFile[, $iMapMode = 8[, $iFlags = 0]])
; Parameters ....: $hEnMetaFile - Handle to the enhanced-format metafile that is to be converted
;                  $iMapMode	- The mapping mode to use in the converted metafile:
;                  |1 - Each logical unit is mapped to one device pixel. Positive x is to the right; positive y is down
;                  |2 - Each logical unit is mapped to 0.1 millimeter. Positive x is to the right; positive y is up
;                  |3 - Each logical unit is mapped to 0.01 millimeter. Positive x is to the right; positive y is up
;                  |4 - Each logical unit is mapped to 0.01 inch. Positive x is to the right; positive y is up
;                  |5 - Each logical unit is mapped to 0.001 inch. Positive x is to the right; positive y is up
;                  |6 - Each logical unit is mapped to one twentieth of a printer's point (1/1440 inch, also called a twip).
;                  +Positive x is to the right; positive y is up
;                  |7 - Logical units are mapped to arbitrary units with equally scaled axes; that is, one unit along the x-axis
;                  +is equal to one unit along the y-axis
;                  |8 - Logical units are mapped to arbitrary units with arbitrarily scaled axes
;                  $iFlags		- Flags options for the conversion. Can be in any combination of the following flags:
;                  |0 - The default conversion
;                  |1 - The source EMF metafile is to be embedded as a comment in the resulting WMF metafile
;                  |2 - The resulting WMF metafile is in the placeable metafile format; that is, it has the additional 22-byte
;                  +header required by a placeable metafile
;                  |4 - The clipping region is stored in the metafile in the traditional way. If you do not set this flag,
;                  +the function applies an optimization that stores the clipping region as a path and simulates clipping by
;                  +using the XOR operator
; Return values .: Success      - A dll structure (DllStructCreate) that contains the Window Metafile Format data
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_ERROR:
; 			       |	1 - Could not retrieve the required buffer size, call _WinAPI_GetLastError to identify the error
;                  |    2 - The second call to retrieve the data failed, call _WinAPI_GetLastError to identify the error
; Remarks .......: This function does not invalidate the enhanced metafile handle. The user is responsible to release to release
;                  +the object resources. You can call _WinAPI_SetMetaFileBitsEx to get a Window Metafile Format metafile handle
;                  +from the returned data.
; Related .......: _WinAPI_SetMetaFileBitsEx, _WinAPI_DeleteEnhMetaFile
; Link ..........; @@MsdnLink@@ GdipEmfToWmfBits
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEmfToWmfBits($hEnMetaFile, $iMapMode = 8, $iFlags = 0)
	Local $pData, $tData, $iData, $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEmfToWmfBits", "hwnd", $hEnMetaFile, "uint", 0, "ptr", 0, "int", $iMapMode, "int", $iFlags)
	If @error Then Return SetError(@error, @extended, -1)

	$iData = $aResult[0]
	If $iData = 0 Then
		$GDIP_ERROR = 1
		Return -1
	EndIf

	$tData = DllStructCreate("byte Buffer[" & $iData & "]")
	$pData = DllStructGetPtr($tData)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEmfToWmfBits", "hwnd", $hEnMetaFile, "uint", $iData, "ptr", $pData, "int", $iMapMode, "int", $iFlags)
	If @error Then Return SetError(@error, @extended, -1)

	If $aResult[0] = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	Return $tData
EndFunc   ;==>_GDIPlus_MetafileEmfToWmfBits

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEnumerateDestPoint
; Description ...: Calls an application-defined callback function for each record in a specified metafile. You can use this
;                  +function to display a metafile by calling _GDIPlus_MetafilePlayRecord in the callback function
; Syntax.........: _GDIPlus_MetafileEnumerateDestPoint($hGraphics, $hMetaFile, $nX, $nY, $pEnumCallback[, $pCallbackData = 0[, $hImageAttributes = 0]])
;                  $hGraphics		 - Pointer to a Graphics object
; Parameters ....: $hMetaFile 		 - Pointer to a Metafile object to be enumerated
;                  $nX        		 - X coordinate of the upper-left corner of the displayed metafile
;                  $nY        		 - Y coordinate of the upper-left corner of the displayed metafile
;                  $pEnumCallback	 - Pointer to an application-defined callback function, see remarks
;                  $pCallbackdata	 - Pointer to a block of data that is passed to the callback function
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies color adjustments for the displayed
;                  +metafile
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The dll callback function should be defined as:
;                  $hFunc = DllCallbackRegister("MyEnumFunc", "int", "int;uint;uint;ptr;ptr")
;                  If the callback function returns False, the enumeration process is aborted. Otherwise it continues
; Related .......: _GDIPlus_MetafilePlayRecord
; Link ..........; @@MsdnLink@@ GdipEnumerateMetafileDestPoint
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEnumerateDestPoint($hGraphics, $hMetaFile, $nX, $nY, $pEnumCallback, $pCallbackData = 0, $hImageAttributes = 0)
	Local $pPointF, $tPointF, $aResult

	$tPointF = DllStructCreate("float;float")
	$pPointF = DllStructGetPtr($tPointF)
	DllStructSetData($tPointF, 1, $nX)
	DllStructSetData($tPointF, 2, $nY)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEnumerateMetafileDestPoint", "hwnd", $hGraphics, "hwnd", $hMetaFile, "ptr", $pPointF, "ptr", $pEnumCallback, "ptr", $pCallbackData, "hwnd", $hImageAttributes)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileEnumerateDestPoint

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEnumerateDestPoints
; Description ...: Calls an application-defined callback function for each record in a specified metafile. You can use this
;                  +function to display a metafile by calling _GDIPlus_MetafilePlayRecord in the callback function
; Syntax.........: _GDIPlus_MetafileEnumerateDestPoints($hGraphics, $hMetaFile, $nULX, $nULY, $nURX, $nURY, $nLLX, $nLLY, $pEnumCallback[, $pCallbackData = 0[, $hImageAttributes = 0]])
; Parameters ....: $hGraphics		 - Pointer to a Graphics object
;                  $hMetaFile 		 - Pointer to a Metafile object to be enumerated
;                  $nULX       		 - The X coordinate of the upper left corner of the displayed metafile
;                  $nULY       		 - The Y coordinate of the upper left corner of the displayed metafile
;                  $nURX       		 - The X coordinate of the upper right corner of the displayed metafile
;                  $nURY       		 - The Y coordinate of the upper right corner of the displayed metafile
;                  $nLLX       		 - The X coordinate of the lower left corner of the displayed metafile
;                  $nLLY       		 - The Y coordinate of the lower left corner of the displayed metafile
;                  $pEnumCallback	 - Pointer to an application-defined callback function, see remarks
;                  $pCallbackdata	 - Pointer to a block of data that is passed to the callback function
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies color adjustments for the displayed
;                  +metafile
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The dll callback function should be defined as:
;                  $hFunc = DllCallbackRegister("MyEnumFunc", "int", "int;uint;uint;ptr;ptr")
;                  If the callback function returns False, the enumeration process is aborted. Otherwise it continues
; Related .......: _GDIPlus_MetafilePlayRecord
; Link ..........; @@MsdnLink@@ GdipEnumerateMetafileDestPoints
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEnumerateDestPoints($hGraphics, $hMetaFile, $nULX, $nULY, $nURX, $nURY, $nLLX, $nLLY, $pEnumCallback, $pCallbackData = 0, $hImageAttributes = 0)
	Local $tPoints, $pPoints, $aResult

	$tPoints = DllStructCreate("float X;float Y;float X2;float Y2;float X3;float Y3")
	$pPoints = DllStructGetPtr($tPoints)
	DllStructSetData($tPoints, "X", $nULX)
	DllStructSetData($tPoints, "Y", $nULY)
	DllStructSetData($tPoints, "X2", $nURX)
	DllStructSetData($tPoints, "Y2", $nURY)
	DllStructSetData($tPoints, "X3", $nLLX)
	DllStructSetData($tPoints, "Y3", $nLLY)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEnumerateMetafileDestPoints", "hwnd", $hGraphics, "hwnd", $hMetaFile, "ptr", $pPoints, "int", 3, "ptr", $pEnumCallback, "ptr", $pCallbackData, "hwnd", $hImageAttributes)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileEnumerateDestPoints

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEnumerateDestRect
; Description ...: Calls an application-defined callback function for each record in a specified metafile. You can use this
;                  +function to display a metafile by calling _GDIPlus_MetafilePlayRecord in the callback function
; Syntax.........: _GDIPlus_MetafileEnumerateDestRect($hGraphics, $hMetaFile, $tDstRectF, $pEnumCallback[, $pCallbackData = 0[, $hImageAttributes = 0]])
; Parameters ....: $hGraphics		 - Pointer to a Graphics object
;                  $hMetaFile 		 - Pointer to a Metafile object to be enumerated
;                  $tDstRectF     	 - A $tagGDIPRECTF structure that specifies the rectangle in which the metafile is displayed
;                  $pEnumCallback	 - Pointer to an application-defined callback function, see remarks
;                  $pCallbackdata	 - Pointer to a block of data that is passed to the callback function
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies color adjustments for the displayed
;                  +metafile
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The dll callback function should be defined as:
;                  $hFunc = DllCallbackRegister("MyEnumFunc", "int", "int;uint;uint;ptr;ptr")
;                  If the callback function returns False, the enumeration process is aborted. Otherwise it continues
; Related .......: _GDIPlus_MetafilePlayRecord
; Link ..........; @@MsdnLink@@ GdipEnumerateMetafileDestRect
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEnumerateDestRect($hGraphics, $hMetaFile, $tDstRectF, $pEnumCallback, $pCallbackData = 0, $hImageAttributes = 0)
	Local $pDstRectF, $aResult

	$pDstRectF = DllStructGetPtr($tDstRectF)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEnumerateMetafileDestRect", "hwnd", $hGraphics, "hwnd", $hMetaFile, "ptr", $pDstRectF, "ptr", $pEnumCallback, "ptr", $pCallbackData, "hwnd", $hImageAttributes)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileEnumerateDestRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEnumerateSrcRectDestPoint
; Description ...: Calls an application-defined callback function for each record in a specified metafile. You can use this
;                  +function to display a metafile by calling _GDIPlus_MetafilePlayRecord in the callback function
; Syntax.........: _GDIPlus_MetafileEnumerateSrcRectDestPoint($hGraphics, $hMetaFile, $nX, $nY, $tSrcRectF, $pEnumCallback[, $pCallbackData = 0[, $iUnit = 2,[ $hImageAttributes = 0]]])
; Parameters ....: $hGraphics		 - Pointer to a Graphics object
;                  $hMetaFile 		 - Pointer to a Metafile object to be enumerated
;                  $nX        		 - X coordinate of the upper-left corner of the displayed metafile
;                  $nY        		 - Y coordinate of the upper-left corner of the displayed metafile
;                  $tSrcRectF        - A $tagGDIPRECTF structure that specifies the portion of the metafile that is displayed
;                  $pEnumCallback	 - Pointer to an application-defined callback function, see remarks
;                  $pCallbackdata	 - Pointer to a block of data that is passed to the callback function
;                  $iUnit			 - Unit of measurement for the source rectangle:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies color adjustments for the displayed
;                  +metafile
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The dll callback function should be defined as:
;                  $hFunc = DllCallbackRegister("MyEnumFunc", "int", "int;uint;uint;ptr;ptr")
;                  If the callback function returns False, the enumeration process is aborted. Otherwise it continues
; Related .......: _GDIPlus_MetafilePlayRecord
; Link ..........; @@MsdnLink@@ GdipEnumerateMetafileSrcRectDestPoint
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEnumerateSrcRectDestPoint($hGraphics, $hMetaFile, $nX, $nY, $tSrcRectF, $pEnumCallback, $pCallbackData = 0, $iUnit = 2, $hImageAttributes = 0)
	Local $pSrcRectF, $tPointF, $pPointF, $aResult

	$tPointF = DllStructCreate("float;float")
	$pPointF = DllStructGetPtr($tPointF)
	DllStructSetData($tPointF, 1, $nX)
	DllStructSetData($tPointF, 2, $nY)
	$pSrcRectF = DllStructGetPtr($tSrcRectF)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEnumerateMetafileSrcRectDestPoint", "hwnd", $hGraphics, "hwnd", $hMetaFile, "ptr", $pPointF, "ptr", $pSrcRectF, "int", $iUnit, "ptr", $pEnumCallback, "ptr", $pCallbackData, "hwnd", $hImageAttributes)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileEnumerateSrcRectDestPoint

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEnumerateSrcRectDestPoints
; Description ...: Calls an application-defined callback function for each record in a specified metafile. You can use this
;                  +function to display a metafile by calling _GDIPlus_MetafilePlayRecord in the callback function
; Syntax.........: _GDIPlus_MetafileEnumerateSrcRectDestPoints($hGraphics, $hMetaFile, $nULX, $nULY, $nURX, $nURY, $nLLX, $nLLY, $tSrcRectF, $pEnumCallback[, $pCallbackData = 0[, $iUnit = 2[, $hImageAttributes = 0]]])
; Parameters ....: $hGraphics		 - Pointer to a Graphics object
;                  $hMetaFile 		 - Pointer to a Metafile object to be enumerated
;                  $nULX       		 - The X coordinate of the upper left corner of the destination of the displayed metafile
;                  $nULY       		 - The Y coordinate of the upper left corner of the destination of the displayed metafile
;                  $nURX       		 - The X coordinate of the upper right corner of the destination of the displayed metafile
;                  $nURY       		 - The Y coordinate of the upper right corner of the destination of the displayed metafile
;                  $nLLX       		 - The X coordinate of the lower left corner of the destination of the displayed metafile
;                  $nLLY       		 - The Y coordinate of the lower left corner of the destination of the displayed metafile
;                  $tSrcRectF        - A $tagGDIPRECTF structure that specifies the portion of the metafile that is displayed
;                  $pEnumCallback	 - Pointer to an application-defined callback function, see remarks
;                  $pCallbackdata	 - Pointer to a block of data that is passed to the callback function
;                  $iUnit			 - Unit of measurement for the source rectangle:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies color adjustments for the displayed
;                  +metafile
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The dll callback function should be defined as:
;                  $hFunc = DllCallbackRegister("MyEnumFunc", "int", "int;uint;uint;ptr;ptr")
;                  If the callback function returns False, the enumeration process is aborted. Otherwise it continues
; Related .......: _GDIPlus_MetafilePlayRecord
; Link ..........; @@MsdnLink@@ GdipEnumerateMetafileSrcRectDestPoints
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEnumerateSrcRectDestPoints($hGraphics, $hMetaFile, $nULX, $nULY, $nURX, $nURY, $nLLX, $nLLY, $tSrcRectF, $pEnumCallback, $pCallbackData = 0, $iUnit = 2, $hImageAttributes = 0)
	Local $pSrcRectF, $tPoints, $pPoints, $aResult

	$tPoints = DllStructCreate("float X;float Y;float X2;float Y2;float X3;float Y3")
	$pPoints = DllStructGetPtr($tPoints)
	DllStructSetData($tPoints, "X", $nULX)
	DllStructSetData($tPoints, "Y", $nULY)
	DllStructSetData($tPoints, "X2", $nURX)
	DllStructSetData($tPoints, "Y2", $nURY)
	DllStructSetData($tPoints, "X3", $nLLX)
	DllStructSetData($tPoints, "Y3", $nLLY)
	$pSrcRectF = DllStructGetPtr($tSrcRectF)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEnumerateMetafileSrcRectDestPoints", "hwnd", $hGraphics, "hwnd", $hMetaFile, "ptr", $pPoints, "int", 3, "ptr", $pSrcRectF, "int", $iUnit, "ptr", $pEnumCallback, "ptr", $pCallbackData, "hwnd", $hImageAttributes)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileEnumerateSrcRectDestPoints

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileEnumerateSrcRectDestRect
; Description ...: Calls an application-defined callback function for each record in a specified metafile. You can use this
;                  +function to display a metafile by calling _GDIPlus_MetafilePlayRecord in the callback function
; Syntax.........: _GDIPlus_MetafileEnumerateSrcRectDestRect($hGraphics, $hMetaFile, $tDstRectF, $tSrcRectF, $pEnumCallback[, $pCallbackData = 0[, $iUnit = 2[, $hImageAttributes = 0]]])
; Parameters ....: $hGraphics		 - Pointer to a Graphics object
;                  $hMetaFile 		 - Pointer to a Metafile object to be enumerated
;                  $tDstRectF 		 - A $tagGDIPRECTF structure that specifies the rectangle in which the metafile is displayed
;                  $tSrcRectF  		 - A $tagGDIPRECTF structure hat specifies the portion of the metafile that is displayed
;                  $pEnumCallback	 - Pointer to an application-defined callback function, see remarks
;                  $pCallbackdata	 - Pointer to a block of data that is passed to the callback function
;                  $iUnit			 - Unit of measurement for the source rectangle:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  $hImageAttributes - Pointer to an ImageAttributes object that specifies color adjustments for the displayed
;                  +metafile
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The dll callback function should be defined as:
;                  $hFunc = DllCallbackRegister("MyEnumFunc", "int", "int;uint;uint;ptr;ptr")
;                  If the callback function returns False, the enumeration process is aborted. Otherwise it continues
; Related .......: _GDIPlus_MetafilePlayRecord
; Link ..........; @@MsdnLink@@ GdipEnumerateMetafileSrcRectDestRect
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileEnumerateSrcRectDestRect($hGraphics, $hMetaFile, $tDstRectF, $tSrcRectF, $pEnumCallback, $pCallbackData = 0, $iUnit = 2, $hImageAttributes = 0)
	Local $pDstRectF, $pSrcRectF, $aResult

	$pDstRectF = DllStructGetPtr($tDstRectF)
	$pSrcRectF = DllStructGetPtr($tSrcRectF)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipEnumerateMetafileSrcRectDestRect", "hwnd", $hGraphics, "hwnd", $hMetaFile, "ptr", $pDstRectF, "ptr", $pSrcRectF, "int", $iUnit, "ptr", $pEnumCallback, "ptr", $pCallbackData, "hwnd", $hImageAttributes)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileEnumerateSrcRectDestRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileGetDownLevelRasterizationLimit
; Description ...: Gets the rasterization limit currently set for this metafile
; Syntax.........: _GDIPlus_MetafileGetDownLevelRasterizationLimit($hMetaFile)
; Parameters ....: $hMetaFile - Pointer to a Metafile object
; Return values .: Success      - Rasterization limit in dots per inch (DPI)
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The rasterization limit is the resolution used for certain brush bitmaps that are stored in the metafile
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetMetafileDownLevelRasterizationLimit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileGetDownLevelRasterizationLimit($hMetaFile)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetMetafileDownLevelRasterizationLimit", "hwnd", $hMetaFile, "uint*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_MetafileGetDownLevelRasterizationLimit

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileHeaderFromEmf
; Description ...: Gets a metafile header from an enhanced metafile
; Syntax.........: _GDIPlus_MetafileHeaderFromEmf($hEnMetaFile)
; Parameters ....: $hEnMetaFile - Window handle to an enhanced metafile
; Return values .: Success      - Returns a $tagGDIPMETAFILEHEADER_ENHMETAHEADER3 structure containing the metafile header
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagGDIPMETAFILEHEADER_ENHMETAHEADER3
; Link ..........; @@MsdnLink@@ GdipGetMetafileHeaderFromEmf
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileHeaderFromEmf($hEnMetaFile)
	Local $tMetafile, $pMetafile, $aResult

	$tMetafile = DllStructCreate($tagGDIPMETAFILEHEADER_ENHMETAHEADER3)
	$pMetafile = DllStructGetPtr($tMetafile)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetMetafileHeaderFromEmf", "hwnd", $hEnMetaFile, "ptr", $pMetafile)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tMetafile
EndFunc   ;==>_GDIPlus_MetafileHeaderFromEmf

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileHeaderFromFile
; Description ...: Gets a metafile header of a file
; Syntax.........: _GDIPlus_MetafileHeaderFromFile($sFileName)
; Parameters ....: $sFileName - File name to create the Metafile Header from
; Return values .: Success      - Returns a $tagGDIPMETAFILEHEADER_ENHMETAHEADER3 structure containing the metafile header
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagGDIPMETAFILEHEADER_ENHMETAHEADER3
; Link ..........; @@MsdnLink@@ GdipGetMetafileHeaderFromFile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileHeaderFromFile($sFileName)
	Local $tMetafile, $pMetafile, $aResult

	$tMetafile = DllStructCreate($tagGDIPMETAFILEHEADER_ENHMETAHEADER3)
	$pMetafile = DllStructGetPtr($tMetafile)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetMetafileHeaderFromFile", "wstr", $sFileName, "ptr", $pMetafile)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tMetafile
EndFunc   ;==>_GDIPlus_MetafileHeaderFromFile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileHeaderFromMetafile
; Description ...: Gets a metafile header of a Metafile object
; Syntax.........: _GDIPlus_MetafileHeaderFromMetafile($hMetaFile)
; Parameters ....: $hMetaFile - Pointer to a Metafile object
; Return values .: Success      - Returns a $tagGDIPMETAFILEHEADER_ENHMETAHEADER3 structure containing the metafile header
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagGDIPMETAFILEHEADER_ENHMETAHEADER3
; Link ..........; @@MsdnLink@@ GdipGetMetafileHeaderFromMetafile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileHeaderFromMetafile($hMetaFile)
	Local $tMetafile, $pMetafile, $aResult

	$tMetafile = DllStructCreate($tagGDIPMETAFILEHEADER_ENHMETAHEADER3)
	$pMetafile = DllStructGetPtr($tMetafile)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetMetafileHeaderFromMetafile", "hwnd", $hMetaFile, "ptr", $pMetafile)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tMetafile
EndFunc   ;==>_GDIPlus_MetafileHeaderFromMetafile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileHeaderFromStream
; Description ...: Gets a metafile header of an IStream interface
; Syntax.........: _GDIPlus_MetafileHeaderFromStream($pStream)
; Parameters ....: $pStream - Pointer to a nIStream interface that points to a stream of data in a file
; Return values .: Success      - Returns a $tagGDIPMETAFILEHEADER_ENHMETAHEADER3 structure containing the metafile header
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagGDIPMETAFILEHEADER_ENHMETAHEADER3
; Link ..........; @@MsdnLink@@ GdipGetMetafileHeaderFromStream
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileHeaderFromStream($pStream)
	Local $tMetafile, $pMetafile, $aResult

	$tMetafile = DllStructCreate($tagGDIPMETAFILEHEADER_ENHMETAHEADER3)
	$pMetafile = DllStructGetPtr($tMetafile)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetMetafileHeaderFromStream", "ptr", $pStream, "ptr", $pMetafile)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tMetafile
EndFunc   ;==>_GDIPlus_MetafileHeaderFromStream

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileHeaderFromWmf
; Description ...: Gets a metafile header from a window metafile handle and a placeable metafile header
; Syntax.........: _GDIPlus_MetafileHeaderFromWmf($hWMetaFile, $tWmfPlaceableFileHeader)
; Parameters ....: $hWMetaFile 				- Handle to a Windows GDI metafile
;                  $tWmfPlaceableFileHeader	- A $tagGDIPWmfPlaceableFileHeader structure that defined the preheader before
;                  +heading metafile
; Return values .: Success      - Returns a $tagGDIPMETAFILEHEADER_ENHMETAHEADER3 structure containing the metafile header
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagGDIPMETAFILEHEADER_ENHMETAHEADER3
; Link ..........; @@MsdnLink@@ GdipGetMetafileHeaderFromWmf
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileHeaderFromWmf($hWMetaFile, $tWmfPlaceableFileHeader)
	Local $tMetafile, $pMetafile, $pWmfPlaceableFileHeader, $aResult

	$tMetafile = DllStructCreate($tagGDIPMETAFILEHEADER_ENHMETAHEADER3)
	$pMetafile = DllStructGetPtr($tMetafile)
	$pWmfPlaceableFileHeader = DllStructGetPtr($tWmfPlaceableFileHeader)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetMetafileHeaderFromWmf", "hwnd", $hWMetaFile, "ptr", $pWmfPlaceableFileHeader, "ptr", $pMetafile)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tMetafile
EndFunc   ;==>_GDIPlus_MetafileHeaderFromWmf

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafilePlayRecord
; Description ...: Plays a metafile record
; Syntax.........: _GDIPlus_MetafilePlayRecord($hMetaFile, $iRecordType, $iFlags, $iDataSize, $pData)
; Parameters ....: $hMetaFile 	- Pointer to a Metafile object
;                  $iRecordType	- Element of the EmfPlusRecordType enumeration that specifies the type of metafile record to be
;                  +played. The enumeration constants are declared in GDIPConstants.au3
;                  $iFlags		- Set of flags that specify attributes of the record to be played
;                  $iDataSize	- Number of bytes contained in the record data
;                  $pData		- Pointer to an array of bytes that contains the record data
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: This function is used in conjunction with the Metafile enumeration functions. $iRecordType, $iFlags,
;                  +$iDataSize, and $pData are the first 4 parameters of the callback enumeration and are provided by the system
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipPlayMetafileRecord
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafilePlayRecord($hMetaFile, $iRecordType, $iFlags, $iDataSize, $pData)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipPlayMetafileRecord", "hwnd", $hMetaFile, "int", $iRecordType, "uint", $iFlags, "uint", $iDataSize, "ptr", $pData)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafilePlayRecord

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileRecord
; Description ...: Creates a Metafile object for recording
; Syntax.........: _GDIPlus_MetafileRecord($hDC[, $pRectF = 0[, $iType = 5[, $iUnit = 7[, $sDescription = 0]]]])
; Parameters ....: $hDC 		 - Handle to a device context that contains attributes of the display device that is used to
;                  +record the metafile
;                  $pRectF 		 - Pointer to a $tagGDIPRECTF structre defining the bounding rectangle of the displayed metafile
;                  $iType  		 - The type of the metafile that will be recorded:
;                  |3 - Records in the metafile are EMF records, which can be displayed by GDI or GDI+
;                  |4 - Records in the metafile are EMF+ records, which can be displayed by GDI+ but not by GDI
;                  |5 - EMF+ records in the metafile are associated with an alternate EMF record. Metafiles of this type can be
;                  +displayed by GDI or by GDI+
;                  $iUnit  		 - Unit of measurement for the $tRectF rectangle:
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  |7 - A unit is 0.01 millimeter
;                  $sDescription - String that specifies a descriptive name of the metafile
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRecordMetafile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileRecord($hDC, $pRectF = 0, $iType = 5, $iUnit = 7, $sDescription = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRecordMetafile", "hwnd", $hDC, "int", $iType, "ptr", $pRectF, "int", $iUnit, "wstr", $sDescription, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[6]
EndFunc   ;==>_GDIPlus_MetafileRecord

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileRecordFileName
; Description ...: Creates a Metafile object for recording
; Syntax.........: _GDIPlus_MetafileRecordFileName($sFileName, $hDC[, $tRectF = 0[, $iType = 5[, $iUnit = 7[, $sDescription = 0]]]])
; Parameters ....: $sFileName	 - Name of the file in which the metafile will be saved
;                  $hDC 		 - Handle to a device context that contains attributes of the display device that is used to
;                  +record the metafile
;                  $pRectF 		 - Pointer to a $tagGDIPRECTF structre defining the bounding rectangle of the displayed metafile
;                  $iType  		 - The type of the metafile that will be recorded:
;                  |3 - Records in the metafile are EMF records, which can be displayed by GDI or GDI+
;                  |4 - Records in the metafile are EMF+ records, which can be displayed by GDI+ but not by GDI
;                  |5 - EMF+ records in the metafile are associated with an alternate EMF record. Metafiles of this type can be
;                  +displayed by GDI or by GDI+
;                  $iUnit  		 - Unit of measurement for the $tRectF rectangle:
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  |7 - A unit is 0.01 millimeter
;                  $sDescription - String that specifies a descriptive name of the metafile
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRecordMetafileFileName
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileRecordFileName($sFileName, $hDC, $tRectF = 0, $iType = 5, $iUnit = 7, $sDescription = 0)
	Local $pRectF, $aResult

	$pRectF = DllStructGetPtr($tRectF)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipRecordMetafileFileName", "wstr", $sFileName, "hwnd", $hDC, "int", $iType, "ptr", $pRectF, "int", $iUnit, "wstr", $sDescription, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[7]
EndFunc   ;==>_GDIPlus_MetafileRecordFileName

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileRecordStream
; Description ...: Creates a Metafile object for recording
; Syntax.........: _GDIPlus_MetafileRecordStream($pStream, $hDC[, $pRectF = 0[, $iType = 5[, $iUnit = 7[, $sDescription = 0]]]])
; Parameters ....: $pStream	 	 - Pointer to an IStream interface that points to a stream of data in a file. When the commands
;                  +are recorded, they will be saved to this stream
;                  $hDC 		 - Handle to a device context that contains attributes of the display device that is used to
;                  +record the metafile
;                  $pRectF 		 - Pointer to a $tagGDIPRECTF structre defining the bounding rectangle of the displayed metafile
;                  $iType  		 - The type of the metafile that will be recorded:
;                  |3 - Records in the metafile are EMF records, which can be displayed by GDI or GDI+
;                  |4 - Records in the metafile are EMF+ records, which can be displayed by GDI+ but not by GDI
;                  |5 - EMF+ records in the metafile are associated with an alternate EMF record. Metafiles of this type can be
;                  +displayed by GDI or by GDI+
;                  $iUnit  		 - Unit of measurement for the $tRectF rectangle:
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  |7 - A unit is 0.01 millimeter
;                  $sDescription - String that specifies a descriptive name of the metafile
; Return values .: Success      - Pointer to a new Metafile object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRecordMetafileStream
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileRecordStream($pStream, $hDC, $pRectF = 0, $iType = 5, $iUnit = 7, $sDescription = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRecordMetafileStream", "ptr", $pStream, "hwnd", $hDC, "int", $iType, "ptr", $pRectF, "int", $iUnit, "wstr", $sDescription, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[7]
EndFunc   ;==>_GDIPlus_MetafileRecordStream

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MetafileSetDownLevelRasterizationLimit
; Description ...: Sets the resolution for certain brush bitmaps that are stored in a metafile
; Syntax.........: _GDIPlus_MetafileSetDownLevelRasterizationLimit($hMetaFile, $iRasterizationLimitDPI)
; Parameters ....: $hMetaFile 			   - Pointer to a Metafile object
;                  $iRasterizationLimitDPI - Integer that specifies the resolution in dots per inch (DPI)
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: If the rasterization parameter equal to 0, the resolution is set to match the resolution of the device context
;                  +handle that was used to create the Metafile object. If the rasterization parameter is greater than 0 but less
;                  +than 10, the resolution is left unchanged
; Related .......: _GDIPlus_MetafileGetDownLevelRasterizationLimit
; Link ..........; @@MsdnLink@@ GdipSetMetafileDownLevelRasterizationLimit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MetafileSetDownLevelRasterizationLimit($hMetaFile, $iRasterizationLimitDPI)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetMetafileDownLevelRasterizationLimit", "hwnd", $hMetaFile, "uint", $iRasterizationLimitDPI)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_MetafileSetDownLevelRasterizationLimit

#EndRegion Metafile Functions

#Region GraphicsPath Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathAddBeziers
; Description ...: Adds a sequence of connected bezier splines to the current figure of a path
; Syntax.........: _GDIPlus_PathAddBeziers($hPath, $aPoints)
; Parameters ....: $hPath	- Pointer to a GraphicsPath object
;                  $aPoints - Array of points that specify the starting, ending, and control points of the Bezier splines:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The first spline is constructed from the first point through the fourth point in the array and uses the second
;                  +and third points as control points. Each subsequent spline in the sequence needs exactly three more points:
;                  +the ending point of the previous spline is used as the starting point, the next two points in the sequence
;                  +are control points, and the third point is the ending point
; Related .......: _GDIPlus_PathAddBezier
; Link ..........; @@MsdnLink@@ GdipAddPathBeziers
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathAddBeziers($hPath, $aPoints)
	Local $iI, $iCount, $pPoints, $tPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipAddPathBeziers", "hwnd", $hPath, "ptr", $pPoints, "int", $iCount)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathAddBeziers

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathAddClosedCurves
; Description ...: Adds a closed cardinal spline to a path
; Syntax.........: _GDIPlus_PathAddClosedCurves($hPath, $aPoints, $nTension)
; Parameters ....: $hPath	 - Pointer to a GraphicsPath object
;                  $aPoints  - Array of points that define the cardinal spline:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $nTension - Nonnegative real number that controls the length of the curve and how the curve bends. A value of
;                  +0 specifies that the spline is a sequence of straight lines. As the value increases, the curve becomes fuller
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: A cardinal spline is a curve that passes through each point in the array
; Related .......: _GDIPlus_PathAddClosedCurve
; Link ..........; @@MsdnLink@@ GdipAddPathClosedCurve2
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathAddClosedCurves($hPath, $aPoints, $nTension)
	Local $iI, $iCount, $pPoints, $tPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipAddPathClosedCurve2", "hwnd", $hPath, "ptr", $pPoints, "int", $iCount, "float", $nTension)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathAddClosedCurves

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathAddCurves
; Description ...: Adds a cardinal spline to the current figure of a path
; Syntax.........: _GDIPlus_PathAddCurves($hPath, $aPoints, $nTension)
; Parameters ....: $hPath	 - Pointer to a GraphicsPath object
;                  $aPoints  - Array of points that define the cardinal spline:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $nTension - Nonnegative real number that controls the length of the curve and how the curve bends. A value of
;                  +0 specifies that the spline is a sequence of straight lines. As the value increases, the curve becomes fuller
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: A cardinal spline is a curve that passes through each point in the array
; Related .......: _GDIPlus_PathAddCurve, _GDIPlus_PathAddCurvesSubset
; Link ..........; @@MsdnLink@@ GdipAddPathCurve2
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathAddCurves($hPath, $aPoints, $nTension)
	Local $iI, $iCount, $pPoints, $tPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipAddPathCurve2", "hwnd", $hPath, "ptr", $pPoints, "int", $iCount, "float", $nTension)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathAddCurves

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathAddCurvesSubset
; Description ...: Adds a cardinal spline to the current figure of a path
; Syntax.........: _GDIPlus_PathAddCurvesSubset($hPath, $aPoints, $iOffset, $iNumOfSegments, $nTension)
; Parameters ....: $hPath	 	   - Pointer to a GraphicsPath object
;                  $aPoints  	   - Array of points that define the cardinal spline:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  $iOffset	 	   - The index of the array element that is used as the first point of the cardinal spline, this
;                  +is the index of the specific point in the array minus 1
;                  $iNumOfSegments - Number of segments in the cardinal spline. Segments are the curves that connect consecutive
;                  +points in the array
;                  $nTension 	   - Nonnegative real number that controls the length of the curve and how the curve bends.
;                  A value of 0 specifies that the spline is a sequence of straight lines. As the value increases, the curve
;                  +becomes fuller
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The cardinal spline is a curve that passes through a subset
;                  +(specified by the $iOffset and $iNumOfSegments parameters) of the points in the array
; Related .......: _GDIPlus_PathAddCurve, _GDIPlus_PathAddCurve2
; Link ..........; @@MsdnLink@@ GdipAddPathCurve3
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathAddCurvesSubset($hPath, $aPoints, $iOffset, $iNumOfSegments, $nTension)
	Local $iI, $iCount, $pPoints, $tPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipAddPathCurve3", "hwnd", $hPath, "ptr", $pPoints, "int", $iCount, "int", $iOffset, "int", $iNumOfSegments, "float", $nTension)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathAddCurvesSubset

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathAddLines
; Description ...: Adds a sequence of lines to the current figure of a path
; Syntax.........: _GDIPlus_PathAddLines($hPath, $aPoints)
; Parameters ....: $hPath	- Pointer to a GraphicsPath object
;                  $aPoints - Array of points that define the lines:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathAddLine
; Link ..........; @@MsdnLink@@ GdipAddPathLine2
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathAddLines($hPath, $aPoints)
	Local $iI, $iCount, $pPoints, $tPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipAddPathLine2", "hwnd", $hPath, "ptr", $pPoints, "int", $iCount)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathAddLines

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathAddRectangles
; Description ...: Adds a sequence of rectangles to a path
; Syntax.........: _GDIPlus_PathAddRectangles($hPath, $aRects)
; Parameters ....: $hPath  - Pointer to a GraphicsPath object
;                  $aRects - Array of rectangles that specify the rectangles coordinates and dimensions:
;                  |[0][0] - Number of rectangles
;                  |[1][0] - Rectangle 1 X position
;                  |[1][1] - Rectangle 1 Y position
;                  |[1][2] - Rectangle 1 Width
;                  |[1][3] - Rectangle 1 Height
;                  |[n][0] - Rectangle n X position
;                  |[n][1] - Rectangle n Y position
;                  |[n][2] - Rectangle n Width
;                  |[n][3] - Rectangle n Height
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathAddRectangle
; Link ..........; @@MsdnLink@@ GdipDrawRectangles
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathAddRectangles($hPath, $aRects)
	Local $iI, $iCount, $pRects, $tRects, $aResult

	$iCount = $aRects[0][0]
	$tRects = DllStructCreate("float[" & $iCount * 4 & "]")

	$pRects = DllStructGetPtr($tRects)
	For $iI = 1 To $iCount
		DllStructSetData($tRects, 1, $aRects[$iI][0], (($iI - 1) * 4) + 1)
		DllStructSetData($tRects, 1, $aRects[$iI][1], (($iI - 1) * 4) + 2)
		DllStructSetData($tRects, 1, $aRects[$iI][2], (($iI - 1) * 4) + 3)
		DllStructSetData($tRects, 1, $aRects[$iI][3], (($iI - 1) * 4) + 4)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipAddPathRectangles", "hwnd", $hPath, "ptr", $pRects, "int", $iCount)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathAddRectangles

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathClearMarkers
; Description ...: Clears the markers from a path
; Syntax.........: _GDIPlus_PathClearMarkers($hPath)
; Parameters ....: $hPath - Pointer to a GraphicsPath object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathSetMarker
; Link ..........; @@MsdnLink@@ GdipClearPathMarkers
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathClearMarkers($hPath)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipClearPathMarkers", "hwnd", $hPath)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathClearMarkers

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathCloseFigures
; Description ...: Closes all open figures in a path
; Syntax.........: _GDIPlus_PathCloseFigures($hPath)
; Parameters ....: $hPath - Pointer to a GraphicsPath object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathCloseFigure, _GDIPlus_PathStartFigure
; Link ..........; @@MsdnLink@@ GdipClosePathFigure
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathCloseFigures($hPath)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipClosePathFigures", "hwnd", $hPath)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathCloseFigures

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathGetPointsI
; Description ...: Gets an array of points from a path
; Syntax.........: _GDIPlus_PathGetPointsI($hPath)
; Parameters ....: $hPath 	  - Pointer to a GraphicsPath object
; Return values .: Success      - Array of points that define the path data points
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[2][0] - Point 2 X position
;                  |[2][1] - Point 2 Y position
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - _GDIPlus_PathGetPointCount failed, $GDIP_STATUS contains the error code
;                  |    2 - The path does not contain any points
;                  |	3 - _GDIPlus_PathGetPointsI failed, $GDIP_STATUS contains the error code
; Remarks .......: This function returns integer values
; Related .......: _GDIPlus_PathGetPoints
; Link ..........; @@MsdnLink@@ GdipGetPathPointsI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathGetPointsI($hPath)
	Local $iI, $iCount, $pPoints, $tPoints, $aPoints[1][1], $aResult

	$iCount = _GDIPlus_PathGetPointCount($hPath)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tPoints = DllStructCreate("int[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathPointsI", "hwnd", $hPath, "ptr", $pPoints, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aPoints[$iCount + 1][2]
	$aPoints[0][0] = $iCount

	For $iI = 1 To $iCount
		$aPoints[$iI][0] = DllStructGetData($tPoints, 1, (($iI - 1) * 2) + 1)
		$aPoints[$iI][1] = DllStructGetData($tPoints, 1, (($iI - 1) * 2) + 2)
	Next

	Return $aPoints
EndFunc   ;==>_GDIPlus_PathGetPointsI

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathGetTypes
; Description ...: Gets an array of types from a path
; Syntax.........: _GDIPlus_PathGetTypes($hPath)
; Parameters ....: $hPath 	  - Pointer to a GraphicsPath object
; Return values .: Success      - Array of point types that define the path data points types
;                  |[0] - Number of point types
;                  |[1] - Type 1
;                  |[2] - Type 2
;                  |[n] - Type n
;                  +Each point type is one of the following values:
;                  |0x00 - The point is the start of a figure
;                  |0x01 - The point is one of the two endpoints of a line
;                  |0x03 - The point is an endpoint or control point of a cubic bezier spline
;                  |0x20 - The point is a marker
;                  |0x80 - The point is the last point in a closed subpath (figure)
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - _GDIPlus_PathGetPointCount failed, $GDIP_STATUS contains the error code
;                  |    2 - The path does not contain any points
;                  |	3 - _GDIPlus_PathGetPoints failed, $GDIP_STATUS contains the error code
; Remarks .......: This function returns integer values
; Related .......: _GDIPlus_PathGetPoints
; Link ..........; @@MsdnLink@@ GdipGetPathPointsI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathGetTypes($hPath)
	Local $iI, $iCount, $pTypes, $tTypes, $aTypes[1], $aResult

	$iCount = _GDIPlus_PathGetPointCount($hPath)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tTypes = DllStructCreate("ubyte[" & $iCount & "]")
	$pTypes = DllStructGetPtr($tTypes)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathTypes", "hwnd", $hPath, "ptr", $pTypes, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aTypes[$iCount + 1]
	$aTypes[0] = $iCount

	For $iI = 1 To $iCount
		$aTypes[$iI] = DllStructGetData($tTypes, 1, $iI)
	Next

	Return $aTypes
EndFunc   ;==>_GDIPlus_PathGetTypes

#EndRegion GraphicsPath Functions

#Region GraphicsPathIterator Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterCopyData
; Description ...: Gets a subset of the path's data points and types
; Syntax.........: _GDIPlus_PathIterCopyData($hPathIter, $iStartIndex, $iEndIndex)
; Parameters ....: $hPathIter 	- Pointer to a GraphicsPathIterator object
;                  $iStartIndex	- The starting index of the points and types to be copied
;			 	   $iEndIndex	- The ending index of the points and types to be copied
; Return values .: Success      - Array of points and types that specifiesthe path's data points and types:
;                  |[0][0] - Number of points and types
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[1][2] - Point 1 type
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  |[1][2] - Point n type
;                  +Each point type is one of the following values:
;                  |0x00 - The point is the start of a figure
;                  |0x01 - The point is one of the two endpoints of a line
;                  |0x03 - The point is an endpoint or control point of a cubic bezier spline
;                  |0x20 - The point is a marker
;                  |0x80 - The point is the last point in a closed subpath (figure)
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The starting and ending indices do not map to a valid index range or elements
;                  |	2 - The _GDIPlus_PathIterCopyData function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathCreate2, _GDIPlus_PathIterNextMarker
; Link ..........; @@MsdnLink@@ GdipPathIterCopyData
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterCopyData($hPathIter, $iStartIndex, $iEndIndex)
	Local $iI, $iCount, $pPoints, $tPoints, $pTypes, $tTypes, $aPtTypes[1][1], $aResult

	$iCount = $iEndIndex - $iStartIndex + 1
	If $iCount <= 0 Or $iStartIndex < 0 Then
		$GDIP_ERROR = 1
		Return -1
	EndIf

	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	$tTypes = DllStructCreate("ubyte[" & $iCount & "]")
	$pTypes = DllStructGetPtr($tTypes)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterCopyData", "hwnd", $hPathIter, "int*", 0, "ptr", $pPoints, "ptr", $pTypes, "int", $iStartIndex, "int", $iEndIndex)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$iCount = $aResult[2]
	ReDim $aPtTypes[$iCount + 1][3]
	$aPtTypes[0][0] = $iCount

	For $iI = 1 To $iCount
		$aPtTypes[$iI][0] = DllStructGetData($tPoints, 1, (($iI - 1) * 2) + 1)
		$aPtTypes[$iI][1] = DllStructGetData($tPoints, 1, (($iI - 1) * 2) + 2)
		$aPtTypes[$iI][2] = DllStructGetData($tTypes, 1, $iI)
	Next

	Return $aPtTypes
EndFunc   ;==>_GDIPlus_PathIterCopyData

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterEnumerate
; Description ...: Gets the path's data points and types
; Syntax.........: _GDIPlus_PathIterEnumerate($hPathIter)
; Parameters ....: $hPathIter 	- Pointer to a GraphicsPathIterator object
; Return values .: Success      - Array of points and types that specifiesthe path's data points and types:
;                  |[0][0] - Number of points and types
;                  |[1][0] - Point 1 X position
;                  |[1][1] - Point 1 Y position
;                  |[1][2] - Point 1 type
;                  |[n][0] - Point n X position
;                  |[n][1] - Point n Y position
;                  |[1][2] - Point n type
;                  +Each point type is one of the following values:
;                  |0x00 - The point is the start of a figure
;                  |0x01 - The point is one of the two endpoints of a line
;                  |0x03 - The point is an endpoint or control point of a cubic bezier spline
;                  |0x20 - The point is a marker
;                  |0x80 - The point is the last point in a closed subpath (figure)
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_PathIterGetCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The GraphicsPath associated with this GraphicsPathIterator does not contain any points
;                  |	3 - The _GDIPlus_PathIterEnumerate function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathCreate2, _GDIPlus_PathIterCopyData
; Link ..........; @@MsdnLink@@ GdipPathIterEnumerate
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterEnumerate($hPathIter)
	Local $iI, $iCount, $pPoints, $tPoints, $pTypes, $tTypes, $aPtTypes[1][1], $aResult

	$iCount = _GDIPlus_PathIterGetCount($hPathIter)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	$tTypes = DllStructCreate("ubyte[" & $iCount & "]")
	$pTypes = DllStructGetPtr($tTypes)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterEnumerate", "hwnd", $hPathIter, "int*", 0, "ptr", $pPoints, "ptr", $pTypes, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	$iCount = $aResult[2]
	ReDim $aPtTypes[$iCount + 1][3]
	$aPtTypes[0][0] = $iCount

	For $iI = 1 To $iCount
		$aPtTypes[$iI][0] = DllStructGetData($tPoints, 1, (($iI - 1) * 2) + 1)
		$aPtTypes[$iI][1] = DllStructGetData($tPoints, 1, (($iI - 1) * 2) + 2)
		$aPtTypes[$iI][2] = DllStructGetData($tTypes, 1, $iI)
	Next

	Return $aPtTypes
EndFunc   ;==>_GDIPlus_PathIterEnumerate

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterGetCount
; Description ...: Gets the number of data points in the path
; Syntax.........: _GDIPlus_PathIterGetCount($hPathIter)
; Parameters ....: $hPathIter - Pointer to a GraphicsPathIterator object
; Return values .: Success      - Number of data points in the path
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathIterCopyData
; Link ..........; @@MsdnLink@@ GdipPathIterGetCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterGetCount($hPathIter)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterGetCount", "hwnd", $hPathIter, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PathIterGetCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterHasCurve
; Description ...: Determines whether the path has any curves
; Syntax.........: _GDIPlus_PathIterHasCurve($hPathIter)
; Parameters ....: $hPathIter - Pointer to a GraphicsPathIterator object
; Return values .: Success      - True if the path has any curves, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipPathIterHasCurve
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterHasCurve($hPathIter)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterHasCurve", "hwnd", $hPathIter, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2] <> 0
EndFunc   ;==>_GDIPlus_PathIterHasCurve

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterIsValid
; Description ...: Determines whether the specified GraphicsPathIterator object pointed to by the parameter is valid
; Syntax.........: _GDIPlus_PathIterIsValid($hPathIter)
; Parameters ....: $hPathIter - Pointer to a GraphicsPathIterator object
; Return values .: Success      - True if the GraphicsPathIterator object is valid, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipPathIterIsValid
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterIsValid($hPathIter)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterIsValid", "hwnd", $hPathIter, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PathIterIsValid

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterNextMarker
; Description ...: Gets the starting and ending indices of the next marker-delimited section in an iterator's associated path
; Syntax.........: _GDIPlus_PathIterNextMarker($hPathIter)
; Parameters ....: $hPathIter - Pointer to a GraphicsPathIterator object
; Return values .: Success      - Array containing the number of points in the retrieved section and points indices:
;                  |[0] - Number of point in the retrieved section or 0 if no more sections to be retrieved
;                  |[1] - The starting index
;                  |[2] - The ending index
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathIterCopyData, _GDIPlus_PathIterRewind
; Link ..........; @@MsdnLink@@ GdipPathIterNextMarker
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterNextMarker($hPathIter)
	Local $aReturn[3], $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterNextMarker", "hwnd", $hPathIter, "int*", 0, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	$aReturn[0] = $aResult[2]
	$aReturn[1] = $aResult[3]
	$aReturn[2] = $aResult[4]
	Return $aReturn
EndFunc   ;==>_GDIPlus_PathIterNextMarker

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterNextPathType
; Description ...: Gets the starting and ending indices of the next group of data points that all have the same type
; Syntax.........: _GDIPlus_PathIterNextPathType($hPathIter)
; Parameters ....: $hPathIter - Pointer to a GraphicsPathIterator object
; Return values .: Success      - Array containing the number of points in the retrieved section, points indices and type:
;                  |[0] - Number of point in the retrieved section or 0 if no more sections to be retrieved
;                  |[1] - The starting index
;                  |[2] - The ending index
;                  |[3] - Points type which is one of the following values:
;                  |	1 - The points are endpoints of a line
;                  |	3 - The points are endpoints and control points of a cubic bezier spline
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathIterCopyData, _GDIPlus_PathIterRewind
; Link ..........; @@MsdnLink@@ GdipPathIterNextPathType
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterNextPathType($hPathIter)
	Local $aReturn[4], $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterNextPathType", "hwnd", $hPathIter, "int*", 0, "ubyte*", 0, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	$aReturn[0] = $aResult[2]
	$aReturn[1] = $aResult[4]
	$aReturn[2] = $aResult[5]
	$aReturn[3] = $aResult[3]
	Return $aReturn
EndFunc   ;==>_GDIPlus_PathIterNextPathType

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathIterNextSubpath
; Description ...: Gets the starting and ending indices of the next subpath (figure) in an iterator's associated path
; Syntax.........: _GDIPlus_PathIterNextSubpath($hPathIter)
; Parameters ....: $hPathIter - Pointer to a GraphicsPathIterator object
; Return values .: Success      - Array containing the number of points in the retrieved section and points indices:
;                  |[0] - Number of point in the retrieved figure or 0 if no more figures to be retrieved
;                  |[1] - The starting index
;                  |[2] - The ending index
;                  |[3] - If True, the figure is closed, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathIterCopyData, _GDIPlus_PathIterRewind
; Link ..........; @@MsdnLink@@ GdipPathIterNextSubpath
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathIterNextSubpath($hPathIter)
	Local $aReturn[4], $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipPathIterNextSubpath", "hwnd", $hPathIter, "int*", 0, "int*", 0, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	$aReturn[0] = $aResult[2]
	$aReturn[1] = $aResult[3]
	$aReturn[2] = $aResult[4]
	$aReturn[3] = $aResult[5]
	Return $aReturn
EndFunc   ;==>_GDIPlus_PathIterNextSubpath

#EndRegion GraphicsPathIterator Functions

#Region HatchBrush Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_HatchBrushGetBackgroundColor
; Description ...: Gets the background color of a hatch brush
; Syntax.........: _GDIPlus_HatchBrushGetBackgroundColor($hHatchBrush)
; Parameters ....: $hHatchBrush	- Pointer to a HatchBrush object
; Return values .: Success      - ARGB color of the background
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The background color defines the color over which the hatch lines are drawn
; Related .......: _GDIPlus_HatchBrushGetForegroundColor
; Link ..........; @@MsdnLink@@ GdipGetHatchBackgroundColor
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_HatchBrushGetBackgroundColor($hHatchBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetHatchBackgroundColor", "hwnd", $hHatchBrush, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_HatchBrushGetBackgroundColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_HatchBrushGetForegroundColor
; Description ...: Gets the foreground color of a hatch brush
; Syntax.........: _GDIPlus_HatchBrushGetForegroundColor($hHatchBrush)
; Parameters ....: $hHatchBrush	- Pointer to a HatchBrush object
; Return values .: Success      - ARGB color of the foreground
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The foreground color defines the color of the hatch lines
; Related .......: _GDIPlus_HatchBrushGetBackgroundColor
; Link ..........; @@MsdnLink@@ GdipGetHatchForegroundColor
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_HatchBrushGetForegroundColor($hHatchBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetHatchForegroundColor", "hwnd", $hHatchBrush, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_HatchBrushGetForegroundColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_HatchBrushGetStyle
; Description ...: Gets the hatch style of a hatch brush
; Syntax.........: _GDIPlus_HatchBrushGetStyle($hHatchBrush)
; Parameters ....: $hHatchBrush	- Pointer to a HatchBrush object
; Return values .: Success      - Pattern of hatch lines that will be used, see remarks
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The pattern constants are declared in GDIPConstants.au3, those that start with $HatchStyle*
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetHatchStyle
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_HatchBrushGetStyle($hHatchBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetHatchStyle", "hwnd", $hHatchBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_HatchBrushGetStyle

#EndRegion HatchBrush Functions

#Region Image Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageClone
; Description ...: Clones an Image object
; Syntax.........: _GDIPlus_ImageClone($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Pointer to a new cloned Image object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipCloneImage
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageClone($hImage)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCloneImage", "hwnd", $hImage, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageClone

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageForceValidation
; Description ...: Forces validation of an image
; Syntax.........: _GDIPlus_ImageForceValidation($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - True if image is correct, False otherwise
;                  Failure      - -1 and sets @error and @extended if DllCall failed
; Remarks .......: This function forces GDI+ to check for image correctness, usually this will be done by GDI+ when drawing the
;                  +image. Even though the function may return False, if the object exists, it's resources should be released
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipImageForceValidation
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageForceValidation($hImage)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipImageForceValidation", "hwnd", $hImage)

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageForceValidation

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetAllPropertyItems
; Description ...: Gets all the property items (metadata) stored in an Image object
; Syntax.........: _GDIPlus_ImageGetAllPropertyItems($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Array containing the image property items:
;                  |[0][0] - Number of property items
;                  |[1][0] - Property item 1 identifier (see remarks)
;                  |[1][1] - Property item 1 value size, in bytes
;                  |[1][2] - Property item 1 value type
;                  |[1][1] - Property item 1 value pointer
;                  |[1][0] - Property item n identifier
;                  |[1][1] - Property item n value size, in bytes
;                  |[1][2] - Property item n value type
;                  |[1][1] - Property item n value pointer
;                  Possible property value types are:
;                  |1 - The value pointer points to an array of bytes
;                  |2 - The value pointer points to a null terminated character stringASCII string
;                  |3 - The value pointer points to an array of unsigned shorts
;                  |4 - The value pointer points to an array of unsigned integers
;                  |5 - The value pointer points to an array of unsigned two longs (numerator, denomintor)
;                  |7 - The value pointer points to an array of bytes of any type
;                  |9 - The value pointer points to an array of signed integers
;                  |10- The value pointer points to an array of signed two longs (numerator, denomintor)
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_ImageGetPropertySize function failed, $GDIP_STATUS contains the error code
;                  |	2 - The image contains no property items metadata
;                  |	3 - The _GDIPlus_ImageGetAllPropertyItems function failed, $GDIP_STATUS contains the error code
; Remarks .......: The properties item tag identifiers are declared in GDIPConstants.au3, those that start with $GDIP_PROPERTYTAG
;                  +The value size is given in bytes, divide this by the size of the data (4 for integers, 2 for shorts, etc..)
; Related .......: _GDIPlus_ImageGetPropertySize
; Link ..........; @@MsdnLink@@ GdipGetAllPropertyItems
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetAllPropertyItems($hImage)
	Local $iI, $iCount, $tBuffer, $pBuffer, $iBuffer, $tPropertyItem, $aSize, $aPropertyItems[1][1], $aResult

	$aSize = _GDIPlus_ImageGetPropertySize($hImage)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $aSize[1] = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$iBuffer = $aSize[0]
	$tBuffer = DllStructCreate("byte[" & $iBuffer & "]")
	$pBuffer = DllStructGetPtr($tBuffer)
	$iCount = $aSize[1]

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetAllPropertyItems", "hwnd", $hImage, "uint", $iBuffer, "uint", $iCount, "ptr", $pBuffer)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aPropertyItems[$iCount + 1][4]
	$aPropertyItems[0][0] = $iCount

	For $iI = 1 To $iCount
		$tPropertyItem = DllStructCreate($tagGDIPPROPERTYITEM, $pBuffer)
		$aPropertyItems[$iI][0] = DllStructGetData($tPropertyItem, "id")
		$aPropertyItems[$iI][1] = DllStructGetData($tPropertyItem, "length")
		$aPropertyItems[$iI][2] = DllStructGetData($tPropertyItem, "type")
		$aPropertyItems[$iI][3] = DllStructGetData($tPropertyItem, "value")
		$pBuffer += DllStructGetSize($tPropertyItem)
	Next

	Return $aPropertyItems
EndFunc   ;==>_GDIPlus_ImageGetAllPropertyItems

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetBounds
; Description ...: Gets the bounding rectangle for an image
; Syntax.........: _GDIPlus_ImageGetBounds($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Array that contains the rectangle coordinates and dimensions:
;                  |[0] - X coordinate of the upper-left corner of the rectangle
;                  |[1] - Y coordinate of the upper-left corner of the rectangle
;                  |[2] - Width of the rectangle
;                  |[3] - Height of the rectangle
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetImageBounds
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetBounds($hImage)
	Local $tRectF, $pRectF, $iI, $aRectF[4], $aResult

	$tRectF = DllStructCreate($tagGDIPRECTF)
	$pRectF = DllStructGetPtr($tRectF)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetImageBounds", "hwnd", $hImage, "ptr", $pRectF, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To 4
		$aRectF[$iI - 1] = DllStructGetData($tRectF, $iI)
	Next
	Return $aRectF
EndFunc   ;==>_GDIPlus_ImageGetBounds

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetDimension
; Description ...: Gets the width and height of an image
; Syntax.........: _GDIPlus_ImageGetDimension($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Array that contains the rectangle coordinates and dimensions:
;                  |[0] - Width of the image
;                  |[1] - Height of the image
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipGetImageDimension
; Example .......; No
; ===============================================================================================================================
;~ Func _GDIPlus_ImageGetDimension($hImage)
;~ 	Local $aSize[2], $aResult

;~ 	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetImageDimension", "hwnd", $hImage, "float*", 0, "float*", 0)
;~ 	If @error Then Return SetError(@error, @extended, -1)

;~ 	$GDIP_STATUS = $aResult[0]
;~ 	If $GDIP_STATUS Then Return -1

;~ 	$aSize[0] = $aResult[2]
;~ 	$aSize[1] = $aResult[3]
;~ 	Return $aSize
;~ EndFunc   ;==>_GDIPlus_ImageGetDimension

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetFrameCount
; Description ...: Gets the number of frames in a specified dimension of an Image object
; Syntax.........: _GDIPlus_ImageGetFrameCount($hImage, $sDimensionID)
; Parameters ....: $hImage   	 - Pointer to an Image object
;                  $sDimensionID - GUID string of the dimension ID
; Return values .: Success      - The number of frames in the specified dimension of the Image object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: GUID constants are declared in GDIPConstants.au3, those that start with $GDIP_FRAMEDIMENSION_*.
; Related .......: _GDIPlus_ImageGetFrameDimensionsList
; Link ..........; @@MsdnLink@@ GdipImageGetFrameCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetFrameCount($hImage, $sDimensionID)
	Local $tGUID, $pGUID, $aResult

	$tGUID = _WinAPI_GUIDFromString($sDimensionID)
	$pGUID = DllStructGetPtr($tGUID)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipImageGetFrameCount", "hwnd", $hImage, "ptr", $pGUID, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_ImageGetFrameCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetFrameDimensionsCount
; Description ...: Gets the number of frame dimensions in an Image object
; Syntax.........: _GDIPlus_ImageGetFrameDimensionsCount($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - The number of frames dimensions in the Image object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetFrameCount, _GDIPlus_ImageGetFrameDimensionsList
; Link ..........; @@MsdnLink@@ GdipImageGetFrameDimensionsCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetFrameDimensionsCount($hImage)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipImageGetFrameDimensionsCount", "hwnd", $hImage, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageGetFrameDimensionsCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetFrameDimensionsList
; Description ...: Gets the identifiers for the frame dimensions of an Image object
; Syntax.........: _GDIPlus_ImageGetFrameDimensionsList($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Array of GUID strings that define the frame dimensions identifier:
;                  |[0] - Number of GUID strings
;                  |[1] - GUID string 1
;                  |[2] - GUID string 2
;                  |[n] - GUID string n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_ImageGetFrameDimensionsCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The image does not contain any frame dimension identifiers
;                  |	3 - The _GDIPlus_ImageGetFrameDimensionsList function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetFrameCount, _GDIPlus_ImageGetFrameDimensionsCount
; Link ..........; @@MsdnLink@@ GdipImageGetFrameDimensionsList
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetFrameDimensionsList($hImage)
	Local $iI, $iCount, $tBuffer, $pBuffer, $aPropertyIDs[1], $aResult

	$iCount = _GDIPlus_ImageGetFrameDimensionsCount($hImage)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tBuffer = DllStructCreate("byte[" & $iCount * 16 & "]")
	$pBuffer = DllStructGetPtr($tBuffer)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipImageGetFrameDimensionsList", "hwnd", $hImage, "ptr", $pBuffer, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aPropertyIDs[$iCount + 1]
	$aPropertyIDs[0] = $iCount

	For $iI = 1 To $iCount
		$aPropertyIDs[$iI] = _WinAPI_StringFromGUID($pBuffer)
		$pBuffer += 16
	Next
	Return $aPropertyIDs
EndFunc   ;==>_GDIPlus_ImageGetFrameDimensionsList

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPalette
; Description ...: Gets the color palette of an Image object
; Syntax.........: _GDIPlus_ImageGetPalette($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - $tagGDIPCOLORPALETTE structure.
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_ImageGetPaletteSize function failed, $GDIP_STATUS contains the error code
;                  |	2 - The image does not contain a palette
;                  |	3 - The _GDIPlus_ImageGetPalette function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPaletteSize, $tagGDIPCOLORPALETTE
; Link ..........; @@MsdnLink@@ GdipGetImagePalette
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPalette($hImage)
	Local $iCount, $iColorPalette, $tColorPalette, $pColorPalette, $aResult

	$iColorPalette = _GDIPlus_ImageGetPaletteSize($hImage)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iColorPalette = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$iCount = ($iColorPalette - 8) / 4
	$tColorPalette = DllStructCreate("uint Flags;uint Count;uint Entries[" & $iCount & "];")
	$pColorPalette = DllStructGetPtr($tColorPalette)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetImagePalette", "hwnd", $hImage, "ptr", $pColorPalette, "int", $iColorPalette)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $tColorPalette
EndFunc   ;==>_GDIPlus_ImageGetPalette

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPaletteSize
; Description ...: Gets the size, in bytes, of the color palette of an Image object
; Syntax.........: _GDIPlus_ImageGetPaletteSize($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Size, in bytes, of the color palette
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPalette, $tagGDIPCOLORPALETTE
; Link ..........; @@MsdnLink@@ GdipGetImagePaletteSize
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPaletteSize($hImage)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetImagePaletteSize", "hwnd", $hImage, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageGetPaletteSize

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPropertyCount
; Description ...: Gets the number of properties (pieces of metadata) stored in an Image object
; Syntax.........: _GDIPlus_ImageGetPropertyCount($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Number of property items store in the Image object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetAllPropertyItems, _GDIPlus_ImageGetPropertyIdList
; Link ..........; @@MsdnLink@@ GdipGetPropertyCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPropertyCount($hImage)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPropertyCount", "hwnd", $hImage, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageGetPropertyCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPropertyIdList
; Description ...: Gets a list of the property identifiers used in the metadata of an Image object
; Syntax.........: _GDIPlus_ImageGetPropertyIdList($hImage)
; Parameters ....: $hImage - Pointer to an Image object
; Return values .: Success      - Array of property identifiers:
;                  |[0] - Number of property identifiers
;                  |[1] - Property identifier 1
;                  |[2] - Property identifier 2
;                  |[n] - Property identifier n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_ImageGetPropertyCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The image does not contain any property items
;                  |	3 - The _GDIPlus_ImageGetPropertyIdList function failed, $GDIP_STATUS contains the error code
; Remarks .......: The property item identifiers are declared in GDIPConstants.au3, those that start with $GDIP_PROPERTYTAGN*
; Related .......: _GDIPlus_ImageGetAllPropertyItems, _GDIPlus_ImageGetPropertyCount, _GDIPlus_ImageGetPropertyItem
; Link ..........; @@MsdnLink@@ GdipGetPropertyIdList
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPropertyIdList($hImage)
	Local $iI, $iCount, $tProperties, $pProperties, $aProperties[1], $aResult

	$iCount = _GDIPlus_ImageGetPropertyCount($hImage)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tProperties = DllStructCreate("uint[" & $iCount & "]")
	$pProperties = DllStructGetPtr($tProperties)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPropertyIdList", "hwnd", $hImage, "int", $iCount, "ptr", $pProperties)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aProperties[$iCount + 1]
	$aProperties[0] = $iCount

	For $iI = 1 To $iCount
		$aProperties[$iI] = DllStructGetData($tProperties, 1, $iI)
	Next
	Return $aProperties
EndFunc   ;==>_GDIPlus_ImageGetPropertyIdList

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPropertyItem
; Description ...: Gets a specified property item (piece of metadata) from an Image object
; Syntax.........: _GDIPlus_ImageGetPropertyItem($hImage, $iPropID)
; Parameters ....: $hImage  - Pointer to an Image object
;                  $iPropID - Identifier of the property item to be retrieved
; Return values .: Success      - $tagGDIPPROPERTYITEM structure containing the property size, type and value pointer
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_ImageGetPropertyItemSize function failed, $GDIP_STATUS contains the error code
;                  |	2 - The specified property identifier does not exist in the image
;                  |	3 - The _GDIPlus_ImageGetPropertyItem function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPropertyIdList, _GDIPlus_ImageGetPropertyItemSize, $tagGDIPPROPERTYITEM
; Link ..........; @@MsdnLink@@ GdipGetPropertyItem
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPropertyItem($hImage, $iPropID)
	Local $iBuffer, $tBuffer, $pBuffer, $tPropertyItem, $aResult

	$iBuffer = _GDIPlus_ImageGetPropertyItemSize($hImage, $iPropID)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iBuffer = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tBuffer = DllStructCreate("byte[" & $iBuffer & "]")
	$pBuffer = DllStructGetPtr($tBuffer)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPropertyItem", "hwnd", $hImage, "uint", $iPropID, "uint", $iBuffer, "ptr", $pBuffer)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	$tPropertyItem = DllStructCreate($tagGDIPPROPERTYITEM, $pBuffer)
	Return $tPropertyItem
EndFunc   ;==>_GDIPlus_ImageGetPropertyItem

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPropertyItemSize
; Description ...: Gets the size, in bytes, of a specified property item of an Image object
; Syntax.........: _GDIPlus_ImageGetPropertyItemSize($hImage, $iPropID)
; Parameters ....: $hImage  - Pointer to an Image object
;                  $iPropID - Identifier of the property item to be retrieved
; Return values .: Success      - $tagGDIPPROPERTYITEM structure containing the property size, type and value pointer
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPropertyIdList, _GDIPlus_ImageGetPropertyItem
; Link ..........; @@MsdnLink@@ GdipGetPropertyItemSize
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPropertyItemSize($hImage, $iPropID)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPropertyItemSize", "hwnd", $hImage, "uint", $iPropID, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_ImageGetPropertyItemSize

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetPropertySize
; Description ...: Gets the total size, in bytes, and the number of all the property items stored in an Image object
; Syntax.........: _GDIPlus_ImageGetPropertySize($hImage)
; Parameters ....: $hImage  - Pointer to an Image object
; Return values .: Success      - Array containing the total size and the number of property items:
;                  |[0] - Total size, in bytes, of the property items
;                  |[1] - Number of the property items
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPropertyIdList, _GDIPlus_ImageGetPropertyItem
; Link ..........; @@MsdnLink@@ GdipGetPropertyItemSize
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageGetPropertySize($hImage)
	Local $aSize[2], $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPropertySize", "hwnd", $hImage, "uint*", 0, "uint*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	$aSize[0] = $aResult[2]
	$aSize[1] = $aResult[3]
	Return $aSize
EndFunc   ;==>_GDIPlus_ImageGetPropertySize

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageGetThumbnail
; Description ...: Gets a thumbnail image from an Image object
; Syntax.........: _GDIPlus_ImageGetThumbnail($hImage[, $iTNWidth = 32[, $iTNHeight = 32]])
; Parameters ....: $hImage    - Pointer to an Image object
;                  $iTNWidth  - Width, in pixels, of the requested thumbnail image
;                  $iTNHeight - Height, in pixels, of the requested thumbnail image
; Return values .: Success      - Pointer to a new thumbnailed Image object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipGetImageThumbnail
; Example .......; No
; ===============================================================================================================================
;~ Func _GDIPlus_ImageGetThumbnail($hImage, $iTNWidth = 32, $iTNHeight = 32)
;~ 	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetImageThumbnail", "hwnd", $hImage, "uint", $iTNWidth, "uint", $iTNHeight, "int*", 0, "ptr", 0, "ptr", 0)

;~ 	If @error Then Return SetError(@error, @extended, 0)

;~ 	$GDIP_STATUS = $aResult[0]
;~ 	Return $aResult[4]
;~ EndFunc   ;==>_GDIPlus_ImageGetThumbnail

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageLoadFromFileICM
; Description ...: Creates an Image object based on a file. This function uses ICM
; Syntax.........: _GDIPlus_ImageLoadFromFileICM($sFileName)
; Parameters ....: $sFileName - Fully qualified image file name
; Return values .: Success      - Pointer to a new Image object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipLoadImageFromFileICM
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageLoadFromFileICM($sFileName)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipLoadImageFromFileICM", "wstr", $sFileName, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageLoadFromFileICM

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageLoadFromStreamICM
; Description ...: Creates an Image object based on a stream. This function uses ICM
; Syntax.........: _GDIPlus_ImageLoadFromStreamICM($pStream)
; Parameters ....: $pStream - Pointer to an IStream interface
; Return values .: Success      - Pointer to a new Image object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipLoadImageFromStreamICM
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageLoadFromStreamICM($pStream)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipLoadImageFromStreamICM", "ptr", $pStream, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageLoadFromStreamICM

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageRemovePropertyItem
; Description ...: Removes a property item (piece of metadata) from an Image object
; Syntax.........: _GDIPlus_ImageRemovePropertyItem($hImage, $iPropID)
; Parameters ....: $hImage  - Pointer to an Image object
;                  $iPropID - Identifier of the property item to be removed
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPropertyIdList
; Link ..........; @@MsdnLink@@ GdipRemovePropertyItem
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageRemovePropertyItem($hImage, $iPropID)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRemovePropertyItem", "hwnd", $hImage, "uint", $iPropID)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageRemovePropertyItem

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageSaveAdd
; Description ...: Adds a frame to a file or stream
; Syntax.........: _GDIPlus_ImageSaveAdd($hImage, $pParams)
; Parameters ....: $hImage  - Pointer to an Image object
;                  $pParams - Pointer to a $tagGDIPPENCODERPARAMS structure
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Use this Function to save selected frames from a multiple-frame image to another multiple-frame image
; Related .......: _GDIPlus_ImageSaveToFile, _GDIPlus_ImageSaveToStream, _GDIPlus_ImageSelectActiveFrame, $tagGDIPPENCODERPARAMS
; Link ..........; @@MsdnLink@@ GdipSaveAdd
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageSaveAdd($hImage, $pParams)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSaveAdd", "hwnd", $hImage, "ptr", $pParams)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageSaveAdd

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageSaveAddImage
; Description ...: Adds a frame to a file or stream
; Syntax.........: _GDIPlus_ImageSaveAddImage($hImage, $hImageNew, $pParams)
; Parameters ....: $hImage    - Pointer to an Image object
;                  $hImageNew - Pointer to an Image object that holds the frame to be added
;                  $pParams   - Pointer to a $tagGDIPPENCODERPARAMS structure
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageSaveToFile, _GDIPlus_ImageSaveToStream, _GDIPlus_ImageSelectActiveFrame, $tagGDIPPENCODERPARAMS
; Link ..........; @@MsdnLink@@ GdipSaveAddImage
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageSaveAddImage($hImage, $hImageNew, $pParams)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSaveAddImage", "hwnd", $hImage, "hwnd", $hImageNew, "ptr", $pParams)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageSaveAddImage

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageSelectActiveFrame
; Description ...: Selects a frame in an Image object specified by a dimension and an index
; Syntax.........: _GDIPlus_ImageSelectActiveFrame($hImage, $sDimensionID, $iFrameIndex)
; Parameters ....: $hImage     	  - Pointer to an Image object
;                  $sDimensionID  - GUID string specifies the frame dimension (see remarks):
;                  |$GDIP_FRAMEDIMENSION_TIME - GIF image
;                  |$GDIP_FRAMEDIMENSION_PAGE - TIFF image
;                  $iFrameIndex   - Zero-based index of the frame within the specified frame dimension
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Among all the image formats currently supported by GDI+, the only formats that support multiple-frame images
;                  +are GIF and TIFF
; Related .......: _GDIPlus_ImageLoadFromFile, _GDIPlus_ImageLoadFromStream, _GDIPlus_ImageSaveAdd, _GDIPlus_ImageSaveAddImage
; Link ..........; @@MsdnLink@@ GdipImageSelectActiveFrame
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageSelectActiveFrame($hImage, $sDimensionID, $iFrameIndex)
	Local $pGUID, $tGUID, $aResult

	$tGUID = DllStructCreate($tagGUID)
	$pGUID = DllStructGetPtr($tGUID)
	_WinAPI_GUIDFromStringEx($sDimensionID, $pGUID)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipImageSelectActiveFrame", "hwnd", $hImage, "ptr", $pGUID, "uint", $iFrameIndex)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageSelectActiveFrame

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageSetPalette
; Description ...: Sets the color palette of an Image object
; Syntax.........: _GDIPlus_ImageSetPalette($hImage, $pColorPalette)
; Parameters ....: $hImage     	  - Pointer to an Image object
;                  $pColorPalette - Pointer to a $tagGDIPCOLORPALETTE structure that specifies the palette
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_ImageGetPalette, $tagGDIPCOLORPALETTE
; Link ..........; @@MsdnLink@@ GdipSetImagePalette
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageSetPalette($hImage, $pColorPalette)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImagePalette", "hwnd", $hImage, "ptr", $pColorPalette)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageSetPalette

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageSetPropertyItem
; Description ...: Sets the color palette of an Image object
; Syntax.........: _GDIPlus_ImageSetPropertyItem($hImage, $pPropertyItem)
; Parameters ....: $hImage     	  - Pointer to an Image object
;                  $pPropertyItem - Pointer to a $tagGDIPPROPERTYITEM structure that specifies the property item to be set
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: If the item already exists, then its contents are updated; otherwise, a new item is added
; Related .......: _GDIPlus_ImageGetPropertyItem, $tagGDIPPROPERTYITEM
; Link ..........; @@MsdnLink@@ GdipSetPropertyItem
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageSetPropertyItem($hImage, $pPropertyItem)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPropertyItem", "hwnd", $hImage, "ptr", $pPropertyItem)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageSetPropertyItem

#EndRegion Image Functions

#Region ImageAttributes Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesClone
; Description ...: Clones an ImageAttributes object
; Syntax.........: _GDIPlus_ImageAttributesClone($hImageAttributes)
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object to be cloned
; Return values .: Success      - Pointer to a new cloned ImageAttribute object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageAttributesDispose to release the object resources
; Related .......: _GDIPlus_ImageAttributesDispose
; Link ..........; @@MsdnLink@@ GdipCloneImageAttributes
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesClone($hImageAttributes)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCloneImageAttributes", "hwnd", $hImageAttributes, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_ImageAttributesClone

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesGetAdjustedPalette
; Description ...: Adjusts the colors in a palette according to the adjustment settings of a specified category
; Syntax.........: _GDIPlus_ImageAttributesGetAdjustedPalette($hImageAttributes, $pColorPalette[, $iColorAdjustType = 0])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $pColorPalette	 - Pointer to a $tagGDIPCOLORPALETTE structure that on input, contains the palette to be
;                  +adjusted and, on output, receives the adjusted palette
;                  $iColorAdjustType - The category whose adjustment settings will be applied to the palette:
;                  |0 - Color or grayscale adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color or grayscale adjustment applies to bitmapped images
;                  |2 - Color or grayscale adjustment applies to brush operations in metafiles
;                  |3 - Color or grayscale adjustment applies to pen operations in metafiles
;                  |4 - Color or grayscale adjustment applies to text drawn in metafiles
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: $tagGDIPCOLORPALETTE
; Link ..........; @@MsdnLink@@ GdipGetImageAttributesAdjustedPalette
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesGetAdjustedPalette($hImageAttributes, $pColorPalette, $iColorAdjustType = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetImageAttributesAdjustedPalette", "hwnd", $hImageAttributes, "ptr", $pColorPalette, "int", $iColorAdjustType)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesGetAdjustedPalette

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesReset
; Description ...: Clears all color- and grayscale-adjustment settings for a specified category
; Syntax.........: _GDIPlus_ImageAttributesReset($hImageAttributes[, $iColorAdjustType = 0])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which color adjustment is reset:
;                  |0 - Color or grayscale adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color or grayscale adjustment applies to bitmapped images
;                  |2 - Color or grayscale adjustment applies to brush operations in metafiles
;                  |3 - Color or grayscale adjustment applies to pen operations in metafiles
;                  |4 - Color or grayscale adjustment applies to text drawn in metafiles
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipResetImageAttributes
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesReset($hImageAttributes, $iColorAdjustType = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipResetImageAttributes", "hwnd", $hImageAttributes, "int", $iColorAdjustType)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesReset

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetGamma
; Description ...: Sets or clears the gamma value for a specified category
; Syntax.........: _GDIPlus_ImageAttributesSetGamma($hImageAttributes[, $iColorAdjustType = 0[, $fEnable = False[, $nGamma = 0]]])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which the gamma value is set or cleared:
;                  |0 - Gamma adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Gamma adjustment applies to bitmapped images
;                  |2 - Gamma adjustment applies to brush operations in metafiles
;                  |3 - Gamma adjustment applies to pen operations in metafiles
;                  |4 - Gamma adjustment applies to text drawn in metafiles
;                  $fEnable		     - If True, gamma correction for the specified category is applied, otherwise cleared
;                  $nGamma		     - Real number that specifies the gamma value
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Gamma correction controls the overall brightness of an image, typical range is from 1.0  to  2.2;  however,
;                  +values from 0.1 to 5.0 could prove useful under some circumstances
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesGamma
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetGamma($hImageAttributes, $iColorAdjustType = 0, $fEnable = False, $nGamma = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesGamma", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable, "float", $nGamma)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetGamma

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetNoOp
; Description ...: Turns on or off color adjustment for a specified category
; Syntax.........: _GDIPlus_ImageAttributesSetNoOp($hImageAttributes[, $iColorAdjustType = 0[, $fEnable = True]])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which color correction is turned on or off:
;                  |0 - Color adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color adjustment applies to bitmapped images
;                  |2 - Color adjustment applies to brush operations in metafiles
;                  |3 - Color adjustment applies to pen operations in metafiles
;                  |4 - Color adjustment applies to text drawn in metafiles
;                  $fEnable			 - If True, color adjustment for the specified category is turned off; otherwise, color
;                  +adjustment for the specified category is turned on
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesNoOp
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetNoOp($hImageAttributes, $iColorAdjustType = 0, $fEnable = True)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesNoOp", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetNoOp

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetOutputChannel
; Description ...: Sets or clears the CMYK (Cyan, Magenta, Yellow and Black) output channel for a specified category
; Syntax.........: _GDIPlus_ImageAttributesSetOutputChannel($hImageAttributes[, $iColorAdjustType = 0[, $fEnable = False[, $iColorChannelFlags = 4]]])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which the output channel is set or cleared:
;                  |0 - Color adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color adjustment applies to bitmapped images
;                  |2 - Color adjustment applies to brush operations in metafiles
;                  |3 - Color adjustment applies to pen operations in metafiles
;                  |4 - Color adjustment applies to text drawn in metafiles
;                  $fEnable			 - If True, output channel for the specified category is set; otherwise, output channel for
;                  +the specified category is cleared
;                  $iColorChannelFlags - The output channel, can be any combination:
;                  |0 - Cyan color channel
;                  |1 - Magenta color channel
;                  |2 - Yellow color channel
;                  |3 - Black color channel
;                  |4 - The previous selected channel
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesOutputChannel
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetOutputChannel($hImageAttributes, $iColorAdjustType = 0, $fEnable = False, $iColorChannelFlags = 4)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesOutputChannel", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable, "int", $iColorChannelFlags)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetOutputChannel

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetOutputChannelColorProfile
; Description ...: Sets or clears the output channel color-profile file for a specified category
; Syntax.........: _GDIPlus_ImageAttributesSetOutputChannelColorProfile($hImageAttributes[, $iColorAdjustType = 0[, $fEnable = False[, $sFileName = 0]]])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which the output channel color-profile file is set or cleared:
;                  |0 - Color or grayscale adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color or grayscale adjustment applies to bitmapped images
;                  |2 - Color or grayscale adjustment applies to brush operations in metafiles
;                  |3 - Color or grayscale adjustment applies to pen operations in metafiles
;                  |4 - Color or grayscale adjustment applies to text drawn in metafiles
;                  $fEnable			 - If True, output channel for the specified category is set; otherwise, output channel for
;                  +the specified category is cleared
;                  $sFileName		 - Fully qualified color-profile file name (see remarks)
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: If the color-profile file is in the %SystemRoot%\System32\Spool\Drivers\Color directory, then file name
;                  +parameter can be the file name. Otherwise, it must contain the fully-qualified path name
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesOutputChannelColorProfile
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetOutputChannelColorProfile($hImageAttributes, $iColorAdjustType = 0, $fEnable = False, $sFileName = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesOutputChannelColorProfile", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable, "wstr", $sFileName)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetOutputChannelColorProfile

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetRemapTable
; Description ...: Sets or clears the color-remap table for a specified category
; Syntax.........: _GDIPlus_ImageAttributesSetRemapTable($hImageAttributes[, $iColorAdjustType = 0[, $fEnable = False[, $aColorMap = 0]]])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which the output channel color-profile file is set or cleared:
;                  |0 - Color adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color adjustment applies to bitmapped images
;                  |2 - Color adjustment applies to brush operations in metafiles
;                  |3 - Color adjustment applies to pen operations in metafiles
;                  |4 - Color adjustment applies to text drawn in metafiles
;                  $fEnable			 - If True, color-remap table for the specified category is set; otherwise, color-remap table
;                  +for the specified category is cleared
;                  $aColorMap		 - Array of old and new colors:
;                  |[0][0] - Number of old and new colors
;                  |[1][0] - Old color 1
;                  |[1][1] - New color 1
;                  |[2][0] - Old color 2
;                  |[2][1] - New color 2
;                  |[n][0] - Old color n
;                  |[n][2] - New color n
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: During rendering, any color that matches ane of the old colors in the remap table is changed to the
;                  +corresponding new color
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesRemapTable
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetRemapTable($hImageAttributes, $iColorAdjustType = 0, $fEnable = False, $aColorMap = 0)
	Local $iI, $iCount, $tColorMap, $pColorMap, $aResult

	If IsArray($aColorMap) Then
		$iCount = $aColorMap[0][0]
		$tColorMap = DllStructCreate("uint[" & $iCount * 2 & "]")
		$pColorMap = DllStructGetPtr($tColorMap)

		For $iI = 1 To $iCount
			DllStructSetData($tColorMap, 1, $aColorMap[$iI][0], ($iI - 1) * 2 + 1)
			DllStructSetData($tColorMap, 1, $aColorMap[$iI][1], ($iI - 1) * 2 + 2)
		Next

		$aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesRemapTable", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable, "int", $iCount, "ptr", $pColorMap)
	Else
		$aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesRemapTable", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable, "int", 0, "ptr", 0)
	EndIf

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetRemapTable

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetThreshold
; Description ...: Sets or clears the threshold (transparency range) for a specified category
; Syntax.........: _GDIPlus_ImageAttributesSetThreshold($hImageAttributes[, $iColorAdjustType = 0[, $fEnable = False[, $nThershold = 0]]])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which the color threshold is set or cleared:
;                  |0 - Color adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color adjustment applies to bitmapped images
;                  |2 - Color adjustment applies to brush operations in metafiles
;                  |3 - Color adjustment applies to pen operations in metafiles
;                  |4 - Color adjustment applies to text drawn in metafiles
;                  $fEnable			 - If True, color threshold for the specified category is set; otherwise, color threshold
;                  +for the specified category is cleared
;                  $nThershold		 - Number that specifies the threshold value (see remarks)
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The threshold is a value from 0 through 1 that specifies a cutoff point for each color component. For example,
;                  +suppose the threshold is set to 0.7, and suppose you are rendering a color whose red, green, and blue
;                  +components are 230, 50, and 220. The red component, 230, is greater than 0.7ª255, so the red component will
;                  be changed to 255 (full intensity). The green component, 50, is less than 0.7ª255, so the green component will
;                  +be changed to 0. The blue component, 220, is greater than 0.7ª255, so the blue component will be changed to
;                  +255
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesThreshold
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetThreshold($hImageAttributes, $iColorAdjustType = 0, $fEnable = False, $nThershold = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesThreshold", "hwnd", $hImageAttributes, "int", $iColorAdjustType, "int", $fEnable, "float", $nThershold)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetThreshold

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetToIdentity
; Description ...: Sets the color-adjustment matrix of a specified category to identity matrix
; Syntax.........: _GDIPlus_ImageAttributesSetToIdentity($hImageAttributes[, $iColorAdjustType = 0])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iColorAdjustType - The category for which the color-adjustment matrix is set to identity:
;                  |0 - Color or grayscale adjustment applies to all categories that do not have adjustment settings of their own
;                  |1 - Color or grayscale adjustment applies to bitmapped images
;                  |2 - Color or grayscale adjustment applies to brush operations in metafiles
;                  |3 - Color or grayscale adjustment applies to pen operations in metafiles
;                  |4 - Color or grayscale adjustment applies to text drawn in metafiles
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesToIdentity
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetToIdentity($hImageAttributes, $iColorAdjustType = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesToIdentity", "hwnd", $hImageAttributes, "int", $iColorAdjustType)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetToIdentity

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_ImageAttributesSetWrapMode
; Description ...: Sets the wrap mode of an ImageAttributes object
; Syntax.........: _GDIPlus_ImageAttributesSetWrapMode($hImageAttributes, $iWrapMode[, $iARGB = 0xFF000000])
; Parameters ....: $hImageAttributes - Pointer to an ImageAttribute object
;                  $iWrapMode 		 - Specifies how repeated copies of an image are used to tile an area:
;                  |0 - Tiling without flipping
;                  |1 - Tiles are flipped horizontally as you move from one tile to the next in a row
;                  |2 - Tiles are flipped vertically as you move from one tile to the next in a column
;                  |3 - Tiles are flipped horizontally as you move along a row and flipped vertically as you move along a column
;                  |4 - No tiling takes place
;                  $iARGB			 - Alpha, Red, Green and Blue components of the color of pixels outside of a rendered image.
;                  +This color is visible if the wrap mode is set to 4 and the source rectangle of the image is greater than the
;                  +image itself
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipSetImageAttributesWrapMode
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_ImageAttributesSetWrapMode($hImageAttributes, $iWrapMode, $iARGB = 0xFF000000)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetImageAttributesWrapMode", "hwnd", $hImageAttributes, "int", $iWrapMode, "uint", $iARGB, "int", 0)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_ImageAttributesSetWrapMode

#EndRegion ImageAttributes Functions

#Region LinearGradientBrush Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetBlend
; Description ...: Gets the blend factors and their corresponding blend positions from a LinearGradientBrush object
; Syntax.........: _GDIPlus_LineBrushGetBlend($hLineGradientBrush)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
; Return values .: Success      - Array of blend factors and blend positions:
;                  |[0][0] - Number of blend factors and blend positions
;                  |[1][0] - Factor 1
;                  |[1][1] - Position 1
;                  |[2][0] - Factor 2
;                  |[2][1] - Position 2
;                  |[n][0] - Factor n
;                  |[n][1] - Position n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_LineBrushGetBlendCount function failed, $GDIP_STATUS contains the error code
; 				   |	2 - The LineGradientBrush object does not contain any blend points or factors
;                  |	3 - The _GDIPlus_LineBrushGetBlend function failed, $GDIP_STATUS contains the error code
; Remarks .......: Each factor in the array specifies a percentage of the ending color and should be in the range 0.0 to 1.0.
;                  Each position in the array indicates a percentage of the distance between the starting boundary and the ending
;                  +boundary and is in the range 0.0 to 1.0, where 0.0 indicates the starting boundary of the gradient and 1.0
;                  +indicates the ending boundary
; Related .......: _GDIPlus_LineBrushGetBlendCount, _GDIPlus_LineBrushSetBlend
; Link ..........; @@MsdnLink@@ GdipGetLineBlend
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetBlend($hLineGradientBrush)
	Local $iI, $iCount, $pFactors, $tFactors, $pPositions, $tPositions, $aBlends[1][1], $aResult

	$iCount = _GDIPlus_LineBrushGetBlendCount($hLineGradientBrush)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tFactors = DllStructCreate("float[" & $iCount & "]")
	$pFactors = DllStructGetPtr($tFactors)
	$tPositions = DllStructCreate("float[" & $iCount & "]")
	$pPositions = DllStructGetPtr($tPositions)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLineBlend", "hwnd", $hLineGradientBrush, "ptr", $pFactors, "ptr", $pPositions, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aBlends[$iCount + 1][2]
	$aBlends[0][0] = $iCount

	For $iI = 1 To $iCount
		$aBlends[$iI][0] = DllStructGetData($tFactors, 1, $iI)
		$aBlends[$iI][1] = DllStructGetData($tPositions, 1, $iI)
	Next

	Return $aBlends
EndFunc   ;==>_GDIPlus_LineBrushGetBlend

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetBlendCount
; Description ...: Gets the number of blend factors currently set for a LinearGradientBrush object
; Syntax.........: _GDIPlus_LineBrushGetBlendCount($hLineGradientBrush)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
; Return values .: Success      - Number of blend factors currently set for the LinearGradientBrush object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushGetBlend
; Link ..........; @@MsdnLink@@ GdipGetLineBlendCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetBlendCount($hLineGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLineBlendCount", "hwnd", $hLineGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_LineBrushGetBlendCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetGammaCorrection
; Description ...: Determines whether gamma correction is enabled for a LinearGradientBrush object
; Syntax.........: _GDIPlus_LineBrushGetGammaCorrection($hLineGradientBrush)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
; Return values .: Success      - True if gamma correction is enabled, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushSetGammaCorrection
; Link ..........; @@MsdnLink@@ GdipGetLineGammaCorrection
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetGammaCorrection($hLineGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLineGammaCorrection", "hwnd", $hLineGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_LineBrushGetGammaCorrection

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetPresetBlend
; Description ...: Gets the colors currently set to be interpolated for a linear gradient brush and their blend positions
; Syntax.........: _GDIPlus_LineBrushGetPresetBlend($hLineGradientBrush)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
; Return values .: Success      - Array of preset colors and blend positions:
;                  |[0][0] - Number of preset colors and blend positions
;                  |[1][0] - Color 1
;                  |[1][1] - Position 1
;                  |[2][0] - Color 2
;                  |[2][1] - Position 2
;                  |[n][0] - Color n
;                  |[n][1] - Position n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_LineBrushGetPresetBlendCount function failed, $GDIP_STATUS contains the error code
; 				   |	2 - The LineGradientBrush object does not contain any interpolated colors
;                  |	3 - The _GDIPlus_LineBrushGetPresetBlend function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushGetPresetBlendCount, _GDIPlus_LineBrushSetPresetBlend
; Link ..........; @@MsdnLink@@ GdipGetLinePresetBlend
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetPresetBlend($hLineGradientBrush)
	Local $iI, $iCount, $pColors, $tColors, $pPositions, $tPositions, $aInterpolations[1][1], $aResult

	$iCount = _GDIPlus_LineBrushGetPresetBlendCount($hLineGradientBrush)
	If @error Then Return SetError(@error, @extended, 0)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tColors = DllStructCreate("uint[" & $iCount & "]")
	$pColors = DllStructGetPtr($tColors)
	$tPositions = DllStructCreate("float[" & $iCount & "]")
	$pPositions = DllStructGetPtr($tPositions)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLinePresetBlend", "hwnd", $hLineGradientBrush, "ptr", $pColors, "ptr", $pPositions, "int", $iCount)
	If @error Then Return SetError(@error, @extended, 0)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aInterpolations[$iCount + 1][2]
	$aInterpolations[0][0] = $iCount

	For $iI = 1 To $iCount
		$aInterpolations[$iI][0] = DllStructGetData($tColors, 1, $iI)
		$aInterpolations[$iI][1] = DllStructGetData($tPositions, 1, $iI)
	Next

	Return $aInterpolations
EndFunc   ;==>_GDIPlus_LineBrushGetPresetBlend

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetPresetBlendCount
; Description ...: Gets the number of colors currently set to be interpolated for a linear gradient brush
; Syntax.........: _GDIPlus_LineBrushGetPresetBlendCount($hLineGradientBrush)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
; Return values .: Success      - Number of colors currently set to be interpolated for the LinearGradientBrush object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushGetPresetBlend
; Link ..........; @@MsdnLink@@ GdipGetLinePresetBlendCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetPresetBlendCount($hLineGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLinePresetBlendCount", "hwnd", $hLineGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_LineBrushGetPresetBlendCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetTransform
; Description ...: Gets the transformation matrix of a linear gradient brush
; Syntax.........: _GDIPlus_LineBrushGetTransform($hLineGradientBrush, $hMatrix)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
;                  $hMatrix			   - Pointer to a Matrix object that receives the transformation matrix
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushSetTransform
; Link ..........; @@MsdnLink@@ GdipGetLineTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetTransform($hLineGradientBrush, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLineTransform", "hwnd", $hLineGradientBrush, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_LineBrushGetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushGetWrapMode
; Description ...: Gets the wrap mode of a linear gradient brush
; Syntax.........: _GDIPlus_LineBrushGetWrapMode($hLineGradientBrush)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
; Return values .: Success      - Wrap mode that specifies how an area is tiled when it is painted with a brush:
;                  |0 - Tiling without flipping
;                  |1 - Tiles are flipped horizontally as you move from one tile to the next in a row
;                  |2 - Tiles are flipped vertically as you move from one tile to the next in a column
;                  |3 - Tiles are flipped horizontally as you move along a row and flipped vertically as you move along a column
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushSetWrapMode
; Link ..........; @@MsdnLink@@ GdipGetLineWrapMode
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushGetWrapMode($hLineGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetLineWrapMode", "hwnd", $hLineGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_LineBrushGetWrapMode

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushRotateTransform
; Description ...: Updates a brush's current transformation matrix with the product of itself and a rotation matrix
; Syntax.........: _GDIPlus_LineBrushRotateTransform($hLineGradientBrush, $nAngle[, $iOrder = 0])
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
;                  $nAngle			   - Real number that specifies the angle of rotation in degrees
;                  $iOrder			   - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRotateLineTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushRotateTransform($hLineGradientBrush, $nAngle, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRotateLineTransform", "hwnd", $hLineGradientBrush, "float", $nAngle, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_LineBrushRotateTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushScaleTransform
; Description ...: Updates a brush's current transformation matrix with the product of itself and a scaling matrix
; Syntax.........: _GDIPlus_LineBrushScaleTransform($hLineGradientBrush, $nScaleX, $nScaleY[, $iOrder = 0])
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
;                  $nScaleX			   - Real number that specifies the amount to scale in the X direction
;                  $nScaleY 		   - Real number that specifies the amount to scale in the Y direction
;                  $iOrder			   - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipScaleLineTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushScaleTransform($hLineGradientBrush, $nScaleX, $nScaleY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipScaleLineTransform", "hwnd", $hLineGradientBrush, "float", $nScaleX, "float", $nScaleY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_LineBrushScaleTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushSetWrapMode
; Description ...: Sets the wrap mode of a linear gradient brush
; Syntax.........: _GDIPlus_LineBrushSetWrapMode($hLineGradientBrush, $iWrapMode)
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
;                  $iWrapMode		   - Wrap mode that specifies how an area is tiled when it is painted with a brush:
;                  |0 - Tiling without flipping
;                  |1 - Tiles are flipped horizontally as you move from one tile to the next in a row
;                  |2 - Tiles are flipped vertically as you move from one tile to the next in a column
;                  |3 - Tiles are flipped horizontally as you move along a row and flipped vertically as you move along a column
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_LineBrushGetWrapMode
; Link ..........; @@MsdnLink@@ GdipSetLineWrapMode
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushSetWrapMode($hLineGradientBrush, $iWrapMode)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetLineWrapMode", "hwnd", $hLineGradientBrush, "int", $iWrapMode)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_LineBrushSetWrapMode

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_LineBrushTranslateTransform
; Description ...: Updates a brush's current transformation matrix with the product of itself and a translation matrix
; Syntax.........: _GDIPlus_LineBrushTranslateTransform($hLineGradientBrush, $nDX, $nDY[, $iOrder = 0])
; Parameters ....: $hLineGradientBrush - Pointer to a LinearGradientBrush object
;                  $nDX			   	   - Real number that specifies the horizontal component of the translation
;                  $nDY 		   	   - Real number that specifies the vertical component of the translation
;                  $iOrder			   - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipTranslateLineTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_LineBrushTranslateTransform($hLineGradientBrush, $nDX, $nDY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipTranslateLineTransform", "hwnd", $hLineGradientBrush, "float", $nDX, "float", $nDY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_LineBrushTranslateTransform

#EndRegion LinearGradientBrush Functions

#Region Matrix Functions
; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixCreate2
; Description ...: Creates and initializes a Matrix object based on six numbers that define an affine transformation
; Syntax.........: _GDIPlus_MatrixCreate2($nM11, $nM12, $nM21, $nM22, $nDX, $nDY)
; Parameters ....: $nM11 - Real number that specifies the element in the first row, first column
;                  $nM12 - Real number that specifies the element in the first row, second column
;                  $nM21 - Real number that specifies the element in the second row, first column
;                  $nM22 - Real number that specifies the element in the second row, second column
;                  $nDX  - Real number that specifies the element in the third row, first column
;                  $nDY  - Real number that specifies the element in the third row, second column
; Return values .: Success      - Returns a handle to a new Matrix object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_MatrixDispose to release the object resources
; Related .......: _GDIPlus_MatrixDispose
; Link ..........; @@MsdnLink@@ GdipCreateMatrix2
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixCreate2($nM11, $nM12, $nM21, $nM22, $nDX, $nDY)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMatrix2", "float", $nM11, "float", $nM12, "float", $nM21, "float", $nM22, "float", $nDX, "float", $nDY, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[7]
EndFunc   ;==>_GDIPlus_MatrixCreate2

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixCreate3
; Description ...: Creates and initializes a Matrix object based on a rectangle and a point
; Syntax.........: _GDIPlus_MatrixCreate3($tRectF, $nDX, $nDY)
; Parameters ....: $tRectF - $tagGDIPRECTF that specifies the matrix elements rows and columns (see remarks)
;                  $nDX    - Real number that specifies the element in the third row, first column
;                  $nDY    - Real number that specifies the element in the third row, second column
; Return values .: Success      - Returns a handle to a new Matrix object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The X data member of the rectangle specifies the matrix element in row 1, column 1.
;                  The Y data member of the rectangle specifies the matrix element in row 1, column 2.
;                  The Width data member of the rectangle specifies the matrix element in row 2, column 1.
;                  The Height data member of the rectangle specifies the matrix element in row 2, column 2
;                  After you are done with the object, call _GDIPlus_MatrixDispose to release the object resources
; Related .......: _GDIPlus_MatrixDispose
; Link ..........; @@MsdnLink@@ GdipCreateMatrix3
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixCreate3($tRectF, $nDX, $nDY)
	Local $pRectF, $tPointF, $pPointF, $aResult

	$pRectF = DllStructGetPtr($tRectF)
	$tPointF = DllStructCreate("float;float")
	$pPointF = DllStructGetPtr($tPointF)
	DllStructSetData($tPointF, 1, $nDX)
	DllStructSetData($tPointF, 2, $nDY)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateMatrix3", "ptr", $pRectF, "ptr", $pPointF, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_MatrixCreate3

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixIsEqual
; Description ...: Determines whether the elements of a matrix are equal to the elements of another matrix
; Syntax.........: _GDIPlus_MatrixIsEqual($hMatrix1, $hMatrix2)
; Parameters ....: $hMatrix1 - Pointer to a Matrix object
;                  $hMatrix2 - Pointer to a Matrix object
; Return values .: Success      - True if the matrices are equal, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipIsMatrixEqual
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixIsEqual($hMatrix1, $hMatrix2)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsMatrixEqual", "hwnd", $hMatrix1, "hwnd", $hMatrix2, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[3] <> 0
EndFunc   ;==>_GDIPlus_MatrixIsEqual

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixIsIdentity
; Description ...: Determines whether a matrix is the identity matrix
; Syntax.........: _GDIPlus_MatrixIsIdentity($hMatrix)
; Parameters ....: $hMatrix - Pointer to a Matrix object
; Return values .: Success      - True if the matrix is the identity matrix, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The identity matrix represents a transformation with no scaling, translation, rotation and conversion, and
;                  +represents a transformation that does nothing
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipIsMatrixIdentity
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixIsIdentity($hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsMatrixIdentity", "hwnd", $hMatrix, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2] <> 0
EndFunc   ;==>_GDIPlus_MatrixIsIdentity

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixIsInvertible
; Description ...: Determines whether a matrix is invertible
; Syntax.........: _GDIPlus_MatrixIsInvertible($hMatrix)
; Parameters ....: $hMatrix - Pointer to a Matrix object
; Return values .: Success      - True if the matrix is the invertible, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_MatrixInvert
; Link ..........; @@MsdnLink@@ GdipIsMatrixInvertible
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixIsInvertible($hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsMatrixInvertible", "hwnd", $hMatrix, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2] <> 0
EndFunc   ;==>_GDIPlus_MatrixIsInvertible

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixTransformPointsI
; Description ...: Multiplies each point in an array by a matrix
; Syntax.........: _GDIPlus_MatrixTransformPointsI($hMatrix, $aPoints)
; Parameters ....: $hMatrix - Pointer to a Matrix object
;                  $aPoints - Array of points to be transformed:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X coordinate
;                  |[1][1] - Point 1 Y coordinate
;                  |[2][0] - Point 2 X coordinate
;                  |[2][1] - Point 2 Y coordinate
;                  |[n][0] - Point n X coordinate
;                  |[n][1] - Point n Y coordinate
; Return values .: Success      - Array containing the transformed points:
;                  |[0][0] - Number of points
;                  |[1][0] - Transformed point 1 X coordinate
;                  |[1][1] - Transformed point 1 Y coordinate
;                  |[2][0] - Transformed point 2 X coordinate
;                  |[2][1] - Transformed point 2 Y coordinate
;                  |[n][0] - Transformed point n X coordinate
;                  |[n][1] - Transformed point n Y coordinate
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Each point in the array is treated as a row matrix. The multiplication is performed with the row matrix on the
;                  +left and the matrix on the right. This function returns integer values only
; Related .......: _GDIPlus_MatrixTransformPoints
; Link ..........; @@MsdnLink@@ GdipTransformMatrixPointsI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixTransformPointsI($hMatrix, $aPoints)
	Local $iI, $iCount, $tPoints, $pPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("int[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)

	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], ($iI - 1) * 2 + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], ($iI - 1) * 2 + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipTransformMatrixPointsI", "hwnd", $hMatrix, "ptr", $pPoints, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To $iCount
		$aPoints[$iI][0] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 1)
		$aPoints[$iI][1] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 2)
	Next

	Return $aPoints
EndFunc   ;==>_GDIPlus_MatrixTransformPointsI

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixVectorTransformPoints
; Description ...: Multiplies each vector in an array by a matrix
; Syntax.........: _GDIPlus_MatrixVectorTransformPoints($hMatrix, $aPoints)
; Parameters ....: $hMatrix - Pointer to a Matrix object
;                  $aPoints - Array of vectors (points) to be transformed:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X coordinate
;                  |[1][1] - Point 1 Y coordinate
;                  |[2][0] - Point 2 X coordinate
;                  |[2][1] - Point 2 Y coordinate
;                  |[n][0] - Point n X coordinate
;                  |[n][1] - Point n Y coordinate
; Return values .: Success      - Array containing the transformed vectors (points):
;                  |[0][0] - Number of points
;                  |[1][0] - Transformed point 1 X coordinate
;                  |[1][1] - Transformed point 1 Y coordinate
;                  |[2][0] - Transformed point 2 X coordinate
;                  |[2][1] - Transformed point 2 Y coordinate
;                  |[n][0] - Transformed point n X coordinate
;                  |[n][1] - Transformed point n Y coordinate
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Each vector in the array is transformed (multiplied by the matrix) and updated with the result of the
;                  +transformation. The translation component (the last row of the matrix) is ignored
; Related .......: _GDIPlus_MatrixVectorTransformPointsI
; Link ..........; @@MsdnLink@@ GdipVectorTransformMatrixPoints
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixVectorTransformPoints($hMatrix, $aPoints)
	Local $iI, $iCount, $tPoints, $pPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)

	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], ($iI - 1) * 2 + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], ($iI - 1) * 2 + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipVectorTransformMatrixPoints", "hwnd", $hMatrix, "ptr", $pPoints, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To $iCount
		$aPoints[$iI][0] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 1)
		$aPoints[$iI][1] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 2)
	Next

	Return $aPoints
EndFunc   ;==>_GDIPlus_MatrixVectorTransformPoints

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_MatrixVectorTransformPointsI
; Description ...: Multiplies each vector in an array by a matrix
; Syntax.........: _GDIPlus_MatrixVectorTransformPointsI($hMatrix, $aPoints)
; Parameters ....: $hMatrix - Pointer to a Matrix object
;                  $aPoints - Array of vectors (points) to be transformed:
;                  |[0][0] - Number of points
;                  |[1][0] - Point 1 X coordinate
;                  |[1][1] - Point 1 Y coordinate
;                  |[2][0] - Point 2 X coordinate
;                  |[2][1] - Point 2 Y coordinate
;                  |[n][0] - Point n X coordinate
;                  |[n][1] - Point n Y coordinate
; Return values .: Success      - Array containing the transformed vectors (points):
;                  |[0][0] - Number of points
;                  |[1][0] - Transformed point 1 X coordinate
;                  |[1][1] - Transformed point 1 Y coordinate
;                  |[2][0] - Transformed point 2 X coordinate
;                  |[2][1] - Transformed point 2 Y coordinate
;                  |[n][0] - Transformed point n X coordinate
;                  |[n][1] - Transformed point n Y coordinate
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: Each vector in the array is transformed (multiplied by the matrix) and updated with the result of the
;                  +transformation. The translation component (the last row of the matrix) is ignored. This function returns
;                  +integer values only
; Related .......: _GDIPlus_MatrixVectorTransformPoints
; Link ..........; @@MsdnLink@@ GdipVectorTransformMatrixPointsI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_MatrixVectorTransformPointsI($hMatrix, $aPoints)
	Local $iI, $iCount, $tPoints, $pPoints, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("int[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)

	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], ($iI - 1) * 2 + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], ($iI - 1) * 2 + 2)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipVectorTransformMatrixPointsI", "hwnd", $hMatrix, "ptr", $pPoints, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To $iCount
		$aPoints[$iI][0] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 1)
		$aPoints[$iI][1] = DllStructGetData($tPoints, 1, ($iI - 1) * 2 + 2)
	Next

	Return $aPoints
EndFunc   ;==>_GDIPlus_MatrixVectorTransformPointsI

#EndRegion Matrix Functions

#Region PathGradientBrush Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetBlend
; Description ...: Gets the blend factors and the corresponding blend positions currently set for a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetBlend($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Array of blend factors and blend positions:
;                  |[0][0] - Number of blend factors and blend positions
;                  |[1][0] - Factor 1
;                  |[1][1] - Position 1
;                  |[2][0] - Factor 2
;                  |[2][1] - Position 2
;                  |[n][0] - Factor n
;                  |[n][1] - Position n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_PathBrushGetBlendCount function failed, $GDIP_STATUS contains the error code
; 				   |	2 - The PathGradientBrush object does not contain any blend points or factors
;                  |	3 - The _GDIPlus_PathBrushGetBlend function failed, $GDIP_STATUS contains the error code
; Remarks .......: Each factor in the array specifies a percentage of the ending color and should be in the range 0.0 to 1.0.
;                  Each position in the array indicates a percentage of the distance between the starting boundary and the ending
;                  +boundary and is in the range 0.0 to 1.0, where 0.0 indicates the starting boundary of the gradient and 1.0
;                  +indicates the ending boundary
; Related .......: _GDIPlus_PathBrushGetBlendCount, _GDIPlus_PathBrushSetBlend
; Link ..........; @@MsdnLink@@ GdipGetPathGradientBlend
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetBlend($hPathGradientBrush)
	Local $iI, $iCount, $pFactors, $tFactors, $pPositions, $tPositions, $aBlends[1][1], $aResult

	$iCount = _GDIPlus_PathBrushGetBlendCount($hPathGradientBrush)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tFactors = DllStructCreate("float[" & $iCount & "]")
	$pFactors = DllStructGetPtr($tFactors)
	$tPositions = DllStructCreate("float[" & $iCount & "]")
	$pPositions = DllStructGetPtr($tPositions)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientBlend", "hwnd", $hPathGradientBrush, "ptr", $pFactors, "ptr", $pPositions, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aBlends[$iCount + 1][2]
	$aBlends[0][0] = $iCount

	For $iI = 1 To $iCount
		$aBlends[$iI][0] = DllStructGetData($tFactors, 1, $iI)
		$aBlends[$iI][1] = DllStructGetData($tPositions, 1, $iI)
	Next

	Return $aBlends
EndFunc   ;==>_GDIPlus_PathBrushGetBlend

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetBlendCount
; Description ...: Gets the number of blend factors currently set for a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetBlendCount($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Number of blend factors currently set for the PathGradientBrush object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushGetBlend
; Link ..........; @@MsdnLink@@ GdipGetPathGradientBlendCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetBlendCount($hPathGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientBlendCount", "hwnd", $hPathGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PathBrushGetBlendCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetCenterColor
; Description ...: Gets the color of the center point of a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetCenterColor($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Alpha, Red, Green and Blue components of the center color
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushSetCenterColor
; Link ..........; @@MsdnLink@@ GdipGetPathGradientCenterColor
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetCenterColor($hPathGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientCenterColor", "hwnd", $hPathGradientBrush, "uint*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PathBrushGetCenterColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetCenterPointI
; Description ...: Gets the center point of a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetCenterPointI($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Array containing the point coordinates:
;                  |[0] - Center point X coordinate
;                  |[1] - Center point Y coordinate
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: This functions returns integer values only
; Related .......: _GDIPlus_PathBrushGetCenterPoint, _GDIPlus_PathBrushSetCenterPoint
; Link ..........; @@MsdnLink@@ GdipGetPathGradientCenterPointI
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetCenterPointI($hPathGradientBrush)
	Local $tPoint, $pPoint, $aPoint[2], $aResult

	$tPoint = DllStructCreate("int;int")
	$pPoint = DllStructGetPtr($tPoint)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientCenterPointI", "hwnd", $hPathGradientBrush, "ptr", $pPoint)
	If @error Then Return SetError(@error, @extended, 0)

	$aPoint[0] = DllStructGetData($tPoint, 1)
	$aPoint[1] = DllStructGetData($tPoint, 2)
	Return SetError($aResult[0], 0, $aPoint)
EndFunc   ;==>_GDIPlus_PathBrushGetCenterPointI

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetGammaCorrection
; Description ...: Determines whether gamma correction is enabled for a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetGammaCorrection($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush 	- Pointer to a PathGradientBrush object
; Return values .: Success      - True if gamma correction is enabled, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: By default, gamma correction is disabled during creation of a PathGradientBrush object.
;                  Gamma correction is often done to match the intensity contrast of the gradient to the ability of the human eye
;                  +to perceive intensity changes
; Related .......: _GDIPlus_PathBrushSetGammaCorrection
; Link ..........; @@MsdnLink@@ GdipGetPathGradientGammaCorrection
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetGammaCorrection($hPathGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientGammaCorrection", "hwnd", $hPathGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2] <> 0
EndFunc   ;==>_GDIPlus_PathBrushGetGammaCorrection

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetPresetBlend
; Description ...: Gets the preset colors and blend positions currently specified for a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetPresetBlend($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Array of preset colors and blend positions:
;                  |[0][0] - Number of preset colors and blend positions
;                  |[1][0] - Color 1
;                  |[1][1] - Position 1
;                  |[2][0] - Color 2
;                  |[2][1] - Position 2
;                  |[n][0] - Color n
;                  |[n][1] - Position n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_PathBrushGetPresetBlendCount function failed, $GDIP_STATUS contains the error code
; 				   |	2 - The PathGradientBrush object does not contain any interpolated colors
;                  |	3 - The _GDIPlus_PathBrushGetPresetBlend function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushGetPresetBlendCount, _GDIPlus_PathBrushSetPresetBlend
; Link ..........; @@MsdnLink@@ GdipGetPathGradientPresetBlend
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetPresetBlend($hPathGradientBrush)
	Local $iI, $iCount, $pColors, $tColors, $pPositions, $tPositions, $aInterpolations[1][1], $aResult

	$iCount = _GDIPlus_PathBrushGetPresetBlendCount($hPathGradientBrush)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tColors = DllStructCreate("uint[" & $iCount & "]")
	$pColors = DllStructGetPtr($tColors)
	$tPositions = DllStructCreate("float[" & $iCount & "]")
	$pPositions = DllStructGetPtr($tPositions)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientPresetBlend", "hwnd", $hPathGradientBrush, "ptr", $pColors, "ptr", $pPositions, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aInterpolations[$iCount + 1][2]
	$aInterpolations[0][0] = $iCount

	For $iI = 1 To $iCount
		$aInterpolations[$iI][0] = DllStructGetData($tColors, 1, $iI)
		$aInterpolations[$iI][1] = DllStructGetData($tPositions, 1, $iI)
	Next

	Return $aInterpolations
EndFunc   ;==>_GDIPlus_PathBrushGetPresetBlend

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetPresetBlendCount
; Description ...: Gets the number of preset colors currently specified for a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetPresetBlendCount($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Number of preset colors currently specified for the PathGradientBrush object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushGetPresetBlend
; Link ..........; @@MsdnLink@@ GdipGetPathGradientPresetBlendCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetPresetBlendCount($hPathGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientPresetBlendCount", "hwnd", $hPathGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PathBrushGetPresetBlendCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetSurroundColorCount
; Description ...: Gets the number of colors that have been specified for the boundary path of a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetSurroundColorCount($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Number of colors that have been specified for the boundary path of the PathGradientBrush object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushGetSurroundColorsWithCount
; Link ..........; @@MsdnLink@@ GdipGetPathGradientSurroundColorCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetSurroundColorCount($hPathGradientBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientSurroundColorCount", "hwnd", $hPathGradientBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PathBrushGetSurroundColorCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetSurroundColorsWithCount
; Description ...: Gets the surround colors currently specified for a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetSurroundColorsWithCount($hPathGradientBrush)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
; Return values .: Success      - Array containing the surrounding colors:
;                  |[0] - Number of colors
;                  |[1] - Color 1
;                  |[2] - Color 2
;                  |[n] - Color n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_PathBrushGetSurroundColorCount function failed, $GDIP_STATUS contains the error code
; 				   |	2 - The PathGradientBrush object does not contain any surrounding colors
;                  |	3 - _GDIPlus_PathBrushGetSurroundColorsWithCount failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushGetSurroundColorCount, _GDIPlus_PathBrushSetSurroundColorsWithCount
; Link ..........; @@MsdnLink@@ GdipGetPathGradientSurroundColorsWithCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetSurroundColorsWithCount($hPathGradientBrush)
	Local $iI, $iCount, $tColors, $pColors, $aColors[1], $aResult

	$iCount = _GDIPlus_PathBrushGetSurroundColorCount($hPathGradientBrush)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount = 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tColors = DllStructCreate("uint[" & $iCount & "]")
	$pColors = DllStructGetPtr($tColors)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientSurroundColorsWithCount", "hwnd", $hPathGradientBrush, "ptr", $pColors, "int*", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	$iCount = $aResult[3]

	ReDim $aColors[$iCount + 1]
	$aColors[0] = $iCount

	For $iI = 1 To $iCount
		$aColors[$iI] = DllStructGetData($tColors, 1, $iI)
	Next

	Return $aColors
EndFunc   ;==>_GDIPlus_PathBrushGetSurroundColorsWithCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushGetTransform
; Description ...: Gets the transformation matrix of a path gradient brush
; Syntax.........: _GDIPlus_PathBrushGetTransform($hPathGradientBrush, $hMatrix)
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
;                  $hMatrix			   - Pointer to a Matrix object that receives the transformation matrix
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PathBrushSetTransform
; Link ..........; @@MsdnLink@@ GdipGetPathGradientTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushGetTransform($hPathGradientBrush, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPathGradientTransform", "hwnd", $hPathGradientBrush, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathBrushGetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushRotateTransform
; Description ...: Updates a brush's current transformation matrix with the product of itself and a rotation matrix
; Syntax.........: _GDIPlus_PathBrushRotateTransform($hPathGradientBrush, $nAngle[, $iOrder = 0])
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
;                  $nAngle			   - Real number that specifies the angle of rotation in degrees
;                  $iOrder			   - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRotatePathGradientTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushRotateTransform($hPathGradientBrush, $nAngle, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRotatePathGradientTransform", "hwnd", $hPathGradientBrush, "float", $nAngle, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathBrushRotateTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushScaleTransform
; Description ...: Updates a brush's current transformation matrix with the product of itself and a scaling matrix
; Syntax.........: _GDIPlus_PathBrushScaleTransform($hPathGradientBrush, $nScaleX, $nScaleY[, $iOrder = 0])
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
;                  $nScaleX			   - Real number that specifies the amount to scale in the X direction
;                  $nScaleY 		   - Real number that specifies the amount to scale in the Y direction
;                  $iOrder			   - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipScalePathGradientTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushScaleTransform($hPathGradientBrush, $nScaleX, $nScaleY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipScalePathGradientTransform", "hwnd", $hPathGradientBrush, "float", $nScaleX, "float", $nScaleY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathBrushScaleTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PathBrushTranslateTransform
; Description ...: Updates a brush's current transformation matrix with the product of itself and a translation matrix
; Syntax.........: _GDIPlus_PathBrushTranslateTransform($hPathGradientBrush, $nDX, $nDY[, $iOrder = 0])
; Parameters ....: $hPathGradientBrush - Pointer to a PathGradientBrush object
;                  $nDX			   	   - Real number that specifies the horizontal component of the translation
;                  $nDY 		   	   - Real number that specifies the vertical component of the translation
;                  $iOrder			   - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipTranslatePathGradientTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PathBrushTranslateTransform($hPathGradientBrush, $nDX, $nDY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipTranslatePathGradientTransform", "hwnd", $hPathGradientBrush, "float", $nDX, "float", $nDY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PathBrushTranslateTransform

#EndRegion PathGradientBrush Functions

#Region Pen Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenClone
; Description ...: Clones a Pen object
; Syntax.........: _GDIPlus_PenClone($hPen)
; Parameters ....: $hPen - Pointer to a Pen object to be cloned
; Return values .: Success      - Pointer to a new cloned Pen object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_PenDispose to release the object resources
; Related .......: _GDIPlus_PenDispose
; Link ..........; @@MsdnLink@@ GdipClonePen
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenClone($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipClonePen", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenClone

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetBrushFill
; Description ...: Gets the Brush object that is currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetBrushFill($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Pointer to a new Brush object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_BrushDispose to release the object resources
; Related .......: _GDIPlus_BrushDispose, _GDIPlus_PenSetBrushFill
; Link ..........; @@MsdnLink@@ GdipGetPenBrushFill
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetBrushFill($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenBrushFill", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetBrushFill

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetCompoundArray
; Description ...: Gets the compound array currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetCompoundArray($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Array of compound values:
;                  |[0] - Number of compound values
;                  |[1] - Compound value 1
;                  |[2] - Compound value 2
;                  |[n] - Compound value n
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_PenGetCompoundCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The Pen object does not contain a compound array
;                  |	3 - The _GDIPlus_PenGetCompoundArray function failed, $GDIP_STATUS contains the error code
; Remarks .......: Compound values are in the range 0.0 to 1.0
; Related .......: _GDIPlus_PenGetCompoundCount, _GDIPlus_PenSetCompoundArray
; Link ..........; @@MsdnLink@@ GdipGetPenCompoundArray
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetCompoundArray($hPen)
	Local $iI, $iCount, $pCompounds, $tCompounds, $aCompounds[1], $aResult

	$iCount = _GDIPlus_PenGetCompoundCount($hPen)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount <= 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tCompounds = DllStructCreate("float[" & $iCount & "]")
	$pCompounds = DllStructGetPtr($tCompounds)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenCompoundArray", "hwnd", $hPen, "ptr", $pCompounds, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aCompounds[$iCount + 1]
	$aCompounds[0] = $iCount

	For $iI = 1 To $iCount
		$aCompounds[$iI] = DllStructGetData($tCompounds, 1, $iI)
	Next

	Return $aCompounds
EndFunc   ;==>_GDIPlus_PenGetCompoundArray

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetCompoundCount
; Description ...: Gets the number of elements in a Pen's compound array
; Syntax.........: _GDIPlus_PenGetCompoundCount($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Number of elements in the Pen's compound array
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetCompoundArray
; Link ..........; @@MsdnLink@@ GdipGetPenCompoundCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetCompoundCount($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenCompoundCount", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetCompoundCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetCustomStartCap
; Description ...: Gets the custom start cap for the pen
; Syntax.........: _GDIPlus_PenGetCustomStartCap($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Pointer to a CustomLineCap object that receives the start cap of a Pen object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetCustomEndCap, _GDIPlus_PenSetCustomStartCap
; Link ..........; @@MsdnLink@@ GdipGetPenCustomStartCap
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetCustomStartCap($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenCustomStartCap", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetCustomStartCap

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetDashArray
; Description ...: Gets an array of custom dashes and spaces currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetDashArray($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Array containing the length of the dashes and spaces in a custom dashed line:
;                  |[0] - Number of elements in the dashes  and spaces array
;                  |[1] - Dash 1 length
;                  |[2] - Space 1 length
;                  |[3] - Dash 2 length
;                  |[4] - Space 2 length
;                  +and so forth
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_PenGetDashCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The Pen object does not contain a dashes array
;                  |	3 - The _GDIPlus_PenGetDashArray function failed, $GDIP_STATUS contains the error code
; Remarks .......: The length of each dash and space in the dash pattern is the product of each element in the array and the
;                  +width of the Pen object
; Related .......: _GDIPlus_PenGetDashCount, _GDIPlus_PenSetDashArray
; Link ..........; @@MsdnLink@@ GdipGetPenDashArray
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetDashArray($hPen)
	Local $iI, $iCount, $pDashes, $tDashes, $aDashes[1], $aResult

	$iCount = _GDIPlus_PenGetDashCount($hPen)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount <= 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tDashes = DllStructCreate("float[" & $iCount & "]")
	$pDashes = DllStructGetPtr($tDashes)

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenDashArray", "hwnd", $hPen, "ptr", $pDashes, "int", $iCount)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aDashes[$iCount + 1]
	$aDashes[0] = $iCount

	For $iI = 1 To $iCount
		$aDashes[$iI] = DllStructGetData($tDashes, 1, $iI)
	Next

	Return $aDashes
EndFunc   ;==>_GDIPlus_PenGetDashArray

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetDashCount
; Description ...: Gets the number of elements in a Pen object's dash pattern array
; Syntax.........: _GDIPlus_PenGetDashCount($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Number of elements in the pen's dash pattern array
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetDashArray
; Link ..........; @@MsdnLink@@ GdipGetPenDashCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetDashCount($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenDashCount", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetDashCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetDashOffset
; Description ...: Gets the distance from the start of the line to the start of the first space in a dashed line
; Syntax.........: _GDIPlus_PenGetDashOffset($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Number that indicates the distance from the start of the line to the start of the dashes
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenSetDashOffset
; Link ..........; @@MsdnLink@@ GdipGetPenDashOffset
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetDashOffset($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenDashOffset", "hwnd", $hPen, "float*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetDashOffset

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetFillType
; Description ...: Gets the type of brush fill currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetFillType($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Pen type:
;                  |0  - The pen draws with a solid color
;                  |1  - The pen draws with a hatch pattern that is specified by a HatchBrush object
;                  |2  - The pen draws with a texture that is specified by a TextureBrush object
;                  |3  - The pen draws with a color gradient that is specified by a PathGradientBrush object
;                  |4  - The pen draws with a color gradient that is specified by a LinearGradientBrush object
;                  |-1 - The pen type is unknown
;                  Failure      - -2 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenSetBrushFill
; Link ..........; @@MsdnLink@@ GdipGetPenFillType
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetFillType($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenFillType", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, -2)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -2
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetFillType

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetLineJoin
; Description ...: Gets the line join style currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetLineJoin($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Line join style:
;                  |0 - Line join produces a sharp corner or a clipped corner
;                  |1 - Line join produces a diagonal corner.
;                  |2 - Line join produces a smooth, circular arc between the lines.
;                  |3 - Line join produces a sharp corner or a clipped corner
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenSetLineJoin
; Link ..........; @@MsdnLink@@ GdipGetPenLineJoin
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetLineJoin($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenLineJoin", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetLineJoin

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetStartCap
; Description ...: Gets the start cap currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetStartCap($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Line cap style:
;                  |0x00 - Line ends at the last point. The end is squared off
;                  |0x01 - Square cap. The center of the square is the last point in the line. The height
;                  +and width of the square are the line width.
;                  |0x02 - Circular cap. The center of the circle is the last point in the line. The diameter
;                  +of the circle is the line width.
;                  |0x03 - Triangular cap. The base of the triangle is the last point in the line. The base
;                  +of the triangle is the line width.
;                  |0x10 - Line ends are not anchored.
;                  |0x11 - Line ends are anchored with a square. The center of the square is the last point in
;                  +the line. The height and width of the square are the line width.
;                  |0x12 - Line ends are anchored with a circle. The center of the circle is at the last point
;                  +in the line. The circle is wider than the line.
;                  |0x13 - Line ends are anchored with a diamond (a square turned at 45 degrees). The center of the diamond is at
;                  +the last point in the line. The diamond is wider than the line.
;                  |0x14 - Line ends are anchored with arrowheads. The arrowhead point is located at the last
;                  +point in the line. The arrowhead is wider than the line.
;                  |0xff - Line ends are made from a CustomLineCap object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenSetStartCap
; Link ..........; @@MsdnLink@@ GdipGetPenStartCap
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetStartCap($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenStartCap", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetStartCap

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetTransform
; Description ...: Gets the world transformation matrix currently set for a Pen object
; Syntax.........: _GDIPlus_PenGetTransform($hPen, $hMatrix)
; Parameters ....: $hPen 	- Pointer to a Pen object
;                  $hMatrix	- Pointer to a Matrix object that receives the transformation matrix
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenSetTransform
; Link ..........; @@MsdnLink@@ GdipGetPenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetTransform($hPen, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenTransform", "hwnd", $hPen, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenGetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenGetUnit
; Description ...: Gets the unit of measurement for a Pen object
; Syntax.........: _GDIPlus_PenGetUnit($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - Unit of measurement for the pen:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenSetUnit
; Link ..........; @@MsdnLink@@ GdipGetPenUnit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenGetUnit($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetPenUnit", "hwnd", $hPen, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_PenGetUnit

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenMultiplyTransform
; Description ...: Updates the world transformation matrix of a Pen object with the product of itself and another matrix
; Syntax.........: _GDIPlus_PenMultiplyTransform($hPen, $hMatrix[, $iOrder = 0])
; Parameters ....: $hPen 	- Pointer to a Pen object
;                  $hMatrix	- Pointer to a matrix to be multiplied by the pen's current transformation matrix
;                  $iOrder	- Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipMultiplyPenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenMultiplyTransform($hPen, $hMatrix, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipMultiplyPenTransform", "hwnd", $hPen, "hwnd", $hMatrix, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenMultiplyTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenResetTransform
; Description ...: Resets the world transformation matrix of a Pen object to the identity matrix
; Syntax.........: _GDIPlus_PenResetTransform($hPen)
; Parameters ....: $hPen - Pointer to a Pen object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The identity matrix represents a transformation that does nothing
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipResetPenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenResetTransform($hPen)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipResetPenTransform", "hwnd", $hPen)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenResetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenRotateTransform
; Description ...: Updates the world transformation matrix of a Pen object with the product of itself and a rotation matrix
; Syntax.........: _GDIPlus_PenRotateTransform($hPen, $nAngle[, $iOrder = 0])
; Parameters ....: $hPen   - Pointer to a Pen object
;                  $nAngle - Real number that specifies the angle of rotation in degrees
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRotatePenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenRotateTransform($hPen, $nAngle, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRotatePenTransform", "hwnd", $hPen, "float", $nAngle, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenRotateTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenScaleTransform
; Description ...: Updates the world transformation matrix of a Pen object with the product of itself and a scaling matrix
; Syntax.........: _GDIPlus_PenScaleTransform($hPen, $nScaleX, $nScaleY[, $iOrder = 0])
; Parameters ....: $hPen 	- Pointer to a Pen object
;                  $nScaleX	- Real number that specifies the amount to scale in the X direction
;                  $nScaleY - Real number that specifies the amount to scale in the Y direction
;                  $iOrder	- Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipScalePenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenScaleTransform($hPen, $nScaleX, $nScaleY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipScalePenTransform", "hwnd", $hPen, "float", $nScaleX, "float", $nScaleY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenScaleTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetBrushFill
; Description ...: Sets the Brush object that a pen uses to fill a line
; Syntax.........: _GDIPlus_PenSetBrushFill($hPen, $hBrush)
; Parameters ....: $hPen   - Pointer to a Pen object
;                  $hBrush - Pointer to a Brush object for the pen to use to fill a line
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetBrushFill
; Link ..........; @@MsdnLink@@ GdipSetPenBrushFill
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetBrushFill($hPen, $hBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenBrushFill", "hwnd", $hPen, "hwnd", $hBrush)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetBrushFill

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetCompoundArray
; Description ...: Sets the compound array currently set for a Pen object
; Syntax.........: _GDIPlus_PenSetCompoundArray($hPen, $aCompounds)
; Parameters ....: $hPen 	   - Pointer to a Pen object
;                  $aCompounds - Array of compound values:
;                  |[0] - Number of compound values
;                  |[1] - Compound value 1
;                  |[2] - Compound value 2
;                  |[n] - Compound value n
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The elements in the array must be in increasing order, not less than 0, and not greater than 1
;                  Suppose you want a pen to draw two parallel lines where the width of the first line is 20 percent of the pen's
;                  +width, the width of the space that separates the two lines is 50 percent of the pen' s width, and the width
;                  +of the second line is 30 percent of the pen's width. Start by creating a Pen object and an array of compound
;                  +values. You can then set the compound array by passing the array with the values 0.0, 0.2, 0.7, and 1.0 to
;                  +the _GDIPlus_PenSetCompoundArray function.
; Related .......: _GDIPlus_PenGetCompoundArray
; Link ..........; @@MsdnLink@@ GdipSetPenCompoundArray
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetCompoundArray($hPen, $aCompounds)
	Local $iI, $iCount, $pCompounds, $tCompounds, $aResult

	$iCount = $aCompounds[0]
	$tCompounds = DllStructCreate("float[" & $iCount & "]")
	$pCompounds = DllStructGetPtr($tCompounds)

	For $iI = 1 To $iCount
		DllStructSetData($tCompounds, 1, $aCompounds[$iI], $iI)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenCompoundArray", "hwnd", $hPen, "ptr", $pCompounds, "int", $iCount)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetCompoundArray

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetCustomStartCap
; Description ...: Sets the custom start cap for a Pen object
; Syntax.........: _GDIPlus_PenSetCustomStartCap($hPen, $hCustomLineCap)
; Parameters ....: $hPen 		   - Pointer to a Pen object
;                  $hCustomLineCap - Pointer to a CustomLineCap object that specifies the custom start cap for the pen
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetCustomStartCap, _GDIPlus_PenSetCustomEndCap
; Link ..........; @@MsdnLink@@ GdipSetPenCustomStartCap
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetCustomStartCap($hPen, $hCustomLineCap)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenCustomStartCap", "hwnd", $hPen, "hwnd", $hCustomLineCap)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetCustomStartCap

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetDashArray
; Description ...: Gets an array of custom dashes and spaces currently set for a Pen object
; Syntax.........: _GDIPlus_PenSetDashArray($hPen, $aDashes)
; Parameters ....: $hPen 	- Pointer to a Pen object
;                  $aDashes	- Array that specifies the length of the custom dashes and spaces:
;                  |[0] - Number of elements in the dashes and spaces array
;                  |[1] - Dash 1 length
;                  |[2] - Space 1 length
;                  |[3] - Dash 2 length
;                  |[4] - Space 2 length
;                  +and so forth
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: This function will set the dash style for the Pen object to DashStyleCustom (6)
; Related .......: _GDIPlus_PenGetDashArray
; Link ..........; @@MsdnLink@@ GdipSetPenDashArray
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetDashArray($hPen, $aDashes)
	Local $iI, $iCount, $tDashes, $pDashes, $aResult

	$iCount = $aDashes[0]
	$tDashes = DllStructCreate("float[" & $iCount & "]")
	$pDashes = DllStructGetPtr($tDashes)

	For $iI = 1 To $iCount
		DllStructSetData($tDashes, 1, $aDashes[$iI], $iI)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenDashArray", "hwnd", $hPen, "ptr", $pDashes, "int", $iCount)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetDashArray

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetDashOffset
; Description ...: Sets the distance from the start of the line to the start of the first space in a dashed line
; Syntax.........: _GDIPlus_PenSetDashOffset($hPen, $nOffset)
; Parameters ....: $hPen 	- Pointer to a Pen object
;                  $nOffset	- Real number that specifies the number of times to shift the spaces in a dashed line. Each shift is
;                  +equal to the length of a space in the dashed line
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetDashOffset
; Link ..........; @@MsdnLink@@ GdipSetPenDashOffset
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetDashOffset($hPen, $nOffset)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenDashOffset", "hwnd", $hPen, "float", $nOffset)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetDashOffset

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetTransform
; Description ...: Sets the world transformation of a Pen object
; Syntax.........: _GDIPlus_PenSetTransform($hPen, $hMatrix)
; Parameters ....: $hPen 	- Pointer to a Pen object
;                  $hMatrix	- Pointer to a Matrix object that specifies the world transformation
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetTransform
; Link ..........; @@MsdnLink@@ GdipSetPenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetTransform($hPen, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenTransform", "hwnd", $hPen, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenSetUnit
; Description ...: Sets the unit of measurement for a Pen object
; Syntax.........: _GDIPlus_PenSetUnit($hPen, $iUnit)
; Parameters ....: $hPen  - Pointer to a Pen object
;                  $iUnit - New unit of measurement for the pen:
;                  |0 - World coordinates, a nonphysical unit
;                  |1 - Display units
;                  |2 - A unit is 1 pixel
;                  |3 - A unit is 1 point or 1/72 inch
;                  |4 - A unit is 1 inch
;                  |5 - A unit is 1/300 inch
;                  |6 - A unit is 1 millimeter
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_PenGetUnit
; Link ..........; @@MsdnLink@@ GdipSetPenUnit
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenSetUnit($hPen, $iUnit)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetPenUnit", "hwnd", $hPen, "int", $iUnit)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenSetUnit

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_PenTranslateTransform
; Description ...: Updates a pen's current transformation matrix with the product of itself and a translation matrix
; Syntax.........: _GDIPlus_PenTranslateTransform($hPen, $nDX, $nDY[, $iOrder = 0])
; Parameters ....: $hPen   - Pointer to a Pen object
;                  $nDX	   - Real number that specifies the horizontal component of the translation
;                  $nDY    - Real number that specifies the vertical component of the translation
;                  $iOrder - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipTranslatePenTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_PenTranslateTransform($hPen, $nDX, $nDY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipTranslatePenTransform", "hwnd", $hPen, "float", $nDX, "float", $nDY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_PenTranslateTransform

#EndRegion Pen Functions

#Region Region Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionCreateFromHrgn
; Description ...: Creates a region that is identical to the region that is specified by a handle to GDI region (HRGN)
; Syntax.........: _GDIPlus_RegionCreateFromHrgn($hRgn)
; Parameters ....: $hRgn - Handle to an existing GDI region
; Return values .: Success      - Pointer to a new Region object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_RegionDispose to release the object resources
; Related .......: _GDIPlus_RegionDispose
; Link ..........; @@MsdnLink@@ GdipCreateRegionHrgn
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionCreateFromHrgn($hRgn)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateRegionHrgn", "hwnd", $hRgn, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_RegionCreateFromHrgn

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionCreateFromRgnData
; Description ...: Creates a region that is defined by data obtained from another region
; Syntax.........: _GDIPlus_RegionCreateFromRgnData($tData)
; Parameters ....: $tData - Structure of byte array that contains the region data to use
; Return values .: Success      - Pointer to a new Region object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_RegionDispose to release the object resources
; Related .......: _GDIPlus_RegionDispose, _GDIPlus_RegionGetData
; Link ..........; @@MsdnLink@@ GdipCreateRegionRgnData
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionCreateFromRgnData($tData)
	Local $iData, $pData, $aResult

	$iData = DllStructGetSize($tData)
	$pData = DllStructGetPtr($tData)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipCreateRegionRgnData", "ptr", $pData, "int", $iData, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[3]
EndFunc   ;==>_GDIPlus_RegionCreateFromRgnData

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionGetData
; Description ...: Gets the data that describes a region
; Syntax.........: _GDIPlus_RegionGetData($hRegion)
; Parameters ....: $hRegion - Pointer to a Region object
; Return values .: Success      - Structure of byte array that contains the region data
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_RegionGetDataSize function failed, $GDIP_STATUS contains the error code
;                  |	2 - The Region object does not contain any region data to be retrieved
;                  |	3 - The _GDIPlus_RegionGetData function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionCreateFromRgnData, _GDIPlus_RegionGetDataSize
; Link ..........; @@MsdnLink@@ GdipGetRegionData
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionGetData($hRegion)
	Local $iBuffer, $pBuffer, $tBuffer, $aResult

	$iBuffer = _GDIPlus_RegionGetDataSize($hRegion)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iBuffer <= 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tBuffer = DllStructCreate("byte Data[" & $iBuffer & "]")
	$pBuffer = DllStructGetPtr($tBuffer)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetRegionData", "hwnd", $hRegion, "ptr", $pBuffer, "int", $iBuffer, "ptr", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	Return $tBuffer
EndFunc   ;==>_GDIPlus_RegionGetData

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionGetDataSize
; Description ...: Gets the number of bytes of data that describes a Region object
; Syntax.........: _GDIPlus_RegionGetDataSize($hRegion)
; Parameters ....: $hRegion - Pointer to a Region object
; Return values .: Success      - Number of bytes of data that describes the region
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionGetData
; Link ..........; @@MsdnLink@@ GdipGetRegionDataSize
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionGetDataSize($hRegion)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetRegionDataSize", "hwnd", $hRegion, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_RegionGetDataSize

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionGetScans
; Description ...: Gets an array of rectangles that approximate a region
; Syntax.........: _GDIPlus_RegionGetScans($hRegion[, $hMatrix = 0])
; Parameters ....: $hRegion - Pointer to a Region object
;                  $hMatrix - Pointer to a Matrix object that is used to transform the region. If 0, an identity matrix is used
; Return values .: Success      - Array containing the rectangles coordinates and dimensions:
;                  |[0][0] - Number of rectangles
;                  |[1][0] - Rectangle 1 X coordinate of the upper-left corner
;                  |[1][1] - Rectangle 1 Y coordinate of the upper-left corner
;                  |[1][2] - Rectangle 1 width
;                  |[1][3] - Rectangle 1 height
;                  |[n][0] - Rectangle n X coordinate of the upper-left corner
;                  |[n][1] - Rectangle n Y coordinate of the upper-left corner
;                  |[n][2] - Rectangle n width
;                  |[n][3] - Rectangle n height
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_RegionGetScansCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The region is empty
;                  |	3 - The _GDIPlus_RegionGetScans function failed, $GDIP_STATUS contains the error code
; Remarks .......: The region is transformed by the specified matrix before the rectangles are calculated
; Related .......: _GDIPlus_RegionGetScansCount
; Link ..........; @@MsdnLink@@ GdipGetRegionScans
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionGetScans($hRegion, $hMatrix = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pRects, $tRects, $aRects[1][1], $aResult

	_GDIPlus_MatrixDefCreate($hMatrix)
	$iCount = _GDIPlus_RegionGetScansCount($hRegion, $hMatrix)
	Switch @error
		Case 0
			If $GDIP_STATUS Then
				_GDIPlus_MatrixDefDispose()
				$GDIP_ERROR = 1
				Return -1
			ElseIf $iCount <= 0 Then
				_GDIPlus_MatrixDefDispose()
				$GDIP_ERROR = 2
				Return -1
			EndIf
		Case Else
			$iTmpErr = @error
			$iTmpExt = @extended
			_GDIPlus_MatrixDefDispose()
			Return SetError($iTmpErr, $iTmpExt, -1)
	EndSwitch

	$tRects = DllStructCreate("float[" & $iCount * 4 & "]")
	$pRects = DllStructGetPtr($tRects)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetRegionScans", "hwnd", $hRegion, "ptr", $pRects, "int*", $iCount, "hwnd", $hMatrix)
	$iTmpErr = @error
	$iTmpExt = @extended
	_GDIPlus_MatrixDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aRects[$iCount + 1][4]
	$aRects[0][0] = $iCount

	For $iI = 1 To $iCount
		$aRects[$iI][0] = DllStructGetData($tRects, 1, (($iI - 1) * 4) + 1)
		$aRects[$iI][1] = DllStructGetData($tRects, 1, (($iI - 1) * 4) + 2)
		$aRects[$iI][2] = DllStructGetData($tRects, 1, (($iI - 1) * 4) + 3)
		$aRects[$iI][3] = DllStructGetData($tRects, 1, (($iI - 1) * 4) + 4)
	Next
	Return $aRects
EndFunc   ;==>_GDIPlus_RegionGetScans

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionGetScansCount
; Description ...: Gets the number of rectangles that approximate a region
; Syntax.........: _GDIPlus_RegionGetScansCount($hRegion, $hMatrix)
; Parameters ....: $hRegion - Pointer to a Region object
;                  $hMatrix - Pointer to a Matrix object that is used to transform the region.
; Return values .: Success      - The number of rectangles that approximate the region
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The region is transformed by the specified matrix before the rectangles are calculated
; Related .......: _GDIPlus_RegionGetScans
; Link ..........; @@MsdnLink@@ GdipGetRegionScansCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionGetScansCount($hRegion, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetRegionScansCount", "hwnd", $hRegion, "uint*", 0, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_RegionGetScansCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionIsEmpty
; Description ...: Determines whether a region is empty
; Syntax.........: _GDIPlus_RegionIsEmpty($hRegion, $hGraphics)
; Parameters ....: $hRegion   - Pointer to a Region object
;                  $hGraphics - Pointer to a Graphics object that contains the world and page transformations required to
;                  +calculate the device coordinates of the region
; Return values .: Success      - True if the region is empty, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipIsEmptyRegion
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionIsEmpty($hRegion, $hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsEmptyRegion", "hwnd", $hRegion, "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[3] <> 0
EndFunc   ;==>_GDIPlus_RegionIsEmpty

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionIsEqual
; Description ...: Determines whether a region is equal to another region
; Syntax.........: _GDIPlus_RegionIsEqual($hRegion1, $hRegion2, $hGraphics)
; Parameters ....: $hRegion1  - Pointer to a Region object
;                  $hRegion2  - Pointer to a Region object to test against the first Region object
;                  $hGraphics - Pointer to a Graphics object that contains the world and page transformations required to
;                  +calculate the device coordinates of the regions
; Return values .: Success      - True if the regiona are identical, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipIsEqualRegion
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionIsEqual($hRegion1, $hRegion2, $hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsEqualRegion", "hwnd", $hRegion1, "hwnd", $hRegion2, "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[4] <> 0
EndFunc   ;==>_GDIPlus_RegionIsEqual

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionIsInfinite
; Description ...: Determines whether a region is infinite
; Syntax.........: _GDIPlus_RegionIsInfinite($hRegion, $hGraphics)
; Parameters ....: $hRegion   - Pointer to a Region object
;                  $hGraphics - Pointer to a Graphics object that contains the world and page transformations required to
;                  +calculate the device coordinates of the region
; Return values .: Success      - True if the region is infinite, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipIsInfiniteRegion
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionIsInfinite($hRegion, $hGraphics)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsInfiniteRegion", "hwnd", $hRegion, "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)
	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[3] <> 0
EndFunc   ;==>_GDIPlus_RegionIsInfinite

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionIsVisiblePoint
; Description ...: Determines whether a point is inside a region
; Syntax.........: _GDIPlus_RegionIsVisiblePoint($hRegion, $nX, $nY[, $hGraphics = 0])
; Parameters ....: $hRegion	  - Pointer to a Region object
;                  $nX        - X coordinate of the point to check for visibility
;                  $nY        - Y coordinate of the point to check for visibility
;                  $hGraphics - Pointer to a Graphics object that contains the world and page transformations required to
;                  +calculate the device coordinates of the region and the point
; Return values .: Success      - True if the specified point is inside the region, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionIsVisibleRect
; Link ..........; @@MsdnLink@@ GdipIsVisibleRegionPoint
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionIsVisiblePoint($hRegion, $nX, $nY, $hGraphics = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsVisibleRegionPoint", "hwnd", $hRegion, "float", $nX, "float", $nY, "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[5] <> 0
EndFunc   ;==>_GDIPlus_RegionIsVisiblePoint

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionIsVisibleRect
; Description ...: Determines whether a rectangle intersects a region
; Syntax.........: _GDIPlus_RegionIsVisibleRect($hRegion, $nX, $nY, $nWidth, $nHeight[, $hGraphics = 0])
; Parameters ....: $hRegion   - Pointer to a Region object
;                  $nX        - X coordinate of the upper-left corner of the rectangle
;                  $nY        - Y coordinate of the upper-left corner of the rectangle
;                  $nWidth	  - Width of the rectangle
;                  $nHeight	  - Height of the rectangle
;                  $hGraphics - Pointer to a Graphics object that contains the world and page transformations required to
;                  +calculate the device coordinates of the region and the rectangle
; Return values .: Success      - True if the specified rectangle intersects the region, False otherwise
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionIsVisiblePoint
; Link ..........; @@MsdnLink@@ GdipIsVisibleRegionRect
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionIsVisibleRect($hRegion, $nX, $nY, $nWidth, $nHeight, $hGraphics = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipIsVisibleRegionRect", "hwnd", $hRegion, "float", $nX, "float", $nY, "float", $nWidth, "float", $nHeight, "hwnd", $hGraphics, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[7] <> 0
EndFunc   ;==>_GDIPlus_RegionIsVisibleRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionSetEmpty
; Description ...: Updates a region to an empty region. In other words, the region occupies no space on the display device
; Syntax.........: _GDIPlus_RegionSetEmpty($hRegion)
; Parameters ....: $hRegion   - Pointer to a Region object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionSetInfinite
; Link ..........; @@MsdnLink@@ GdipSetEmpty
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionSetEmpty($hRegion)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetEmpty", "hwnd", $hRegion)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_RegionSetEmpty

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_RegionSetInfinite
; Description ...: Updates a region to an infinite region
; Syntax.........: _GDIPlus_RegionSetInfinite($hRegion)
; Parameters ....: $hRegion   - Pointer to a Region object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_RegionSetEmpty
; Link ..........; @@MsdnLink@@ GdipSetInfinite
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_RegionSetInfinite($hRegion)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetInfinite", "hwnd", $hRegion)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_RegionSetInfinite
#EndRegion Region Functions

#Region SolidBrush Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_BrushGetFillColor
; Description ...: Gets the fill color of a solid brush
; Syntax.........: _GDIPlus_BrushGetFillColor($hBrush)
; Parameters ....: $hBrush - Pointer to a Brush object
; Return values .: Success      - Alpha, Red, Green and Blue components of the brush fill color
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_BrushSetFillColor
; Link ..........; @@MsdnLink@@ GdipGetSolidFillColor
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_BrushGetFillColor($hBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetSolidFillColor", "hwnd", $hBrush, "uint*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_BrushGetFillColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_BrushSetFillColor
; Description ...: Sets the fill color of a solid brush
; Syntax.........: _GDIPlus_BrushSetFillColor($hBrush, $iARGB)
; Parameters ....: $hBrush - Pointer to a Brush object
;                  $iARGB  - Alpha, Red, Green and Blue components that specify the new fill color of the brush
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_BrushGetFillColor
; Link ..........; @@MsdnLink@@ GdipSetSolidFillColor
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_BrushSetFillColor($hBrush, $iARGB)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetSolidFillColor", "hwnd", $hBrush, "uint", $iARGB)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_BrushSetFillColor

#EndRegion SolidBrush Functions

#Region StringFormat Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatClone
; Description ...: Clones a StringFormat object
; Syntax.........: _GDIPlus_StringFormatClone($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Pointer to a new cloned StringFormat object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_StringFormatDispose to release the object resources
; Related .......: _GDIPlus_StringFormatDispose
; Link ..........; @@MsdnLink@@ GdipCloneStringFormat
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatClone($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipCloneStringFormat", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatClone

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatCreateDefault
; Description ...: Creates a generic, default StringFormat object
; Syntax.........: _GDIPlus_StringFormatCreateDefault()
; Parameters ....: None
; Return values .: Success      - Pointer to a StringFormat object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_StringFormatDispose to release the object resources
; Related .......: _GDIPlus_StringFormatDispose
; Link ..........; @@MsdnLink@@ GdipStringFormatGetGenericDefault
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatCreateDefault()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipStringFormatGetGenericDefault", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_StringFormatCreateDefault

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatCreateTypographic
; Description ...: Creates a generic, typographic StringFormat object
; Syntax.........: _GDIPlus_StringFormatCreateTypographic()
; Parameters ....: None
; Return values .: Success      - Pointer to a StringFormat object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_StringFormatDispose to release the object resources
; Related .......: _GDIPlus_StringFormatDispose
; Link ..........; @@MsdnLink@@ GdipStringFormatGetGenericTypographic
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatCreateTypographic()
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipStringFormatGetGenericTypographic", "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[1]
EndFunc   ;==>_GDIPlus_StringFormatCreateTypographic

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetAlign
; Description ...: Gets the string alignment currently set for the StringFormat object that indicates the character alignment of
;                  +a StringFormat object in relation to the origin of the layout rectangle
; Syntax.........: _GDIPlus_StringFormatGetAlign($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - String alignmenet:
;                  |0 - Alignment is towards the origin of the bounding rectangle
;                  |1 - Alignment is centered between origin and extent (width) of the formatting rectangle
;                  |2 - Alignment is to the far extent (right side) of the formatting rectangle
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The layout rectangle is used to position the displayed string
; Related .......: _GDIPlus_StringFormatSetAlign
; Link ..........; @@MsdnLink@@ GdipGetStringFormatAlign
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetAlign($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatAlign", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatGetAlign

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetDigitSubstitution
; Description ...: Gets the language ID and the digit substitution method that is used by a StringFormat object
; Syntax.........: _GDIPlus_StringFormatGetDigitSubstitution($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Array containing the language ID and the digit substitution method of the StringFormat:
;                  |[0] - Language ID used by the StringFormat object
;                  |[1] - Digit substitution method used by the StringFormat object:
;                  |	0 - A user-defined substitution scheme
;                  |	1 - Digit substitution is disabled
;                  |	2 - Substitution digits that correspond with the official national language of the user's locale
;                  |	3 -	Substitution digits that correspond with the user's native script or language
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatSetDigitSubstitution
; Link ..........; @@MsdnLink@@ GdipGetStringFormatDigitSubstitution
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetDigitSubstitution($hStringFormat)
	Local $aDigitSubstitution[2], $aResult

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatDigitSubstitution", "hwnd", $hStringFormat, "ushort*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	$aDigitSubstitution[0] = $aResult[2]
	$aDigitSubstitution[1] = $aResult[3]
	Return $aDigitSubstitution
EndFunc   ;==>_GDIPlus_StringFormatGetDigitSubstitution

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetFlags
; Description ...: Gets the string format flags of a StringFormat object
; Syntax.........: _GDIPlus_StringFormatGetFlags($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Text layout information and display flags, can be any combination of the following:
;                  |0x0001 - Reading order is right to left. For horizontal text, characters are read from right to left. For
;                  +vertical text, columns are read from right to left
;                  |0x0002 - Individual lines of text are drawn vertically on the display device
;                  |0x0004 - Parts of characters are allowed to overhang the string's layout rectangle
;                  |0x0020 - Unicode layout control characters are displayed with a representative character
;                  |0x0400 - An alternate font is used for characters that are not supported in the requested font
;                  |0x0800 - The space at the end of each line is included in a string measurement
;                  |0x1000 - Wrapping of text to the next line is disabled
;                  |0x2000 - Only entire lines are laid out in the layout rectangle
;                  |0x4000 - Characters overhanging the layout rectangle and text extending outside the layout rectangle are
;                  +allowed to show
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatSetFlags
; Link ..........; @@MsdnLink@@ GdipGetStringFormatFlags
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetFlags($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatFlags", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatGetFlags

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetHotkeyPrefix
; Description ...: Gets the type of processing that is performed on a string when a hot key prefix (&) is encountered
; Syntax.........: _GDIPlus_StringFormatGetHotkeyPrefix($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Type of hot key prefix processing:
;                  |0 - No hot key processing occurs
;                  |1 - Unicode text is scanned for ampersands (&). All pairs of ampersands are replaced by a single ampersand.
;                  +All single ampersands are removed, the first character that follows a single ampersand is displayed
;                  +underlined
;                  |2 - Same as 1 but a character following a single ampersand is not displayed underlined
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatSetHotkeyPrefix
; Link ..........; @@MsdnLink@@ GdipGetStringFormatHotkeyPrefix
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetHotkeyPrefix($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatHotkeyPrefix", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatGetHotkeyPrefix

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetLineAlign
; Description ...: Gets the line alignment of a StringFormat object in relation to the origin of a layout rectangle
; Syntax.........: _GDIPlus_StringFormatGetLineAlign($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Type of line alignment used by the StringFormat object:
;                  |0 - Alignment is towards the origin of the bounding rectangle
;                  |1 - Alignment is centered between origin and the height of the formatting rectangle
;                  |2 - Alignment is to the far extent (right side) of the formatting rectangle
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: The line alignment setting specifies how to align the string vertically in the layout rectangle
; Related .......: _GDIPlus_StringFormatSetLineAlign
; Link ..........; @@MsdnLink@@ GdipGetStringFormatLineAlign
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetLineAlign($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatLineAlign", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatGetLineAlign

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetTabStopCount
; Description ...: Gets the number of tab-stop offsets in a StringFormat object
; Syntax.........: _GDIPlus_StringFormatGetTabStopCount($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Number of tab stops in the StringFormat object
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetTabStops
; Link ..........; @@MsdnLink@@ GdipGetStringFormatTabStopCount
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetTabStopCount($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatTabStopCount", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatGetTabStopCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetTabStops
; Description ...: Gets the offsets of the tab stops in a StringFormat object
; Syntax.........: _GDIPlus_StringFormatGetTabStops($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Array containing the tabs stops offsets in the StringFormat object:
;                  |[0] - Number of tab stops offsets in the array
;                  |[1] - Offset 1, relative to the string's origin
;                  |[2] - Offset 2, relative to the previous offset
;                  |[3] - Offset 3, relative to the previous offset
;                  |[n] - Offset n, relative to the previous offset
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
;                  |$GDIP_ERROR:
;                  |	1 - The _GDIPlus_StringFormatGetTabStopCount function failed, $GDIP_STATUS contains the error code
;                  |	2 - The StringFormat object does not contain any tab stops array
;                  | 	3 - The _GDIPlus_StringFormatGetTabStops function failed, $GDIP_STATUS contains the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetTabStopCount, _GDIPlus_StringFormatSetTabStops
; Link ..........; @@MsdnLink@@ GdipGetStringFormatTabStops
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetTabStops($hStringFormat)
	Local $iI, $iCount, $pStops, $tStops, $aStops[1], $aResult

	$iCount = _GDIPlus_StringFormatGetTabStopCount($hStringFormat)
	If @error Then Return SetError(@error, @extended, -1)

	If $GDIP_STATUS Then
		$GDIP_ERROR = 1
		Return -1
	ElseIf $iCount <= 0 Then
		$GDIP_ERROR = 2
		Return -1
	EndIf

	$tStops = DllStructCreate("float[" & $iCount & "]")
	$pStops = DllStructGetPtr($tStops)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatTabStops", "hwnd", $hStringFormat, "int", $iCount, "float*", 0, "ptr", $pStops)
	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then
		$GDIP_ERROR = 3
		Return -1
	EndIf

	ReDim $aStops[$iCount + 2]
	$aStops[0] = $iCount + 1
	$aStops[1] = $aResult[3]

	For $iI = 1 To $iCount
		$aStops[$iI + 1] = DllStructGetData($tStops, 1, $iI)
	Next
	Return $aStops
EndFunc   ;==>_GDIPlus_StringFormatGetTabStops

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatGetTrimming
; Description ...: Gets the trimming style of a StringFormat object
; Syntax.........: _GDIPlus_StringFormatGetTrimming($hStringFormat)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
; Return values .: Success      - Trimming style used by the StringFormat object:
;                  |0 - No trimming is done
;                  |1 - String is broken at the boundary of the last character that is inside the layout rectangle
;                  |2 - String is broken at the boundary of the last word that is inside the layout rectangle
;                  |3 - String is broken at the boundary of the last character that is inside the layout rectangle and an
;                  +ellipsis (...) is inserted after the character
;                  |4 - String is broken at the boundary of the last word that is inside the layout rectangle and an
;                  |ellipsis (...) is inserted after the word
;                  |5 - The center is removed from the string and replaced by an ellipsis. The algorithm keeps as much of the
;                  +last portion of the string as possible
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatSetTrimming
; Link ..........; @@MsdnLink@@ GdipGetStringFormatTrimming
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatGetTrimming($hStringFormat)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetStringFormatTrimming", "hwnd", $hStringFormat, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_StringFormatGetTrimming

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatSetDigitSubstitution
; Description ...: Sets the language ID and the digit substitution method that is used by a StringFormat object
; Syntax.........: _GDIPlus_StringFormatSetDigitSubstitution($hStringFormat, $iLANGID, $iStringDigitSubstitute)
; Parameters ....: $hStringFormat     	   - Pointer to a StringFormat object
;                  $iLANGID				   - Language ID of the language associated with the substitute digits (see remarks)
;                  $iStringDigitSubstitute - Digit substitution method that will be used by the StringFormat object:
;                  |0 - A user-defined substitution scheme
;                  |1 - Digit substitution is disabled
;                  |2 - Substitution digits that correspond with the official national language of the user's locale
;                  |3 -	Substitution digits that correspond with the user's native script or language
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetDigitSubstitution
; Link ..........; @@MsdnLink@@ GdipSetStringFormatDigitSubstitution
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatSetDigitSubstitution($hStringFormat, $iLANGID, $iStringDigitSubstitute)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetStringFormatDigitSubstitution", "hwnd", $hStringFormat, "ushort", $iLANGID, "int", $iStringDigitSubstitute)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_StringFormatSetDigitSubstitution

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatSetFlags
; Description ...: Sets the format flags for a StringFormat object
; Syntax.........: _GDIPlus_StringFormatSetFlags($hStringFormat, $iFlags)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
;                  $iFlags		  - Text layout information and display flags, can be any combination of the following:
;                  |0x0001 - Reading order is right to left. For horizontal text, characters are read from right to left. For
;                  +vertical text, columns are read from right to left
;                  |0x0002 - Individual lines of text are drawn vertically on the display device
;                  |0x0004 - Parts of characters are allowed to overhang the string's layout rectangle
;                  |0x0020 - Unicode layout control characters are displayed with a representative character
;                  |0x0400 - An alternate font is used for characters that are not supported in the requested font
;                  |0x0800 - The space at the end of each line is included in a string measurement
;                  |0x1000 - Wrapping of text to the next line is disabled
;                  |0x2000 - Only entire lines are laid out in the layout rectangle
;                  |0x4000 - Characters overhanging the layout rectangle and text extending outside the layout rectangle are
;                  +allowed to show
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetFlags
; Link ..........; @@MsdnLink@@ GdipSetStringFormatFlags
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatSetFlags($hStringFormat, $iFlags)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetStringFormatFlags", "hwnd", $hStringFormat, "int", $iFlags)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_StringFormatSetFlags

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatSetHotkeyPrefix
; Description ...: Sets the type of processing that is performed on a string when a hot key prefix (&) is encountered
; Syntax.........: _GDIPlus_StringFormatSetHotkeyPrefix($hStringFormat, $iHotKeyPerfix)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
;                  $iHotKeyPerfix - Type of hot key prefix processing to use:
;                  |0 - No hot key processing occurs
;                  |1 - Unicode text is scanned for ampersands (&). All pairs of ampersands are replaced by a single ampersand.
;                  +All single ampersands are removed, the first character that follows a single ampersand is displayed
;                  +underlined
;                  |2 - Same as 1 but a character following a single ampersand is not displayed underlined
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetHotkeyPrefix
; Link ..........; @@MsdnLink@@ GdipSetStringFormatHotkeyPrefix
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatSetHotkeyPrefix($hStringFormat, $iHotKeyPerfix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetStringFormatHotkeyPrefix", "hwnd", $hStringFormat, "int", $iHotKeyPerfix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_StringFormatSetHotkeyPrefix

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatSetTabStops
; Description ...: Sets the offsets for tab stops in a StringFormat object
; Syntax.........: _GDIPlus_StringFormatSetTabStops($hStringFormat, $aStops)
; Parameters ....: $hStringFormat - Pointer to a StringFormat object
;                  $aStops		  - Array of tabs stops offsets, the first offset is relative to the string's origin:
;                  |[0] - Number of tab stops offsets in the array
;                  |[1] - Offset 1, relative to the string's origin
;                  |[2] - Offset 2, relative to the previous offset
;                  |[3] - Offset 3, relative to the previous offset
;                  |[n] - Offset n, relative to the previous offset
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetTabStops
; Link ..........; @@MsdnLink@@ GdipSetStringFormatTabStops
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatSetTabStops($hStringFormat, $aStops)
	Local $iI, $iCount, $iFirstTabOffset, $pStops, $tStops, $aResult

	$iCount = $aStops[0]
	$tStops = DllStructCreate("float[" & $iCount & "]")
	$pStops = DllStructGetPtr($tStops)

	$iFirstTabOffset = $aStops[1]
	For $iI = 2 To $iCount
		DllStructSetData($tStops, 1, $aStops[$iI], $iI - 1)
	Next

	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetStringFormatTabStops", "hwnd", $hStringFormat, "float", $iFirstTabOffset, "int", $iCount - 1, "ptr", $pStops)
	If @error Then Return SetError(@error, @extended, False)

	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_StringFormatSetTabStops

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_StringFormatSetTrimming
; Description ...: Sets the trimming style for a StringFormat object
; Syntax.........: _GDIPlus_StringFormatSetTrimming($hStringFormat, $iStringTrimming)
; Parameters ....: $hStringFormat 	- Pointer to a StringFormat object
;                  $iStringTrimming	- The trimming style  to use:
;                  |0 - No trimming is done
;                  |1 - String is broken at the boundary of the last character that is inside the layout rectangle
;                  |2 - String is broken at the boundary of the last word that is inside the layout rectangle
;                  |3 - String is broken at the boundary of the last character that is inside the layout rectangle and an
;                  +ellipsis (...) is inserted after the character
;                  |4 - String is broken at the boundary of the last word that is inside the layout rectangle and an
;                  |ellipsis (...) is inserted after the word
;                  |5 - The center is removed from the string and replaced by an ellipsis. The algorithm keeps as much of the
;                  +last portion of the string as possible
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_StringFormatGetTrimming
; Link ..........; @@MsdnLink@@ GdipSetStringFormatTrimming
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_StringFormatSetTrimming($hStringFormat, $iStringTrimming)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetStringFormatTrimming", "hwnd", $hStringFormat, "int", $iStringTrimming)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_StringFormatSetTrimming

#EndRegion StringFormat Functions

#Region Text Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsDrawDriverString
; Description ...: Draws characters at the specified positions.
; Syntax.........: _GDIPlus_GraphicsDrawDriverString($hGraphics, $vText, $hFont, $hBrush, $aPoints[, $iStrLen = -1[, $iFlag = 1[, $hMatrix = 0]]])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $vText	  - The string of text or glyhps to be drawn
;                  $hFont	  - Pointer to a Font object that specifies the font characteristics
;                  $hBrush	  - Pointer to a Brush object that is used to fill the string
;                  $aPoints   - Array of points for the text or glyphs locations:
;                  |[0][0] - Number of points in the array. If $iFlag contains 4 this number must be 1
;                  |[1][0] - Point 1 X coordinate
;                  |[1][1] - Point 1 Y coordinate
;                  |[2][0] - Point 2 X coordinate
;                  |[2][1] - Point 2 Y coordinate
;                  |[n][0] - Point n X coordinate
;                  |[n][1] - Point n Y coordinate
;                  $iStrLen   - The number of characters or glyphs in the $vText parameter to draw. Can be -1 if $vText is a
;                  +null-terminated string
;                  $iFlag	  - Flags that specify the appearance of the string, can be any combination of the following:
;                  |1 - The string array contains Unicode character values. If this flag is not set, each value in $vText is
;                  +interpreted as an index to a font glyph that defines a character to be displayed
;                  |2 - The string is displayed vertically
;                  |4 - The glyph positions are calculated from the position of the first glyph. If this flag is not set, the
;                  +glyph positions are obtained from an array of coordinates ($aPoints)
;                  |8 - Less memory should be used for cache of antialiased glyphs. This also produces lower quality. If this
;                  +flag is not set, more memory is used, but the quality is higher
;                  $hMatrix	  - Pointer to a Matrix object that specifies the transformation matrix to apply to each value in the
;                  +text array. If 0, an identity matrix is used.
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsDrawString
; Link ..........; @@MsdnLink@@ GdipDrawDriverString
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsDrawDriverString($hGraphics, $vText, $hFont, $hBrush, $aPoints, $iStrLen, $iFlag = 1, $hMatrix = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pPoints, $tPoints, $sType, $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	If IsString($vText) Then
		$sType = "wstr"
	Else
		$sType = "ptr"
	EndIf

	_GDIPlus_MatrixDefCreate($hMatrix)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipDrawDriverString", "hwnd", $hGraphics, $sType, $vText, "int", $iStrLen, "hwnd", $hFont, "hwnd", $hBrush, "ptr", $pPoints, "int", $iFlag, "hwnd", $hMatrix)
	$iTmpErr = @error
	$iTmpExt = @extended
	_GDIPlus_MatrixDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_GraphicsDrawDriverString

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_GraphicsMeasureDriverString
; Description ...: Measures the bounding box for the specified characters and their corresponding positions
; Syntax.........: _GDIPlus_GraphicsMeasureDriverString($hGraphics, $vText, $hFont, $aPoints[, $iStrLen = -1[, $iFlag = 1[, $hMatrix = 0]]])
; Parameters ....: $hGraphics - Pointer to a Graphics object
;                  $vText	  - The string of text or glyhps to be drawn
;                  $hFont	  - Pointer to a Font object that specifies the font characteristics
;                  $aPoints   - Array of points for the text of glyphs locations:
;                  |[0][0] - Number of points in the array. If $iFlag contains 4 this number must be 1
;                  |[1][0] - Point 1 X coordinate
;                  |[1][1] - Point 1 Y coordinate
;                  |[2][0] - Point 2 X coordinate
;                  |[2][1] - Point 2 Y coordinate
;                  |[n][0] - Point n X coordinate
;                  |[n][1] - Point n Y coordinate
;                  $iStrLen   - The number of characters or glyphs in the $vText parameter to draw. Can be -1 if $vText is a
;                  +null-terminated string
;                  $iFlag	  - Flags that specify the appearance of the string, can be any combination of the following:
;                  |1 - The string array contains Unicode character values. If this flag is not set, each value in $vText is
;                  +interpreted as an index to a font glyph that defines a character to be displayed
;                  |2 - The string is displayed vertically
;                  |4 - The glyph positions are calculated from the position of the first glyph. If this flag is not set, the
;                  +glyph positions are obtained from an array of coordinates ($aPoints)
;                  |8 - Less memory should be used for cache of antialiased glyphs. This also produces lower quality. If this
;                  +flag is not set, more memory is used, but the quality is higher
;                  $hMatrix	  - Pointer to a Matrix object that specifies the transformation matrix to apply to each value in the
;                  +text array. If 0, an identity matrix is used.
; Return values .: Success      - Array containing the bounding rectangle of the string:
;                  |[0] - X coordinate of the upper-left corner of the rectangle
;                  |[1] - Y coordinate of the upper-left corner of the rectangle
;                  |[2] - Width of the rectangle
;                  |[3] - Height of the rectangle
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_GraphicsMeasureString
; Link ..........; @@MsdnLink@@ GdipMeasureDriverString
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_GraphicsMeasureDriverString($hGraphics, $vText, $hFont, $aPoints, $iStrLen = -1, $iFlag = 1, $hMatrix = 0)
	Local $iI, $iCount, $iTmpErr, $iTmpExt, $pPoints, $tPoints, $tRectF, $pRectF, $sType, $aRectF[4], $aResult

	$iCount = $aPoints[0][0]
	$tPoints = DllStructCreate("float[" & $iCount * 2 & "]")
	$pPoints = DllStructGetPtr($tPoints)
	$tRectF = DllStructCreate($tagGDIPRECTF)
	$pRectF = DllStructGetPtr($tRectF)

	For $iI = 1 To $iCount
		DllStructSetData($tPoints, 1, $aPoints[$iI][0], (($iI - 1) * 2) + 1)
		DllStructSetData($tPoints, 1, $aPoints[$iI][1], (($iI - 1) * 2) + 2)
	Next

	If IsString($vText) Then
		$sType = "wstr"
	Else
		$sType = "ptr"
	EndIf

	_GDIPlus_MatrixDefCreate($hMatrix)
	$aResult = DllCall($__g_hGDIPDll, "uint", "GdipMeasureDriverString", "hwnd", $hGraphics, $sType, $vText, "int", $iStrLen, "hwnd", $hFont, "ptr", $pPoints, "int", $iFlag, "hwnd", $hMatrix, "ptr", $pRectF)
	$iTmpErr = @error
	$iTmpExt = @extended
	_GDIPlus_MatrixDefDispose()

	If $iTmpErr Then Return SetError($iTmpErr, $iTmpExt, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1

	For $iI = 1 To 4
		$aRectF[$iI - 1] = DllStructGetData($tRectF, $iI)
	Next

	Return $aRectF
EndFunc   ;==>_GDIPlus_GraphicsMeasureDriverString

#EndRegion Text Functions

#Region Texture Brush Functions

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureGetImage
; Description ...: Gets a pointer to the Image object that is defined by a texture brush
; Syntax.........: _GDIPlus_TextureGetImage($hTextureBrush)
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
; Return values .: Success      - Pointer to a new Image object
;                  Failure      - 0 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: After you are done with the object, call _GDIPlus_ImageDispose to release the object resources
; Related .......: _GDIPlus_ImageDispose
; Link ..........; @@MsdnLink@@ GdipGetTextureImage
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureGetImage($hTextureBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetTextureImage", "hwnd", $hTextureBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, 0)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_TextureGetImage

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureGetTransform
; Description ...: Gets the transformation matrix of a texture brush
; Syntax.........: _GDIPlus_TextureGetTransform($hTextureBrush, $hMatrix)
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $hMatrix		  - Pointer to a Matrix object that receives the transformation matrix
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_TextureSetTransform
; Link ..........; @@MsdnLink@@ GdipGetTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureGetTransform($hTextureBrush, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetTextureTransform", "hwnd", $hTextureBrush, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureGetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureGetWrapMode
; Description ...: Gets the wrap mode currently set for a texture brush
; Syntax.........: _GDIPlus_TextureGetWrapMode($hTextureBrush)
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
; Return values .: Success      - Wrap mode that specifies how repeated copies of an image are used to tile an area when it is
;                  +painted with the texture brush:
;                  |0 - Tiling without flipping
;                  |1 - Tiles are flipped horizontally as you move from one tile to the next in a row
;                  |2 - Tiles are flipped vertically as you move from one tile to the next in a column
;                  |3 - Tiles are flipped horizontally as you move along a row and flipped vertically as you move along a column
;                  |4 - No tiling takes place
;                  Failure      - -1 and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_TextureSetWrapMode
; Link ..........; @@MsdnLink@@ GdipGetTextureWrapMode
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureGetWrapMode($hTextureBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipGetTextureWrapMode", "hwnd", $hTextureBrush, "int*", 0)

	If @error Then Return SetError(@error, @extended, -1)

	$GDIP_STATUS = $aResult[0]
	If $GDIP_STATUS Then Return -1
	Return $aResult[2]
EndFunc   ;==>_GDIPlus_TextureGetWrapMode

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureMultiplyTransform
; Description ...: Updates a texture brush's transformation matrix with the product of itself and another matrix
; Syntax.........: _GDIPlus_TextureMultiplyTransform($hTextureBrush, $hMatrix[, $iOrder = 0])
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $hMatrix		  - Pointer to a matrix to be multiplied by the brush's current transformation matrix
;                  $iOrder		  - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipMultiplyTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureMultiplyTransform($hTextureBrush, $hMatrix, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipMultiplyTextureTransform", "hwnd", $hTextureBrush, "hwnd", $hMatrix, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureMultiplyTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureResetTransform
; Description ...: Resets the transformation matrix of a texture brush to the identity matrix
; Syntax.........: _GDIPlus_TextureResetTransform($hTextureBrush))
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipResetTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureResetTransform($hTextureBrush)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipResetTextureTransform", "hwnd", $hTextureBrush)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureResetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureRotateTransform
; Description ...: Updates a texture brush's current transformation matrix with the product of itself and a rotation matrix
; Syntax.........: _GDIPlus_TextureRotateTransform($hTextureBrush, $nAngle[, $iOrder = 0])
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $nAngle		  - Real number that specifies the angle of rotation in degrees
;                  $iOrder		  - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipRotateTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureRotateTransform($hTextureBrush, $nAngle, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipRotateTextureTransform", "hwnd", $hTextureBrush, "float", $nAngle, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureRotateTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureScaleTransform
; Description ...: Updates a texture brush's current transformation matrix with the product of itself and a scaling matrix
; Syntax.........: _GDIPlus_TextureScaleTransform($hTextureBrush, $nScaleX, $nScaleY[, $iOrder = 0])
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $nScaleX		  - Real number that specifies the amount to scale in the X direction
;                  $nScaleY 	  - Real number that specifies the amount to scale in the Y direction
;                  $iOrder		  - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipScaleTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureScaleTransform($hTextureBrush, $nScaleX, $nScaleY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipScaleTextureTransform", "hwnd", $hTextureBrush, "float", $nScaleX, "float", $nScaleY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureScaleTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureSetTransform
; Description ...: Sets the transformation matrix of a texture brush
; Syntax.........: _GDIPlus_TextureSetTransform($hTextureBrush, $hMatrix)
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $hMatrix		  - Pointer to a Matrix object that specifies the transformation matrix
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_TextureGetTransform
; Link ..........; @@MsdnLink@@ GdipSetTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureSetTransform($hTextureBrush, $hMatrix)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetTextureTransform", "hwnd", $hTextureBrush, "hwnd", $hMatrix)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureSetTransform

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureSetWrapMode
; Description ...: Sets the wrap mode of a texture brush
; Syntax.........: _GDIPlus_TextureSetWrapMode($hTextureBrush, $iWrapMode)
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $iWrapMode	  - Wrap mode that specifies how repeated copies of an image are used to tile an area when it is
;                  +painted with the texture brush:
;                  |0 - Tiling without flipping
;                  |1 - Tiles are flipped horizontally as you move from one tile to the next in a row
;                  |2 - Tiles are flipped vertically as you move from one tile to the next in a column
;                  |3 - Tiles are flipped horizontally as you move along a row and flipped vertically as you move along a column
;                  |4 - No tiling takes place
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: _GDIPlus_TextureGetWrapMode
; Link ..........; @@MsdnLink@@ GdipSetTextureWrapMode
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureSetWrapMode($hTextureBrush, $iWrapMode)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipSetTextureWrapMode", "hwnd", $hTextureBrush, "int", $iWrapMode)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureSetWrapMode

; #FUNCTION# ====================================================================================================================
; Name...........: _GDIPlus_TextureTranslateTransform
; Description ...: Updates a texture brush's current transformation matrix with the product of itself and a translation matrix
; Syntax.........: _GDIPlus_TextureTranslateTransform($hTextureBrush, $nDX, $nDY[, $iOrder = 0])
; Parameters ....: $hTextureBrush - Pointer to a TextureBrush object
;                  $nDX			  - Real number that specifies the horizontal component of the translation
;                  $nDY 		  - Real number that specifies the vertical component of the translation
;                  $iOrder		  - Order of matrices multiplication:
;                  |0 - The passed matrix is on the left
;                  |1 - The passed matrix is on the right
; Return values .: Success      - True
;                  Failure      - False and either:
;                  |@error and @extended are set if DllCall failed
;                  |$GDIP_STATUS contains a non zero value specifying the error code
; Remarks .......: None
; Related .......: None
; Link ..........; @@MsdnLink@@ GdipTranslateTextureTransform
; Example .......; No
; ===============================================================================================================================
Func _GDIPlus_TextureTranslateTransform($hTextureBrush, $nDX, $nDY, $iOrder = 0)
	Local $aResult = DllCall($__g_hGDIPDll, "uint", "GdipTranslateTextureTransform", "hwnd", $hTextureBrush, "float", $nDX, "float", $nDY, "int", $iOrder)

	If @error Then Return SetError(@error, @extended, False)
	$GDIP_STATUS = $aResult[0]
	Return $aResult[0] = 0
EndFunc   ;==>_GDIPlus_TextureTranslateTransform

#EndRegion Texture Brush Functions

#Region Other Functions

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _GDIPlus_MatrixDefCreate
; Description ...: Creates a default Matrix object if needed, this is the identity matrix
; Syntax.........: _GDIPlus_MatrixDefCreate(ByRef $hMatrix)
; Parameters ....: $hMatrix     - Handle to a Matrix object
; Return values .: Success      - $hBrush or a default Brush object
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _GDIPlus_MatrixDefCreate(ByRef $hMatrix)
	If $hMatrix = 0 Then
		$ghGDIPMatrix = _GDIPlus_MatrixCreate()
		$hMatrix = $ghGDIPMatrix
	EndIf
EndFunc   ;==>_GDIPlus_MatrixDefCreate

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _GDIPlus_MatrixDefDispose
; Description ...: Frees default Matrix object
; Syntax.........: _GDIPlus_MatrixDefDispose()
; Parameters ....:
; Return values .:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......;
; ===============================================================================================================================
Func _GDIPlus_MatrixDefDispose()
	If $ghGDIPMatrix <> 0 Then
		_GDIPlus_MatrixDispose($ghGDIPMatrix)
		$ghGDIPMatrix = 0
	EndIf
EndFunc   ;==>_GDIPlus_MatrixDefDispose

#EndRegion Other Functions