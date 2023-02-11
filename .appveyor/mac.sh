sudo xcode-select -s /Applications/Xcode-12.5.1.app
mkdir -p build && cd build
cp ../.appveyor/CmakeLists.txt ../cimgui/
cmake ../cimgui -GXcode
xcodebuild -scheme cimgui
cp -r ../src cimgui
zip -j ../build.zip  Debug/*.dylib
zip -j ../build.zip ../*.md
zip -j ../build.zip ../.appveyor/*.md
zip -r ../build.zip cimgui
