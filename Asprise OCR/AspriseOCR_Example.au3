#include <AspriseOCR.au3>

$fileImg=FileOpenDialog("Choose an image to extract text/information", Default, "Images (*.jpg;*.jpeg;*.bmp;*.png)|All (*.*)")
If @error<>0 Then
	_WinAPI_FreeLibrary($handle)
	Exit
EndIf
ConsoleWrite("Version: "&c_com_asprise_ocr_version()&@CRLF)
$setup=c_com_asprise_ocr_setup(false)
If Not ($setup=1) Then Exit ConsoleWrite("Failed to setup. code: "&$setup&@CRLF)
;~ $ptrToApi = c_com_asprise_ocr_start("eng", $OCR_SPEED_FASTEST, NULL, NULL, NULL)
;~ $ptrToApi = c_com_asprise_ocr_start("eng", $OCR_SPEED_FAST, NULL, NULL, NULL)
$ptrToApi = c_com_asprise_ocr_start("eng", $OCR_SPEED_SLOW, NULL, NULL, NULL)
if ($ptrToApi == 0) Then Exit ConsoleWrite("Failed to start."&@CRLF)
ConsoleWrite("OCR engine started. "&@CRLF)
$s = c_com_asprise_ocr_recognize($ptrToApi, $fileImg, -1, -1, -1, -1, -1, $OCR_RECOGNIZE_TYPE_ALL, $OCR_OUTPUT_FORMAT_PDF,"PROP_PDF_OUTPUT_FILE=result.pdf,PROP_PDF_OUTPUT_TEXT_VISIBLE=true,PROP_PDF_OUTPUT_IMAGE_FORCE_BW=true,PROP_OUTPUT_SEPARATE_WORDS=false,PROP_PDF_OUTPUT_RETURN_TEXT=text", ",", "=")
ConsoleWrite("Returned: "&$s&@CRLF)
c_com_asprise_ocr_stop($ptrToApi)

_WinAPI_FreeLibrary($handle)