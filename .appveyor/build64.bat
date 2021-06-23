call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
mkdir build
cd build
cmake -A x64 ../cimgui
cmake --build . --config Release
robocopy ../src Release/cimgui
robocopy ../*.md Release/
cd Release
7z a -tzip build.zip *.dll *.md cimgui
