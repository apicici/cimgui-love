-- RenderDrawLists is based on love-imgui (https://github.com/slages/love-imgui) Copyright (c) 2016 slages, licensed under the MIT license

local path = (...):gsub("[^%.]*$", "")
local M = require(path .. "master")
local ffi = require("ffi")
local bit = require("bit")

local C = M.C

local vertexformat = {
    {"VertexPosition", "float", 2},
    {"VertexTexCoord", "float", 2},
    {"VertexColor", "byte", 4}
}

local lovekeymap = {}

local letters = "abcdefghijklmnopqrstuvwxyz"
for i = 1, #letters do
    local letter = letters:sub(i,i)
    lovekeymap[letter] = C["ImGuiKey_" .. letter:upper()]
end
for i = 0, 9 do
    lovekeymap[tostring(i)] =  C["ImGuiKey_" .. i]
    lovekeymap["kp" .. i] =  C["ImGuiKey_Keypad" .. i]
end
for i = 1, 12 do
    lovekeymap["f" .. i] =  C["ImGuiKey_F" .. i]
end
local inverse_map = {
    ["LeftArrow"] = "left",
    ["RightArrow"] = "right",
    ["UpArrow"] = "up",
    ["DownArrow"] = "down",
    ["Tab"] = string.lower,
    ["PageUp"] = string.lower,
    ["PageDown"] = string.lower,
    ["Home"] = string.lower,
    ["End"] = string.lower,
    ["Insert"] = string.lower,
    ["Delete"] = string.lower,
    ["Backspace"] = string.lower,
    ["Space"] = string.lower,
    ["Enter"] = "return",
    ["Escape"] = string.lower,
    ["LeftCtrl"] = "lctrl",
    ["LeftShift"] = "lshift",
    ["LeftAlt"] = "lgui",
    ["LeftSuper"] = "lgui",
    ["RightCtrl"] = "rctrl",
    ["RightShift"] = "rshift",
    ["RightAlt"] = "ralt",
    ["RightSuper"] = "rgui",
    ["Menu"] = string.lower,
    ["Apostrophe"] = "'",
    ["Comma"] = ",",
    ["Minus"] = "-",
    ["Period"] = ".",
    ["Slash"] = "/",
    ["Semicolon"] = ";",
    ["Equal"] = "=",
    ["LeftBracket"] = "[",
    ["Backslash"] = "\\",
    ["RightBracket"] = "]",
    ["GraveAccent"] = "`",
    ["CapsLock"] = string.lower,
    ["ScrollLock"] = string.lower,
    ["NumLock"] = string.lower,
    ["PrintScreen"] = string.lower,
    ["Pause"] = string.lower,
    ["KeypadDecimal"] = "kp.",
    ["KeypadDivide"] = "kp/",
    ["KeypadMultiply"] = "kp*",
    ["KeypadSubtract"] = "kp-",
    ["KeypadAdd"] = "kp+",
    ["KeypadEnter"] = "kpenter",
    ["KeypadEqual"] = "kp=",
}
for k, v in pairs(inverse_map) do
    v = type(v) == "function" and v(k) or v
    lovekeymap[v] = C["ImGuiKey_" .. k]
end


local ini_filename, textureObject

M._textures = setmetatable({},{__mode="v"})

function M.Init()
    C.igCreateContext(nil)
    M.BuildFontAtlas()

    local io = C.igGetIO()

    io.GetClipboardTextFn = function(userdata)
        return love.system.getClipboardText()
    end
    io.SetClipboardTextFn = function(userdata, text)
        love.system.setClipboardText(ffi.string(text))
    end

    local dpiscale = love.window.getDPIScale()
    io.DisplayFramebufferScale.x, io.DisplayFramebufferScale.x = dpiscale, dpiscale

    love.filesystem.createDirectory("/")
    ini_filename = love.filesystem.getSaveDirectory() .. "/imgui.ini"
    io.IniFilename = ini_filename

    io.BackendFlags = bit.bor(C.ImGuiBackendFlags_HasMouseCursors, C.ImGuiBackendFlags_HasSetMousePos)
end

function M.BuildFontAtlas()
    local io = C.igGetIO()
    local pixels, width, height = ffi.new("unsigned char*[1]"), ffi.new("int[1]"), ffi.new("int[1]")
    C.ImFontAtlas_GetTexDataAsRGBA32(io.Fonts, pixels, width, height, nil)
    local imgdata = love.image.newImageData(width[0], height[0], "rgba8", ffi.string(pixels[0], width[0]*height[0]*4))
    textureObject = love.graphics.newImage(imgdata)
end

function M.Update(dt)
    local io = C.igGetIO()
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

function M.RenderDrawLists()
    local io = C.igGetIO()
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

    -- Avoid rendering when minimized, scale coordinates for retina displays
    -- (screen coordinates != framebuffer coordinates)
    if io.DisplaySize.x == 0 or io.DisplaySize.y == 0 then return end
    C.ImDrawData_ScaleClipRects(data, io.DisplayFramebufferScale)

    for i = 0, data.CmdListsCount - 1 do
        local cmd_list = data.CmdLists[i]
        local VtxSize = cmd_list.VtxBuffer.Size*ffi.sizeof("ImDrawVert")
        local meshdata = love.image.newImageData(VtxSize/4, 1)
        ffi.copy(meshdata:getFFIPointer(), cmd_list.VtxBuffer.Data, VtxSize)
        local mesh = love.graphics.newMesh(vertexformat, meshdata, "triangles", "static")

        local IdxBuffer = {}
        for k = 1, cmd_list.IdxBuffer.Size do
            IdxBuffer[k] = cmd_list.IdxBuffer.Data[k - 1] + 1
        end
        mesh:setVertexMap(IdxBuffer)

        for k = 0, cmd_list.CmdBuffer.Size - 1 do
            local cmd = cmd_list.CmdBuffer.Data[k]
            local clipX, clipY = cmd.ClipRect.x, cmd.ClipRect.y
            local clipW = cmd.ClipRect.z - clipX
            local clipH = cmd.ClipRect.w - clipY

            love.graphics.setBlendMode("alpha")

            local texture_id = C.ImDrawCmd_GetTexID(cmd)
            if texture_id ~= nil then
                local obj = M._textures[tostring(texture_id)]
                local status, value = pcall(love_texture_test, obj)
                assert(status and value, "Only LÖVE Texture objects can be passed as ImTextureID arguments.")
                if obj:typeOf("Canvas") then
					love.graphics.setBlendMode("alpha", "premultiplied")
                end
                mesh:setTexture(obj)
            else
                mesh:setTexture(textureObject)
            end

            love.graphics.setScissor(clipX, clipY, clipW, clipH)
            mesh:setDrawRange(cmd.IdxOffset + 1, cmd.ElemCount)
            love.graphics.draw(mesh)
            love.graphics.setBlendMode("alpha")
        end
    end
    love.graphics.setScissor()
end

function M.MouseMoved(x, y)
    if love.window.hasMouseFocus() then
        C.igGetIO():AddMousePosEvent(x, y)
    end
end

local mouse_buttons = {true, true, true}

function M.MousePressed(button)
    if mouse_buttons[button] then
        C.igGetIO():AddMouseButtonEvent(button - 1, true)
    end
end

function M.MouseReleased(button)
    if mouse_buttons[button] then
        C.igGetIO():AddMouseButtonEvent(button - 1, false)
    end
end

function M.WheelMoved(x, y)
    C.igGetIO():AddMouseWheelEvent(x, y)
end


local function update_mods()
    local key_mods = bit.bor(
        love.keyboard.isDown("rshift", "lshift") and C.ImGuiKeyModFlags_Shift or C.ImGuiKeyModFlags_None,
        love.keyboard.isDown("rctrl", "lctrl") and C.ImGuiKeyModFlags_Ctrl or C.ImGuiKeyModFlags_None,
        love.keyboard.isDown("ralt", "lalt") and C.ImGuiKeyModFlags_Alt or C.ImGuiKeyModFlags_None,
        love.keyboard.isDown("rgui", "lgui") and C.ImGuiKeyModFlags_Super or C.ImGuiKeyModFlags_None
    )
    C.igGetIO():AddKeyModsEvent(key_mods)
end

function M.KeyPressed(key)
    C.igGetIO():AddKeyEvent(lovekeymap[key] or C.ImGuiKey_None, true)
    update_mods()
end

function M.KeyReleased(key)
    C.igGetIO():AddKeyEvent(lovekeymap[key] or C.ImGuiKey_None, false)
    update_mods()
end

function M.TextInput(text)
    C.ImGuiIO_AddInputCharactersUTF8(C.igGetIO(), text)
end

function M.Shutdown()
    C.igDestroyContext(nil)
end

function M.JoystickAdded(joystick)
    if not joystick:isGamepad() then return end
    local io = C.igGetIO()
    io.BackendFlags = bit.bor(io.BackendFlags, C.ImGuiBackendFlags_HasGamepad)
end

function M.JoystickRemoved()
    for _, joystick in ipairs(love.joystick.getJoysticks()) do
        if joystick:isGamepad() then return end
    end
    local io = C.igGetIO()
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

function M.GamepadPressed(button)
    C.igGetIO():AddKeyEvent(gamepad_map[button] or C.ImGuiKey_None, true)
end

function M.GamepadReleased(button)
    C.igGetIO():AddKeyEvent(gamepad_map[button] or C.ImGuiKey_None, false)
end

function M.GamepadAxis(axis, value, threshold)
    threshold = threshold or 0
    local io = C.igGetIO()
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

function M.GetWantCaptureMouse()
    return C.igGetIO().WantCaptureMouse
end

function M.GetWantCaptureKeyboard()
    return C.igGetIO().WantCaptureKeyboard
end

function M.GetWantTextInput()
    return C.igGetIO().WantTextInput
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
    M[shortname] = function(...)
        local t = {}
        for _, flag in ipairs({...}) do
            t[#t + 1] = M[name .. "_" .. flag]
        end
        return bit.bor(unpack(t))
    end
end
