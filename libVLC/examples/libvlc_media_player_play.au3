#include "..\LibVLC.au3"

Opt("GuiOnEventMode", 1)

$hWnd = GUICreate("AutoIt + VLC Example", 700, 320)
GUISetState(@SW_SHOW, $hWnd)

$WorkingDir=@WorkingDir

;pick a short video/audio-file, if you want to get the event
$sFilePath = FileOpenDialog("Select VLC compatible file", "", "All (*.*)", 1+2, "", $hWnd)
If @error<>0 Then Exit

FileChangeDir($WorkingDir);set @WorkingDir back, thanks to silly FileOpenDialog logic

$hLibVLC_dll = DllOpen("libvlc.dll")

If $hLibVLC_dll=-1 Then Exit MsgBox(0, "", "libvlc.dll filed to load. Script exitting")

$hVLC = libvlc_new($hLibVLC_dll, 0, 0)
$m = libvlc_media_new_path($hLibVLC_dll, $hVLC, $sFilePath);path object
$mp = libvlc_media_player_new_from_media($hLibVLC_dll, $m);player object
libvlc_media_release($hLibVLC_dll, $m);release the path object. We're done with it.
$mp_em = libvlc_media_player_event_manager($hLibVLC_dll, $mp);player event manager

;Create dllcallback to function and set to event: media player end reached
$pEndReached = DllCallbackRegister("_VLC_Event_EndReached", "none:cdecl", "handle;handle")
libvlc_event_attach($hLibVLC_dll, $mp_em, $libvlc_MediaPlayerEndReached, DllCallbackGetPtr($pEndReached), 0)

libvlc_media_player_set_hwnd($hLibVLC_dll, $mp, $hWnd)
libvlc_media_player_play($hLibVLC_dll, $mp)

;~ OnAutoItExitRegister("_CleanUp")
GUISetOnEvent(-3, "_MyExit", $hWnd)

While 1
    Sleep(10)
WEnd

Func _CleanUp()
    libvlc_media_player_stop($hLibVLC_dll, $mp);stop the video
    libvlc_media_player_release($hLibVLC_dll, $mp)
    libvlc_release($hLibVLC_dll, $hVLC)
    DllClose($hLibVLC_dll)
    DllCallbackFree($pEndReached)
    GUIDelete($hWnd)
EndFunc

Func _MyExit()
    _CleanUp()
    Exit
EndFunc

Func _VLC_Event_EndReached($event, $data); the event function
    ConsoleWrite("EndReached"&@CRLF)
EndFunc