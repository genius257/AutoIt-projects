#AutoIt3Wrapper_Run_AU3Check=Y
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7

#include <AspriseOCR.au3>

_Example()
_WinAPI_FreeLibrary($handle)

Func _Example()
	Local $fileImg = FileOpenDialog("Choose an image to extract text/information", @ScriptDir, "Images (*.jpg;*.jpeg;*.bmp;*.png)|All (*.*)")
	If @error <> 0 Then Return

	ConsoleWrite("Version: " & c_com_asprise_ocr_version() & @CRLF)
	Local $setup = c_com_asprise_ocr_setup(False)
	If Not ($setup = 1) Then Return ConsoleWrite("Failed to setup. code: " & $setup & @CRLF)

;~ $ptrToApi = c_com_asprise_ocr_start("eng", $OCR_SPEED_FASTEST, NULL, NULL, NULL)
;~ $ptrToApi = c_com_asprise_ocr_start("eng", $OCR_SPEED_FAST, NULL, NULL, NULL)
	Local $ptrToApi = c_com_asprise_ocr_start("eng", $OCR_SPEED_SLOW, Null, Null, Null)
	If ($ptrToApi == 0) Then Return ConsoleWrite("Failed to start." & @CRLF)

	ConsoleWrite("OCR engine started. " & @CRLF)
	Local $hTimer = TimerInit()
	Local $s = c_com_asprise_ocr_recognize($ptrToApi, $fileImg, -1, -1, -1, -1, -1, $OCR_RECOGNIZE_TYPE_ALL, $OCR_OUTPUT_FORMAT_PDF, "PROP_PDF_OUTPUT_FILE=result.pdf,PROP_PDF_OUTPUT_TEXT_VISIBLE=true,PROP_PDF_OUTPUT_IMAGE_FORCE_BW=true,PROP_OUTPUT_SEPARATE_WORDS=false,PROP_PDF_OUTPUT_RETURN_TEXT=text", ",", "=")
	Local $fDiff = TimerDiff($hTimer) ; Find the difference in time from the previous call of TimerInit. The variable we stored the TimerInit handlem is passed as the "handle" to TimerDiff.
	ConsoleWrite("! Recognition time = " & $fDiff/1000 & " seconds" & @CRLF)
	ConsoleWrite("Returned: " & $s & @CRLF)
	c_com_asprise_ocr_stop($ptrToApi)

EndFunc   ;==>_Example
