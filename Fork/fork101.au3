Opt("TrayIconHide", 1)

#include <ProcessConstants.au3>
#include <WinAPI.au3>
#include <WinAPIProc.au3>
#include <SendMessage.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>

#include "Fork.au3"

Opt("TrayOnEventMode", 1)
Opt("GUIOnEventMode", 1)

;~ _WinAPI_SetWindowDisplayAffinity

;~ If Not @Compiled Then Exit MsgBox(0, "sorry", "debugging with non compiled application not implemented yet.")

;~ Global Const $tagPROCESSENTRY32 = "dword dwsize;dword cntUsage;dword th32ProcessID;uint th32DefaultHeapID;dword th32ModuleID;dword cntThreads;dword th32ParentProcessID;long pcPriClassBase;dword dwFlags;char szExeFile[260]"
;~ Global Const $_tagPROCESSENTRY32 = "dword dwsize;dword cntUsage;dword th32ProcessID;uint th32DefaultHeapID;dword th32ModuleID;dword cntThreads;dword th32ParentProcessID;long pcPriClassBase;dword dwFlags;char szExeFile[260]"
;~ Global Const $TH32CS_SNAPPROCESS = 0x00000002

;~ Global Const $WM_COPYDATA = 0x004A

Global Const $_tagDataStruct = "wchar info[255]"

Global $hKernel32 = DllOpen("Kernel32.dll")
;~ _WinAPI_SetProcessAffinityMask ;TODO
;~ _WinAPI_CreateEvent ;TODO


$iForkPos=ForkPos()

$hWnd = GUICreate("", 0, 0, 0, 0, $WS_POPUP, $WS_EX_TRANSPARENT, 0)
GUIRegisterMsg($WM_COPYDATA, "Fork_WM_COPYDATA")
;~ GUISetState(@SW_SHOW, $hWnd)
If $iForkPos<0 Then
	Exit MsgBox(0, "Stray fork", "An error occured, when trying to dectect fork heierchy position."&@CRLF&"This may have occured if parent process closed too early, or permission issues.")
ElseIf $iForkPos>0 Then
	MsgBox(0, "", @AutoItPID&": is #"&$iForkPos&" level child."&@CRLF)
;~ 	If $iForkPos<3 Then $iPID = Fork()
;~ 	$t=_WinAPI_GetProcessEntry(@AutoItPID)
;~ 	$hParentHwnd=ForkHwnd($t.th32ParentProcessID)
;~ 	MsgBox(0, "parent", $t.th32ParentProcessID)
;~ 	MsgBox(0, "", "HWND: "&$hParentHwnd&@CRLF)
;~ 	_SendMessage($hParentHwnd, $WM_COPYDATA, 0, 0)
;~ 	MsgBox(0, @error&"#"&$iForkPos, "Pause")
Else
;~ 	MsgBox(0, "#"&$iForkPos, "Creating a fork...")
	$iPID = Fork()
;~ 	MsgBox(0, "parent hwnd", $hWnd)
;~ 	_SendMessage($hWnd, $WM_COPYDATA, 0, 0)
	Sleep(1000)
	$hForkWnd=ForkHwnd($iPID)
;~ 	ConsoleWrite("HWND: "&$hForkWnd&@CRLF)
;~ 	_WinAPI_RegisterWaitForSingleObject($iPID)
;~ 	MsgBox(0, "#"&$iForkPos, "Parent pause")
;~ 	While 1
;~ 		Sleep(10)
;~ 	WEnd
	MsgBox(0, "", "Waiting")
EndIf

;~ DllCallAddress(

Exit

;~ MsgBox(0, "", $CmdLine[0])
;~ $iPID = Run(@ScriptFullPath)
;~ _WinAPI_CreateProcess("dunno", "",

$tPROCESSENTRY32 = _WinAPI_GetProcessEntry(@AutoItPID)
$hProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION + $PROCESS_VM_READ, 0, $tPROCESSENTRY32.th32ProcessID)
$hParentProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION + $PROCESS_VM_READ, 0, $tPROCESSENTRY32.th32ParentProcessID)
$sFileName1 = _WinAPI_GetModuleFileNameEx($hProcess, 0)
$sFileName2 = _WinAPI_GetModuleFileNameEx($hParentProcess, 0)

Global $Thread = ($sFileName1==$sFileName2)

;~ $_hWnd = GUICreate("msg", 100, 100)

$tPROCESSENTRY32 = GetProcessEntry(@AutoItPID)
MsgBox(0, "", $tPROCESSENTRY32.th32ProcessID)
$hProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION + $PROCESS_VM_READ, 0, $tPROCESSENTRY32.th32ProcessID)
$hParentProcess = _WinAPI_OpenProcess($PROCESS_QUERY_INFORMATION + $PROCESS_VM_READ, 0, $tPROCESSENTRY32.th32ParentProcessID)
MsgBox(0, @error, _WinAPI_GetLastErrorMessage())
$sFileName1 = _WinAPI_GetModuleFileNameEx($hProcess, 0)
$sFileName2 = _WinAPI_GetModuleFileNameEx($hParentProcess, 0)
MsgBox(0, @error, _WinAPI_GetLastErrorMessage())
CloseHandle($hProcess)
CloseHandle($hParentProcess)

MsgBox(0, "", $sFileName1&@CRLF&$sFileName2&@CRLF&($sFileName1==$sFileName2))
$sCommandLine = _WinAPI_GetCommandLine()
MsgBox(0, "", $sCommandLine&@CRLF&'"'&$sFileName1&'"'&@CRLF&($sCommandLine=('"'&$sFileName1&'" ')))
_SendMessage($hWnd, $WM_COPYDATA, 0, 0)
;~ FileWriteLine("fork101.txt", $sCommandLine)
;~ FileWriteLine("fork101.txt", '"'&$sFileName1&'"')
;~ _winapi_GetWindowThreadProcessId(
;~ _winapi_EnumWindows(False)

Func _WinAPI_GetCommandLine()
	$aRet=DllCall("Kernel32.dll", "WSTR", "GetCommandLineW")
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return $aRet[0]
EndFunc

Func GetProcessEntry($iPID)
	Local $tPROCESSENTRY32 = DllStructCreate($_tagPROCESSENTRY32)
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