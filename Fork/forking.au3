#include <WinAPI.au3>
#include "Fork.au3"

If $CmdLine[0] = 0 Then
	$iPID = Run(@AutoItExe & ' "' & @ScriptFullPath & '" '&String(ptr(0)), @WorkingDir)
;~ 	_WinAPI_RegisterWaitForSingleObject
Else
	Global $hKernel32 = DllOpen("Kernel32.dll")
	$tPROCESSENTRY32 = GetProcessEntry(@AutoItPID)
;~ 	MsgBox(0, "", "PID: "&$tPROCESSENTRY32.th32ParentProcessID)
	DllClose($hKernel32)
	ProcessWaitClose($tPROCESSENTRY32.th32ParentProcessID)
	Exit
EndIf

Global $hKernel32 = DllOpen("Kernel32.dll")
;~ $iPID = Run(@AutoItExe & ' "' & @ScriptFullPath & '"', @WorkingDir)

;~ StdoutRead

;~ Global Const $tagPROCESSENTRY32 = "dword dwsize;dword cntUsage;dword th32ProcessID;uint th32DefaultHeapID;dword th32ModuleID;dword cntThreads;dword th32ParentProcessID;long pcPriClassBase;dword dwFlags;char szExeFile[260]"
;~ $tPROCESSENTRY32 = DllStructCreate($tagPROCESSENTRY32)
;~ $tPROCESSENTRY32.dwSize = DllStructGetSize($tPROCESSENTRY32)
;~ $pPROCESSENTRY32 = DllStructGetPtr($tPROCESSENTRY32)

ConsoleWrite("PID: "&@AutoItPID&@CRLF)

;~ $bSuccess = 0

;~ $hSnapshot = CreateToolhelp32Snapshot($TH32CS_SNAPPROCESS, @AutoItPID)
;~ ConsoleWrite("$hSnapshot: "&$hSnapshot&@CRLF)
;~ $bSuccess = Process32First($hSnapshot, $pPROCESSENTRY32)
;~ ConsoleWrite("PID: "&$tPROCESSENTRY32.th32ProcessID&@CRLF)
;~ While $bSuccess
;~ 	If Process32Next($hSnapshot, $pPROCESSENTRY32) = 0 Then ExitLoop
;~ 	If $tPROCESSENTRY32.th32ProcessID = @AutoItPID Then ExitLoop
;~ 	ConsoleWrite("PID: "&$tPROCESSENTRY32.th32ProcessID&@CRLF)
;~ WEnd
;~ ConsoleWrite("th32ParentProcessID: "&$tPROCESSENTRY32.th32ParentProcessID&@CRLF)
;~ CloseHandle($hSnapshot)
;~ DllClose($hKernel32)

$tPROCESSENTRY32 = GetProcessEntry(@AutoItPID)
ConsoleWrite("@error: "&@error&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.th32ProcessID&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.szExeFile&@CRLF)
$tPROCESSENTRY32 = GetProcessEntry($tPROCESSENTRY32.th32ParentProcessID)
ConsoleWrite("@error: "&@error&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.th32ProcessID&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.szExeFile&@CRLF)
$tPROCESSENTRY32 = GetProcessEntry($tPROCESSENTRY32.th32ParentProcessID)
ConsoleWrite("@error: "&@error&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.th32ProcessID&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.szExeFile&@CRLF)
$tPROCESSENTRY32 = GetProcessEntry($tPROCESSENTRY32.th32ParentProcessID)
ConsoleWrite("@error: "&@error&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.th32ProcessID&@CRLF)
ConsoleWrite("PID: "&$tPROCESSENTRY32.szExeFile&@CRLF)

DllClose($hKernel32)

Func GetProcessEntry($iPID)
	Local $tPROCESSENTRY32 = DllStructCreate($tagPROCESSENTRY32)
	$tPROCESSENTRY32.dwSize = DllStructGetSize($tPROCESSENTRY32)
	Local $pPROCESSENTRY32 = DllStructGetPtr($tPROCESSENTRY32)

	Local $hSnapshot = CreateToolhelp32Snapshot($TH32CS_SNAPPROCESS, $iPID)
	Local $bSuccess = Process32First($hSnapshot, $pPROCESSENTRY32)
	While $bSuccess
		$bSuccess = Process32Next($hSnapshot, $pPROCESSENTRY32)
;~ 		If Process32Next($hSnapshot, $pPROCESSENTRY32) = 0 Then ExitLoop
		If $bSuccess = 0 Then ExitLoop
		If $tPROCESSENTRY32.th32ProcessID = $iPID Then ExitLoop
	WEnd
	CloseHandle($hSnapshot)
	Return SetError(($bSuccess)?0:1, 0, $tPROCESSENTRY32)
EndFunc

Func CloseHandle($hObject)
	$aRet = DllCall($hKernel32, "int", "CloseHandle", "long", $hObject)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func Process32Next($hSnapshot, $lppe)
	$aRet = DLLCall($hKernel32, "int", "Process32Next", "long", $hSnapshot, "ptr", $lppe)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func Process32First($hSnapshot, $lppe)
	$aRet = DllCall($hKernel32, "int", "Process32First", "long", $hSnapshot, "ptr", $lppe)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func CreateToolhelp32Snapshot($dwFlags, $th32ProcessID)
	$aRet = DllCall($hKernel32, "ptr", "CreateToolhelp32Snapshot", "dword", $dwFlags, "dword", $th32ProcessID)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc