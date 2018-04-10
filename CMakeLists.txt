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

# FIXME: Check Android and Emscripten first.
if(${CMAKE_SYSTEM_NAME} STREQUAL "WindowsStore")
    message(FATAL_ERROR "huh?")
elseif(WIN32)
    rebase_sources(sdl2_srcs
        ${sdl2_egl_srcs}
        ${sdl2_common_srcs}
        ${sdl2_win32_common_srcs}
        ${sdl2_libm_srcs}
        ${sdl2_win32_desktop_srcs})
    rebase_sources(sdl2_main_srcs
        main/windows/SDL_windows_main.c)
    set_source_files_properties(${sdl2_srcs} ${sdl2_main_srcs}
        PROPERTIES
        COMPILE_DEFINITIONS
        "_CRT_SECURE_NO_WARNINGS;_WINDOWS;HAVE_LIBC")
else()
    message(FATAL_ERROR "Unsupported platform.")
endif()

include_directories(${SDL2_ROOT}/include)

add_library(sdl2_static STATIC ${sdl2_srcs})
add_library(sdl2_main_static STATIC ${sdl2_main_srcs})
