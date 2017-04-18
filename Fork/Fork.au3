#include <ProcessConstants.au3>
#include <WinAPI.au3>
#include <WinAPIProc.au3>

Global Const $_tagPROCESSENTRY32 = "dword dwsize;dword cntUsage;dword th32ProcessID;uint th32DefaultHeapID;dword th32ModuleID;dword cntThreads;dword th32ParentProcessID;long pcPriClassBase;dword dwFlags;char szExeFile[260]"
Global Const $TH32CS_SNAPPROCESS = 0x00000002

Func Fork()
	Local $iPID
	If @Compiled Then
		$iPID=Run(@ScriptFullPath)
	Else
		$iPID=Run(@AutoItExe & ' "' & @ScriptFullPath & '"')
	EndIf
	Return $iPID
EndFunc

Func ForkPos($iPID=@AutoItPID)
	Local $iPos=0
	Local $hProcess, $hParentProcess
	Local $sFileName1, $sFileName2
	Local $tPROCESSENTRY32

	While 1
		$tPROCESSENTRY32 = _WinAPI_GetProcessEntry($iPID)
		$hProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION + $PROCESS_VM_READ, 0, $tPROCESSENTRY32.th32ProcessID)
		$hParentProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION + $PROCESS_VM_READ, 0, $tPROCESSENTRY32.th32ParentProcessID)
		$sFileName1 = _WinAPI_GetModuleFileNameEx($hProcess, 0)
		$sFileName2 = _WinAPI_GetModuleFileNameEx($hParentProcess, 0)

		_WinAPI_CloseHandle($hProcess)
		_WinAPI_CloseHandle($hParentProcess)
		If Not ($sFileName1=$sFileName2) Then ExitLoop
		$iPos+=1
		$iPID=$tPROCESSENTRY32.th32ParentProcessID
	WEnd

	Return @Compiled?$iPos:$iPos-1
EndFunc

Func ForkHwnd($iPID)
	Local Static $lpEnumFunc=DllCallbackRegister("Fork_EnumWindowsProc", "BOOLEAN", "HANDLE;LPARAM")
	Local $t=DllStructCreate("DWORD PID;HANDLE HWND;")
	$t.PID=$iPID
	Local $aRet=DllCall("User32.dll", "BOOLEAN", "EnumWindows", "HANDLE", DllCallbackGetPtr($lpEnumFunc), "LPARAM", DllStructGetPtr($t))
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $t.HWND
EndFunc

Volatile Func Fork_EnumWindowsProc($hWnd, $lParam)
	Local $iPID, $t=DllStructCreate("DWORD PID;HANDLE HWND;", $lParam)
	If @error<>0 Then Return False
	Local $iThreadID=_WinAPI_GetWindowThreadProcessId($hWnd, $iPID)
	If $iPID=$t.PID Then
;~ 		ConsoleWrite("match"&@CRLF)
		$t.HWND=$hWnd
		ConsoleWrite("Class: "&_WinAPI_GetClassName($hWnd)&@CRLF)
;~ 		Return False
	EndIf
	Return True
EndFunc

Func Fork_WM_COPYDATA($hWnd, $iMsg, $wParam, $lParam)
	Return ConsoleWrite("WM_COPYDATA("&$hWnd&", "&$iMsg&", "&$wParam&", "&$lParam&")"&@CRLF)
EndFunc

Func _WinAPI_RegisterWaitForSingleObject();TODO

EndFunc

Func _WinAPI_GetProcessEntry($iPID)
	Local $tPROCESSENTRY32 = DllStructCreate($_tagPROCESSENTRY32)
	$tPROCESSENTRY32.dwSize = DllStructGetSize($tPROCESSENTRY32)
	Local $pPROCESSENTRY32 = DllStructGetPtr($tPROCESSENTRY32)

	Local $hSnapshot = _WinAPI_CreateToolhelp32Snapshot($TH32CS_SNAPPROCESS, $iPID)
	Local $bSuccess = _WinAPI_Process32First($hSnapshot, $pPROCESSENTRY32)
	While $bSuccess
		$bSuccess = _WinAPI_Process32Next($hSnapshot, $pPROCESSENTRY32)
		If $bSuccess = 0 Then ExitLoop
		If $tPROCESSENTRY32.th32ProcessID = $iPID Then ExitLoop
	WEnd
	_WinAPI_CloseHandle($hSnapshot)
	Return SetError(($bSuccess)?0:1, 0, $tPROCESSENTRY32)
EndFunc

;~ Func _WinAPI_CloseHandle($hKernel32, $hObject)
;~ 	Local $aRet = DllCall($hKernel32, "int", "CloseHandle", "long", $hObject)
;~ 	If @error<>0 Then Return SetError(@error, @extended, 0)
;~ 	Return $aRet[0]
;~ EndFunc

Func _WinAPI_Process32Next($hSnapshot, $lppe)
	Local $aRet = DLLCall("Kernel32.dll", "int", "Process32Next", "long", $hSnapshot, "ptr", $lppe)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func _WinAPI_Process32First($hSnapshot, $lppe)
	Local $aRet = DllCall("Kernel32.dll", "int", "Process32First", "long", $hSnapshot, "ptr", $lppe)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func _WinAPI_CreateToolhelp32Snapshot($dwFlags, $th32ProcessID)
	Local $aRet = DllCall("Kernel32.dll", "ptr", "CreateToolhelp32Snapshot", "dword", $dwFlags, "dword", $th32ProcessID)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc