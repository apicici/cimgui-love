-- RenderDrawLists is based on love-imgui (https://github.com/slages/love-imgui) Copyright (c) 2016 slages, licensed under the MIT license

local path = (...):gsub("[^%.]*$", "")
local M = require(path .. "master")
local ffi = require("ffi")
local bit = require("bit")
local love = require("love")

local C = M.C
local L = M.love
local _common = M._common

local vertexformat

local major, minor = love.getVersion()
if major == 12 then
    vertexformat = {
        {name="VertexPosition", format="floatvec2"},
        {name="VertexTexCoord", format="floatvec2"},
        {name="VertexColor", format="unorm8vec4"}
    }
elseif major == 11 then
    vertexformat = {
        {"VertexPosition", "float", 2},
        {"VertexTexCoord", "float", 2},
        {"VertexColor", "byte", 4}
    }
else
    error("This version of LÖVE is not supported by cimgui-love")
end

local lovekeymap = {
    ["return"] = C.ImGuiKey_Enter,
    ["escape"] = C.ImGuiKey_Escape,
    ["backspace"] = C.ImGuiKey_Backspace,
    ["tab"] = C.ImGuiKey_Tab,
    ["space"] = C.ImGuiKey_Space,
    [","] = C.ImGuiKey_Comma,
    ["-"] = C.ImGuiKey_Minus,
    ["."] = C.ImGuiKey_Period,
    ["/"] = C.ImGuiKey_Slash,

    ["0"] = C.ImGuiKey_0,
    ["1"] = C.ImGuiKey_1,
    ["2"] = C.ImGuiKey_2,
    ["3"] = C.ImGuiKey_3,
    ["4"] = C.ImGuiKey_4,
    ["5"] = C.ImGuiKey_5,
    ["6"] = C.ImGuiKey_6,
    ["7"] = C.ImGuiKey_7,
    ["8"] = C.ImGuiKey_8,
    ["9"] = C.ImGuiKey_9,

    [";"] = C.ImGuiKey_Semicolon,
    ["="] = C.ImGuiKey_Equal,

    ["["] = C.ImGuiKey_LeftBracket,
    ["\\"] = C.ImGuiKey_Backslash,
    ["]"] = C.ImGuiKey_RightBracket,
    ["`"] = C.ImGuiKey_GraveAccent,

    ["a"] = C.ImGuiKey_A,
    ["b"] = C.ImGuiKey_B,
    ["c"] = C.ImGuiKey_C,
    ["d"] = C.ImGuiKey_D,
    ["e"] = C.ImGuiKey_E,
    ["f"] = C.ImGuiKey_F,
    ["g"] = C.ImGuiKey_G,
    ["h"] = C.ImGuiKey_H,
    ["i"] = C.ImGuiKey_I,
    ["j"] = C.ImGuiKey_J,
    ["k"] = C.ImGuiKey_K,
    ["l"] = C.ImGuiKey_L,
    ["m"] = C.ImGuiKey_M,
    ["n"] = C.ImGuiKey_N,
    ["o"] = C.ImGuiKey_O,
    ["p"] = C.ImGuiKey_P,
    ["q"] = C.ImGuiKey_Q,
    ["r"] = C.ImGuiKey_R,
    ["s"] = C.ImGuiKey_S,
    ["t"] = C.ImGuiKey_T,
    ["u"] = C.ImGuiKey_U,
    ["v"] = C.ImGuiKey_V,
    ["w"] = C.ImGuiKey_W,
    ["x"] = C.ImGuiKey_X,
    ["y"] = C.ImGuiKey_Y,
    ["z"] = C.ImGuiKey_Z,

    ["capslock"] = C.ImGuiKey_CapsLock,

    ["f1"] = C.ImGuiKey_F1,
    ["f2"] = C.ImGuiKey_F2,
    ["f3"] = C.ImGuiKey_F3,
    ["f4"] = C.ImGuiKey_F4,
    ["f5"] = C.ImGuiKey_F5,
    ["f6"] = C.ImGuiKey_F6,
    ["f7"] = C.ImGuiKey_F7,
    ["f8"] = C.ImGuiKey_F8,
    ["f9"] = C.ImGuiKey_F9,
    ["f10"] = C.ImGuiKey_F10,
    ["f11"] = C.ImGuiKey_F11,
    ["f12"] = C.ImGuiKey_F12,

    ["printscreen"] = C.ImGuiKey_PrintScreen,
    ["scrolllock"] = C.ImGuiKey_ScrollLock,
    ["pause"] = C.ImGuiKey_Pause,
    ["insert"] = C.ImGuiKey_Insert,
    ["home"] = C.ImGuiKey_Home,
    ["pageup"] = C.ImGuiKey_PageUp,
    ["delete"] = C.ImGuiKey_Delete,
    ["end"] = C.ImGuiKey_End,
    ["pagedown"] = C.ImGuiKey_PageDown,
    ["right"] = C.ImGuiKey_RightArrow,
    ["left"] = C.ImGuiKey_LeftArrow,
    ["down"] = C.ImGuiKey_DownArrow,
    ["up"] = C.ImGuiKey_UpArrow,

    ["numlock"] = C.ImGuiKey_NumLock,
    ["kp/"] = C.ImGuiKey_KeypadDivide,
    ["kp*"] = C.ImGuiKey_KeypadMultiply,
    ["kp-"] = C.ImGuiKey_KeypadSubtract,
    ["kp+"] = C.ImGuiKey_KeypadAdd,
    ["kpenter"] = C.ImGuiKey_KeypadEnter,
    ["kp0"] = C.ImGuiKey_Keypad0,
    ["kp1"] = C.ImGuiKey_Keypad1,
    ["kp2"] = C.ImGuiKey_Keypad2,
    ["kp3"] = C.ImGuiKey_Keypad3,
    ["kp4"] = C.ImGuiKey_Keypad4,
    ["kp5"] = C.ImGuiKey_Keypad5,
    ["kp6"] = C.ImGuiKey_Keypad6,
    ["kp7"] = C.ImGuiKey_Keypad7,
    ["kp8"] = C.ImGuiKey_Keypad8,
    ["kp9"] = C.ImGuiKey_Keypad9,
    ["kp."] = C.ImGuiKey_KeypadDecimal,
    ["kp="] = C.ImGuiKey_KeypadEqual,

    ["menu"] = C.ImGuiKey_Menu,

    ["lctrl"] = {C.ImGuiKey_LeftCtrl, C.ImGuiMod_Ctrl},
    ["lshift"] = {C.ImGuiKey_LeftShift, C.ImGuiMod_Shift},
    ["lalt"] = {C.ImGuiKey_LeftAlt, C.ImGuiMod_Alt},
    ["lgui"] = {C.ImGuiKey_LeftSuper, C.ImGuiMod_Super},
    ["rctrl"] = {C.ImGuiKey_RightCtrl, C.ImGuiMod_Ctrl},
    ["rshift"] = {C.ImGuiKey_RightShift, C.ImGuiMod_Shift},
    ["ralt"] = {C.ImGuiKey_RightAlt, C.ImGuiMod_Alt},
    ["rgui"] = {C.ImGuiKey_RightSuper, C.ImGuiMod_Super},
}
_common.lovekeymap = lovekeymap

local textureObject, textureShader
local strings = {}

_common.textures = setmetatable({},{__mode="v"})
_common.callbacks = setmetatable({},{__mode="v"})

local cliboard_callback_get, cliboard_callback_set
local io

local Alpha8_shader

function L.Init(format)
    Alpha8_shader = love.graphics.newShader [[
        vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
            float alpha = Texel(tex, texture_coords).r;
            return vec4(color.rgb, color.a*alpha);
        }
    ]]

    format = format or "RGBA32"
    C.igCreateContext(nil)
    io = C.igGetIO()
    L.BuildFontAtlas(format)

    cliboard_callback_get = ffi.cast("const char* (*)(void*)", function(userdata)
        return love.system.getClipboardText()
    end)
    cliboard_callback_set = ffi.cast("void (*)(void*, const char*)", function(userdata, text)
        love.system.setClipboardText(ffi.string(text))
    end)

    io.GetClipboardTextFn = cliboard_callback_get
    io.SetClipboardTextFn = cliboard_callback_set

    local dpiscale = love.window.getDPIScale()
    io.DisplayFramebufferScale.x, io.DisplayFramebufferScale.y = dpiscale, dpiscale

    love.filesystem.createDirectory("/")
    strings.ini_filename = love.filesystem.getSaveDirectory() .. "/imgui.ini"
    io.IniFilename = strings.ini_filename

    strings.impl_name = "cimgui-love"
    io.BackendPlatformName = strings.impl_name
    io.BackendRendererName = strings.impl_name

    io.BackendFlags = bit.bor(C.ImGuiBackendFlags_HasMouseCursors, C.ImGuiBackendFlags_HasSetMousePos)
