mkdir -p build && cd build
cmake ../cimgui
cmake --build .
cp -r ../src cimgui
zip -j ../build.zip *.so *.dylib
zip -r ../build.zip cimgui
