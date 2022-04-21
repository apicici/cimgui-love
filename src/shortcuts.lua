local path = (...):gsub("[^%.]*$", "")
local M = require(path .. "master")
local love = require("love")
local jit = require("jit")

local L = M.love

local shortcuts = {}

local modifier_names = {
    shift = "Shift",
    ctrl = "Ctrl",
    alt = "Alt",
    gui = jit.os == "Windows" and "Win" or jit.os == "OSX" and "Cmd" or "Super"
}

local focused_flags = M.ImGuiFocusedFlags_RootAndChildWindows

function L.Shortcut(modifiers, key, action, enabled, global)
    if enabled == nil then enabled = true end
    if global == nil then global = true end
    modifiers = modifiers or {}
    assert(type(modifiers) == "table" and type(key) == "string" and type(action) == "function", "Wrong arguments.")
    local keys = {{key}}
    local key_triggers = {[key]=true}
    for i, mod in ipairs(modifiers) do
        assert(modifier_names[mod], string.format("Modifier #%d is not a valid modifier. It Should be one of shift, ctrl, alt, gui.", i))
        keys[#keys + 1] = {"l" .. mod, "r" .. mod}
        key_triggers["l" .. mod] = true
        key_triggers["r" .. mod] = true
    end

    local text_table = {}
    for _, mod in ipairs({"shift", "ctrl", "alt", "gui"}) do
        if key_triggers["l" .. mod] then
            text_table[#text_table + 1] = modifier_names[mod]
        end
    end
    text_table[#text_table + 1] = string.upper(key)

    if enabled and (global or M.IsWindowFocused(focused_flags)) then
        shortcuts[#shortcuts + 1] = {keys=keys, key_triggers=key_triggers, action=action}
    end

    return {text=table.concat(text_table, "+"), action=action, enabled=enabled}
end

local pressed_key

function M._common.RunShortcuts()
    if pressed_key then
        for _, s in ipairs(shortcuts) do
            if s.key_triggers[pressed_key] then
                local flag = true
                for _, t in ipairs(s.keys) do
                    flag = flag and love.keyboard.isDown(unpack(t))
                    if not flag then break end
                end
                if flag then
                    s.action()
                    break
                end
            end
        end
    end
    shortcuts = {}
    pressed_key = nil
end

function L.RunShortcuts(key)
    pressed_key = key
end