end

local custom_shader

function L.SetShader(shader)
    custom_shader = shader
end

function L.BuildFontAtlas(format)
    format = format or "RGBA32"
    local pixels, width, height = ffi.new("unsigned char*[1]"), ffi.new("int[1]"), ffi.new("int[1]")
    local imgdata

    if format == "RGBA32" then
        C.ImFontAtlas_GetTexDataAsRGBA32(io.Fonts, pixels, width, height, nil)
        imgdata = love.image.newImageData(width[0], height[0], "rgba8", ffi.string(pixels[0], width[0]*height[0]*4))
        textureShader = nil
    elseif format == "Alpha8" then
        C.ImFontAtlas_GetTexDataAsAlpha8(io.Fonts, pixels, width, height, nil)
        imgdata = love.image.newImageData(width[0], height[0], "r8", ffi.string(pixels[0], width[0]*height[0]))
        textureShader = Alpha8_shader
    else
        error([[Format should be either "RGBA32" or "Alpha8".]], 2)
    end

    textureObject = love.graphics.newImage(imgdata)
end

function L.Update(dt)
    io.DisplaySize.x, io.DisplaySize.y = love.graphics.getDimensions()
    io.DeltaTime = dt

    if io.WantSetMousePos then
        love.mouse.setPosition(io.MousePos.x, io.MousePos.y)
    end
