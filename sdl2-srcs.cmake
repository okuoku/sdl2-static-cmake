set(sdl2_winrt_srcs
    audio/wasapi/SDL_wasapi_winrt.cpp
    core/winrt/SDL_winrtapp_common.cpp
    core/winrt/SDL_winrtapp_direct3d.cpp
    core/winrt/SDL_winrtapp_xaml.cpp
    filesystem/winrt/SDL_sysfilesystem.cpp
    power/winrt/SDL_syspower.cpp
    render/direct3d11/SDL_render_winrt.cpp
    video/winrt/SDL_winrtevents.cpp
    video/winrt/SDL_winrtgamebar.cpp
    video/winrt/SDL_winrtkeyboard.cpp
    video/winrt/SDL_winrtmessagebox.cpp
    video/winrt/SDL_winrtmouse.cpp
    video/winrt/SDL_winrtopengles.cpp
    video/winrt/SDL_winrtpointerinput.cpp
    video/winrt/SDL_winrtvideo.cpp
    )

set(sdl2_win32_common_srcs
    audio/wasapi/SDL_wasapi.c
    core/windows/SDL_windows.c
    core/windows/SDL_xinput.c
    haptic/windows/SDL_dinputhaptic.c
    haptic/windows/SDL_windowshaptic.c
    haptic/windows/SDL_xinputhaptic.c
    joystick/windows/SDL_dinputjoystick.c
    joystick/windows/SDL_windowsjoystick.c
    joystick/windows/SDL_xinputjoystick.c
    loadso/windows/SDL_sysloadso.c
    render/direct3d11/SDL_render_d3d11.c
    render/direct3d11/SDL_shaders_d3d11.c
    timer/windows/SDL_systimer.c
    )

set(sdl2_win32_desktop_srcs
    audio/directsound/SDL_directsound.c
    audio/wasapi/SDL_wasapi_win32.c
    audio/winmm/SDL_winmm.c
    joystick/windows/SDL_mmjoystick.c
    power/windows/SDL_syspower.c
    render/direct3d/SDL_render_d3d.c

    # FIXME: Not Win32 specific..
    render/opengl/SDL_render_gl.c
    render/opengl/SDL_shaders_gl.c

    # FIXME: Not Win32 specific..
    thread/generic/SDL_syscond.c

    thread/windows/SDL_syssem.c
    thread/windows/SDL_systhread.c
    thread/windows/SDL_systls.c
    thread/windows/SDL_sysmutex.c

    video/windows/SDL_windowsclipboard.c
    video/windows/SDL_windowsevents.c
    video/windows/SDL_windowsframebuffer.c
    video/windows/SDL_windowskeyboard.c
    video/windows/SDL_windowsmessagebox.c
    video/windows/SDL_windowsmodes.c
    video/windows/SDL_windowsmouse.c
    video/windows/SDL_windowsopengl.c
    video/windows/SDL_windowsopengles.c
    video/windows/SDL_windowsshape.c
    video/windows/SDL_windowsvideo.c
    video/windows/SDL_windowsvulkan.c
    video/windows/SDL_windowswindow.c

    filesystem/windows/SDL_sysfilesystem.c
    )

set(sdl2_emscripten_srcs
    audio/emscripten/SDL_emscriptenaudio.c
    filesystem/emscripten/SDL_sysfilesystem.c
    joystick/emscripten/SDL_sysjoystick.c
    power/emscripten/SDL_syspower.c
    video/emscripten/SDL_emscriptenevents.c
    video/emscripten/SDL_emscriptenframebuffer.c
    video/emscripten/SDL_emscriptenmouse.c
    video/emscripten/SDL_emscriptenopengles.c
    video/emscripten/SDL_emscriptenvideo.c

    # FIXME: Not emscripten specific..
    thread/generic/SDL_systls.c
    )

set(sdl2_posix_srcs
    loadso/dlopen/SDL_sysloadso.c

    render/opengles/SDL_render_gles.c

    thread/pthread/SDL_syscond.c
    thread/pthread/SDL_sysmutex.c
    thread/pthread/SDL_syssem.c
    thread/pthread/SDL_systhread.c
    thread/pthread/SDL_systls.c

    timer/unix/SDL_systimer.c
    )

set(sdl2_android_srcs
    audio/android/SDL_androidaudio.c
    # atomic/SDL_spinlock.c.arm # FIXME: generate this?
    core/android/SDL_android.c
    joystick/android/SDL_sysjoystick.c


    power/android/SDL_syspower.c
    filesystem/android/SDL_sysfilesystem.c


    haptic/android/SDL_syshaptic.c

    video/android/SDL_androidclipboard.c
    video/android/SDL_androidevents.c
    video/android/SDL_androidgl.c
    video/android/SDL_androidkeyboard.c
    video/android/SDL_androidmessagebox.c
    video/android/SDL_androidmouse.c
    video/android/SDL_androidtouch.c
    video/android/SDL_androidvideo.c
    video/android/SDL_androidwindow.c
    )

