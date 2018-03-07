SET APPROOT=%CD%
PUSHD %APPROOT%\..\..
SET AQLROOT=%CD%
SET AQLLIBS=%AQLROOT%\libs\x86_64-pc-windows-msvc
SET AQLBLD=%APPROOT%\build
CALL "C:\Program Files (x86)\Microsoft Visual C++ Build Tools\vcbuildtools.bat" amd64
PUSHD %APPROOT%
bash -c "../../crystal/bin/crystal build src/main.cr --cross-compile --target x86_64-pc-windows-msvc -D win32 --no-debug"
link "main.o"  "%AQLLIBS%\pcre.lib" "%AQLLIBS%\gc.lib" "%AQLLIBS%\SDL2.lib" "%AQLLIBS%\SDL2_image.lib" advapi32.lib libcmt.lib user32.lib /NODEFAULTLIB:msvcrt /OUT:build\pong.exe
DEL main.o
