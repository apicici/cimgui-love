call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars32.bat"
mkdir build
cd build
cmake -A Win32 ../cimgui
cmake --build . --config Release
robocopy ../src Release/cimgui
cd Release
7z a -tzip build.zip *.dll cimgui