end

local function love_texture_test(t)
    return t:typeOf("Texture")
end

local cursors = {
    [C.ImGuiMouseCursor_Arrow] = love.mouse.getSystemCursor("arrow"),
    [C.ImGuiMouseCursor_TextInput] = love.mouse.getSystemCursor("ibeam"),
    [C.ImGuiMouseCursor_ResizeAll] = love.mouse.getSystemCursor("sizeall"),
    [C.ImGuiMouseCursor_ResizeNS] = love.mouse.getSystemCursor("sizens"),
    [C.ImGuiMouseCursor_ResizeEW] = love.mouse.getSystemCursor("sizewe"),
    [C.ImGuiMouseCursor_ResizeNESW] = love.mouse.getSystemCursor("sizenesw"),
    [C.ImGuiMouseCursor_ResizeNWSE] = love.mouse.getSystemCursor("sizenwse"),
    [C.ImGuiMouseCursor_Hand] = love.mouse.getSystemCursor("hand"),
    [C.ImGuiMouseCursor_NotAllowed] = love.mouse.getSystemCursor("no"),
}

local mesh, meshdata
local max_vertexcount = -math.huge

function L.RenderDrawLists()
    -- Avoid rendering when minimized
    if io.DisplaySize.x == 0 or io.DisplaySize.y == 0 or not love.window.isVisible() then return end

    love.graphics.push("all")

    _common.RunShortcuts()
    local data = C.igGetDrawData()

    -- change mouse cursor
    if bit.band(io.ConfigFlags, C.ImGuiConfigFlags_NoMouseCursorChange) ~= C.ImGuiConfigFlags_NoMouseCursorChange then
        local cursor = cursors[C.igGetMouseCursor()]
        if io.MouseDrawCursor or not cursor then
            love.mouse.setVisible(false) -- Hide OS mouse cursor if ImGui is drawing it
        else
            love.mouse.setVisible(true)
            love.mouse.setCursor(cursor)
        end
    end

    for i = 0, data.CmdListsCount - 1 do
        local cmd_list = data.CmdLists[i]

        local vertexcount = cmd_list.VtxBuffer.Size
        local data_size = vertexcount*ffi.sizeof("ImDrawVert")
        if vertexcount > max_vertexcount then
            max_vertexcount = vertexcount
            if mesh then mesh:release() end
            if meshdata then meshdata:release() end
            meshdata = love.data.newByteData(math.max(data_size, ffi.sizeof("ImDrawVert")))
            ffi.copy(meshdata:getFFIPointer(), cmd_list.VtxBuffer.Data, data_size)
            mesh = love.graphics.newMesh(vertexformat, meshdata, "triangles", "static")
        else
            ffi.copy(meshdata:getFFIPointer(), cmd_list.VtxBuffer.Data, data_size)
            mesh:setVertices(meshdata)
        end

        local IdxBuffer = {}
        for k = 1, cmd_list.IdxBuffer.Size do
            IdxBuffer[k] = cmd_list.IdxBuffer.Data[k - 1] + 1
        end
        mesh:setVertexMap(IdxBuffer)

        for k = 0, cmd_list.CmdBuffer.Size - 1 do
            local cmd = cmd_list.CmdBuffer.Data[k]
            if cmd.UserCallback ~= nil then
                local callback = _common.callbacks[ffi.string(ffi.cast("void*", cmd.UserCallback))] or cmd.UserCallback
                callback(cmd_list, cmd)
            elseif cmd.ElemCount > 0 then
                local clipX, clipY = cmd.ClipRect.x, cmd.ClipRect.y
                local clipW = cmd.ClipRect.z - clipX
                local clipH = cmd.ClipRect.w - clipY

                love.graphics.setBlendMode("alpha", "alphamultiply")

                local texture_id = C.ImDrawCmd_GetTexID(cmd)
                if texture_id ~= nil then
                    local obj = _common.textures[tostring(texture_id)]
                    local status, value = pcall(love_texture_test, obj)
                    assert(status and value, "Only LÖVE Texture objects can be passed as ImTextureID arguments.")
                    if obj:typeOf("Canvas") then
                        love.graphics.setBlendMode("alpha", "premultiplied")
                    end
                    love.graphics.setShader()
                    mesh:setTexture(obj)
                else
                    love.graphics.setShader(custom_shader or textureShader)
                    mesh:setTexture(textureObject)
                end

                love.graphics.setScissor(clipX, clipY, clipW, clipH)
                mesh:setDrawRange(cmd.IdxOffset + 1, cmd.ElemCount)
                love.graphics.draw(mesh)
            end
        end
    end
    love.graphics.pop()
