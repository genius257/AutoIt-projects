#AutoIt3Wrapper_Run_AU3Check=Y
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7

#include-once
#include <WINAPI.au3>

Global Const $OCR_SPEED_FASTEST = "fastest"
Global Const $OCR_SPEED_FAST = "fast"
Global Const $OCR_SPEED_SLOW = "slow"

Global Const $OCR_RECOGNIZE_TYPE_TEXT = "text"
Global Const $OCR_RECOGNIZE_TYPE_BARCODE = "barcode"
Global Const $OCR_RECOGNIZE_TYPE_ALL = "all"

Global Const $OCR_OUTPUT_FORMAT_PLAINTEXT = "text"
Global Const $OCR_OUTPUT_FORMAT_XML = "xml"
Global Const $OCR_OUTPUT_FORMAT_PDF = "pdf"
Global Const $OCR_OUTPUT_FORMAT_RTF = "rtf"

Global Const $OCR_PROP_INCLUDE_EMPTY_BLOCK = "PROP_INCLUDE_EMPTY_BLOCK"

Global Const $OCR_PROP_LIMIT_TO_CHARSET = "PROP_LIMIT_TO_CHARSET"

Global Const $OCR_PROP_PAGE_TYPE = "PROP_PAGE_TYPE"
Global Const $OCR_PROP_PAGE_TYPE_AUTO_DETECT = "auto"
Global Const $OCR_PROP_PAGE_TYPE_SINGLE_BLOCK = "single_block"
Global Const $OCR_PROP_PAGE_TYPE_SINGLE_COLUMN = "single_column"
Global Const $OCR_PROP_PAGE_TYPE_SINGLE_LINE = "single_line"
Global Const $OCR_PROP_PAGE_TYPE_SINGLE_WORD = "single_word"
Global Const $OCR_PROP_PAGE_TYPE_SINGLE_CHARACTOR = "single_char"
Global Const $OCR_PROP_PAGE_TYPE_SCATTERED = "scattered"

Global Const $OCR_PROP_OUTPUT_SEPARATE_WORDS = "PROP_OUTPUT_SEPARATE_WORDS"

;~ /** The DPI to be used to render the PDF file; default is 300 if not specified */
Global Const $OCR_PROP_INPUT_PDF_DPI = "PROP_INPUT_PDF_DPI"

;~ // -------- Dictionary related ---------
;~ /** set to 'true' to skip using the default built in dict. Default value: 'false' */
Global Const $OCR_START_PROP_DICT_SKIP_BUILT_IN_DEFAULT = "START_PROP_DICT_SKIP_BUILT_IN_DEFAULT"
;~ /** set to 'true' to skip using all built-in dicts. Default value: 'false' */
Global Const $OCR_START_PROP_DICT_SKIP_BUILT_IN_ALL = "START_PROP_DICT_SKIP_BUILT_IN_ALL"
;~ /** Path to your custom dictionary (words are separated using line breaks). Default value: null */
Global Const $OCR_START_PROP_DICT_CUSTOM_DICT_FILE = "START_PROP_DICT_CUSTOM_DICT_FILE"
;~ /** Path to your custom templates (templates are separated using line breaks). Default value: null */
Global Const $OCR_START_PROP_DICT_CUSTOM_TEMPLATES_FILE = "START_PROP_DICT_CUSTOM_TEMPLATES_FILE"

;~ /** Percentage measuring the importance of the dictionary (0: not at all; 100: extremely important; default: 10) */
Global Const $OCR_PROP_DICT_DICT_IMPORTANCE = "PROP_DICT_DICT_IMPORTANCE"

;~ // -------- PDF output related ---------
Global Const $OCR_PROP_PDF_OUTPUT_FILE = "PROP_PDF_OUTPUT_FILE"
Global Const $OCR_PROP_PDF_OUTPUT_IMAGE_DPI = "PROP_PDF_OUTPUT_IMAGE_DPI"
Global Const $OCR_PROP_PDF_OUTPUT_FONT = "PROP_PDF_OUTPUT_FONT"
Global Const $OCR_PROP_PDF_OUTPUT_TEXT_VISIBLE = "PROP_PDF_OUTPUT_TEXT_VISIBLE"
Global Const $OCR_PROP_PDF_OUTPUT_IMAGE_FORCE_BW = "PROP_PDF_OUTPUT_IMAGE_FORCE_BW"

