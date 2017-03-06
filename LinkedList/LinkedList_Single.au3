#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.14.2
 Author........: genius257
 Version.......: 1.0.0
#ce ----------------------------------------------------------------------------

#include <WinAPISys.au3>
#include <Memory.au3>

Global Const $tagLinkedList = "ptr string;ptr next"
Global Const $tLinkedList = DllStructCreate($tagLinkedList)

Func LinkedList_Pop($iIndex=0)
	$_tLinkedList = LinkedList_Item($iIndex)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	If $_tLinkedList.next = 0 Then Return SetError(-3, -3, 0)
	$__tLinkedList = DllStructCreate($tagLinkedList, $_tLinkedList.next)
	$_tLinkedList.next = $__tLinkedList.next

	$__tLinkedList.next=0
	Return $__tLinkedList
EndFunc

Func LinkedList_Push($sString, $iIndex=-1)
	Local $_tLinkedList = DllStructCreate($tagLinkedList)
	Local $_pLinkedList
	Local $__tLinkedList
	If Not(($iIndex>0) Or ($iIndex==-1)) Then Return SetError(-1, -1, 0)
	$__tLinkedList = ($iIndex==-1)?LinkedList_Last():LinkedList_Item($iIndex-1)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	$_tLinkedList.string = _WinAPI_CreateString($sString)
	$_pLinkedList = MemCloneGlob($_tLinkedList)
	If ($iIndex>0) Then
		$_tLinkedList = DllStructCreate($tagLinkedList, $_pLinkedList)
		$_tLinkedList.next = $__tLinkedList.next
		$__tLinkedList.next = $_pLinkedList
	Else
		$__tLinkedList.next = $_pLinkedList
	EndIf
EndFunc

Func LinkedList_Item($iIndex)
	If $iIndex<0 Then Return SetError(-1, -1, 0)
	Local $_tLinkedList = DllStructCreate($tagLinkedList, DllStructGetPtr($tLinkedList))
	Local $_pLinkedList = $_tLinkedList.next
	Local $i
	For $i=1 To $iIndex
		If $_pLinkedList = 0 Then Return SetError(-2, -2, 0)
		$_tLinkedList = DllStructCreate($tagLinkedList, $_pLinkedList)
		$_pLinkedList = $_tLinkedList.next
	Next
	Return $_tLinkedList
EndFunc

Func LinkedList_Last()
	Local $_tLinkedList = DllStructCreate($tagLinkedList, DllStructGetPtr($tLinkedList))
	Local $_pLinkedList = $_tLinkedList.next
	Local $i=0
	While 1
		If $_pLinkedList = 0 Then ExitLoop
		$_tLinkedList = DllStructCreate($tagLinkedList, $_pLinkedList)
		$_pLinkedList = $_tLinkedList.next
		$i+=1
	WEnd
	Return SetExtended($i, $_tLinkedList)
EndFunc

Func LinkedList_Count()
	LinkedList_Last()
	Return @extended
EndFunc

Func LinkedList_Each($fProc)
	If Not IsFunc($fProc) Then Return SetError(-4, -4, 0)
	Local $_tLinkedList = DllStructCreate($tagLinkedList, DllStructGetPtr($tLinkedList))
	Local $_pLinkedList = $_tLinkedList.next
	Local $i=0
	Local $mVar
	While 1
		If $_pLinkedList = 0 Then ExitLoop
		$_tLinkedList = DllStructCreate($tagLinkedList, $_pLinkedList)
		$_pLinkedList = $_tLinkedList.next
		$mVar = Call($fProc, $_tLinkedList, $i)
		If @error<>0 Then Return SetError(@error, @extended, 0)
		If $mVar==False Then ExitLoop
		$i+=1
	WEnd
EndFunc

Func LinkedListItem_Unset($t)
	$hData = GlobalHandle(DllStructGetPtr($t))
	_WinAPI_FreeMemory($t.string)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	_MemGlobalFree($hData)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	Return 1
EndFunc

Func MemCloneGlob($tObject);clones DllStruct to memory and returns pointer to new allocated memory
	Local $iSize = DllStructGetSize($tObject)
	Local $hData = _MemGlobalAlloc($iSize, $GMEM_MOVEABLE)
	Local $pData = _MemGlobalLock($hData)
	_MemMoveMemory(DllStructGetPtr($tObject), $pData, $iSize)
	Return $pData
EndFunc

Func GlobalHandle($pMem)
	$aRet = DllCall("Kernel32.dll", "ptr", "GlobalHandle", "ptr", $pMem)
	If @error<>0 Then Return SetError(@error, @extended, 0)
	If $aRet[0]=0 Then Return SetError(-1, @extended, 0)
	Return $aRet[0]
EndFunc
