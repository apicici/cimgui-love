-- RenderDrawLists is based on love-imgui (https://github.com/slages/love-imgui)

local path = (...):gsub("[^%.]*$", "")
local M = require(path .. "master")
local ffi = require("ffi")

local C = M.C

local vertexformat = {
    {"VertexPosition", "float", 2},
    {"VertexTexCoord", "float", 2},
    {"VertexColor", "byte", 4}
}

local lovekeymap = {
    ["tab"] = 1,
    ["left"] = 2,
    ["right"] = 3,
    ["up"] = 4,
    ["down"] = 5,
    ["pageup"] = 6,
    ["pagedown"] = 7,
    ["home"] = 8,
    ["end"] = 9,
    ["insert"] = 10,
    ["delete"] = 11,
    ["backspace"] = 12,
    ["space"] = 13,
    ["return"] = 14,
    ["escape"] = 15,
    ["kpenter"] = 16,
    ["a"] = 17,
    ["c"] = 18,
    ["v"] = 19,
    ["x"] = 20,
    ["y"] = 21,
    ["z"] = 22
}

local ini_filename, textureObject

M._textures = setmetatable({},{__mode="v"})

function M.Init()
    C.igCreateContext(nil)
    M.BuildFontAtlas()

    local io = C.igGetIO()
    local kmap = io.KeyMap

    kmap[C.ImGuiKey_Tab] = lovekeymap["tab"]
    kmap[C.ImGuiKey_LeftArrow] = lovekeymap["left"]
    kmap[C.ImGuiKey_RightArrow] = lovekeymap["right"]
    kmap[C.ImGuiKey_UpArrow] = lovekeymap["up"]
    kmap[C.ImGuiKey_DownArrow] = lovekeymap["down"]
    kmap[C.ImGuiKey_PageUp] = lovekeymap["pageup"]
    kmap[C.ImGuiKey_PageDown] = lovekeymap["pagedown"]
    kmap[C.ImGuiKey_Home] = lovekeymap["home"]
    kmap[C.ImGuiKey_End] = lovekeymap["end"]
    kmap[C.ImGuiKey_Insert] = lovekeymap["insert"]
    kmap[C.ImGuiKey_Delete] = lovekeymap["delete"]
    kmap[C.ImGuiKey_Backspace] = lovekeymap["backspace"]
    kmap[C.ImGuiKey_Space] = lovekeymap["space"]
    kmap[C.ImGuiKey_Enter] = lovekeymap["return"]
    kmap[C.ImGuiKey_Escape] = lovekeymap["escape"]
    kmap[C.ImGuiKey_KeyPadEnter] = lovekeymap["kpenter"]
    kmap[C.ImGuiKey_A] = lovekeymap["a"]
    kmap[C.ImGuiKey_C] = lovekeymap["c"]
    kmap[C.ImGuiKey_V] = lovekeymap["v"]
    kmap[C.ImGuiKey_X] = lovekeymap["x"]
    kmap[C.ImGuiKey_Y] = lovekeymap["y"]
    kmap[C.ImGuiKey_Z] = lovekeymap["z"]

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

    -- Hide OS mouse cursor if ImGui is drawing it
    love.mouse.setVisible(not io.MouseDrawCursor)
end

local function love_texture_test(t)
    return t:typeOf("Texture")
end

function M.RenderDrawLists()
    local io = C.igGetIO()
    local data = C.igGetDrawData()

    -- Avoid rendering when minimized, scale coordinates for retina displays
    -- (screen coordinates != framebuffer coordinates)
    if io.DisplaySize.x == 0 or io.DisplaySize.y == 0 then return end
    C.ImDrawData_ScaleClipRects(data, io.DisplayFramebufferScale)

    for i = 0, data.CmdListsCount - 1 do
        local cmd_list = data.CmdLists[i]
        local VtxSize = cmd_list.VtxBuffer.Size*ffi.sizeof("ImDrawVert")
        local VtxData = ffi.string(ffi.cast("unsigned char*", cmd_list.VtxBuffer.Data), VtxSize)
        local meshdata = love.image.newImageData(VtxSize/4, 1, "rgba8", VtxData)
        local mesh = love.graphics.newMesh(vertexformat, meshdata, "triangles")

        local IdxBuffer = {}
        for k = 1, cmd_list.IdxBuffer.Size do
            IdxBuffer[k] = cmd_list.IdxBuffer.Data[k - 1] + 1
        end
        mesh:setVertexMap(IdxBuffer)

        local position = 1
        for k = 0, cmd_list.CmdBuffer.Size - 1 do
            local cmd = cmd_list.CmdBuffer.Data[k]
            local clipX, clipY = cmd.ClipRect.x, cmd.ClipRect.y
            local clipW = cmd.ClipRect.z - clipX
            local clipH = cmd.ClipRect.w - clipY

            love.graphics.setBlendMode("alpha")

            local texture_id = cmd.TextureId
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
            mesh:setDrawRange(position, cmd.ElemCount)
            love.graphics.draw(mesh)
            position = position + cmd.ElemCount
            love.graphics.setBlendMode("alpha")
        end
    end
    love.graphics.setScissor()
end

function M.MouseMoved(x, y)
    local io = C.igGetIO()
    if love.window.hasMouseFocus() then
        io.MousePos.x, io.MousePos.y = x, y
    end
end

local mouse_buttons = {true, true, true}

function M.MousePressed(button)
    if mouse_buttons[button] then
        C.igGetIO().MouseDown[button - 1] = true
    end
end

function M.MouseReleased(button)
    if mouse_buttons[button] then
        C.igGetIO().MouseDown[button - 1] = false
    end
end

function M.WheelMoved(x, y)
    local io = C.igGetIO()
    io.MouseWheelH = x
    io.MouseWheel = y
end

function M.KeyPressed(key)
    local io = C.igGetIO()
    if lovekeymap[key] then
        io.KeysDown[lovekeymap[key]] = true
    elseif key == "rshift" or key == "lshift" then
        io.KeyShift = true
    elseif key == "rctrl" or key == "lctrl" then
        io.KeyCtrl = true
    elseif key == "ralt" or key == "lalt" then
        io.KeyAlt = true
    elseif key == "rgui" or key == "lgui" then
        io.KeySuper = true
    end
end

function M.KeyReleased(key)
    local io = C.igGetIO()
    if lovekeymap[key] then
        io.KeysDown[lovekeymap[key]] = false
    elseif key == "rshift" or key == "lshift" then
        io.KeyShift = false
    elseif key == "rctrl" or key == "lctrl" then
        io.KeyCtrl = false
    elseif key == "ralt" or key == "lalt" then
        io.KeyAlt = false
    elseif key == "rgui" or key == "lgui" then
        io.KeySuper = false
    end
end

function M.TextInput(text)
    C.ImGuiIO_AddInputCharactersUTF8(C.igGetIO(), text)
end

function M.Shutdown()
    C.igDestroyContext(nil)
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

local bit = require("bit")
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