Global Const $OCR_PROP_PDF_OUTPUT_PDFA = "PROP_PDF_OUTPUT_PDFA"
Global Const $OCR_PROP_PDF_OUTPUT_PDFA_FONT_FILE = "PROP_PDF_OUTPUT_PDFA_FONT_FILE"

;~ /** Text recognized below or above confidence will be highlighted in different colors. */
Global Const $OCR_PROP_PDF_OUTPUT_CONF_THRESHOLD = "PROP_PDF_OUTPUT_CONF_THRESHOLD"

;~ /** Return text in 'text' or 'xml' format */
Global Const $OCR_PROP_PDF_OUTPUT_RETURN_TEXT = "PROP_PDF_OUTPUT_RETURN_TEXT"

;~ // -------- RTF output related ---------

Global Const $OCR_PROP_RTF_OUTPUT_FILE = "PROP_RTF_OUTPUT_FILE"

;~ /** Return text in 'text' or 'xml' format */
Global Const $OCR_PROP_RTF_OUTPUT_RETURN_TEXT = "PROP_RTF_OUTPUT_RETURN_TEXT"

;~ /** default is LETTER, may set to A4. */
Global Const $OCR_PROP_RTF_PAPER_SIZE = "PROP_RTF_PAPER_SIZE"

;~ /** set to false to disable rendering table cells borders into black. Default is true. */
Global Const $OCR_PROP_RTF_SHOW_TABLE_CELL_BORDER = "PROP_RTF_SHOW_TABLE_CELL_BORDER"

;~ // -------- image processing related ---------

;~ /** Image pre-processing type */
Global Const $OCR_PROP_IMG_PREPROCESS_TYPE = "PROP_IMG_PREPROCESS_TYPE"
Global Const $OCR_PROP_IMG_PREPROCESS_TYPE_DEFAULT = "default"
Global Const $OCR_PROP_IMG_PREPROCESS_TYPE_DEFAULT_WITH_ORIENTATION_DETECTION = "default_with_orientation_detection"
Global Const $OCR_PROP_IMG_PREPROCESS_TYPE_CUSTOM = "custom"

;~ /** Image pre-processing command */
Global Const $OCR_PROP_IMG_PREPROCESS_CUSTOM_CMDS = "PROP_IMG_PREPROCESS_CUSTOM_CMDS"

;~ // -------- table related ---------
;~ /** table will be detected by default; set this property to true to skip detection. */
Global Const $OCR_PROP_TABLE_SKIP_DETECTION = "PROP_TABLE_SKIP_DETECTION"

;~ /** default is 32 if not specified */
Global Const $OCR_PROP_TABLE_MIN_SIDE_LENGTH = "PROP_TABLE_MIN_SIDE_LENGTH"

;~ /** Save intermediate images generated for debug purpose - don't specify or empty string to skip saving */
Global Const $OCR_PROP_SAVE_INTERMEDIATE_IMAGES_TO_DIR = "PROP_SAVE_INTERMEDIATE_IMAGES_TO_DIR"

;~ /** Set to true if there is only one image per page on the input PDF file; potentially speed up of the process */
Global Const $OCR_PROP_INPUT_PDF_SINGLE_IMG_PER_PAGE = "PROP_INPUT_PDF_SINGLE_IMG_PER_PAGE"

Global $FUNC_NAME_com_asprise_ocr_version
Global $FUNC_NAME_com_asprise_ocr_setup
Global $FUNC_NAME_com_asprise_ocr_list_supported_langs
Global $FUNC_NAME_com_asprise_ocr_start
Global $FUNC_NAME_com_asprise_ocr_stop
Global $FUNC_NAME_com_asprise_ocr_recognize
Global $FUNC_NAME_com_asprise_ocr_util_delete
Global $FUNC_NAME_com_asprise_ocr_input_license

If @AutoItX64 Then
	$FUNC_NAME_com_asprise_ocr_version = "com_asprise_ocr_version"
	$FUNC_NAME_com_asprise_ocr_setup = "com_asprise_ocr_setup"
	$FUNC_NAME_com_asprise_ocr_list_supported_langs = "com_asprise_ocr_list_supported_langs"
	$FUNC_NAME_com_asprise_ocr_start = "com_asprise_ocr_start"
	$FUNC_NAME_com_asprise_ocr_stop = "com_asprise_ocr_stop"
	$FUNC_NAME_com_asprise_ocr_recognize = "com_asprise_ocr_recognize"
	$FUNC_NAME_com_asprise_ocr_util_delete = "com_asprise_ocr_util_delete"
	$FUNC_NAME_com_asprise_ocr_input_license = "com_asprise_ocr_input_license"
