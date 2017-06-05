#include <Array.au3>
#include <IE.au3>

$sUrl="about:blank"
$iTryAttach=0
$iVisible=1
$iWait=1
$iTakeFocus=0

$hFile = FileOpen(@ScriptDir&"\"&@ScriptName&".result.au3", 2)

$oIE = Execute("_IECreate($sUrl, $iTryAttach, $iVisible, $iWait, $iTakeFocus)")
$oIE_2 = Execute("_IECreate($sUrl, $iTryAttach, $iVisible, $iWait, $iTakeFocus)")
$oIE_3 = Execute("_IECreate($sUrl, $iTryAttach, $iVisible, $iWait, $iTakeFocus)")
;~ _IEAttach(HWnd($oIE.hwnd), "hwnd", HWnd($oIE.hwnd))
_IENavigate($oIE, "https://msdn.microsoft.com/en-us/library/dd374158(v=vs.85).aspx")
$oFunctions = $oIE.document.querySelectorAll('td[data-th="Function"]')
$iFunctions = $oFunctions.length-1
For $i=44 To $iFunctions
	ConsoleWrite($i&" of "&$iFunctions&@CRLF)
;~ 	MsgBox(0, "", StringRegExp($oFunctions.Item($i).innerText, " functions$", 0))
;~ 	_IEQuit($oIE)
;~ 	_IEQuit($oIE_2)
;~ 	Exit
	$oA = $oFunctions.Item($i).getElementsByTagName("a")
	$iA = $oA.length-1
	For $i2=0 To $iA
;~ 		FileWrite($hFile, ";"&$oFunctions.Item($i).innerText&@CRLF)
		FileWrite($hFile, ";"&$oA.Item($i2).innerText&@CRLF)
		FileWrite($hFile, ";"&$oA.Item($i2).href&@CRLF)
		_IENavigate($oIE_2, $oA.Item($i2).href)
		If StringRegExp($oIE_2.document.querySelectorAll("#page #body #content .topic .title").item(0).innerText, " Functions$", 0) Then
	;~ 	If StringRegExp($oFunctions.Item($i).innerText, " functions$", 0) Then;document.querySelectorAll("#page #body #content .topic .title")[0].innerText
			$oFunctions_2 = $oIE_2.document.querySelectorAll("#mainSection ul a")
			For $j=0 To $oFunctions_2.length-1
				FileWrite($hFile, @TAB&";"&$oFunctions_2.Item($j).innerText&@CRLF)
				FileWrite($hFile, @TAB&";"&$oFunctions_2.Item($j).href&@CRLF)
				_IENavigate($oIE_3, $oFunctions_2.Item($j).href)
				$oFunctions_3 = $oIE_3.document.querySelectorAll('td[data-th="Function"]')
	;~ 			ConsoleWrite($oIE_3.document.querySelectorAll("[id^='CodeSnippetContainerCode_']").Item(0).innerText&@CRLF)
				$a = $oIE_3.document.querySelectorAll("#mainSection .contentTableWrapper [summary='table'] [scope='row']")
				FileWrite($hFile, @TAB&StringReplace(ParseCode($oIE_3.document.querySelectorAll("[id^='CodeSnippetContainerCode_']").Item(0).innerText, '"'&$a.item($a.length-1).nextSibling.innerText&'"'), @CRLF, @CRLF&@TAB)&@CRLF)
			Next
		Else
	;~ 		ConsoleWrite($oIE_2.document.body.innerHTML&@CRLF)
	;~ 		ConsoleWrite($oIE_2.document.querySelectorAll("[id^='CodeSnippetContainerCode_']").Item(0).innerText&@CRLF)
	;~ 		$a = $oIE_2.document.querySelectorAll("#mainSection .contentTableWrapper [summary='table'] [scope='row']")[4].nextSibling.innerText
			$a = $oIE_2.document.querySelectorAll("#mainSection .contentTableWrapper [summary='table'] [scope='row']")
			FileWrite($hFile, ParseCode($oIE_2.document.querySelectorAll("[id^='CodeSnippetContainerCode_']").Item(0).innerText, '"'&$a.item($a.length-1).nextSibling.innerText&'"')&@CRLF)
		EndIf
	Next
Next

FileClose($hFile)

_IEQuit($oIE)
_IEQuit($oIE_2)
_IEQuit($oIE_3)
Exit

Func ParseCode($string, $dll="$DLL")
;~ 	Local Const $pattern = "([a-zA-Z0-9]+)[\s]+[a-zA-Z0-9]+[\s]+([a-zA-Z0-9]+)[\s]*[(]((?:[\s]*[a-zA-Z0-9]+[\s]+[a-zA-Z0-9]+[,])[\s]+[a-zA-Z0-9]+[\s]+[a-zA-Z0-9])[)][;]"
	Local Const $pattern = "([a-zA-Z0-9_]+)[\s]+(?:[a-zA-Z0-9_]+[\s]+)?([a-zA-Z0-9_]+)[\s]*[(]((?:[\s]*(?:const[\s]+)?[a-zA-Z0-9_]+[\s]+[*]?[a-zA-Z0-9_]+[,])*[\s]*(?:const[\s]+)?[a-zA-Z0-9_]+[\s]+[*]*[a-zA-Z0-9_]+|void)[\s]*[\)][;]"
	Local Const $subpattern = "[\s]*([a-zA-Z0-9_]+)[\s]+([*]?)([a-zA-Z0-9_]+)(?:[,]|$)"
	Local Const $replace = [["void","NONE"],["LPCSTR","STR"],["LPSTR","STR"],["LPCWSTR","WSTR"],["LPWSTR","WSTR"],["LPVOID","PTR"],["HINSTANCE","HANDLE"],["HRESULT","LONG"],["LONGLONG","INT64"],["LARGE_INTEGER","INT64"],["ULONGLONG","UINT64"],["ULARGE_INTEGER","UINT64"],["SIZE_T","ULONG_PTR"]]
	Local $f,$g,$i,$j
	Local $a=StringRegExp($string, $pattern, 1)
;~ 	ConsoleWrite(@error&@CRLF)

	$j=_ArraySearch($replace, $a[0], 0, 0, 0, 0, 1, 0)
	$a[0]=($j>=0)?'"'&$replace[$j][1]&'"':'$'&$a[0]
	$f='DllCall('&$dll&','&$a[0]&',"'&$a[1]&'"'
	$g='Func '&$a[1]&'('
	Local $b=StringRegExp($a[2], $subpattern, 3)
	For $i=0 To UBound($b,1)-1 Step +3
;~ 		$f&=',$'&$b[$i]&',$'&$b[$i+2]
		$f&=','&(($b[$i+1]=="")?'$'&$b[$i]:'"PTR"')&',$'&$b[$i+2]
		$g&='$'&$b[$i+2]&','
	Next
	$g=StringMid($g,1,StringLen($g)-1)&')'
	$f&=")"
;~ 	MsgBox(0, "", ($a[0]=='"'&$replace[0][1]&'"')?1:0)
	If Not ($a[0]=='"'&$replace[0][1]&'"') Then
		Return ($g&@CRLF& _
		@TAB&"Local $a="&$f&@CRLF& _
		@TAB&"If @error<>0 Then Return SetError(@error, @extended, 0)"&@CRLF& _
		@TAB&"Return $a"&@CRLF& _
		"EndFunc")
	Else
		Return ($g&@CRLF& _
		@TAB&$f&@CRLF& _
		@TAB&"If @error<>0 Then Return SetError(@error, @extended, 0)"&@CRLF& _
		"EndFunc")
	EndIf
;~ 	_ArrayDisplay($b)
EndFunc