set(sdl2_x11_srcs
    # FIXME: OK?
    core/unix/SDL_poll.c

    video/x11/edid-parse.c
    video/x11/imKStoUCS.c
    video/x11/SDL_x11clipboard.c
    video/x11/SDL_x11dyn.c
    video/x11/SDL_x11events.c
    video/x11/SDL_x11framebuffer.c
    video/x11/SDL_x11keyboard.c
    video/x11/SDL_x11messagebox.c
    video/x11/SDL_x11modes.c
    video/x11/SDL_x11mouse.c
    video/x11/SDL_x11opengl.c
    video/x11/SDL_x11opengles.c
    video/x11/SDL_x11shape.c
    video/x11/SDL_x11touch.c
    video/x11/SDL_x11video.c
    video/x11/SDL_x11window.c
    video/x11/SDL_x11xinput2.c)

set(sdl2_stdcpp_srcs
    # FIXME: OK?
    thread/generic/SDL_syssem.c

    thread/stdcpp/SDL_syscond.cpp
    thread/stdcpp/SDL_sysmutex.cpp
    thread/stdcpp/SDL_systhread.cpp
    )

set(sdl2_libm_srcs
    libm/e_atan2.c
    libm/e_log.c
    libm/e_pow.c
    libm/e_rem_pio2.c
    libm/e_sqrt.c
    libm/k_cos.c
    libm/k_rem_pio2.c
    libm/k_sin.c
    libm/k_tan.c
    libm/s_atan.c
    libm/s_copysign.c
    libm/s_cos.c
    libm/s_fabs.c
    libm/s_floor.c
    libm/s_scalbn.c
    libm/s_sin.c
    libm/s_tan.c
    )

set(sdl2_common_srcs
    atomic/SDL_atomic.c
    atomic/SDL_spinlock.c

    audio/disk/SDL_diskaudio.c
    audio/dummy/SDL_dummyaudio.c

    audio/SDL_audio.c
    audio/SDL_audiocvt.c
    audio/SDL_audiodev.c
    audio/SDL_audiotypecvt.c
    audio/SDL_mixer.c
    audio/SDL_wave.c

    cpuinfo/SDL_cpuinfo.c

    # dynapi/SDL_dynapi.c

    events/SDL_clipboardevents.c
    events/SDL_dropevents.c
    events/SDL_events.c
    events/SDL_gesture.c
    events/SDL_keyboard.c
    events/SDL_mouse.c
    events/SDL_quit.c
    events/SDL_touch.c
    events/SDL_windowevents.c

    file/SDL_rwops.c

    haptic/dummy/SDL_syshaptic.c
    haptic/SDL_haptic.c

    joystick/dummy/SDL_sysjoystick.c
    joystick/SDL_gamecontroller.c
    joystick/SDL_joystick.c

    power/SDL_power.c

    render/opengles2/SDL_render_gles2.c
    render/opengles2/SDL_shaders_gles2.c
    render/SDL_d3dmath.c
    render/SDL_render.c
    # render/SDL_yuv_mmx.c # Removed?
    render/SDL_yuv_sw.c
    render/software/SDL_blendfillrect.c
    render/software/SDL_blendline.c
    render/software/SDL_blendpoint.c
    render/software/SDL_drawline.c
    render/software/SDL_drawpoint.c
    render/software/SDL_render_sw.c
    render/software/SDL_rotate.c

    SDL.c
    SDL_assert.c
    SDL_dataqueue.c
    SDL_error.c
    SDL_hints.c
    SDL_log.c

    stdlib/SDL_getenv.c
    stdlib/SDL_iconv.c
    stdlib/SDL_malloc.c
    stdlib/SDL_qsort.c
    stdlib/SDL_stdlib.c
    stdlib/SDL_string.c

    thread/SDL_thread.c

    timer/SDL_timer.c

    video/dummy/SDL_nullevents.c
    video/dummy/SDL_nullframebuffer.c
    video/dummy/SDL_nullvideo.c
    video/SDL_blit.c
    video/SDL_blit_0.c
    video/SDL_blit_1.c
    video/SDL_blit_A.c
    video/SDL_blit_auto.c
    video/SDL_blit_copy.c
    video/SDL_blit_N.c
    video/SDL_blit_slow.c
    video/SDL_bmp.c
    video/SDL_clipboard.c
    #video/SDL_egl.c
    video/SDL_fillrect.c
    video/SDL_pixels.c
    video/SDL_rect.c
    video/SDL_RLEaccel.c
    video/SDL_shape.c
    video/SDL_stretch.c
    video/SDL_surface.c
    video/SDL_video.c
    video/SDL_yuv.c

    video/yuv2rgb/yuv_rgb.c

    video/SDL_vulkan_utils.c
    )

set(sdl2_egl_srcs
    video/SDL_egl.c
    )
