# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]
### Changed
- Updated to Dear ImGui 1.89.9 (docking branch)

## [1.89.7-1] (2023-07-19)
### Changed
- Updated to Dear ImGui 1.89.7 (docking branch)

## [1.89.6-1] (2023-06-13)
### Changed
- Updated to Dear ImGui 1.89.6 (docking branch)

## [1.89.5-1] (2023-04-17)
### Changed
- Updated to Dear ImGui 1.89.5 (docking branch)

## [1.89.4-1] (2023-03-16)
### Changed
- Updated to Dear ImGui 1.89.4 (docking branch)

## [1.89.3-1] (2023-02-16)
### Changed
- Updated to Dear ImGui 1.89.3 (docking branch)

## [1.89.2-2] (2023-02-11)
### Added
- Compatibility with the WIP version of LÖVE 12
- Start building macos releases with universal library

## [1.89.2-1] (2023-01-06)
### Changed
- Updated to Dear ImGui 1.89.2 (docking branch)

## [1.89.1-1] (2022-12-03)
### Changed
- Updated to Dear ImGui 1.89.1 (docking branch)

## [1.89-1] (2022-11-15)
### Changed
- Updated to Dear ImGui 1.89 (docking branch)

## [1.88-2] (2022-07-26)
### Changed
- The shader for the `Alpha8` texture format is now created by `imgui.love.Init`, to avoid errors if the library is loaded before the LÖVE window is created.

## [1.88-1] (2022-06-22)
### Changed
- Updated to Dear ImGui 1.88 (docking branch)

### Added
- Added helper functions `imgui.love.Shortcut` and `imgui.love.RunShortcuts` to run MenuItem actions using keyboard shortcuts.
- Fixed problem with high DPI caused by unnecessary scaling of ClipRects
- Improved efficiency by avoid recreating the LÖVE mesh when not necessary.
- Added support for `ImDrawCallback`.
- Added support for `Alpha8` texture format.

## [1.87-1] (2022-02-08)
### Breaking changes
- Moved implementation-specific function to their own table. For example `imgui.Init` is now `imgui.love.Init`. If you prefer the old convention or you want to upgrade an older project without breaking it you can move all the functions back to the old location by running `imgui.love.RevertToOldNames()`.

### Changed
- Updated to Dear ImGui 1.87 (docking branch)
- `imgui.love.RenderDrawLists` now does nothing if the window is minimised.
- The generated Lua files are now filled in alphabetical order to make reading the diffs easier.

## [1.87WIP-1] (2022-01-24)
### Changed
- Updated to Dear ImGui 1.87 WIP (docking branch) as 1.86 has some bugs with modal popups
- Rewrote the code to handle inputs to match the 1.87+ style

## [1.86-1] (2021-12-31)
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

[Unreleased]: https://github.com/apicici/cimgui-love/compare/1.89.7-1...HEAD
[1.89.7-1]: https://github.com/apicici/cimgui-love/compare/1.89.6-1...1.89.7-1
[1.89.6-1]: https://github.com/apicici/cimgui-love/compare/1.89.5-1...1.89.6-1
[1.89.5-1]: https://github.com/apicici/cimgui-love/compare/1.89.4-1...1.89.5-1
[1.89.4-1]: https://github.com/apicici/cimgui-love/compare/1.89.3-1...1.89.4-1
[1.89.3-1]: https://github.com/apicici/cimgui-love/compare/1.89.2-2...1.89.3-1
[1.89.2-2]: https://github.com/apicici/cimgui-love/compare/1.89.2-1...1.89.2-2
[1.89.2-1]: https://github.com/apicici/cimgui-love/compare/1.89.1-1...1.89.2-1
[1.89.1-1]: https://github.com/apicici/cimgui-love/compare/1.89-1...1.89.1-1
[1.89-1]: https://github.com/apicici/cimgui-love/compare/1.88-2...1.89-1
[1.88-2]: https://github.com/apicici/cimgui-love/compare/1.88-1...1.88-2
[1.88-1]: https://github.com/apicici/cimgui-love/compare/1.87-1...1.88-1
[1.87-1]: https://github.com/apicici/cimgui-love/compare/1.87WIP-1...1.87-1
[1.87WIP-1]: https://github.com/apicici/cimgui-love/compare/1.86-1...1.87WIP-1
[1.86-1]: https://github.com/apicici/cimgui-love/compare/1.85-1...1.86-1
[1.85-1]: https://github.com/apicici/cimgui-love/compare/1.84.2-2...1.85-1
[1.84.2-2]: https://github.com/apicici/cimgui-love/compare/1.84.2-1...1.84.2-2
[1.84.2-1]: https://github.com/apicici/cimgui-love/compare/1.84.1-1...1.84.2-1
[1.84.1-1]: https://github.com/apicici/cimgui-love/compare/1.83-3...1.84.1-1
[1.83-3]: https://github.com/apicici/cimgui-love/compare/1.83-2...1.83-3
[1.83-2]: https://github.com/apicici/cimgui-love/compare/1.83-1...1.83-2
[1.83-1]: https://github.com/apicici/cimgui-love/compare/1.82-1...1.83-1
[1.82-1]: https://github.com/apicici/cimgui-love/releases/tag/1.82-1