end

function L.MouseMoved(x, y)
    if love.window.hasMouseFocus() then
        io:AddMousePosEvent(x, y)
    end
end

local mouse_buttons = {true, true, true}

function L.MousePressed(button)
    if mouse_buttons[button] then
        io:AddMouseButtonEvent(button - 1, true)
    end
end

function L.MouseReleased(button)
    if mouse_buttons[button] then
        io:AddMouseButtonEvent(button - 1, false)
    end
end

function L.WheelMoved(x, y)
    io:AddMouseWheelEvent(x, y)
end

function L.KeyPressed(key)
    local t = lovekeymap[key]
    if type(t) == "table" then
        io:AddKeyEvent(t[1], true)
        io:AddKeyEvent(t[2], true)
    else
        io:AddKeyEvent(t or C.ImGuiKey_None, true)
    end
end

function L.KeyReleased(key)
    local t = lovekeymap[key]
    if type(t) == "table" then
        io:AddKeyEvent(t[1], false)
        io:AddKeyEvent(t[2], false)
    else
        io:AddKeyEvent(t or C.ImGuiKey_None, false)
    end
end

function L.TextInput(text)
    C.ImGuiIO_AddInputCharactersUTF8(io, text)
end

function L.Shutdown()
    C.igDestroyContext(nil)
    io = nil
    cliboard_callback_get:free()
    cliboard_callback_set:free()
    cliboard_callback_get, cliboard_callback_set = nil
end

