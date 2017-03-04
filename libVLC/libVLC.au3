#cs ----------------------------------------------------------------------------
; Title .............: LibVLC
; AutoIt Version.....: 3.3.14.2
; Description .......: Functions to use with the libvlc.dll, based on the offical vlc documentation
; Author.............: Genius257
; Target VLC Version.: 2.2.4
#ce ----------------------------------------------------------------------------

#Region group_libvlc ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc.html

	#Region group_libvlc_renderer_discoverer ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__renderer__discoverer.html
		Func libvlc_renderer_item_name($hLibVLC_dll, $p_item)
			$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_renderer_item_name", "handle", $p_item)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_item_type($hLibVLC_dll, $p_item)
			$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_renderer_item_type", "handle", $p_item)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_item_icon_uri($hLibVLC_dll, $p_item)
			$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_renderer_item_icon_uri", "handle", $p_item)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_item_flags($hLibVLC_dll, $p_item)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_renderer_item_flags", "handle", $p_item)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_discoverer_new($hLibVLC_dll, $p_inst, $psz_name)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_renderer_discoverer_new", "handle", $p_inst, "str", $psz_name)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_discoverer_release($hLibVLC_dll, $p_rd)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_renderer_discoverer_release", "handle", $p_rd)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_renderer_discoverer_start($hLibVLC_dll, $p_rd)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_renderer_discoverer_start", "handle", $p_rd)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_discoverer_stop($hLibVLC_dll, $p_rd)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_renderer_discoverer_stop", "handle", $p_rd)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_renderer_discoverer_event_manager($hLibVLC_dll, $p_rd)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_renderer_discoverer_event_manager", "handle", $p_rd)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_discoverer_list_get($hLibVLC_dll, $p_inst, $ppp_services)
			$aRet = DllCall($hLibVLC_dll, "uint:cdecl", "libvlc_renderer_discoverer_list_get", "handle", $p_inst, "handle", $ppp_services)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_renderer_discoverer_list_release($hLibVLC_dll, $pp_services, $i_count)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_renderer_discoverer_list_release", "handle", $pp_services, "uint", $i_count)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc
	#EndRegion group_libvlc_renderer_discoverer

	#Region group_libvlc_dialog ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__dialog.html
		Func libvlc_dialog_set_callbacks($hLibVLC_dll, $p_instance, $p_cbs, $p_data)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_dialog_set_callbacks", "handle", $p_instance, "handle", $p_cbs, "handle", $p_data)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_dialog_set_context($hLibVLC_dll, $p_id, $p_context)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_dialog_set_context", "handle", $p_id, "handle", $p_context)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_dialog_get_context($hLibVLC_dll, $p_id)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_dialog_get_context", "handle", $p_id)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_dialog_post_login($hLibVLC_dll, $p_id, $psz_username, $psz_password, $b_store)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_dialog_post_login", "handle", $p_id, "str", $psz_username, "str", $psz_password, "bool", $b_store)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_dialog_post_action($hLibVLC_dll, $p_id, $i_action)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_dialog_post_action", "handle", $p_id, "int", $i_action)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_dialog_dismiss($hLibVLC_dll, $p_id)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_dialog_dismiss", "handle", $p_id)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc
	#EndRegion group_libvlc_dialog

	#Region group_libvlc_clock ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__clock.html
		#cs
			Detailed Description:
				These functions provide access to the LibVLC time/clock.
		#ce

		Func libvlc_clock($hLibVLC_dll)
			$aRet = DllCall($hLibVLC_dll, "int64:cdecl", "libvlc_clock")
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_delay($hLibVLC_dll, $pts)
			$aRet = DllCall($hLibVLC_dll, "int64:cdecl", "libvlc_delay", "int64", $pts)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc
	#EndRegion group_libvlc_clock

	#Region group_libvlc_media_list_player ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media__list__player.html
		;TODO
	#EndRegion group_libvlc_media_list_player

	#Region group_libvlc_media_player ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media__player.html

		#Region group_libvlc_video ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__video.html
			;TODO
		#EndRegion group_libvlc_video

		#Region group_libvlc_audio ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__audio.html
			;TODO
		#EndRegion group_libvlc_audio

		$libvlc_track_description_t = ""
		$libvlc_title_description_t = ""
		$libvlc_chapter_description_t = ""
		$libvlc_audio_output_t = ""
		$libvlc_audio_output_device_t = ""

		Func libvlc_media_player_new($hLibVLC_dll, $p_libvlc_instance)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_player_new", "handle", $p_libvlc_instance)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_new_from_media($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_player_new_from_media", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_release($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_release", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_retain($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_retain", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_set_media($hLibVLC_dll, $p_mi, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_media", "handle", $p_mi, "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_media($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_player_get_media", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_event_manager($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_player_event_manager", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_is_playing($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_is_playing", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_play($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_play", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_pause($hLibVLC_dll, $mp, $do_pause)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_pause", "handle", $mp, "int", $do_pause)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_pause($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_pause", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_stop($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_stop", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_set_renderer($hLibVLC_dll, $p_mi, $p_item)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_set_renderer", "handle", $p_mi, "handle", $p_item)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_video_set_callbacks($hLibVLC_dll, $mp, $lock, $unlock, $display, $opaque)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_video_set_callbacks", "handle", $mp, "handle", $lock, "handle", $unlock, "handle", $display, "handle", $opaque)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_video_set_format($hLibVLC_dll, $mp, $chroma, $width, $height, $pitch)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_video_set_format", "handle", $mp, "str", $chroma, "uint", $width, "uint", $height, "uint", $pitch)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_video_set_format_callbacks($hLibVLC_dll, $mp, $setups, $cleanup)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_video_set_format_callbacks", "handle", $mp, "handle", $setups, "handle", $cleanup)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_set_nsobject($hLibVLC_dll, $p_mi, $drawable)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_nsobject", "handle", $p_mi, "handle", $drawable)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_nsobject($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_player_get_nsobject", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_xwindow($hLibVLC_dll, $p_mi, $drawable)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_xwindow", "handle", $p_mi, "uint", $drawable)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_xwindow($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "uint:cdecl", "libvlc_media_player_get_xwindow", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_hwnd($hLibVLC_dll, $p_mi, $drawable)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_hwnd", "handle", $p_mi, "hwnd", $drawable)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_hwnd($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_player_get_hwnd", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_android_context($hLibVLC_dll, $p_mi, $p_awindow_handler)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_android_context", "handle", $p_mi, "handle", $p_awindow_handler)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_set_evas_object($hLibVLC_dll, $p_mi, $p_evas_object)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_set_evas_object", "handle", $p_mi, "handle", $p_evas_object)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_audio_set_callbacks($hLibVLC_dll, $mp, $play, $pause, $resume, $flush, $drain, $opaque)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_audio_set_callbacks", "handle", $mp, "handle", $play, "handle", $pause, "handle", $resume, "handle", $flush, "handle", $drain, "handle", $opaque)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_audio_set_volume_callback($hLibVLC_dll, $mp, $set_volume)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_audio_set_volume_callback", "handle", $mp, "handle", $set_volume)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_audio_set_format_callbacks($hLibVLC_dll, $mp, $setups, $cleanup)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_audio_set_format_callbacks", "handle", $mp, "handle", $setups, "handle", $cleanup)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_audio_set_format($hLibVLC_dll, $mp, $format, $rate, $channels)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_audio_set_format", "handle", $mp, "str", $format, "uint", $rate, "uint", $channels)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_length($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int64:cdecl", "libvlc_media_player_get_length", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_get_time($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int64:cdecl", "libvlc_media_player_get_time", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_time($hLibVLC_dll, $p_mi, $i_time)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_time", "handle", $p_mi, "INT64", $i_time)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_position($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "float:cdecl", "libvlc_media_player_get_position", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_position($hLibVLC_dll, $p_mi, $f_pos)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_position", "handle", $p_mi, "float", $f_pos)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_set_chapter($hLibVLC_dll, $p_mi, $i_chapter)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_chapter", "handle", $p_mi, "int", $i_chapter)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_chapter($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_get_chapter", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_get_chapter_count($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_get_chapter_count", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_will_play($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_will_play", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_get_chapter_count_for_title($hLibVLC_dll, $p_mi, $i_title)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_get_chapter_count_for_title", "handle", $p_mi, "int", $i_title)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_title($hLibVLC_dll, $p_mi, $i_title)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_title", "handle", $p_mi, "int", $i_title)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_title($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_get_title", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_get_title_count($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_get_title_count", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_previous_chapter($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_previous_chapter", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_next_chapter($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_next_chapter", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_rate($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "float:cdecl", "libvlc_media_player_get_rate", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_rate($hLibVLC_dll, $p_mi, $rate)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_set_rate", "handle", $p_mi, "float", $rate)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_get_state($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_get_state", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_has_vout($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "uint:cdecl", "libvlc_media_player_has_vout", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_is_seekable($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_is_seekable", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_can_pause($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_can_pause", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_program_scrambled($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_program_scrambled", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_next_frame($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_next_frame", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_navigate($hLibVLC_dll, $p_mi, $navigate)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_navigate", "handle", $p_mi, "uint", $navigate)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_set_video_title_display($hLibVLC_dll, $p_mi, $position, $timeout)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_video_title_display", "handle", $p_mi, "int", $position, "uint", $timeout)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_add_slave($hLibVLC_dll, $p_mi, $i_type, $psz_uri, $b_select)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_player_add_slave", "handle", $p_mi, "int", $i_type, "str", $psz_uri, "bool", $b_select)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_track_description_list_release($hLibVLC_dll, $p_track_description)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_track_description_list_release", "handle", $p_track_description)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_fps($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "float:cdecl", "libvlc_media_player_get_fps", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_player_set_agl($hLibVLC_dll, $p_mi, $drawable)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_player_set_agl", "handle", $p_mi, "uint", $drawable)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_player_get_agl($hLibVLC_dll, $p_mi)
			$aRet = DllCall($hLibVLC_dll, "uint:cdecl", "libvlc_media_player_get_agl", "handle", $p_mi)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_track_description_release($hLibVLC_dll, $p_track_description)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_track_description_release", "handle", $p_track_description)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc
	#EndRegion group_libvlc_media_player

	#Region group_libvlc_media ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media.html
		$libvlc_media_stats_t = ""
		$libvlc_media_track_info_t = ""
		$libvlc_audio_track_t = ""
		$libvlc_video_track_t = ""
		$libvlc_subtitle_track_t = ""
		$libvlc_media_track_t = ""
		$libvlc_media_slave_t = ""

		Func libvlc_media_new_location($hLibVLC_dll, $p_instance, $psz_mrl)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_new_location", "handle", $p_instance, "str", $psz_mrl)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_new_path($hLibVLC_dll, $p_instance, $path)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_new_path", "handle", $p_instance, "STR", $path)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_new_fd($hLibVLC_dll, $p_instance, $fd)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_new_fd", "handle", $p_instance, "int", $fd)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_new_callbacks($hLibVLC_dll, $instance, $open_cb, $read_cb, $seek_cb, $close_cb, $opaque)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_new_callbacks", "handle", $instance, "handle", $open_cb, "handle", $read_cb, "handle", $seek_cb, "handle", $close_cb, "handle", $opaque)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_new_as_node($hLibVLC_dll, $p_instance, $psz_name)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_new_as_node", "handle", $p_instance, "str", $psz_name)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_add_option($hLibVLC_dll, $p_md, $psz_options)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_add_option", "handle", $p_md, "str", $psz_options)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_add_option_flag($hLibVLC_dll, $p_md, $psz_options, $i_flags)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_add_option_flag", "handle", $p_md, "str", $psz_options, "int", $i_flags)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_retain($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_retain", "handle", $p_md)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_release($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_release", "ptr", $p_md)
			If @error<>0 Then SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_get_mrl($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_media_get_mrl", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_duplicate($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "handle", "libvlc_media_duplicate", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_get_meta($hLibVLC_dll, $p_md, $e_meta)
			$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_media_get_meta", "handle", $p_md, "int", $e_meta)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_set_meta($hLibVLC_dll, $p_md, $e_meta, $psz_value)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_set_meta", "handle", $p_md, "int", $e_meta, "str", $psz_value)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_save_meta($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_save_meta", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_get_state($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_get_state", "HANDLE", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_get_stats($hLibVLC_dll, $p_md, $p_stats)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_get_stats", "handle", $p_md, "handle", $p_stats)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_subitems($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_subitems", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_event_manager($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_event_manager", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_get_duration($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "int64:cdecl", "libvlc_media_get_duration", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_parse_with_options($hLibVLC_dll, $p_md, $parse_flag, $timeout)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_parse_with_options", "handle", $p_md, "int", $parse_flag, "int", $timeout)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_parse_stop($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_parse_stop", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_get_parsed_status($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_get_parsed_status", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_set_user_data($hLibVLC_dll, $p_md, $p_new_user_data)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_set_user_data", "handle", $p_md, "handle", $p_new_user_data)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_get_user_data($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_media_get_user_data", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_tracks_get($hLibVLC_dll, $p_md, $tracks)
			$aRet = DllCall($hLibVLC_dll, "uint:cdecl", "libvlc_media_tracks_get", "handle", $p_md, "handle", $tracks);Todo: look into example, supporting the: libvlc_media_track_t ***tracks
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_get_codec_description($hLibVLC_dll, $i_type, $i_codec)
			$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_media_get_codec_description", "int", $i_type, "uint", $i_codec)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_tracks_release($hLibVLC_dll, $p_tracks, $i_count)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_tracks_release", "handle", $p_tracks, "uint", $i_count)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_get_type($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_get_type", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_slaves_add($hLibVLC_dll, $p_md, $i_type, $i_priority, $psz_uri)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_slaves_add", "handle", $p_md, "int", $i_type, "uint", $i_priority, "str", $psz_uri)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_slaves_clear($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_slaves_clear", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_slaves_get($hLibVLC_dll, $p_md, $ppp_slaves)
			$aRet = DllCall($hLibVLC_dll, "uint:cdecl", "libvlc_media_slaves_get", "handle", $p_md, "handle", $ppp_slaves)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_slaves_release($hLibVLC_dll, $pp_slaves, $i_count)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_slaves_release", "handle", $pp_slaves, "int", $i_count)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_parse($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_parse", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_parse_async($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_media_parse_async", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_media_is_parsed($hLibVLC_dll, $p_md)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_is_parsed", "handle", $p_md)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_media_get_tracks_info($hLibVLC_dll, $p_md, $tracks)
			$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_media_get_tracks_info", "handle", $p_md, "handle", $tracks)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc
	#EndRegion group_libvlc_media

	#Region group_libvlc_media_list ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media__list.html
		;TODO
	#EndRegion group_libvlc_media_list

	#Region group_libvlc_media_library ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media__library.html
		;TODO
	#EndRegion group_libvlc_media_library

	#Region group_libvlc_vlm ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__vlm.html
		;TODO
	#EndRegion group_libvlc_vlm

	#Region group_libvlc_core ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__core.html
		#Region group_libvlc_error ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__error.html
			Func libvlc_errmsg($hLibVLC_dll)
				$aRet = DllCall($hLibVLC_dll, "STR:cdecl", "libvlc_errmsg")
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return $aRet[0]
			EndFunc

			Func libvlc_clearerr($hLibVLC_dll)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_clearerr")
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc

			Func libvlc_vprinterr($hLibVLC_dll, $fmt, $ap)
				$aRet = DllCall($hLibVLC_dll, "STR:cdecl", "libvlc_vprinterr", "str", $fmt, "ptr", $ap);TODO: make example with working va_list paraimiter (ap)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return $aRet[0]
			EndFunc

			Func libvlc_printerr($hLibVLC_dll, $fmt)
				$aRet = DllCall($hLibVLC_dll, "STR:cdecl", "libvlc_printerr", "str", $fmt);TODO: implement functionality for more arguments, as specified by: const char * 	libvlc_printerr (const char *fmt,...)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return $aRet[0]
			EndFunc
		#EndRegion group_libvlc_error

		#Region group_libvlc_log ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__log.html
			Func libvlc_log_get_context($hLibVLC_dll, $ctx, $module, $file, $line)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_log_get_context", "handle", $ctx, "handle", $module, "handle", $file, "handle", $line)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc

			Func libvlc_log_get_object($hLibVLC_dll, $ctx, $name, $header, $line)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_log_get_object", "handle", $ctx, "STR*", $name, "STR*", $header, "uint", $line)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc

			Func libvlc_log_unset($hLibVLC_dll, $p_instance)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_log_unset", "handle", $p_instance)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc

			Func libvlc_log_set($hLibVLC_dll, $p_instance, $cb, $data)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_log_set", "handle", $p_instance, "handle", $cb, "handle", $data)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc

			Func libvlc_log_set_file($hLibVLC_dll, $p_instance, $stream)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_log_set_file", $p_instance, "handle", $stream)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc
		#EndRegion group_libvlc_log

		#Region group_libvlc_event ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__event.html
;~ 			enum libvlc_event_e:
			Enum $libvlc_MediaMetaChanged=0, $libvlc_MediaSubItemAdded, $libvlc_MediaDurationChanged, $libvlc_MediaParsedChanged, $libvlc_MediaFreed, $libvlc_MediaStateChanged _
			,$libvlc_MediaSubItemTreeAdded, $libvlc_MediaPlayerMediaChanged = 0x100, $libvlc_MediaPlayerNothingSpecial, $libvlc_MediaPlayerOpening, $libvlc_MediaPlayerBuffering _
			,$libvlc_MediaPlayerPlaying, $libvlc_MediaPlayerPaused, $libvlc_MediaPlayerStopped, $libvlc_MediaPlayerForward, $libvlc_MediaPlayerBackward, $libvlc_MediaPlayerEndReached _
			,$libvlc_MediaPlayerEncounteredError, $libvlc_MediaPlayerTimeChanged, $libvlc_MediaPlayerPositionChanged, $libvlc_MediaPlayerSeekableChanged, $libvlc_MediaPlayerPausableChanged _
			,$libvlc_MediaPlayerTitleChanged, $libvlc_MediaPlayerSnapshotTaken, $libvlc_MediaPlayerLengthChanged, $libvlc_MediaPlayerVout, $libvlc_MediaPlayerScrambledChanged, $libvlc_MediaPlayerESAdded _
			,$libvlc_MediaPlayerESDeleted, $libvlc_MediaPlayerESSelected, $libvlc_MediaPlayerCorked, $libvlc_MediaPlayerUncorked, $libvlc_MediaPlayerMuted, $libvlc_MediaPlayerUnmuted, $libvlc_MediaPlayerAudioVolume _
			,$libvlc_MediaPlayerAudioDevice, $libvlc_MediaPlayerChapterChanged, $libvlc_MediaListItemAdded = 0x200, $libvlc_MediaListWillAddItem, $libvlc_MediaListItemDeleted, $libvlc_MediaListWillDeleteItem, $libvlc_MediaListEndReached _
			,$libvlc_MediaListViewItemAdded = 0x300, $libvlc_MediaListViewWillAddItem, $libvlc_MediaListViewItemDeleted, $libvlc_MediaListViewWillDeleteItem, $libvlc_MediaListPlayerPlayed = 0x400, $libvlc_MediaListPlayerNextItemSet, $libvlc_MediaListPlayerStopped _
			,$libvlc_MediaDiscovererStarted = 0x500, $libvlc_MediaDiscovererEnded, $libvlc_RendererDiscovererItemAdded, $libvlc_RendererDiscovererItemDeleted, $libvlc_VlmMediaAdded = 0x600, $libvlc_VlmMediaRemoved, $libvlc_VlmMediaChanged, $libvlc_VlmMediaInstanceStarted _
			,$libvlc_VlmMediaInstanceStopped, $libvlc_VlmMediaInstanceStatusInit, $libvlc_VlmMediaInstanceStatusOpening, $libvlc_VlmMediaInstanceStatusPlaying, $libvlc_VlmMediaInstanceStatusPause, $libvlc_VlmMediaInstanceStatusEnd, $libvlc_VlmMediaInstanceStatusError

			Func libvlc_event_attach($hLibVLC_dll, $p_event_manager, $i_event_type, $f_callback, $user_data)
				$aRet = DllCall($hLibVLC_dll, "int:cdecl", "libvlc_event_attach", "handle", $p_event_manager, "int", $i_event_type, "handle", $f_callback, "handle", $user_data)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return $aRet[0]
			EndFunc

			Func libvlc_event_detach($hLibVLC_dll, $p_event_manager, $i_event_type, $f_callback, $p_user_data)
				$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_event_detach", "handle", $p_event_manager, "int", $i_event_type, "handle", $f_callback, "handle", $p_user_data)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return 1
			EndFunc

			Func libvlc_event_type_name($hLibVLC_dll, $event_type)
				$aRet = DllCall($hLibVLC_dll, "str:cdecl", "libvlc_event_type_name", "int", $event_type)
				If @error<>0 Then Return SetError(@error, @extended, 0)
				Return $aRet[0]
			EndFunc
		#EndRegion group_libvlc_event

		#cs
			https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__core.html#ga915aa5778053d7b52ff9f6ba6e2f7764
		#ce
		Func libvlc_new($hLibVLC_dll, $argc, $argv)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_new", "INT", $argc, "STR", $argv)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc
		#cs
			a
		#ce
		Func libvlc_release($hLibVLC_dll, $p_instance)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_release", "ptr", $p_instance)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_retain($hLibVLC_dll, $p_instance)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_retain", "HANDLE", $p_instance)
		EndFunc

		Func libvlc_add_intf($hLibVLC_dll, $p_instance, $name)
			$aRet = DllCall($hLibVLC_dll, "INT:cdecl", "libvlc_add_intf", "HANDLE", $p_instance, "STR", $name)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_set_exit_handler($hLibVLC_dll, $p_instance, $cb, $opaque)
			$aRet = DllCall($hLibVLC_dll, "NONE:cdecl", "libvlc_set_exit_handler", "HANDLE", $p_instance, "HANDLE", $cb, "HANDLE", $opaque)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_set_user_agent($hLibVLC_dll, $p_instance, $name, $http)
			$aRet = DllCall($hLibVLC_dll, "NONE:cdecl", "libvlc_set_user_agent", "HANDLE", $p_instance, "STR*", $name, "STR", $http)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_set_app_id($hLibVLC_dll, $p_instance, $id, $version, $icon)
			$aRet = DllCall($hLibVLC_dll, "NONE:cdecl", "libvlc_set_app_id", "HANDLE", $p_instance, "STR", $id, "STR", $version, "STR", $icon)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_get_version($hLibVLC_dll)
			$aRet = DllCall($hLibVLC_dll, "STR:cdecl", "libvlc_get_version")
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_get_compiler($hLibVLC_dll)
			$aRet = DllCall($hLibVLC_dll, "STR:cdecl", "libvlc_get_compiler")
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_get_changeset($hLibVLC_dll)
			$aRet = DllCall($hLibVLC_dll, "STR:cdecl", "libvlc_get_changeset")
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_free($hLibVLC_dll, $ptr)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_free", "HANDLE", $ptr)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_module_description_list_release($hLibVLC_dll, $p_list)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_module_description_list_release", "HANDLE", $p_list)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		Func libvlc_audio_filter_list_get($hLibVLC_dll, $p_instance)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_audio_filter_list_get", "handle", $p_instance)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_video_filter_list_get($hLibVLC_dll, $p_instance)
			$aRet = DllCall($hLibVLC_dll, "handle:cdecl", "libvlc_video_filter_list_get", "handle", $p_instance)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return $aRet[0]
		EndFunc

		Func libvlc_wait($hLibVLC_dll, $p_instance)
			$aRet = DllCall($hLibVLC_dll, "none:cdecl", "libvlc_wait", "handle", $p_instance)
			If @error<>0 Then Return SetError(@error, @extended, 0)
			Return 1
		EndFunc

		$libvlc_module_description_t = "";TODO

	#EndRegion group_libvlc_core

	#Region group_libvlc_media_discoverer ; https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media__discoverer.html
		;TODO
	#EndRegion group_libvlc_media_discoverer

#EndRegion group_libvlc
