-- Dear Imgui version: 1.88

local path = (...):gsub(".init$", "") .. "."

require(path .. "cdef")

local M = require(path .. "master")
local ffi = require("ffi")
local library_path = assert(package.searchpath("cimgui", package.cpath))
M.C = ffi.load(library_path)

require(path .. "enums")
require(path .. "wrap")
require(path .. "love")
require(path .. "shortcuts")

-- remove access to M._common
M._common = nil

return M