function L.JoystickAdded(joystick)
    if not joystick:isGamepad() then return end
    io.BackendFlags = bit.bor(io.BackendFlags, C.ImGuiBackendFlags_HasGamepad)
end

function L.JoystickRemoved()
    for _, joystick in ipairs(love.joystick.getJoysticks()) do
        if joystick:isGamepad() then return end
    end
    io.BackendFlags = bit.band(io.BackendFlags, bit.bnot(C.ImGuiBackendFlags_HasGamepad))
end

local gamepad_map = {
    start = C.ImGuiKey_GamepadStart,
    back = C.ImGuiKey_GamepadBack,
    a = C.ImGuiKey_GamepadFaceDown,
    b = C.ImGuiKey_GamepadFaceRight,
    y = C.ImGuiKey_GamepadFaceUp,
    x = C.ImGuiKey_GamepadFaceLeft,
    dpleft = C.ImGuiKey_GamepadDpadLeft,
    dpright = C.ImGuiKey_GamepadDpadRight,
    dpup = C.ImGuiKey_GamepadDpadUp,
    dpdown = C.ImGuiKey_GamepadDpadDown,
    leftshoulder = C.ImGuiKey_GamepadL1,
    rightshoulder = C.ImGuiKey_GamepadR1,
    leftstick = C.ImGuiKey_GamepadL3,
    rightstick = C.ImGuiKey_GamepadR3,
    --analog
    triggerleft = C.ImGuiKey_GamepadL2,
    triggerright = C.ImGuiKey_GamepadR2,
    leftx = {C.ImGuiKey_GamepadLStickLeft, C.ImGuiKey_GamepadLStickRight},
    lefty = {C.ImGuiKey_GamepadLStickUp, C.ImGuiKey_GamepadLStickDown},
    rightx = {C.ImGuiKey_GamepadRStickLeft, C.ImGuiKey_GamepadRStickRight},
    righty = {C.ImGuiKey_GamepadRStickUp, C.ImGuiKey_GamepadRStickDown},
}

function L.GamepadPressed(button)
    io:AddKeyEvent(gamepad_map[button] or C.ImGuiKey_None, true)
end

function L.GamepadReleased(button)
    io:AddKeyEvent(gamepad_map[button] or C.ImGuiKey_None, false)
end

function L.GamepadAxis(axis, value, threshold)
    threshold = threshold or 0
    local imguikey = gamepad_map[axis]
    if type(imguikey) == "table" then
        if value > threshold then
            io:AddKeyAnalogEvent(imguikey[2], true, value)
            io:AddKeyAnalogEvent(imguikey[1], false, 0)
        elseif value < -threshold then
            io:AddKeyAnalogEvent(imguikey[1], true, -value)
            io:AddKeyAnalogEvent(imguikey[2], false, 0)
        else
           io:AddKeyAnalogEvent(imguikey[1], false, 0)
           io:AddKeyAnalogEvent(imguikey[2], false, 0)
        end
    elseif imguikey then
        io:AddKeyAnalogEvent(imguikey, value ~= 0, value)
    end
end

-- input capture

function L.GetWantCaptureMouse()
    return io.WantCaptureMouse
end

function L.GetWantCaptureKeyboard()
    return io.WantCaptureKeyboard
end

function L.GetWantTextInput()
    return io.WantTextInput
end

-- flag helpers
local flags = {}

for name in pairs(M) do
    name = name:match("^(%w+Flags)_")
    if name and not flags[name] then
        flags[name] = true
    end
end

for name in pairs(flags) do
    local shortname = name:gsub("^ImGui", "")
    shortname = shortname:gsub("^Im", "")
    L[shortname] = function(...)
        local t = {}
        for _, flag in ipairs({...}) do
            t[#t + 1] = M[name .. "_" .. flag]
        end
        return bit.bor(unpack(t))
    end
end

-- revert to old implementation names, i.e., imgui.RenderDrawLists instead of imgui.love.RenderDrawLists, etc.
local old_names = {}

for k, v in pairs(L) do
    old_names[k] = v
end

function L.RevertToOldNames()
    for k, v in pairs(old_names) do
        M[k] = v
    end
end


