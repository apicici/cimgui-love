# cimgui-love

[LÖVE](https://love2d.org/) module for [Dear ImGui](https://github.com/ocornut/imgui) obtained by wrapping [cimgui](https://github.com/cimgui/cimgui) (programmatically generated C-api) using LuaJIT FFI.

Inspired by [LuaJIT-ImGui](https://github.com/sonoro1234/LuaJIT-ImGui), but does not share code with it. In particular cimgui-love it does not require any libraries other than cimgui, while LuaJIT-ImGui needs SDL for the LÖVE implementation.

Part of the LÖVE implementation (specifically the `RenderDrawLists` function)  is based on [love-imgui](https://github.com/slages/love-imgui).

Currently based on version 1.87 (docking branch) of Dear ImGui and LÖVE 11.4.

## How to use

Grab the appropriate [release](../../releases/) and put the `cimgui` folder (feel free to rename it) somewhere in your LÖVE project. Place the cimgui shared library (`.so`, `.dylib`, or `.dll`, depending on the system) where you prefer (not inside the .love archive, though, or you wan't be able to load it) and change `package.cpath` so that Lua can find it and `ffi.load` can access it.

If you prefer you can compile cimgui and/or generate the wrappers yourself (useful if imgui/cimgui has been updated and this repository hasn't caught up yet) using the instructions [here](#compiling-the-library-and-generating-the-wrappers). Note that if you get the module by cloning the repository the Lua code is in the `src` folder rather than the `cimgui` one.

Here is an overview of how to use cmigui in LÖVE:

```lua
-- Make sure the shared library can be found through package.cpath before loading the module.
-- For example, if you put it in the LÖVE save directory, you could do something like this:
local lib_path = love.filesystem.getSaveDirectory() .. "/libraries"
local extension = jit.os == "Windows" and "dll" or jit.os == "Linux" and "so" or jit.os == "OSX" and "dylib"
package.cpath = string.format("%s;%s/?.%s", package.cpath, lib_path, extension)

local imgui = require "cimgui" -- cimgui is the folder containing the Lua module (the "src" folder in the github repository)

love.load = function()
    imgui.love.Init()
end

love.draw = function()
    -- example window
    imgui.ShowDemoWindow()
    
    -- code to render imgui
    imgui.Render()
    imgui.love.RenderDrawLists()
end

love.update = function(dt)
    imgui.love.Update(dt)
    imgui.NewFrame()
end

love.mousemoved = function(x, y, ...)
    imgui.love.MouseMoved(x, y)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here
    end
end

love.mousepressed = function(x, y, button, ...)
    imgui.love.MousePressed(button)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here 
    end
end

love.mousereleased = function(x, y, button, ...)
    imgui.love.MouseReleased(button)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here 
    end
end

love.wheelmoved = function(x, y)
    imgui.love.WheelMoved(x, y)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here 
    end
end

love.keypressed = function(key, ...)
    imgui.love.KeyPressed(key)
    if not imgui.love.GetWantCaptureKeyboard() then
        -- your code here 
    end
end

love.keyreleased = function(key, ...)
    imgui.love.KeyReleased(key)
    if not imgui.love.GetWantCaptureKeyboard() then
        -- your code here 
    end
end

love.textinput = function(t)
    imgui.love.TextInput(t)
    if not imgui.love.GetWantCaptureKeyboard() then
        -- your code here 
    end
end

love.quit = function()
    return imgui.love.Shutdown()
end

-- for gamepad support also add the following:

love.joystickadded = function(joystick)
    imgui.love.JoystickAdded(joystick)
    -- your code here 
end

love.joystickremoved = function(joystick)
    imgui.love.JoystickRemoved()
    -- your code here 
end

love.gamepadpressed = function(joystick, button)
    imgui.love.GamepadPressed(button)
    -- your code here 
end

love.gamepadreleased = function(joystick, button)
    imgui.love.GamepadReleased(button)
    -- your code here 
end

-- choose threshold for considering analog controllers active, defaults to 0 if unspecified
local threshold = 0.2 

love.gamepadaxis = function(joystick, axis, value)
    imgui.love.GamepadAxis(axis, value, threshold)
    -- your code here 
end
```

### More info on where to put the shared library
As mentioned earlier, unfortunately you cannot place the shared cimgui library inside the .love archive and then load it through `ffi.load`. In theory you can put the shared library anywhere on your computer and then point `package.cpath` to the appropriate path, but you need to be more careful if you plan to distribute the .love archive to other people.

A decent compromise is to put the shared library inside the archive and have LÖVE copy it to the game save folder when it starts (before the cimgui module is loaded) and then point `package.cpath` there with the help of `love.filesystem.getSaveDirectory()`.

### Some notes about FFI

While the wrappers allow you to work with Lua objects most of the time, there are many cases in which you will need to deal with FFI objects directly (e.g., creating them, casting them to other types). In other words, you need to be somewhat familiar with the LuaJIT FFI library in order to use cimgui-love.

Some particular things to keep in mind:
- Don't forget that cdata objects are garbage collected. A case that is particularly easy to miss is when you assign a Lua string to a "const char*" member of a struct: the string is converted to a pointer which will point to stale data if the string is garbage collected (which it will, if you didn't reference it anywhere).
- There is no address-of operator. If you need to pass, say, a `int *` to a function you can create it (and optionally initialise it) using `x = ffi.new("int[1]")`. You can access the int intself with `x[0]`.

### Wrapping convetions

#### Naming conventions

- Functions in cimgui starting with `ig` are wrapped as functions of the same name but with the `ig` removed. For example `igShowDemoWindow` is wrapped as `imgui.ShowDemoWindow`.
- Enums are accessible with the same name they have in imgui/cimgui. For example `ImGuiWindowFlags_None` is wrapped as `imgui.ImGuiWindowFlags_None`.
- Class member functions (those with a cimgui name of the form `ClassName_FuncName`) are wrapped as elements of a table with the class name. For example, `ImColor_SetHSV` is wrapped as `imgui.ImColor.SetHSV`. The table `imgui.ClassName` serves as the metatable for FFI cdata of type `ClassName`, so non-static member functions can be called as methods:
  
  ```lua
  local color = imgui.ImColor.HSV(h, s, v, a)
  color:SetHSV(h1, s1, v1, a1) -- equivalent to imgui.ImColor.SetHSV(color, h1, s1, v1, a1)
  ```
- Note that currently the member function `ImGuiTextBuffer_end` poses a slight problem since calling `imgui.ImGuiTextBuffer.end(textbuffer)` or `textbuffer:end()` is not allowed by Lua since `end` is a reserved keyword. To access it you can use both `imgui.ImGuiTextBuffer["end"]` and `imgui.ImGuiTextBuffer.c_end`.
  
  ```lua
  local textbuffer = imgui.ImGuiTextBuffer()
  --the following all do the same:
  imgui.ImGuiTextBuffer["end"](textbuffer)
  imgui.ImGuiTextBuffer.c_end(textbuffer)
  textbuffer:c_end()
  ```
  The automatic wrapper generator will use the same convention if similar member functions are introduced in future versions of imgui/cimgui.
- Class constructors (those with a cimgui name of the form `ClassName_ClassName` or `ClassName_ClassName_OverloadIdentifier`) are wrapped as functions without the initial `ClassName_` (non-overloaded constructors are actually wrapped as the `__call` meta-method of `imgui.ClassName`, but the result is the same).
  
  ```lua
  local ffi = "ffi"
  local v = imgui.ImVec2_Nil()
  print(ffi.typeof(v)) -- ctype<struct ImVec2 &>
  ```
  Note that wrapped constructors return cdata of type `ClassName` rather than `ClassName*`, and can be passed both to `ClassName` and `ClassName*` arguments of functions.
- cdata of type `ImVec2` and `ImVec4` have been given `__add`, `__sum`, `__unm`, `__mul`, and `__div` meta-methods to simplify their manipulation (they can be added, subtracted, and multiplied/divided by numbers).
- `igGET_FLT_MIN` and `igGET_FLT_MAX`are not wrapped directly since they always return the same value. Instead, their return values are wrapped as the numbers `imgui.FLT_MIN`, `imgui.FLT_MAX`.
- All the unwrapped functions are accessible through FFI and exposed through `imgui.C`, which is the clib returned by `ffi.load`. For example `imgui.C.igRender` is the unwrapped version of `imgui.Render`. The function names in `imgui.C` are the cimgui ones.

#### Implementation specific functions

Starting from version 1.87-1 the functions specific to the LÖVE implementation have been moved to the `imgui.love` table. The implementation functions are
- `imgui.love.Init()`
- `imgui.love.BuildFontAtlas()`
- `imgui.love.Update(dt)`
- `imgui.love.RenderDrawLists()`
- `imgui.love.MouseMoved(x, y)`
- `imgui.love.MousePressed(button)`
- `imgui.love.MouseReleased(button)`
- `imgui.love.WheelMoved(x, y)`
- `imgui.love.KeyPressed(key)`
- `imgui.love.KeyReleased(key)`
- `imgui.love.TextInput(text)`
- `imgui.love.Shutdown()`
- `imgui.love.GetWantCaptureMouse()`
- `imgui.love.GetWantCaptureKeyboard()`
- `imgui.love.GetWantTextInput()`
- `imgui.love.JoystickAdded(joystick)`
- `imgui.love.JoystickRemoved()`
- `imgui.love.GamepadPressed(button)`
- `imgui.love.GamepadReleased(button)`
- `imgui.love.GamepadAxis(axis, value, threshold)`

See the example above to figure out how to use them. `imgui.love.BuildFontAtlas` is used after changing/adding fonts to rebuild the font atlas as a LÖVE texture, and must be used *after* `imgui.love.Init`.

In versions earlier than 1.87-1 the implementation functions were located in the `imgui` table together with the wrappers. If you prefer this convention or you want to upgrade an older project without breaking it you can move all the functions back to the old location by running `imgui.love.RevertToOldNames()`.

#### Flag helpers
The various flag enums are generally meant to be added using bitwise or, which can be done directly using LuaJIT's `bit.bor`. To make it easier to write the combined flags, some helper functions are added to the Lua module (one for each type of flag). For example, the `ImGuiWindowFlags` has the flag helper `imgui.love.WindowFlags`, a function taking as input the needed flag labels (as strings) and returning their bitwise or.
```lua
imgui.love.WindowFlags("NoTitleBar", "NoBackground", "HorizontalScrollbar")
-- same as
local bit = require "bit"
bit.bor(imgui.ImGuiWindowFlags_NoTitleBar, imgui.ImGuiWindowFlags_NoBackground, imgui.ImGuiWindowFlags_HorizontalScrollbar)
```
Prior to version 1.87-1 the flag helper functions were located in the `imgui` table. They can be moved back to the old location by running `imgui.love.RevertToOldNames()`.

#### Shortcut helpers
Dear ImGui does not currently have a way to process keyboard shortcuts defined in `MenuItem`. The Lua module contains some helper functions to easily implement and process keyboard shortcuts.

- 
  ```lua
  shortcut = imgui.love.Shortcut(modifiers, key, action, enabled, global)
  ```
  This function creates a new shortcut and adds it an internal list. It also outputs a table containing a string representation of the keyboard shortcut and the action that should be run.
  - `modifiers` is a table containing the modifiers for the shortcut, chosen among "shift", "ctrl", "alt", "gui". This is an optional argument, if `nil` is passed to it it will default to `{}`, i.e., no modifiers.
  - `key` should be a LÖVE [KeyConstant](https://love2d.org/wiki/KeyConstant) to be pressed together with the modifiers. The string representation assumes this is a letter or number key and it may look wrong if it is something different.
  - `action` is the function to run when the shortcut is processed.
  - `enabled` is an optional boolean flag specified whether the shortcut is currently enabled. Useful to make the shortcut only work under certain conditions. Defaults to `true`.
  - `global` is an optional boolean flag specifying whether the shortcut should be always usable or only when the window it is defined in is focused. Defaults to `true`.
  - The table returned by this function has 3 keys:
    - `shortcut.text` is a string representing the keyboard shortcut (e.g., "Ctrl+S")
    - `shortcut.action` is the function that was passed to the `action` argument of `imgui.love.Shortcut`.
    - `shortcut.enabled` is the boolean flag that was passed to the `enabled` argument of `imgui.love.Shortcut`.

-
  ```lua
  imgui.love.RunShortcuts(key)
  ```
  This is the function that starts the processing of the shortcuts. It is meant to be run inside `love.keypressed`. `key` is the KeyConstant that has just been pressed.

```lua

love.draw = function()
     if imgui.Begin("test", nil, imgui.ImGuiWindowFlags_MenuBar) then
        action = function print("Shortcut processed.") end
        shortcut = imgui.love.Shortcut({"ctrl", "shift"}, "s", action, true, false)

        if imgui.BeginMenuBar() then
            if imgui.BeginMenu("File") then
                -- disable MenuItem if shortcut is not enabled
                if imgui.MenuItem_Bool("Save", shortcut.text, nil, shortcut.enabled) then
                    shortcut.action()
                end
                imgui.EndMenu()
            end
            imgui.EndMenuBar()
        end

    end
    imgui.End()

    imgui.Render()
    imgui.love.RenderDrawLists()
end

love.keypressed = function(key, ...)
    imgui.love.KeyPressed(key)
    if not imgui.love.GetWantCaptureKeyboard() then
        imgui.love.RunShortcuts(key)
    end
end

```
	
#### Excluded functions

- Functions taking `va_list` arguments are not wrapped, since the `...` versions are easier to use in Lua.
- Class destructors (e.g., `ImVec2_destroy`) are not wrapped as the garbage collector takes care of freeing memory allocated by the wrapped constructors.
- `ImVector_ImWchar_*` functions are not wrapped as creating an `ImVector_ImWchar` directly should not be needed.

*Note*: functions that are not wrapped can still be accessed as C functions through `imgui.C` as described above.

#### Output arguments

Some cimgui/imgui functions have pointer arguments that are meant as outputs, for example
```c
void igColorConvertRGBtoHSV(float r,float g,float b,float* out_h,float* out_s,float* out_v);
```
Pointer arguments named `out`, `out_*`, or `pOut` are considered output arguments; they are omitted from the arguments list of the wrapped function and are returned instead. Note that they are returned *before* the "regular" function output (if any)!

For example the function above is wrapped as
```lua
imgui.ColorConvertRGBtoHSV(r, g, b)
```
and it returns 3 numbers.

*Note*: only arguments with the specific names listed above are treated like this by the wrapper generator. It's possible that other arguments are also meant as outputs but are not omitted/returned because they have different names.

#### Default arguments

The wrappers take into account default arguments for the functions. Pass `nil` to an argument to use the default value, if it has one (see imgui/cimgui headers).

*Note*: see `ignored_defaults.txt` for a list of default arguments for which passing `nil` doesn't work. In the current version there are none, but it's possible some will appear if you run the generator yourself on a newer version of cimgui.

#### Overloaded function names

Overloaded functions from imgui are renamed in cimgui to wrap them in C, for example `BeginChild` is split into `igBeginChild_Str` and `igBeginChild_ID`. Overloaded functions from cimgui are wrapped individually, so you would call `imgui.BeginChild_Str` or `imgui.BeginChild_ID` depending on which arguments you plan to pass to the function. This was done to avoid the overhead of a type check in Lua and to allow for an easy implementation of default arguments.

### Changing fonts
If you change or add fonts you need to rebuild the font atlas with `imgui.love.BuildFontAtlas()`. For example:
```lua
local ffi = require "ffi"
local imio = imgui.GetIO()
    
local config = imgui.ImFontConfig()
config.FontDataOwnedByAtlas = false -- it's important to set this, or imgui.love.Shutdown() will crash trying to free already freed memory

local font_size = 16
local content, size = love.filesystem.read("example.ttf")
local newfont = imio.Fonts:AddFontFromMemoryTTF(ffi.cast("void*", content), size, font_size, config)
imio.FontDefault = newfont

imgui.love.BuildFontAtlas()
```
Fonts can also be added from files, but you need to take care of where they are placed as `ImFontAtlas_AddFontFromFileTTF` cannot access files inside the source .love.

### Images
You can add LÖVE images to ImGui with `imgui.Image` and `imgui.ImageButton` by passing a `Texture` object in the `user_texture_id` field.
```lua
local img = love.graphics.newImage("test.png")
local size = imgui.ImVec2_Float(img:getDimensions())

love.draw = function()
    if imgui.Begin("test window") then
        imgui.Image(img, size)
    end
    imgui.End()
    
    imgui.Render()
    imgui.love.RenderDrawLists()
end
```
The same applies to the wrappers of other functions taking "ImTextureID" as an argument.

### Gamepad
Gamepad navigation is supported (once enabled in `io.ConfigFlags`). Note that it only works for joysticks that LÖVE recognises as gamepads. The mapping used is the default Xbox 360 mapping from Dear ImGui. You can change mappings using `love.joystick.setGamepadMapping`.

## Compiling the library and generating the wrappers

If you want to compile the shared library yourself clone this repository with
```
git clone --recursive https://github.com/apicici/cimgui-love.git
```
and compile cimgui from the `cimgui` subfolder using CMake.

If you want to generate the wrapper yourself you should do the following after cloning the repository:
- `git checkout` the relevant commit in the `cimgui/imgui` nested submodule
- run `cimgui/generator/generator.sh` or `cimgui/generator/generator.bat` depending on your system
- run `generator.lua` in the base folder of the repository using Lua
- compile the shared library in `cimgui` using CMake
- the Lua module is in the `src` subfolder


