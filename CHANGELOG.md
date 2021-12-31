# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [1.86] (2021-12-31)
### Changed
- Updated to Dear ImGui 1.86 (docking branch)

## [1.85-1] (2021-10-12)
### Changed
- Updated to Dear ImGui 1.85 (docking branch)

## [1.84.2-2] (2021-09-23)
### Changed
- Updated cimgui fork to pull in changes from upstream

## [1.84.2-1] (2021-08-31)
### Changed
- Updated to Dear ImGui 1.84.2 (docking branch)

## [1.84.1-1] (2021-08-24)
### Changed
- Updated to Dear ImGui 1.84.1 (docking branch)

## [1.83-3] (2021-06-23)
### Added
- LÖVE implementation now honours Dear ImGui's requests to change the mouse cursor or move its position
- Support for gamepad navigation
- Section about gamepad navigation in README.md
- This CHANGELOG.md file

### Changed
- Fixed typos in README.md

## [1.83-2] (2021-06-20)
### Changed
- Fixed potential crashes if LuaJIT compiles the wrapper for a C function which calls the (Lua) clipboard callbacks ([#1](https://github.com/apicici/cimgui-love/issues/1))
- Updated README.md to reflect change in Dear ImGui version
- The mesh data in `imgui.RenderDrawLists` is now initialised using FFI instead of passing a string

## [1.83-1] (2021-06-15)
### Added
- Information about naming conventions for `ImGuiTextBuffer_end` to README.md
### Changed
- Updated to Dear ImGui 1.83 (docking branch)
- Modified `love.lua` to use `ImDrawCmd_GetTexID` since `ImDrawCmd::TextureId` has been obsoleted
- Moved cparser to its own folder and added its LICENSE file
- Fixed typos in README.md

## [1.82-1] (2021-05-23)
### Added
- Initial release of `generator.lua` and LÖVE implementation
- Generated the wrappers using Dear ImGui 1.82 (docking branch)

[Unreleased]: https://github.com/apicici/cimgui-love/compare/1.86-1...HEAD
[1.86-1]: https://github.com/apicici/cimgui-love/compare/1.85-1...1.86-1
[1.85-1]: https://github.com/apicici/cimgui-love/compare/1.84.2-2...1.85-1
[1.84.2-2]: https://github.com/apicici/cimgui-love/compare/1.84.2-1...1.84.2-2
[1.84.2-1]: https://github.com/apicici/cimgui-love/compare/1.84.1-1...1.84.2-1
[1.84.1-1]: https://github.com/apicici/cimgui-love/compare/1.83-3...1.84.1-1
[1.83-3]: https://github.com/apicici/cimgui-love/compare/1.83-2...1.83-3
[1.83-2]: https://github.com/apicici/cimgui-love/compare/1.83-1...1.83-2
[1.83-1]: https://github.com/apicici/cimgui-love/compare/1.82-1...1.83-1
[1.82-1]: https://github.com/apicici/cimgui-love/releases/tag/1.82-1