Else
	$FUNC_NAME_com_asprise_ocr_version = "_com_asprise_ocr_version@0"
	$FUNC_NAME_com_asprise_ocr_setup = "_com_asprise_ocr_setup@4"
	$FUNC_NAME_com_asprise_ocr_list_supported_langs = "_com_asprise_ocr_list_supported_langs@0"
	$FUNC_NAME_com_asprise_ocr_start = "_com_asprise_ocr_start@20"
	$FUNC_NAME_com_asprise_ocr_stop = "_com_asprise_ocr_stop@8"
	$FUNC_NAME_com_asprise_ocr_recognize = "_com_asprise_ocr_recognize@52"
	$FUNC_NAME_com_asprise_ocr_util_delete = "_com_asprise_ocr_util_delete@12"
	$FUNC_NAME_com_asprise_ocr_input_license = "_com_asprise_ocr_input_license@8"
EndIf

Global Const $libName = @AutoItX64 ? "aocr_x64.dll" : "aocr.dll"

Global $handle = _WinAPI_LoadLibrary($libName)
Global $func_com_asprise_ocr_input_license = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_input_license)
Global $func_com_asprise_ocr_list_supported_langs = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_list_supported_langs)
Global $func_com_asprise_ocr_recognize = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_recognize)
Global $func_com_asprise_ocr_setup = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_setup)
Global $func_com_asprise_ocr_start = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_start)
Global $func_com_asprise_ocr_stop = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_stop)
Global $func_com_asprise_ocr_util_delete = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_util_delete)
Global $func_com_asprise_ocr_version = _WinAPI_GetProcAddress($handle, $FUNC_NAME_com_asprise_ocr_version)

Func c_com_asprise_ocr_version()
	If $func_com_asprise_ocr_version = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("STR", $func_com_asprise_ocr_version)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_version

Func c_com_asprise_ocr_setup($queryOnly)
	If $func_com_asprise_ocr_setup = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("INT", $func_com_asprise_ocr_setup, "BOOLEAN", $queryOnly)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_setup

Func c_com_asprise_ocr_list_supported_langs()
	If $func_com_asprise_ocr_list_supported_langs = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("STR", $func_com_asprise_ocr_list_supported_langs)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_list_supported_langs

Func c_com_asprise_ocr_start($lang, $speed, $propSpec, $propSeparator, $propKeyValueSpeparator)
	If $func_com_asprise_ocr_start = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("INT64", $func_com_asprise_ocr_start, "STR", $lang, "STR", $speed, "STR", $propSpec, "STR", $propSeparator, "STR", $propKeyValueSpeparator)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_start

Func c_com_asprise_ocr_recognize($handle, $imgFiles, $pageIndex, $startX, $startY, $width, $height, $recognizeType, $outputFormat, $propSpec, $propSeparator, $propKeyValueSpeparator)
	If $func_com_asprise_ocr_recognize = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("STR", $func_com_asprise_ocr_recognize, "INT64", $handle, "STR", $imgFiles, "INT", $pageIndex, "INT", $startX, "INT", $startY, "INT", $width, "INT", $height, "STR", $recognizeType, "STR", $outputFormat, "STR", $propSpec, "STR", $propSeparator, "STR", $propKeyValueSpeparator)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_recognize

Func c_com_asprise_ocr_stop($handle)
	If $func_com_asprise_ocr_stop = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("NONE", $func_com_asprise_ocr_stop, "INT64", $handle)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_stop

Func c_com_asprise_ocr_input_license($licenseeName, $licenseCode)
	If $func_com_asprise_ocr_input_license = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("NONE", $func_com_asprise_ocr_input_license, "STR", $licenseeName, "STR", $licenseCode)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_input_license

Func c_com_asprise_ocr_util_delete($handle, $isArray)
	If $func_com_asprise_ocr_util_delete = 0 Then Return SetError(1, 0, 0)
	Local $a = DllCallAddress("NONE", $func_com_asprise_ocr_util_delete, "INT64", $handle, "BOOLEAN", $isArray)
	If @error <> 0 Then Return SetError(@error, @extended, 0)
	Return $a[0]
EndFunc   ;==>c_com_asprise_ocr_util_delete
