reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32 || set OS=64
if %OS%==64 (set ARCH=x64) else (set ARCH=Win32)

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars%OS%.bat"
mkdir build
cd build
cmake -A %ARCH% ../cimgui
cmake --build . --config Release
robocopy ../src Release/cimgui
robocopy ../ Release/ *.md
robocopy ../.appveyor/ Release/ *.md
cd Release
7z a -tzip build.zip *.dll *.md cimgui
