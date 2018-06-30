#
# INPUTs: 
#   SDL2_ROOT: Absolute path to SDL2 source

cmake_minimum_required(VERSION 2.8.11)
# FIXME: Only activate CXX on UWP
project(SDL2 C CXX)

if(NOT SDL2_ROOT)
    message(FATAL_ERROR "SDL2_ROOT is undefined")
endif()

if(NOT EXISTS ${SDL2_ROOT})
    message(FATAL_ERROR "SDL2_ROOT is not found (${SDL2_ROOT})")
endif()

include(./sdl2-srcs.cmake)

function(rebase_sources var)
    set(srcs)
    foreach(s ${ARGN})
        list(APPEND srcs ${SDL2_ROOT}/src/${s})
    endforeach()
    set(${var} ${srcs} PARENT_SCOPE)
endfunction()

# Disable DynAPI
add_definitions(
    -DSDL_dynapi_h_
    -DSDL_DYNAMIC_API=0)

# FIXME: SDL_egl_grpcore0.c require this..
include_directories(${SDL2_ROOT}/src/video)

# FIXME: Check Android and Emscripten first.
if(${CMAKE_SYSTEM_NAME} STREQUAL "WindowsStore")
    # WinRT(UWP)
    rebase_sources(sdl2_c_srcs
        #${sdl2_egl_srcs}
        ${sdl2_common_srcs}
        ${sdl2_win32_common_srcs}
        ${sdl2_stdcpp_srcs}
        ${sdl2_libm_srcs})
    rebase_sources(sdl2_cpp_srcs 
        ${sdl2_winrt_srcs})
    rebase_sources(sdl2_main_srcs
        main/winrt/SDL_winrt_main_NonXAML.cpp)
    set_source_files_properties(${sdl2_c_srcs} ${sdl2_cpp_srcs} ${sdl2_main_srcs}
        PROPERTIES
        COMPILE_DEFINITIONS
        "_CRT_SECURE_NO_WARNINGS;SDL_BUILDING_WINRT=1")
    set_source_files_properties(${sdl2_cpp_srcs} ${sdl2_main_srcs}
        COMPILE_FLAGS "/ZW")
    set(sdl2_srcs)
    list(APPEND sdl2_srcs ${sdl2_c_srcs} ${sdl2_cpp_srcs})
    list(APPEND sdl2_srcs ${CMAKE_CURRENT_LIST_DIR}/SDL_egl_grpcore0.c)
    # WAR: Almost all apps will need dxguid still
    add_definitions(
        -DIID_IDXGIFactory2=SDL_IID_IDXGIFactory2
        )
elseif(WIN32)
    rebase_sources(sdl2_srcs
        #${sdl2_egl_srcs}
        ${sdl2_common_srcs}
        ${sdl2_win32_common_srcs}
        ${sdl2_libm_srcs}
        ${sdl2_win32_desktop_srcs})
    rebase_sources(sdl2_main_srcs
        main/windows/SDL_windows_main.c)
    list(APPEND sdl2_srcs ${CMAKE_CURRENT_LIST_DIR}/SDL_egl_grpcore0.c)
    set_source_files_properties(${sdl2_srcs} ${sdl2_main_srcs}
        PROPERTIES
        COMPILE_DEFINITIONS
        "_CRT_SECURE_NO_WARNINGS;_WINDOWS;HAVE_LIBC")
elseif(${CMAKE_SYSTEM_NAME} STREQUAL Android)
    # Android
    rebase_sources(sdl2_srcs
        #${sdl2_egl_srcs}
        ${sdl2_unix_srcs}
        ${sdl2_pthread_srcs}
        ${sdl2_android_srcs}
        ${sdl2_common_srcs}
        ${sdl2_libm_srcs})
    rebase_sources(sdl2_main_srcs
        main/android/SDL_android_main.c)
    list(APPEND sdl2_srcs ${CMAKE_CURRENT_LIST_DIR}/SDL_egl_grpcore0.c)
else()
    message(FATAL_ERROR "Unsupported platform.")
endif()

include_directories(${SDL2_ROOT}/include)

add_library(sdl2_static OBJECT ${sdl2_srcs})
add_library(sdl2_main_static OBJECT ${sdl2_main_srcs})
