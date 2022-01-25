local env = {
    assert = assert,
    type = type,
    tonumber = tonumber,
    tostring = tostring,
    require = require,
    error = error,
    getmetatable = getmetatable,
    setmetatable = setmetatable,
    string = string,
    table = table,
    love = love,
    jit = jit,
}
setfenv(1, env)

local path = (...):gsub("[^%.]*$", "")
local M = require(path .. "master")
local ffi = require("ffi")

local C = M.C

-- add metamethods to ImVec2 and ImVec4

local ct = ffi.typeof("ImVec2")
local ImVec2 = {}
function ImVec2.__add(u, v)
    assert(type(u) == type(v) and ffi.istype(u, v), "One of the summands in not an ImVec2.")
    return ct(u.x + v.x, u.y + v.y)
end
function ImVec2.__sub(u, v)
    assert(type(u) == type(v) and ffi.istype(u, v), "One of the summands in not an ImVec2.")
    return ct( u.x - v.x, u.y - v.y)
end
function ImVec2.__unm(u)
    return ct(-u.x, -u.y)
end
function ImVec2.__mul(u, v)
    local nu, nv = tonumber(u), tonumber(v)
    if nu then
        return ct(nu*v.x, nu*v.y)
    elseif nv then
        return ct(nv*u.x, nv*u.y)
    else
        error("ImVec2 can only be multipliead by a numerical type.")
    end
end
function ImVec2.__div(u, a)
    a = assert(tonumber(a), "ImVec2 can only be divided by a numerical type.")
    return ct(u.x/a, u.y/a)
end

local ct = ffi.typeof("ImVec4")
local ImVec4 = {}
function ImVec4.__add(u, v)
    assert(type(u) == type(v) and ffi.istype(u, v), "One of the summands in not an ImVec4.")
    return ct(u.x + v.x, u.y + v.y, u.z + v.z, u.w + v.w)
end
function ImVec4.__sub(u, v)
    assert(type(u) == type(v) and ffi.istype(u, v), "One of the summands in not an ImVec4.")
    return ct(u.x - v.x, u.y - v.y, u.z - v.z, u.w - v.w)
end
function ImVec4.__unm(u)
    return ct(-u.x, -u.y, -u.z, -u.w)
end
function ImVec4.__mul(u, v)
    local nu, nv = tonumber(u), tonumber(v)
    if nu then
        return v:__new(nu*v.x, nu*v.y, nu*v.z, nu*v.w)
    elseif nv then
        return ct(nv*u.x, nv*u.y, nv*u.z, nv*u.w)
    else
        error("ImVec4 can only be multipliead by a numerical type.")
    end
end
function ImVec4.__div(u, a)
    a = assert(tonumber(a), "ImVec4 can only be divided by a numerical type.")
    return ct(u.x/a, u.y/a, u.z/a, u.w/a)
end

-- wrap FLT_MIN, FLT_MAX

local FLT_MIN, FLT_MAX = C.igGET_FLT_MIN(), C.igGET_FLT_MAX()
M.FLT_MIN, M.FLT_MAX = FLT_MIN, FLT_MAX

-----------------------
-- BEGIN GENERATED CODE
-----------------------

local ImGuiPlatformImeData = ImGuiPlatformImeData or {}
ImGuiPlatformImeData.__index = ImGuiPlatformImeData
local mt = getmetatable(ImGuiPlatformImeData) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiPlatformImeData_ImGuiPlatformImeData()
    return ffi.gc(p[0], C.ImGuiPlatformImeData_destroy)
end
setmetatable(ImGuiPlatformImeData, mt)
M.ImGuiPlatformImeData = ImGuiPlatformImeData
ffi.metatype("ImGuiPlatformImeData", ImGuiPlatformImeData)

local ImFontConfig = ImFontConfig or {}
ImFontConfig.__index = ImFontConfig
local mt = getmetatable(ImFontConfig) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImFontConfig_ImFontConfig()
    return ffi.gc(p[0], C.ImFontConfig_destroy)
end
setmetatable(ImFontConfig, mt)
M.ImFontConfig = ImFontConfig
ffi.metatype("ImFontConfig", ImFontConfig)

local ImDrawList = ImDrawList or {}
ImDrawList.__index = ImDrawList
ImDrawList["_PathArcToFastEx"] = ImDrawList["_PathArcToFastEx"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImDrawList__PathArcToFastEx(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["ChannelsSplit"] = ImDrawList["ChannelsSplit"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList_ChannelsSplit(i1, i2)
    return out
end
ImDrawList["AddPolyline"] = ImDrawList["AddPolyline"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImDrawList_AddPolyline(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["_OnChangedClipRect"] = ImDrawList["_OnChangedClipRect"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__OnChangedClipRect(i1)
    return out
end
ImDrawList["_PopUnusedDrawCmd"] = ImDrawList["_PopUnusedDrawCmd"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__PopUnusedDrawCmd(i1)
    return out
end
ImDrawList["AddTriangle"] = ImDrawList["AddTriangle"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i6 == nil then i6 = 1.0 end
    local out = C.ImDrawList_AddTriangle(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["PrimVtx"] = ImDrawList["PrimVtx"]  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.ImDrawList_PrimVtx(i1, i2, i3, i4)
    return out
end
ImDrawList["PathRect"] = ImDrawList["PathRect"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = 0 end
    local out = C.ImDrawList_PathRect(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["PathLineToMergeDuplicate"] = ImDrawList["PathLineToMergeDuplicate"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList_PathLineToMergeDuplicate(i1, i2)
    return out
end
ImDrawList["_OnChangedTextureID"] = ImDrawList["_OnChangedTextureID"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__OnChangedTextureID(i1)
    return out
end
ImDrawList["PrimReserve"] = ImDrawList["PrimReserve"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImDrawList_PrimReserve(i1, i2, i3)
    return out
end
ImDrawList["AddCircleFilled"] = ImDrawList["AddCircleFilled"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = 0 end
    local out = C.ImDrawList_AddCircleFilled(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["AddBezierQuadratic"] = ImDrawList["AddBezierQuadratic"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i7 == nil then i7 = 0 end
    local out = C.ImDrawList_AddBezierQuadratic(i1, i2, i3, i4, i5, i6, i7)
    return out
end
ImDrawList["PrimWriteVtx"] = ImDrawList["PrimWriteVtx"]  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.ImDrawList_PrimWriteVtx(i1, i2, i3, i4)
    return out
end
ImDrawList["GetClipRectMax"] = ImDrawList["GetClipRectMax"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.ImDrawList_GetClipRectMax(o1, i1)
    return o1[0], out
end
ImDrawList["AddRectFilledMultiColor"] = ImDrawList["AddRectFilledMultiColor"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    local out = C.ImDrawList_AddRectFilledMultiColor(i1, i2, i3, i4, i5, i6, i7)
    return out
end
ImDrawList["PrimQuadUV"] = ImDrawList["PrimQuadUV"]  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10)
    jit.off(true)
    local out = C.ImDrawList_PrimQuadUV(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10)
    return out
end
ImDrawList["PathStroke"] = ImDrawList["PathStroke"]  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    if i4 == nil then i4 = 1.0 end
    local out = C.ImDrawList_PathStroke(i1, i2, i3, i4)
    return out
end
ImDrawList["PathArcToFast"] = ImDrawList["PathArcToFast"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImDrawList_PathArcToFast(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["PrimWriteIdx"] = ImDrawList["PrimWriteIdx"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList_PrimWriteIdx(i1, i2)
    return out
end
ImDrawList["AddLine"] = ImDrawList["AddLine"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = 1.0 end
    local out = C.ImDrawList_AddLine(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["PathLineTo"] = ImDrawList["PathLineTo"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList_PathLineTo(i1, i2)
    return out
end
ImDrawList["PrimRectUV"] = ImDrawList["PrimRectUV"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImDrawList_PrimRectUV(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["_CalcCircleAutoSegmentCount"] = ImDrawList["_CalcCircleAutoSegmentCount"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList__CalcCircleAutoSegmentCount(i1, i2)
    return out
end
ImDrawList["ChannelsSetCurrent"] = ImDrawList["ChannelsSetCurrent"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList_ChannelsSetCurrent(i1, i2)
    return out
end
ImDrawList["AddText_Vec2"] = ImDrawList["AddText_Vec2"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImDrawList_AddText_Vec2(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["AddText_FontPtr"] = ImDrawList["AddText_FontPtr"]  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i8 == nil then i8 = 0.0 end
    local out = C.ImDrawList_AddText_FontPtr(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
ImDrawList["AddConvexPolyFilled"] = ImDrawList["AddConvexPolyFilled"]  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.ImDrawList_AddConvexPolyFilled(i1, i2, i3, i4)
    return out
end
ImDrawList["PathFillConvex"] = ImDrawList["PathFillConvex"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawList_PathFillConvex(i1, i2)
    return out
end
ImDrawList["PopClipRect"] = ImDrawList["PopClipRect"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_PopClipRect(i1)
    return out
end
ImDrawList["PushClipRect"] = ImDrawList["PushClipRect"]  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = false end
    local out = C.ImDrawList_PushClipRect(i1, i2, i3, i4)
    return out
end
ImDrawList["AddImageQuad"] = ImDrawList["AddImageQuad"]  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11)
    jit.off(true)
    if i7 == nil then i7 = M.ImVec2_Float(0, 0) end
    if i8 == nil then i8 = M.ImVec2_Float(1, 0) end
    if i9 == nil then i9 = M.ImVec2_Float(1, 1) end
    if i10 == nil then i10 = M.ImVec2_Float(0, 1) end
    if i11 == nil then i11 = 4294967295 end
    local ptr = ffi.cast("void *", i2)
    M._textures[tostring(ptr)] = i2
    i2 = ptr
    local out = C.ImDrawList_AddImageQuad(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11)
    return out
end
ImDrawList["AddQuad"] = ImDrawList["AddQuad"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i7 == nil then i7 = 1.0 end
    local out = C.ImDrawList_AddQuad(i1, i2, i3, i4, i5, i6, i7)
    return out
end
ImDrawList["PushTextureID"] = ImDrawList["PushTextureID"]  or function(i1, i2)
    jit.off(true)
    local ptr = ffi.cast("void *", i2)
    M._textures[tostring(ptr)] = i2
    i2 = ptr
    local out = C.ImDrawList_PushTextureID(i1, i2)
    return out
end
ImDrawList["AddDrawCmd"] = ImDrawList["AddDrawCmd"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_AddDrawCmd(i1)
    return out
end
ImDrawList["GetClipRectMin"] = ImDrawList["GetClipRectMin"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.ImDrawList_GetClipRectMin(o1, i1)
    return o1[0], out
end
ImDrawList["AddRect"] = ImDrawList["AddRect"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = 0 end
    if i7 == nil then i7 = 1.0 end
    local out = C.ImDrawList_AddRect(i1, i2, i3, i4, i5, i6, i7)
    return out
end
ImDrawList["AddNgonFilled"] = ImDrawList["AddNgonFilled"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImDrawList_AddNgonFilled(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["PathArcTo"] = ImDrawList["PathArcTo"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i6 == nil then i6 = 0 end
    local out = C.ImDrawList_PathArcTo(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["AddQuadFilled"] = ImDrawList["AddQuadFilled"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImDrawList_AddQuadFilled(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["_ResetForNewFrame"] = ImDrawList["_ResetForNewFrame"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__ResetForNewFrame(i1)
    return out
end
ImDrawList["_TryMergeDrawCmds"] = ImDrawList["_TryMergeDrawCmds"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__TryMergeDrawCmds(i1)
    return out
end
ImDrawList["AddCallback"] = ImDrawList["AddCallback"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImDrawList_AddCallback(i1, i2, i3)
    return out
end
ImDrawList["AddTriangleFilled"] = ImDrawList["AddTriangleFilled"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImDrawList_AddTriangleFilled(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["AddBezierCubic"] = ImDrawList["AddBezierCubic"]  or function(i1, i2, i3, i4, i5, i6, i7, i8)
    jit.off(true)
    if i8 == nil then i8 = 0 end
    local out = C.ImDrawList_AddBezierCubic(i1, i2, i3, i4, i5, i6, i7, i8)
    return out
end
ImDrawList["AddRectFilled"] = ImDrawList["AddRectFilled"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = 0 end
    local out = C.ImDrawList_AddRectFilled(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["_ClearFreeMemory"] = ImDrawList["_ClearFreeMemory"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__ClearFreeMemory(i1)
    return out
end
ImDrawList["PathBezierCubicCurveTo"] = ImDrawList["PathBezierCubicCurveTo"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = 0 end
    local out = C.ImDrawList_PathBezierCubicCurveTo(i1, i2, i3, i4, i5)
    return out
end
ImDrawList["PrimUnreserve"] = ImDrawList["PrimUnreserve"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImDrawList_PrimUnreserve(i1, i2, i3)
    return out
end
ImDrawList["PrimRect"] = ImDrawList["PrimRect"]  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.ImDrawList_PrimRect(i1, i2, i3, i4)
    return out
end
ImDrawList["AddImageRounded"] = ImDrawList["AddImageRounded"]  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i9 == nil then i9 = 0 end
    local ptr = ffi.cast("void *", i2)
    M._textures[tostring(ptr)] = i2
    i2 = ptr
    local out = C.ImDrawList_AddImageRounded(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
ImDrawList["ChannelsMerge"] = ImDrawList["ChannelsMerge"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_ChannelsMerge(i1)
    return out
end
ImDrawList["PathClear"] = ImDrawList["PathClear"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_PathClear(i1)
    return out
end
ImDrawList["PopTextureID"] = ImDrawList["PopTextureID"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_PopTextureID(i1)
    return out
end
ImDrawList["AddCircle"] = ImDrawList["AddCircle"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = 0 end
    if i6 == nil then i6 = 1.0 end
    local out = C.ImDrawList_AddCircle(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["AddImage"] = ImDrawList["AddImage"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i5 == nil then i5 = M.ImVec2_Float(0, 0) end
    if i6 == nil then i6 = M.ImVec2_Float(1, 1) end
    if i7 == nil then i7 = 4294967295 end
    local ptr = ffi.cast("void *", i2)
    M._textures[tostring(ptr)] = i2
    i2 = ptr
    local out = C.ImDrawList_AddImage(i1, i2, i3, i4, i5, i6, i7)
    return out
end
ImDrawList["PushClipRectFullScreen"] = ImDrawList["PushClipRectFullScreen"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_PushClipRectFullScreen(i1)
    return out
end
ImDrawList["CloneOutput"] = ImDrawList["CloneOutput"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList_CloneOutput(i1)
    return out
end
ImDrawList["AddNgon"] = ImDrawList["AddNgon"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i6 == nil then i6 = 1.0 end
    local out = C.ImDrawList_AddNgon(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["_PathArcToN"] = ImDrawList["_PathArcToN"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImDrawList__PathArcToN(i1, i2, i3, i4, i5, i6)
    return out
end
ImDrawList["_OnChangedVtxOffset"] = ImDrawList["_OnChangedVtxOffset"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawList__OnChangedVtxOffset(i1)
    return out
end
ImDrawList["PathBezierQuadraticCurveTo"] = ImDrawList["PathBezierQuadraticCurveTo"]  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = 0 end
    local out = C.ImDrawList_PathBezierQuadraticCurveTo(i1, i2, i3, i4)
    return out
end
local mt = getmetatable(ImDrawList) or {}
mt.__call = mt.__call or function(self, i1)
    jit.off(true)
    local p = C.ImDrawList_ImDrawList(i1)
    return ffi.gc(p[0], C.ImDrawList_destroy)
end
setmetatable(ImDrawList, mt)
M.ImDrawList = ImDrawList
ffi.metatype("ImDrawList", ImDrawList)

local ImGuiTextRange = ImGuiTextRange or {}
ImGuiTextRange.__index = ImGuiTextRange
ImGuiTextRange["empty"] = ImGuiTextRange["empty"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextRange_empty(i1)
    return out
end
ImGuiTextRange["split"] = ImGuiTextRange["split"]  or function(i1, i2)
    jit.off(true)
    local o1 = ffi.new("ImVector_ImGuiTextRange[1]")
    local out = C.ImGuiTextRange_split(i1, i2, o1)
    return o1[0], out
end
M.ImGuiTextRange_Nil = M.ImGuiTextRange_Nil  or function()
    jit.off(true)
    local p = C.ImGuiTextRange_ImGuiTextRange_Nil()
    return ffi.gc(p[0], C.ImGuiTextRange_destroy)
end
M.ImGuiTextRange_Str = M.ImGuiTextRange_Str  or function(i1, i2)
    jit.off(true)
    local p = C.ImGuiTextRange_ImGuiTextRange_Str(i1, i2)
    return ffi.gc(p[0], C.ImGuiTextRange_destroy)
end
M.ImGuiTextRange = ImGuiTextRange
ffi.metatype("ImGuiTextRange", ImGuiTextRange)

local ImGuiTableSortSpecs = ImGuiTableSortSpecs or {}
ImGuiTableSortSpecs.__index = ImGuiTableSortSpecs
local mt = getmetatable(ImGuiTableSortSpecs) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiTableSortSpecs_ImGuiTableSortSpecs()
    return ffi.gc(p[0], C.ImGuiTableSortSpecs_destroy)
end
setmetatable(ImGuiTableSortSpecs, mt)
M.ImGuiTableSortSpecs = ImGuiTableSortSpecs
ffi.metatype("ImGuiTableSortSpecs", ImGuiTableSortSpecs)

local ImDrawData = ImDrawData or {}
ImDrawData.__index = ImDrawData
ImDrawData["DeIndexAllBuffers"] = ImDrawData["DeIndexAllBuffers"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawData_DeIndexAllBuffers(i1)
    return out
end
ImDrawData["ScaleClipRects"] = ImDrawData["ScaleClipRects"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawData_ScaleClipRects(i1, i2)
    return out
end
ImDrawData["Clear"] = ImDrawData["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawData_Clear(i1)
    return out
end
local mt = getmetatable(ImDrawData) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImDrawData_ImDrawData()
    return ffi.gc(p[0], C.ImDrawData_destroy)
end
setmetatable(ImDrawData, mt)
M.ImDrawData = ImDrawData
ffi.metatype("ImDrawData", ImDrawData)

local ImFontGlyphRangesBuilder = ImFontGlyphRangesBuilder or {}
ImFontGlyphRangesBuilder.__index = ImFontGlyphRangesBuilder
ImFontGlyphRangesBuilder["AddChar"] = ImFontGlyphRangesBuilder["AddChar"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontGlyphRangesBuilder_AddChar(i1, i2)
    return out
end
ImFontGlyphRangesBuilder["Clear"] = ImFontGlyphRangesBuilder["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImFontGlyphRangesBuilder_Clear(i1)
    return out
end
ImFontGlyphRangesBuilder["BuildRanges"] = ImFontGlyphRangesBuilder["BuildRanges"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("ImVector_ImWchar[1]")
    local out = C.ImFontGlyphRangesBuilder_BuildRanges(i1, o1)
    return o1[0], out
end
ImFontGlyphRangesBuilder["AddRanges"] = ImFontGlyphRangesBuilder["AddRanges"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontGlyphRangesBuilder_AddRanges(i1, i2)
    return out
end
ImFontGlyphRangesBuilder["AddText"] = ImFontGlyphRangesBuilder["AddText"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImFontGlyphRangesBuilder_AddText(i1, i2, i3)
    return out
end
ImFontGlyphRangesBuilder["GetBit"] = ImFontGlyphRangesBuilder["GetBit"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontGlyphRangesBuilder_GetBit(i1, i2)
    return out
end
ImFontGlyphRangesBuilder["SetBit"] = ImFontGlyphRangesBuilder["SetBit"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontGlyphRangesBuilder_SetBit(i1, i2)
    return out
end
local mt = getmetatable(ImFontGlyphRangesBuilder) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder()
    return ffi.gc(p[0], C.ImFontGlyphRangesBuilder_destroy)
end
setmetatable(ImFontGlyphRangesBuilder, mt)
M.ImFontGlyphRangesBuilder = ImFontGlyphRangesBuilder
ffi.metatype("ImFontGlyphRangesBuilder", ImFontGlyphRangesBuilder)

local ImGuiListClipper = ImGuiListClipper or {}
ImGuiListClipper.__index = ImGuiListClipper
ImGuiListClipper["ForceDisplayRangeByIndices"] = ImGuiListClipper["ForceDisplayRangeByIndices"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiListClipper_ForceDisplayRangeByIndices(i1, i2, i3)
    return out
end
ImGuiListClipper["End"] = ImGuiListClipper["End"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiListClipper_End(i1)
    return out
end
ImGuiListClipper["Begin"] = ImGuiListClipper["Begin"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = -1.0 end
    local out = C.ImGuiListClipper_Begin(i1, i2, i3)
    return out
end
ImGuiListClipper["Step"] = ImGuiListClipper["Step"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiListClipper_Step(i1)
    return out
end
local mt = getmetatable(ImGuiListClipper) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiListClipper_ImGuiListClipper()
    return ffi.gc(p[0], C.ImGuiListClipper_destroy)
end
setmetatable(ImGuiListClipper, mt)
M.ImGuiListClipper = ImGuiListClipper
ffi.metatype("ImGuiListClipper", ImGuiListClipper)

local ImFont = ImFont or {}
ImFont.__index = ImFont
ImFont["RenderText"] = ImFont["RenderText"]  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10)
    jit.off(true)
    if i9 == nil then i9 = 0.0 end
    if i10 == nil then i10 = false end
    local out = C.ImFont_RenderText(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10)
    return out
end
ImFont["IsLoaded"] = ImFont["IsLoaded"]  or function(i1)
    jit.off(true)
    local out = C.ImFont_IsLoaded(i1)
    return out
end
ImFont["AddGlyph"] = ImFont["AddGlyph"]  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12)
    jit.off(true)
    local out = C.ImFont_AddGlyph(i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12)
    return out
end
ImFont["SetGlyphVisible"] = ImFont["SetGlyphVisible"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImFont_SetGlyphVisible(i1, i2, i3)
    return out
end
ImFont["ClearOutputData"] = ImFont["ClearOutputData"]  or function(i1)
    jit.off(true)
    local out = C.ImFont_ClearOutputData(i1)
    return out
end
ImFont["AddRemapChar"] = ImFont["AddRemapChar"]  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = true end
    local out = C.ImFont_AddRemapChar(i1, i2, i3, i4)
    return out
end
ImFont["RenderChar"] = ImFont["RenderChar"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImFont_RenderChar(i1, i2, i3, i4, i5, i6)
    return out
end
ImFont["FindGlyphNoFallback"] = ImFont["FindGlyphNoFallback"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFont_FindGlyphNoFallback(i1, i2)
    return out
end
ImFont["GrowIndex"] = ImFont["GrowIndex"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFont_GrowIndex(i1, i2)
    return out
end
ImFont["GetDebugName"] = ImFont["GetDebugName"]  or function(i1)
    jit.off(true)
    local out = C.ImFont_GetDebugName(i1)
    return out
end
ImFont["BuildLookupTable"] = ImFont["BuildLookupTable"]  or function(i1)
    jit.off(true)
    local out = C.ImFont_BuildLookupTable(i1)
    return out
end
ImFont["CalcWordWrapPositionA"] = ImFont["CalcWordWrapPositionA"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImFont_CalcWordWrapPositionA(i1, i2, i3, i4, i5)
    return out
end
ImFont["IsGlyphRangeUnused"] = ImFont["IsGlyphRangeUnused"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImFont_IsGlyphRangeUnused(i1, i2, i3)
    return out
end
ImFont["GetCharAdvance"] = ImFont["GetCharAdvance"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFont_GetCharAdvance(i1, i2)
    return out
end
ImFont["FindGlyph"] = ImFont["FindGlyph"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFont_FindGlyph(i1, i2)
    return out
end
ImFont["CalcTextSizeA"] = ImFont["CalcTextSizeA"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.ImFont_CalcTextSizeA(o1, i1, i2, i3, i4, i5, i6, i7)
    return o1[0], out
end
local mt = getmetatable(ImFont) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImFont_ImFont()
    return ffi.gc(p[0], C.ImFont_destroy)
end
setmetatable(ImFont, mt)
M.ImFont = ImFont
ffi.metatype("ImFont", ImFont)

local ImVec4 = ImVec4 or {}
ImVec4.__index = ImVec4
M.ImVec4_Nil = M.ImVec4_Nil  or function()
    jit.off(true)
    local p = C.ImVec4_ImVec4_Nil()
    return ffi.gc(p[0], C.ImVec4_destroy)
end
M.ImVec4_Float = M.ImVec4_Float  or function(i1, i2, i3, i4)
    jit.off(true)
    local p = C.ImVec4_ImVec4_Float(i1, i2, i3, i4)
    return ffi.gc(p[0], C.ImVec4_destroy)
end
M.ImVec4 = ImVec4
ffi.metatype("ImVec4", ImVec4)

local ImGuiViewport = ImGuiViewport or {}
ImGuiViewport.__index = ImGuiViewport
ImGuiViewport["GetWorkCenter"] = ImGuiViewport["GetWorkCenter"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.ImGuiViewport_GetWorkCenter(o1, i1)
    return o1[0], out
end
ImGuiViewport["GetCenter"] = ImGuiViewport["GetCenter"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.ImGuiViewport_GetCenter(o1, i1)
    return o1[0], out
end
local mt = getmetatable(ImGuiViewport) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiViewport_ImGuiViewport()
    return ffi.gc(p[0], C.ImGuiViewport_destroy)
end
setmetatable(ImGuiViewport, mt)
M.ImGuiViewport = ImGuiViewport
ffi.metatype("ImGuiViewport", ImGuiViewport)

local ImGuiStorage = ImGuiStorage or {}
ImGuiStorage.__index = ImGuiStorage
ImGuiStorage["GetBool"] = ImGuiStorage["GetBool"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = false end
    local out = C.ImGuiStorage_GetBool(i1, i2, i3)
    return out
end
ImGuiStorage["GetVoidPtr"] = ImGuiStorage["GetVoidPtr"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiStorage_GetVoidPtr(i1, i2)
    return out
end
ImGuiStorage["SetFloat"] = ImGuiStorage["SetFloat"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiStorage_SetFloat(i1, i2, i3)
    return out
end
ImGuiStorage["GetBoolRef"] = ImGuiStorage["GetBoolRef"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = false end
    local out = C.ImGuiStorage_GetBoolRef(i1, i2, i3)
    return out
end
ImGuiStorage["GetIntRef"] = ImGuiStorage["GetIntRef"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.ImGuiStorage_GetIntRef(i1, i2, i3)
    return out
end
ImGuiStorage["GetInt"] = ImGuiStorage["GetInt"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.ImGuiStorage_GetInt(i1, i2, i3)
    return out
end
ImGuiStorage["Clear"] = ImGuiStorage["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiStorage_Clear(i1)
    return out
end
ImGuiStorage["GetFloatRef"] = ImGuiStorage["GetFloatRef"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0.0 end
    local out = C.ImGuiStorage_GetFloatRef(i1, i2, i3)
    return out
end
ImGuiStorage["GetVoidPtrRef"] = ImGuiStorage["GetVoidPtrRef"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiStorage_GetVoidPtrRef(i1, i2, i3)
    return out
end
ImGuiStorage["SetBool"] = ImGuiStorage["SetBool"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiStorage_SetBool(i1, i2, i3)
    return out
end
ImGuiStorage["SetInt"] = ImGuiStorage["SetInt"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiStorage_SetInt(i1, i2, i3)
    return out
end
ImGuiStorage["SetAllInt"] = ImGuiStorage["SetAllInt"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiStorage_SetAllInt(i1, i2)
    return out
end
ImGuiStorage["GetFloat"] = ImGuiStorage["GetFloat"]  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0.0 end
    local out = C.ImGuiStorage_GetFloat(i1, i2, i3)
    return out
end
ImGuiStorage["BuildSortByKey"] = ImGuiStorage["BuildSortByKey"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiStorage_BuildSortByKey(i1)
    return out
end
ImGuiStorage["SetVoidPtr"] = ImGuiStorage["SetVoidPtr"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiStorage_SetVoidPtr(i1, i2, i3)
    return out
end
M.ImGuiStorage = ImGuiStorage
ffi.metatype("ImGuiStorage", ImGuiStorage)

local ImGuiStoragePair = ImGuiStoragePair or {}
ImGuiStoragePair.__index = ImGuiStoragePair
M.ImGuiStoragePair_Int = M.ImGuiStoragePair_Int  or function(i1, i2)
    jit.off(true)
    local p = C.ImGuiStoragePair_ImGuiStoragePair_Int(i1, i2)
    return ffi.gc(p[0], C.ImGuiStoragePair_destroy)
end
M.ImGuiStoragePair_Float = M.ImGuiStoragePair_Float  or function(i1, i2)
    jit.off(true)
    local p = C.ImGuiStoragePair_ImGuiStoragePair_Float(i1, i2)
    return ffi.gc(p[0], C.ImGuiStoragePair_destroy)
end
M.ImGuiStoragePair_Ptr = M.ImGuiStoragePair_Ptr  or function(i1, i2)
    jit.off(true)
    local p = C.ImGuiStoragePair_ImGuiStoragePair_Ptr(i1, i2)
    return ffi.gc(p[0], C.ImGuiStoragePair_destroy)
end
M.ImGuiStoragePair = ImGuiStoragePair
ffi.metatype("ImGuiStoragePair", ImGuiStoragePair)

local ImFontAtlas = ImFontAtlas or {}
ImFontAtlas.__index = ImFontAtlas
ImFontAtlas["CalcCustomRectUV"] = ImFontAtlas["CalcCustomRectUV"]  or function(i1, i2)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local o2 = ffi.new("ImVec2[1]")
    local out = C.ImFontAtlas_CalcCustomRectUV(i1, i2, o1, o2)
    return o1[0], o2[0], out
end
ImFontAtlas["Clear"] = ImFontAtlas["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_Clear(i1)
    return out
end
ImFontAtlas["GetGlyphRangesChineseSimplifiedCommon"] = ImFontAtlas["GetGlyphRangesChineseSimplifiedCommon"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(i1)
    return out
end
ImFontAtlas["GetGlyphRangesCyrillic"] = ImFontAtlas["GetGlyphRangesCyrillic"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesCyrillic(i1)
    return out
end
ImFontAtlas["AddCustomRectFontGlyph"] = ImFontAtlas["AddCustomRectFontGlyph"]  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i7 == nil then i7 = M.ImVec2_Float(0, 0) end
    local out = C.ImFontAtlas_AddCustomRectFontGlyph(i1, i2, i3, i4, i5, i6, i7)
    return out
end
ImFontAtlas["AddFontFromFileTTF"] = ImFontAtlas["AddFontFromFileTTF"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImFontAtlas_AddFontFromFileTTF(i1, i2, i3, i4, i5)
    return out
end
ImFontAtlas["AddFontFromMemoryCompressedBase85TTF"] = ImFontAtlas["AddFontFromMemoryCompressedBase85TTF"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    local out = C.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(i1, i2, i3, i4, i5)
    return out
end
ImFontAtlas["Build"] = ImFontAtlas["Build"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_Build(i1)
    return out
end
ImFontAtlas["SetTexID"] = ImFontAtlas["SetTexID"]  or function(i1, i2)
    jit.off(true)
    local ptr = ffi.cast("void *", i2)
    M._textures[tostring(ptr)] = i2
    i2 = ptr
    local out = C.ImFontAtlas_SetTexID(i1, i2)
    return out
end
ImFontAtlas["GetCustomRectByIndex"] = ImFontAtlas["GetCustomRectByIndex"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontAtlas_GetCustomRectByIndex(i1, i2)
    return out
end
ImFontAtlas["IsBuilt"] = ImFontAtlas["IsBuilt"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_IsBuilt(i1)
    return out
end
ImFontAtlas["ClearTexData"] = ImFontAtlas["ClearTexData"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_ClearTexData(i1)
    return out
end
ImFontAtlas["GetTexDataAsAlpha8"] = ImFontAtlas["GetTexDataAsAlpha8"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("unsigned char*[1]")
    local o2 = ffi.new("int[1]")
    local o3 = ffi.new("int[1]")
    local o4 = ffi.new("int[1]")
    local out = C.ImFontAtlas_GetTexDataAsAlpha8(i1, o1, o2, o3, o4)
    return o1[0], o2[0], o3[0], o4[0], out
end
ImFontAtlas["ClearInputData"] = ImFontAtlas["ClearInputData"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_ClearInputData(i1)
    return out
end
ImFontAtlas["GetGlyphRangesVietnamese"] = ImFontAtlas["GetGlyphRangesVietnamese"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesVietnamese(i1)
    return out
end
ImFontAtlas["ClearFonts"] = ImFontAtlas["ClearFonts"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_ClearFonts(i1)
    return out
end
ImFontAtlas["GetGlyphRangesJapanese"] = ImFontAtlas["GetGlyphRangesJapanese"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesJapanese(i1)
    return out
end
ImFontAtlas["GetGlyphRangesDefault"] = ImFontAtlas["GetGlyphRangesDefault"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesDefault(i1)
    return out
end
ImFontAtlas["AddFontFromMemoryCompressedTTF"] = ImFontAtlas["AddFontFromMemoryCompressedTTF"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImFontAtlas_AddFontFromMemoryCompressedTTF(i1, i2, i3, i4, i5, i6)
    return out
end
ImFontAtlas["GetGlyphRangesChineseFull"] = ImFontAtlas["GetGlyphRangesChineseFull"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesChineseFull(i1)
    return out
end
ImFontAtlas["GetGlyphRangesKorean"] = ImFontAtlas["GetGlyphRangesKorean"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesKorean(i1)
    return out
end
ImFontAtlas["AddFont"] = ImFontAtlas["AddFont"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontAtlas_AddFont(i1, i2)
    return out
end
ImFontAtlas["GetTexDataAsRGBA32"] = ImFontAtlas["GetTexDataAsRGBA32"]  or function(i1)
    jit.off(true)
    local o1 = ffi.new("unsigned char*[1]")
    local o2 = ffi.new("int[1]")
    local o3 = ffi.new("int[1]")
    local o4 = ffi.new("int[1]")
    local out = C.ImFontAtlas_GetTexDataAsRGBA32(i1, o1, o2, o3, o4)
    return o1[0], o2[0], o3[0], o4[0], out
end
ImFontAtlas["GetMouseCursorTexData"] = ImFontAtlas["GetMouseCursorTexData"]  or function(i1, i2)
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local o2 = ffi.new("ImVec2[1]")
    local o3 = ffi.new("ImVec2[2][1]")
    local o4 = ffi.new("ImVec2[2][1]")
    local out = C.ImFontAtlas_GetMouseCursorTexData(i1, i2, o1, o2, o3, o4)
    return o1[0], o2[0], o3[0], o4[0], out
end
ImFontAtlas["AddFontDefault"] = ImFontAtlas["AddFontDefault"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImFontAtlas_AddFontDefault(i1, i2)
    return out
end
ImFontAtlas["AddFontFromMemoryTTF"] = ImFontAtlas["AddFontFromMemoryTTF"]  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    local out = C.ImFontAtlas_AddFontFromMemoryTTF(i1, i2, i3, i4, i5, i6)
    return out
end
ImFontAtlas["AddCustomRectRegular"] = ImFontAtlas["AddCustomRectRegular"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImFontAtlas_AddCustomRectRegular(i1, i2, i3)
    return out
end
ImFontAtlas["GetGlyphRangesThai"] = ImFontAtlas["GetGlyphRangesThai"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlas_GetGlyphRangesThai(i1)
    return out
end
local mt = getmetatable(ImFontAtlas) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImFontAtlas_ImFontAtlas()
    return ffi.gc(p[0], C.ImFontAtlas_destroy)
end
setmetatable(ImFontAtlas, mt)
M.ImFontAtlas = ImFontAtlas
ffi.metatype("ImFontAtlas", ImFontAtlas)

local ImFontAtlasCustomRect = ImFontAtlasCustomRect or {}
ImFontAtlasCustomRect.__index = ImFontAtlasCustomRect
ImFontAtlasCustomRect["IsPacked"] = ImFontAtlasCustomRect["IsPacked"]  or function(i1)
    jit.off(true)
    local out = C.ImFontAtlasCustomRect_IsPacked(i1)
    return out
end
local mt = getmetatable(ImFontAtlasCustomRect) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImFontAtlasCustomRect_ImFontAtlasCustomRect()
    return ffi.gc(p[0], C.ImFontAtlasCustomRect_destroy)
end
setmetatable(ImFontAtlasCustomRect, mt)
M.ImFontAtlasCustomRect = ImFontAtlasCustomRect
ffi.metatype("ImFontAtlasCustomRect", ImFontAtlasCustomRect)

local ImGuiWindowClass = ImGuiWindowClass or {}
ImGuiWindowClass.__index = ImGuiWindowClass
local mt = getmetatable(ImGuiWindowClass) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiWindowClass_ImGuiWindowClass()
    return ffi.gc(p[0], C.ImGuiWindowClass_destroy)
end
setmetatable(ImGuiWindowClass, mt)
M.ImGuiWindowClass = ImGuiWindowClass
ffi.metatype("ImGuiWindowClass", ImGuiWindowClass)

local ImGuiTableColumnSortSpecs = ImGuiTableColumnSortSpecs or {}
ImGuiTableColumnSortSpecs.__index = ImGuiTableColumnSortSpecs
local mt = getmetatable(ImGuiTableColumnSortSpecs) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs()
    return ffi.gc(p[0], C.ImGuiTableColumnSortSpecs_destroy)
end
setmetatable(ImGuiTableColumnSortSpecs, mt)
M.ImGuiTableColumnSortSpecs = ImGuiTableColumnSortSpecs
ffi.metatype("ImGuiTableColumnSortSpecs", ImGuiTableColumnSortSpecs)

local ImGuiStyle = ImGuiStyle or {}
ImGuiStyle.__index = ImGuiStyle
ImGuiStyle["ScaleAllSizes"] = ImGuiStyle["ScaleAllSizes"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiStyle_ScaleAllSizes(i1, i2)
    return out
end
local mt = getmetatable(ImGuiStyle) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiStyle_ImGuiStyle()
    return ffi.gc(p[0], C.ImGuiStyle_destroy)
end
setmetatable(ImGuiStyle, mt)
M.ImGuiStyle = ImGuiStyle
ffi.metatype("ImGuiStyle", ImGuiStyle)

local ImDrawListSplitter = ImDrawListSplitter or {}
ImDrawListSplitter.__index = ImDrawListSplitter
ImDrawListSplitter["Clear"] = ImDrawListSplitter["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawListSplitter_Clear(i1)
    return out
end
ImDrawListSplitter["Split"] = ImDrawListSplitter["Split"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImDrawListSplitter_Split(i1, i2, i3)
    return out
end
ImDrawListSplitter["SetCurrentChannel"] = ImDrawListSplitter["SetCurrentChannel"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImDrawListSplitter_SetCurrentChannel(i1, i2, i3)
    return out
end
ImDrawListSplitter["Merge"] = ImDrawListSplitter["Merge"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImDrawListSplitter_Merge(i1, i2)
    return out
end
ImDrawListSplitter["ClearFreeMemory"] = ImDrawListSplitter["ClearFreeMemory"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawListSplitter_ClearFreeMemory(i1)
    return out
end
local mt = getmetatable(ImDrawListSplitter) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImDrawListSplitter_ImDrawListSplitter()
    return ffi.gc(p[0], C.ImDrawListSplitter_destroy)
end
setmetatable(ImDrawListSplitter, mt)
M.ImDrawListSplitter = ImDrawListSplitter
ffi.metatype("ImDrawListSplitter", ImDrawListSplitter)

local ImGuiPlatformMonitor = ImGuiPlatformMonitor or {}
ImGuiPlatformMonitor.__index = ImGuiPlatformMonitor
local mt = getmetatable(ImGuiPlatformMonitor) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiPlatformMonitor_ImGuiPlatformMonitor()
    return ffi.gc(p[0], C.ImGuiPlatformMonitor_destroy)
end
setmetatable(ImGuiPlatformMonitor, mt)
M.ImGuiPlatformMonitor = ImGuiPlatformMonitor
ffi.metatype("ImGuiPlatformMonitor", ImGuiPlatformMonitor)

local ImGuiPlatformIO = ImGuiPlatformIO or {}
ImGuiPlatformIO.__index = ImGuiPlatformIO
local mt = getmetatable(ImGuiPlatformIO) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiPlatformIO_ImGuiPlatformIO()
    return ffi.gc(p[0], C.ImGuiPlatformIO_destroy)
end
setmetatable(ImGuiPlatformIO, mt)
M.ImGuiPlatformIO = ImGuiPlatformIO
ffi.metatype("ImGuiPlatformIO", ImGuiPlatformIO)

local ImGuiOnceUponAFrame = ImGuiOnceUponAFrame or {}
ImGuiOnceUponAFrame.__index = ImGuiOnceUponAFrame
local mt = getmetatable(ImGuiOnceUponAFrame) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiOnceUponAFrame_ImGuiOnceUponAFrame()
    return ffi.gc(p[0], C.ImGuiOnceUponAFrame_destroy)
end
setmetatable(ImGuiOnceUponAFrame, mt)
M.ImGuiOnceUponAFrame = ImGuiOnceUponAFrame
ffi.metatype("ImGuiOnceUponAFrame", ImGuiOnceUponAFrame)

local ImDrawCmd = ImDrawCmd or {}
ImDrawCmd.__index = ImDrawCmd
ImDrawCmd["GetTexID"] = ImDrawCmd["GetTexID"]  or function(i1)
    jit.off(true)
    local out = C.ImDrawCmd_GetTexID(i1)
    return out
end
local mt = getmetatable(ImDrawCmd) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImDrawCmd_ImDrawCmd()
    return ffi.gc(p[0], C.ImDrawCmd_destroy)
end
setmetatable(ImDrawCmd, mt)
M.ImDrawCmd = ImDrawCmd
ffi.metatype("ImDrawCmd", ImDrawCmd)

local ImGuiIO = ImGuiIO or {}
ImGuiIO.__index = ImGuiIO
ImGuiIO["AddMousePosEvent"] = ImGuiIO["AddMousePosEvent"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiIO_AddMousePosEvent(i1, i2, i3)
    return out
end
ImGuiIO["AddKeyEvent"] = ImGuiIO["AddKeyEvent"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiIO_AddKeyEvent(i1, i2, i3)
    return out
end
ImGuiIO["AddMouseButtonEvent"] = ImGuiIO["AddMouseButtonEvent"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiIO_AddMouseButtonEvent(i1, i2, i3)
    return out
end
ImGuiIO["ClearInputCharacters"] = ImGuiIO["ClearInputCharacters"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiIO_ClearInputCharacters(i1)
    return out
end
ImGuiIO["AddFocusEvent"] = ImGuiIO["AddFocusEvent"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiIO_AddFocusEvent(i1, i2)
    return out
end
ImGuiIO["AddInputCharacterUTF16"] = ImGuiIO["AddInputCharacterUTF16"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiIO_AddInputCharacterUTF16(i1, i2)
    return out
end
ImGuiIO["AddMouseWheelEvent"] = ImGuiIO["AddMouseWheelEvent"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiIO_AddMouseWheelEvent(i1, i2, i3)
    return out
end
ImGuiIO["AddKeyModsEvent"] = ImGuiIO["AddKeyModsEvent"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiIO_AddKeyModsEvent(i1, i2)
    return out
end
ImGuiIO["AddKeyAnalogEvent"] = ImGuiIO["AddKeyAnalogEvent"]  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.ImGuiIO_AddKeyAnalogEvent(i1, i2, i3, i4)
    return out
end
ImGuiIO["AddMouseViewportEvent"] = ImGuiIO["AddMouseViewportEvent"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiIO_AddMouseViewportEvent(i1, i2)
    return out
end
ImGuiIO["AddInputCharactersUTF8"] = ImGuiIO["AddInputCharactersUTF8"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiIO_AddInputCharactersUTF8(i1, i2)
    return out
end
ImGuiIO["ClearInputKeys"] = ImGuiIO["ClearInputKeys"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiIO_ClearInputKeys(i1)
    return out
end
ImGuiIO["SetKeyEventNativeData"] = ImGuiIO["SetKeyEventNativeData"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = -1 end
    local out = C.ImGuiIO_SetKeyEventNativeData(i1, i2, i3, i4, i5)
    return out
end
ImGuiIO["AddInputCharacter"] = ImGuiIO["AddInputCharacter"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiIO_AddInputCharacter(i1, i2)
    return out
end
local mt = getmetatable(ImGuiIO) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiIO_ImGuiIO()
    return ffi.gc(p[0], C.ImGuiIO_destroy)
end
setmetatable(ImGuiIO, mt)
M.ImGuiIO = ImGuiIO
ffi.metatype("ImGuiIO", ImGuiIO)

local ImGuiPayload = ImGuiPayload or {}
ImGuiPayload.__index = ImGuiPayload
ImGuiPayload["Clear"] = ImGuiPayload["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiPayload_Clear(i1)
    return out
end
ImGuiPayload["IsDelivery"] = ImGuiPayload["IsDelivery"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiPayload_IsDelivery(i1)
    return out
end
ImGuiPayload["IsPreview"] = ImGuiPayload["IsPreview"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiPayload_IsPreview(i1)
    return out
end
ImGuiPayload["IsDataType"] = ImGuiPayload["IsDataType"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiPayload_IsDataType(i1, i2)
    return out
end
local mt = getmetatable(ImGuiPayload) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiPayload_ImGuiPayload()
    return ffi.gc(p[0], C.ImGuiPayload_destroy)
end
setmetatable(ImGuiPayload, mt)
M.ImGuiPayload = ImGuiPayload
ffi.metatype("ImGuiPayload", ImGuiPayload)

local ImColor = ImColor or {}
ImColor.__index = ImColor
ImColor["SetHSV"] = ImColor["SetHSV"]  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = 1.0 end
    local out = C.ImColor_SetHSV(i1, i2, i3, i4, i5)
    return out
end
ImColor["HSV"] = ImColor["HSV"]  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = 1.0 end
    local o1 = ffi.new("ImColor[1]")
    local out = C.ImColor_HSV(o1, i1, i2, i3, i4)
    return o1[0], out
end
M.ImColor_Nil = M.ImColor_Nil  or function()
    jit.off(true)
    local p = C.ImColor_ImColor_Nil()
    return ffi.gc(p[0], C.ImColor_destroy)
end
M.ImColor_Int = M.ImColor_Int  or function(i1, i2, i3, i4)
    jit.off(true)
    local p = C.ImColor_ImColor_Int(i1, i2, i3, i4)
    return ffi.gc(p[0], C.ImColor_destroy)
end
M.ImColor_U32 = M.ImColor_U32  or function(i1)
    jit.off(true)
    local p = C.ImColor_ImColor_U32(i1)
    return ffi.gc(p[0], C.ImColor_destroy)
end
M.ImColor_Float = M.ImColor_Float  or function(i1, i2, i3, i4)
    jit.off(true)
    local p = C.ImColor_ImColor_Float(i1, i2, i3, i4)
    return ffi.gc(p[0], C.ImColor_destroy)
end
M.ImColor_Vec4 = M.ImColor_Vec4  or function(i1)
    jit.off(true)
    local p = C.ImColor_ImColor_Vec4(i1)
    return ffi.gc(p[0], C.ImColor_destroy)
end
M.ImColor = ImColor
ffi.metatype("ImColor", ImColor)

local ImGuiInputTextCallbackData = ImGuiInputTextCallbackData or {}
ImGuiInputTextCallbackData.__index = ImGuiInputTextCallbackData
ImGuiInputTextCallbackData["HasSelection"] = ImGuiInputTextCallbackData["HasSelection"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiInputTextCallbackData_HasSelection(i1)
    return out
end
ImGuiInputTextCallbackData["InsertChars"] = ImGuiInputTextCallbackData["InsertChars"]  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.ImGuiInputTextCallbackData_InsertChars(i1, i2, i3, i4)
    return out
end
ImGuiInputTextCallbackData["SelectAll"] = ImGuiInputTextCallbackData["SelectAll"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiInputTextCallbackData_SelectAll(i1)
    return out
end
ImGuiInputTextCallbackData["ClearSelection"] = ImGuiInputTextCallbackData["ClearSelection"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiInputTextCallbackData_ClearSelection(i1)
    return out
end
ImGuiInputTextCallbackData["DeleteChars"] = ImGuiInputTextCallbackData["DeleteChars"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiInputTextCallbackData_DeleteChars(i1, i2, i3)
    return out
end
local mt = getmetatable(ImGuiInputTextCallbackData) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiInputTextCallbackData_ImGuiInputTextCallbackData()
    return ffi.gc(p[0], C.ImGuiInputTextCallbackData_destroy)
end
setmetatable(ImGuiInputTextCallbackData, mt)
M.ImGuiInputTextCallbackData = ImGuiInputTextCallbackData
ffi.metatype("ImGuiInputTextCallbackData", ImGuiInputTextCallbackData)

local ImGuiTextFilter = ImGuiTextFilter or {}
ImGuiTextFilter.__index = ImGuiTextFilter
ImGuiTextFilter["Clear"] = ImGuiTextFilter["Clear"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextFilter_Clear(i1)
    return out
end
ImGuiTextFilter["PassFilter"] = ImGuiTextFilter["PassFilter"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiTextFilter_PassFilter(i1, i2, i3)
    return out
end
ImGuiTextFilter["IsActive"] = ImGuiTextFilter["IsActive"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextFilter_IsActive(i1)
    return out
end
ImGuiTextFilter["Draw"] = ImGuiTextFilter["Draw"]  or function(i1, i2, i3)
    jit.off(true)
    if i2 == nil then i2 = "Filter(inc,-exc)" end
    if i3 == nil then i3 = 0.0 end
    local out = C.ImGuiTextFilter_Draw(i1, i2, i3)
    return out
end
ImGuiTextFilter["Build"] = ImGuiTextFilter["Build"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextFilter_Build(i1)
    return out
end
local mt = getmetatable(ImGuiTextFilter) or {}
mt.__call = mt.__call or function(self, i1)
    jit.off(true)
    local p = C.ImGuiTextFilter_ImGuiTextFilter(i1)
    return ffi.gc(p[0], C.ImGuiTextFilter_destroy)
end
setmetatable(ImGuiTextFilter, mt)
M.ImGuiTextFilter = ImGuiTextFilter
ffi.metatype("ImGuiTextFilter", ImGuiTextFilter)

local ImGuiTextBuffer = ImGuiTextBuffer or {}
ImGuiTextBuffer.__index = ImGuiTextBuffer
ImGuiTextBuffer["appendf"] = ImGuiTextBuffer["appendf"]  or function(i1, i2, ...)
    jit.off(true)
    local out = C.ImGuiTextBuffer_appendf(i1, i2, ...)
    return out
end
ImGuiTextBuffer["append"] = ImGuiTextBuffer["append"]  or function(i1, i2, i3)
    jit.off(true)
    local out = C.ImGuiTextBuffer_append(i1, i2, i3)
    return out
end
ImGuiTextBuffer["clear"] = ImGuiTextBuffer["clear"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextBuffer_clear(i1)
    return out
end
ImGuiTextBuffer["c_str"] = ImGuiTextBuffer["c_str"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextBuffer_c_str(i1)
    return out
end
ImGuiTextBuffer["empty"] = ImGuiTextBuffer["empty"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextBuffer_empty(i1)
    return out
end
ImGuiTextBuffer["size"] = ImGuiTextBuffer["size"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextBuffer_size(i1)
    return out
end
ImGuiTextBuffer["begin"] = ImGuiTextBuffer["begin"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextBuffer_begin(i1)
    return out
end
ImGuiTextBuffer["reserve"] = ImGuiTextBuffer["reserve"]  or function(i1, i2)
    jit.off(true)
    local out = C.ImGuiTextBuffer_reserve(i1, i2)
    return out
end
ImGuiTextBuffer["end"] = ImGuiTextBuffer["end"]  or function(i1)
    jit.off(true)
    local out = C.ImGuiTextBuffer_end(i1)
    return out
end
ImGuiTextBuffer.c_end = ImGuiTextBuffer["end"] 
local mt = getmetatable(ImGuiTextBuffer) or {}
mt.__call = mt.__call or function(self)
    jit.off(true)
    local p = C.ImGuiTextBuffer_ImGuiTextBuffer()
    return ffi.gc(p[0], C.ImGuiTextBuffer_destroy)
end
setmetatable(ImGuiTextBuffer, mt)
M.ImGuiTextBuffer = ImGuiTextBuffer
ffi.metatype("ImGuiTextBuffer", ImGuiTextBuffer)

local ImVec2 = ImVec2 or {}
ImVec2.__index = ImVec2
M.ImVec2_Nil = M.ImVec2_Nil  or function()
    jit.off(true)
    local p = C.ImVec2_ImVec2_Nil()
    return ffi.gc(p[0], C.ImVec2_destroy)
end
M.ImVec2_Float = M.ImVec2_Float  or function(i1, i2)
    jit.off(true)
    local p = C.ImVec2_ImVec2_Float(i1, i2)
    return ffi.gc(p[0], C.ImVec2_destroy)
end
M.ImVec2 = ImVec2
ffi.metatype("ImVec2", ImVec2)

M.GetFrameHeight = M.GetFrameHeight  or function()
    jit.off(true)
    local out = C.igGetFrameHeight()
    return out
end
M.TableNextColumn = M.TableNextColumn  or function()
    jit.off(true)
    local out = C.igTableNextColumn()
    return out
end
M.Render = M.Render  or function()
    jit.off(true)
    local out = C.igRender()
    return out
end
M.DragFloat4 = M.DragFloat4  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = "%.3f" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragFloat4(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.IsMousePosValid = M.IsMousePosValid  or function(i1)
    jit.off(true)
    local out = C.igIsMousePosValid(i1)
    return out
end
M.SetScrollFromPosY = M.SetScrollFromPosY  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0.5 end
    local out = C.igSetScrollFromPosY(i1, i2)
    return out
end
M.DragFloat3 = M.DragFloat3  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = "%.3f" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragFloat3(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.Value_Bool = M.Value_Bool  or function(i1, i2)
    jit.off(true)
    local out = C.igValue_Bool(i1, i2)
    return out
end
M.Value_Int = M.Value_Int  or function(i1, i2)
    jit.off(true)
    local out = C.igValue_Int(i1, i2)
    return out
end
M.Value_Uint = M.Value_Uint  or function(i1, i2)
    jit.off(true)
    local out = C.igValue_Uint(i1, i2)
    return out
end
M.Value_Float = M.Value_Float  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igValue_Float(i1, i2, i3)
    return out
end
M.GetItemRectMax = M.GetItemRectMax  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetItemRectMax(o1)
    return o1[0], out
end
M.ColorPicker4 = M.ColorPicker4  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igColorPicker4(i1, i2, i3, i4)
    return out
end
M.BeginListBox = M.BeginListBox  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = M.ImVec2_Float(0, 0) end
    local out = C.igBeginListBox(i1, i2)
    return out
end
M.SliderFloat = M.SliderFloat  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%.3f" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderFloat(i1, i2, i3, i4, i5, i6)
    return out
end
M.SetNextItemWidth = M.SetNextItemWidth  or function(i1)
    jit.off(true)
    local out = C.igSetNextItemWidth(i1)
    return out
end
M.IsRectVisible_Nil = M.IsRectVisible_Nil  or function(i1)
    jit.off(true)
    local out = C.igIsRectVisible_Nil(i1)
    return out
end
M.IsRectVisible_Vec2 = M.IsRectVisible_Vec2  or function(i1, i2)
    jit.off(true)
    local out = C.igIsRectVisible_Vec2(i1, i2)
    return out
end
M.SetNextWindowDockID = M.SetNextWindowDockID  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetNextWindowDockID(i1, i2)
    return out
end
M.SetColumnOffset = M.SetColumnOffset  or function(i1, i2)
    jit.off(true)
    local out = C.igSetColumnOffset(i1, i2)
    return out
end
M.IsKeyReleased = M.IsKeyReleased  or function(i1)
    jit.off(true)
    local out = C.igIsKeyReleased(i1)
    return out
end
M.GetColumnOffset = M.GetColumnOffset  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igGetColumnOffset(i1)
    return out
end
M.VSliderInt = M.VSliderInt  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i6 == nil then i6 = "%d" end
    if i7 == nil then i7 = 0 end
    local out = C.igVSliderInt(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.OpenPopupOnItemClick = M.OpenPopupOnItemClick  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 1 end
    local out = C.igOpenPopupOnItemClick(i1, i2)
    return out
end
M.IsAnyMouseDown = M.IsAnyMouseDown  or function()
    jit.off(true)
    local out = C.igIsAnyMouseDown()
    return out
end
M.EndFrame = M.EndFrame  or function()
    jit.off(true)
    local out = C.igEndFrame()
    return out
end
M.InputTextWithHint = M.InputTextWithHint  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i5 == nil then i5 = 0 end
    local out = C.igInputTextWithHint(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.InputScalarN = M.InputScalarN  or function(i1, i2, i3, i4, i5, i6, i7, i8)
    jit.off(true)
    if i8 == nil then i8 = 0 end
    local out = C.igInputScalarN(i1, i2, i3, i4, i5, i6, i7, i8)
    return out
end
M.InputInt2 = M.InputInt2  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igInputInt2(i1, i2, i3)
    return out
end
M.IsItemFocused = M.IsItemFocused  or function()
    jit.off(true)
    local out = C.igIsItemFocused()
    return out
end
M.SliderInt2 = M.SliderInt2  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%d" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderInt2(i1, i2, i3, i4, i5, i6)
    return out
end
M.BeginMenuBar = M.BeginMenuBar  or function()
    jit.off(true)
    local out = C.igBeginMenuBar()
    return out
end
M.IsItemVisible = M.IsItemVisible  or function()
    jit.off(true)
    local out = C.igIsItemVisible()
    return out
end
M.PopClipRect = M.PopClipRect  or function()
    jit.off(true)
    local out = C.igPopClipRect()
    return out
end
M.CheckboxFlags_IntPtr = M.CheckboxFlags_IntPtr  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igCheckboxFlags_IntPtr(i1, i2, i3)
    return out
end
M.CheckboxFlags_UintPtr = M.CheckboxFlags_UintPtr  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igCheckboxFlags_UintPtr(i1, i2, i3)
    return out
end
M.IsWindowHovered = M.IsWindowHovered  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igIsWindowHovered(i1)
    return out
end
M.PlotHistogram_FloatPtr = M.PlotHistogram_FloatPtr  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i4 == nil then i4 = 0 end
    if i6 == nil then i6 = FLT_MAX end
    if i7 == nil then i7 = FLT_MAX end
    if i8 == nil then i8 = M.ImVec2_Float(0, 0) end
    if i9 == nil then i9 = ffi.sizeof("float") end
    local out = C.igPlotHistogram_FloatPtr(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.PlotHistogram_FnFloatPtr = M.PlotHistogram_FnFloatPtr  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i5 == nil then i5 = 0 end
    if i7 == nil then i7 = FLT_MAX end
    if i8 == nil then i8 = FLT_MAX end
    if i9 == nil then i9 = M.ImVec2_Float(0, 0) end
    local out = C.igPlotHistogram_FnFloatPtr(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.BeginPopupContextVoid = M.BeginPopupContextVoid  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 1 end
    local out = C.igBeginPopupContextVoid(i1, i2)
    return out
end
M.LoadIniSettingsFromMemory = M.LoadIniSettingsFromMemory  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igLoadIniSettingsFromMemory(i1, i2)
    return out
end
M.Checkbox = M.Checkbox  or function(i1, i2)
    jit.off(true)
    local out = C.igCheckbox(i1, i2)
    return out
end
M.GetWindowPos = M.GetWindowPos  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetWindowPos(o1)
    return o1[0], out
end
M.TextColored = M.TextColored  or function(i1, i2, ...)
    jit.off(true)
    local out = C.igTextColored(i1, i2, ...)
    return out
end
M.DragInt2 = M.DragInt2  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0 end
    if i5 == nil then i5 = 0 end
    if i6 == nil then i6 = "%d" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragInt2(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.DragScalarN = M.DragScalarN  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i5 == nil then i5 = 1.0 end
    if i9 == nil then i9 = 0 end
    local out = C.igDragScalarN(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.GetKeyIndex = M.GetKeyIndex  or function(i1)
    jit.off(true)
    local out = C.igGetKeyIndex(i1)
    return out
end
M.GetID_Str = M.GetID_Str  or function(i1)
    jit.off(true)
    local out = C.igGetID_Str(i1)
    return out
end
M.GetID_StrStr = M.GetID_StrStr  or function(i1, i2)
    jit.off(true)
    local out = C.igGetID_StrStr(i1, i2)
    return out
end
M.GetID_Ptr = M.GetID_Ptr  or function(i1)
    jit.off(true)
    local out = C.igGetID_Ptr(i1)
    return out
end
M.IsMouseReleased = M.IsMouseReleased  or function(i1)
    jit.off(true)
    local out = C.igIsMouseReleased(i1)
    return out
end
M.GetItemRectMin = M.GetItemRectMin  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetItemRectMin(o1)
    return o1[0], out
end
M.LogToTTY = M.LogToTTY  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igLogToTTY(i1)
    return out
end
M.SetWindowPos_Vec2 = M.SetWindowPos_Vec2  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetWindowPos_Vec2(i1, i2)
    return out
end
M.SetWindowPos_Str = M.SetWindowPos_Str  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igSetWindowPos_Str(i1, i2, i3)
    return out
end
M.NextColumn = M.NextColumn  or function()
    jit.off(true)
    local out = C.igNextColumn()
    return out
end
M.BeginPopupModal = M.BeginPopupModal  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igBeginPopupModal(i1, i2, i3)
    return out
end
M.ShowMetricsWindow = M.ShowMetricsWindow  or function(i1)
    jit.off(true)
    local out = C.igShowMetricsWindow(i1)
    return out
end
M.GetTextLineHeight = M.GetTextLineHeight  or function()
    jit.off(true)
    local out = C.igGetTextLineHeight()
    return out
end
M.GetMouseClickedCount = M.GetMouseClickedCount  or function(i1)
    jit.off(true)
    local out = C.igGetMouseClickedCount(i1)
    return out
end
M.BeginChild_Str = M.BeginChild_Str  or function(i1, i2, i3, i4)
    jit.off(true)
    if i2 == nil then i2 = M.ImVec2_Float(0, 0) end
    if i3 == nil then i3 = false end
    if i4 == nil then i4 = 0 end
    local out = C.igBeginChild_Str(i1, i2, i3, i4)
    return out
end
M.BeginChild_ID = M.BeginChild_ID  or function(i1, i2, i3, i4)
    jit.off(true)
    if i2 == nil then i2 = M.ImVec2_Float(0, 0) end
    if i3 == nil then i3 = false end
    if i4 == nil then i4 = 0 end
    local out = C.igBeginChild_ID(i1, i2, i3, i4)
    return out
end
M.IsItemToggledOpen = M.IsItemToggledOpen  or function()
    jit.off(true)
    local out = C.igIsItemToggledOpen()
    return out
end
M.ShowDemoWindow = M.ShowDemoWindow  or function(i1)
    jit.off(true)
    local out = C.igShowDemoWindow(i1)
    return out
end
M.EndMenu = M.EndMenu  or function()
    jit.off(true)
    local out = C.igEndMenu()
    return out
end
M.IsWindowCollapsed = M.IsWindowCollapsed  or function()
    jit.off(true)
    local out = C.igIsWindowCollapsed()
    return out
end
M.Begin = M.Begin  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igBegin(i1, i2, i3)
    return out
end
M.GetFontSize = M.GetFontSize  or function()
    jit.off(true)
    local out = C.igGetFontSize()
    return out
end
M.GetWindowDockID = M.GetWindowDockID  or function()
    jit.off(true)
    local out = C.igGetWindowDockID()
    return out
end
M.InputTextMultiline = M.InputTextMultiline  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i4 == nil then i4 = M.ImVec2_Float(0, 0) end
    if i5 == nil then i5 = 0 end
    local out = C.igInputTextMultiline(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.InputFloat4 = M.InputFloat4  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = "%.3f" end
    if i4 == nil then i4 = 0 end
    local out = C.igInputFloat4(i1, i2, i3, i4)
    return out
end
M.PushID_Str = M.PushID_Str  or function(i1)
    jit.off(true)
    local out = C.igPushID_Str(i1)
    return out
end
M.PushID_StrStr = M.PushID_StrStr  or function(i1, i2)
    jit.off(true)
    local out = C.igPushID_StrStr(i1, i2)
    return out
end
M.PushID_Ptr = M.PushID_Ptr  or function(i1)
    jit.off(true)
    local out = C.igPushID_Ptr(i1)
    return out
end
M.PushID_Int = M.PushID_Int  or function(i1)
    jit.off(true)
    local out = C.igPushID_Int(i1)
    return out
end
M.PopStyleColor = M.PopStyleColor  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 1 end
    local out = C.igPopStyleColor(i1)
    return out
end
M.Text = M.Text  or function(i1, ...)
    jit.off(true)
    local out = C.igText(i1, ...)
    return out
end
M.GetTextLineHeightWithSpacing = M.GetTextLineHeightWithSpacing  or function()
    jit.off(true)
    local out = C.igGetTextLineHeightWithSpacing()
    return out
end
M.GetPlatformIO = M.GetPlatformIO  or function()
    jit.off(true)
    local out = C.igGetPlatformIO()
    return out
end
M.BeginTabItem = M.BeginTabItem  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igBeginTabItem(i1, i2, i3)
    return out
end
M.VSliderScalar = M.VSliderScalar  or function(i1, i2, i3, i4, i5, i6, i7, i8)
    jit.off(true)
    if i8 == nil then i8 = 0 end
    local out = C.igVSliderScalar(i1, i2, i3, i4, i5, i6, i7, i8)
    return out
end
M.GetWindowDpiScale = M.GetWindowDpiScale  or function()
    jit.off(true)
    local out = C.igGetWindowDpiScale()
    return out
end
M.SliderFloat3 = M.SliderFloat3  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%.3f" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderFloat3(i1, i2, i3, i4, i5, i6)
    return out
end
M.DragFloat = M.DragFloat  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = "%.3f" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragFloat(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.SetScrollFromPosX = M.SetScrollFromPosX  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0.5 end
    local out = C.igSetScrollFromPosX(i1, i2)
    return out
end
M.TableSetupScrollFreeze = M.TableSetupScrollFreeze  or function(i1, i2)
    jit.off(true)
    local out = C.igTableSetupScrollFreeze(i1, i2)
    return out
end
M.GetMousePosOnOpeningCurrentPopup = M.GetMousePosOnOpeningCurrentPopup  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetMousePosOnOpeningCurrentPopup(o1)
    return o1[0], out
end
M.GetForegroundDrawList_Nil = M.GetForegroundDrawList_Nil  or function()
    jit.off(true)
    local out = C.igGetForegroundDrawList_Nil()
    return out
end
M.GetForegroundDrawList_ViewportPtr = M.GetForegroundDrawList_ViewportPtr  or function(i1)
    jit.off(true)
    local out = C.igGetForegroundDrawList_ViewportPtr(i1)
    return out
end
M.EndDragDropSource = M.EndDragDropSource  or function()
    jit.off(true)
    local out = C.igEndDragDropSource()
    return out
end
M.GetFrameHeightWithSpacing = M.GetFrameHeightWithSpacing  or function()
    jit.off(true)
    local out = C.igGetFrameHeightWithSpacing()
    return out
end
M.CloseCurrentPopup = M.CloseCurrentPopup  or function()
    jit.off(true)
    local out = C.igCloseCurrentPopup()
    return out
end
M.IsItemHovered = M.IsItemHovered  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igIsItemHovered(i1)
    return out
end
M.InputInt3 = M.InputInt3  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igInputInt3(i1, i2, i3)
    return out
end
M.SetNextWindowClass = M.SetNextWindowClass  or function(i1)
    jit.off(true)
    local out = C.igSetNextWindowClass(i1)
    return out
end
M.DestroyPlatformWindows = M.DestroyPlatformWindows  or function()
    jit.off(true)
    local out = C.igDestroyPlatformWindows()
    return out
end
M.DragInt3 = M.DragInt3  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0 end
    if i5 == nil then i5 = 0 end
    if i6 == nil then i6 = "%d" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragInt3(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.RenderPlatformWindowsDefault = M.RenderPlatformWindowsDefault  or function(i1, i2)
    jit.off(true)
    local out = C.igRenderPlatformWindowsDefault(i1, i2)
    return out
end
M.GetContentRegionMax = M.GetContentRegionMax  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetContentRegionMax(o1)
    return o1[0], out
end
M.BeginChildFrame = M.BeginChildFrame  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igBeginChildFrame(i1, i2, i3)
    return out
end
M.EndDragDropTarget = M.EndDragDropTarget  or function()
    jit.off(true)
    local out = C.igEndDragDropTarget()
    return out
end
M.GetKeyPressedAmount = M.GetKeyPressedAmount  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igGetKeyPressedAmount(i1, i2, i3)
    return out
end
M.NewFrame = M.NewFrame  or function()
    jit.off(true)
    local out = C.igNewFrame()
    return out
end
M.DockSpaceOverViewport = M.DockSpaceOverViewport  or function(i1, i2, i3)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igDockSpaceOverViewport(i1, i2, i3)
    return out
end
M.EndListBox = M.EndListBox  or function()
    jit.off(true)
    local out = C.igEndListBox()
    return out
end
M.GetFrameCount = M.GetFrameCount  or function()
    jit.off(true)
    local out = C.igGetFrameCount()
    return out
end
M.GetColumnWidth = M.GetColumnWidth  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igGetColumnWidth(i1)
    return out
end
M.EndMenuBar = M.EndMenuBar  or function()
    jit.off(true)
    local out = C.igEndMenuBar()
    return out
end
M.IsMouseDragging = M.IsMouseDragging  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = -1.0 end
    local out = C.igIsMouseDragging(i1, i2)
    return out
end
M.SetItemAllowOverlap = M.SetItemAllowOverlap  or function()
    jit.off(true)
    local out = C.igSetItemAllowOverlap()
    return out
end
M.EndChild = M.EndChild  or function()
    jit.off(true)
    local out = C.igEndChild()
    return out
end
M.DragFloatRange2 = M.DragFloatRange2  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i4 == nil then i4 = 1.0 end
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = 0.0 end
    if i7 == nil then i7 = "%.3f" end
    if i9 == nil then i9 = 0 end
    local out = C.igDragFloatRange2(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.SetMouseCursor = M.SetMouseCursor  or function(i1)
    jit.off(true)
    local out = C.igSetMouseCursor(i1)
    return out
end
M.InputScalar = M.InputScalar  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i7 == nil then i7 = 0 end
    local out = C.igInputScalar(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.GetTime = M.GetTime  or function()
    jit.off(true)
    local out = C.igGetTime()
    return out
end
M.EndMainMenuBar = M.EndMainMenuBar  or function()
    jit.off(true)
    local out = C.igEndMainMenuBar()
    return out
end
M.GetMouseCursor = M.GetMouseCursor  or function()
    jit.off(true)
    local out = C.igGetMouseCursor()
    return out
end
M.GetScrollY = M.GetScrollY  or function()
    jit.off(true)
    local out = C.igGetScrollY()
    return out
end
M.GetWindowContentRegionMin = M.GetWindowContentRegionMin  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetWindowContentRegionMin(o1)
    return o1[0], out
end
M.SliderScalarN = M.SliderScalarN  or function(i1, i2, i3, i4, i5, i6, i7, i8)
    jit.off(true)
    if i8 == nil then i8 = 0 end
    local out = C.igSliderScalarN(i1, i2, i3, i4, i5, i6, i7, i8)
    return out
end
M.GetKeyName = M.GetKeyName  or function(i1)
    jit.off(true)
    local out = C.igGetKeyName(i1)
    return out
end
M.BeginTabBar = M.BeginTabBar  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igBeginTabBar(i1, i2)
    return out
end
M.DragScalar = M.DragScalar  or function(i1, i2, i3, i4, i5, i6, i7, i8)
    jit.off(true)
    if i4 == nil then i4 = 1.0 end
    if i8 == nil then i8 = 0 end
    local out = C.igDragScalar(i1, i2, i3, i4, i5, i6, i7, i8)
    return out
end
M.IsAnyItemHovered = M.IsAnyItemHovered  or function()
    jit.off(true)
    local out = C.igIsAnyItemHovered()
    return out
end
M.SetCursorPosX = M.SetCursorPosX  or function(i1)
    jit.off(true)
    local out = C.igSetCursorPosX(i1)
    return out
end
M.TreePop = M.TreePop  or function()
    jit.off(true)
    local out = C.igTreePop()
    return out
end
M.GetColorU32_Col = M.GetColorU32_Col  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 1.0 end
    local out = C.igGetColorU32_Col(i1, i2)
    return out
end
M.GetColorU32_Vec4 = M.GetColorU32_Vec4  or function(i1)
    jit.off(true)
    local out = C.igGetColorU32_Vec4(i1)
    return out
end
M.GetColorU32_U32 = M.GetColorU32_U32  or function(i1)
    jit.off(true)
    local out = C.igGetColorU32_U32(i1)
    return out
end
M.PopStyleVar = M.PopStyleVar  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 1 end
    local out = C.igPopStyleVar(i1)
    return out
end
M.FindViewportByPlatformHandle = M.FindViewportByPlatformHandle  or function(i1)
    jit.off(true)
    local out = C.igFindViewportByPlatformHandle(i1)
    return out
end
M.TreeNode_Str = M.TreeNode_Str  or function(i1)
    jit.off(true)
    local out = C.igTreeNode_Str(i1)
    return out
end
M.TreeNode_StrStr = M.TreeNode_StrStr  or function(i1, i2, ...)
    jit.off(true)
    local out = C.igTreeNode_StrStr(i1, i2, ...)
    return out
end
M.TreeNode_Ptr = M.TreeNode_Ptr  or function(i1, i2, ...)
    jit.off(true)
    local out = C.igTreeNode_Ptr(i1, i2, ...)
    return out
end
M.CreateContext = M.CreateContext  or function(i1)
    jit.off(true)
    local out = C.igCreateContext(i1)
    return out
end
M.PopFont = M.PopFont  or function()
    jit.off(true)
    local out = C.igPopFont()
    return out
end
M.CaptureKeyboardFromApp = M.CaptureKeyboardFromApp  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = true end
    local out = C.igCaptureKeyboardFromApp(i1)
    return out
end
M.EndTable = M.EndTable  or function()
    jit.off(true)
    local out = C.igEndTable()
    return out
end
M.DebugCheckVersionAndDataLayout = M.DebugCheckVersionAndDataLayout  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    local out = C.igDebugCheckVersionAndDataLayout(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.SetScrollY = M.SetScrollY  or function(i1)
    jit.off(true)
    local out = C.igSetScrollY(i1)
    return out
end
M.SetColorEditOptions = M.SetColorEditOptions  or function(i1)
    jit.off(true)
    local out = C.igSetColorEditOptions(i1)
    return out
end
M.IsMouseHoveringRect = M.IsMouseHoveringRect  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = true end
    local out = C.igIsMouseHoveringRect(i1, i2, i3)
    return out
end
M.IsItemDeactivated = M.IsItemDeactivated  or function()
    jit.off(true)
    local out = C.igIsItemDeactivated()
    return out
end
M.PushStyleVar_Float = M.PushStyleVar_Float  or function(i1, i2)
    jit.off(true)
    local out = C.igPushStyleVar_Float(i1, i2)
    return out
end
M.PushStyleVar_Vec2 = M.PushStyleVar_Vec2  or function(i1, i2)
    jit.off(true)
    local out = C.igPushStyleVar_Vec2(i1, i2)
    return out
end
M.SaveIniSettingsToMemory = M.SaveIniSettingsToMemory  or function()
    jit.off(true)
    local o1 = ffi.new("size_t[1]")
    local out = C.igSaveIniSettingsToMemory(o1)
    return o1[0], out
end
M.SetWindowFocus_Nil = M.SetWindowFocus_Nil  or function()
    jit.off(true)
    local out = C.igSetWindowFocus_Nil()
    return out
end
M.SetWindowFocus_Str = M.SetWindowFocus_Str  or function(i1)
    jit.off(true)
    local out = C.igSetWindowFocus_Str(i1)
    return out
end
M.PushItemWidth = M.PushItemWidth  or function(i1)
    jit.off(true)
    local out = C.igPushItemWidth(i1)
    return out
end
M.LoadIniSettingsFromDisk = M.LoadIniSettingsFromDisk  or function(i1)
    jit.off(true)
    local out = C.igLoadIniSettingsFromDisk(i1)
    return out
end
M.GetCursorStartPos = M.GetCursorStartPos  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetCursorStartPos(o1)
    return o1[0], out
end
M.TableGetRowIndex = M.TableGetRowIndex  or function()
    jit.off(true)
    local out = C.igTableGetRowIndex()
    return out
end
M.TabItemButton = M.TabItemButton  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igTabItemButton(i1, i2)
    return out
end
M.LabelText = M.LabelText  or function(i1, i2, ...)
    jit.off(true)
    local out = C.igLabelText(i1, i2, ...)
    return out
end
M.GetFont = M.GetFont  or function()
    jit.off(true)
    local out = C.igGetFont()
    return out
end
M.IsKeyPressed = M.IsKeyPressed  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = true end
    local out = C.igIsKeyPressed(i1, i2)
    return out
end
M.GetBackgroundDrawList_Nil = M.GetBackgroundDrawList_Nil  or function()
    jit.off(true)
    local out = C.igGetBackgroundDrawList_Nil()
    return out
end
M.GetBackgroundDrawList_ViewportPtr = M.GetBackgroundDrawList_ViewportPtr  or function(i1)
    jit.off(true)
    local out = C.igGetBackgroundDrawList_ViewportPtr(i1)
    return out
end
M.SmallButton = M.SmallButton  or function(i1)
    jit.off(true)
    local out = C.igSmallButton(i1)
    return out
end
M.ColorEdit4 = M.ColorEdit4  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igColorEdit4(i1, i2, i3)
    return out
end
M.SliderFloat2 = M.SliderFloat2  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%.3f" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderFloat2(i1, i2, i3, i4, i5, i6)
    return out
end
M.IsItemDeactivatedAfterEdit = M.IsItemDeactivatedAfterEdit  or function()
    jit.off(true)
    local out = C.igIsItemDeactivatedAfterEdit()
    return out
end
M.NewLine = M.NewLine  or function()
    jit.off(true)
    local out = C.igNewLine()
    return out
end
M.GetStateStorage = M.GetStateStorage  or function()
    jit.off(true)
    local out = C.igGetStateStorage()
    return out
end
M.SetStateStorage = M.SetStateStorage  or function(i1)
    jit.off(true)
    local out = C.igSetStateStorage(i1)
    return out
end
M.InputFloat = M.InputFloat  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i3 == nil then i3 = 0.0 end
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = "%.3f" end
    if i6 == nil then i6 = 0 end
    local out = C.igInputFloat(i1, i2, i3, i4, i5, i6)
    return out
end
M.DockSpace = M.DockSpace  or function(i1, i2, i3, i4)
    jit.off(true)
    if i2 == nil then i2 = M.ImVec2_Float(0, 0) end
    if i3 == nil then i3 = 0 end
    local out = C.igDockSpace(i1, i2, i3, i4)
    return out
end
M.ColorConvertRGBtoHSV = M.ColorConvertRGBtoHSV  or function(i1, i2, i3)
    jit.off(true)
    local o1 = ffi.new("float[1]")
    local o2 = ffi.new("float[1]")
    local o3 = ffi.new("float[1]")
    local out = C.igColorConvertRGBtoHSV(i1, i2, i3, o1, o2, o3)
    return o1[0], o2[0], o3[0], out
end
M.IsPopupOpen = M.IsPopupOpen  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igIsPopupOpen(i1, i2)
    return out
end
M.AcceptDragDropPayload = M.AcceptDragDropPayload  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igAcceptDragDropPayload(i1, i2)
    return out
end
M.BeginDragDropSource = M.BeginDragDropSource  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igBeginDragDropSource(i1)
    return out
end
M.PlotLines_FloatPtr = M.PlotLines_FloatPtr  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i4 == nil then i4 = 0 end
    if i6 == nil then i6 = FLT_MAX end
    if i7 == nil then i7 = FLT_MAX end
    if i8 == nil then i8 = M.ImVec2_Float(0, 0) end
    if i9 == nil then i9 = ffi.sizeof("float") end
    local out = C.igPlotLines_FloatPtr(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.PlotLines_FnFloatPtr = M.PlotLines_FnFloatPtr  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i5 == nil then i5 = 0 end
    if i7 == nil then i7 = FLT_MAX end
    if i8 == nil then i8 = FLT_MAX end
    if i9 == nil then i9 = M.ImVec2_Float(0, 0) end
    local out = C.igPlotLines_FnFloatPtr(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.PushStyleColor_U32 = M.PushStyleColor_U32  or function(i1, i2)
    jit.off(true)
    local out = C.igPushStyleColor_U32(i1, i2)
    return out
end
M.PushStyleColor_Vec4 = M.PushStyleColor_Vec4  or function(i1, i2)
    jit.off(true)
    local out = C.igPushStyleColor_Vec4(i1, i2)
    return out
end
M.GetWindowSize = M.GetWindowSize  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetWindowSize(o1)
    return o1[0], out
end
M.TableGetColumnFlags = M.TableGetColumnFlags  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igTableGetColumnFlags(i1)
    return out
end
M.ShowStyleEditor = M.ShowStyleEditor  or function(i1)
    jit.off(true)
    local out = C.igShowStyleEditor(i1)
    return out
end
M.LogToFile = M.LogToFile  or function(i1, i2)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igLogToFile(i1, i2)
    return out
end
M.BeginDisabled = M.BeginDisabled  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = true end
    local out = C.igBeginDisabled(i1)
    return out
end
M.GetMainViewport = M.GetMainViewport  or function()
    jit.off(true)
    local out = C.igGetMainViewport()
    return out
end
M.IsAnyItemActive = M.IsAnyItemActive  or function()
    jit.off(true)
    local out = C.igIsAnyItemActive()
    return out
end
M.ColorConvertHSVtoRGB = M.ColorConvertHSVtoRGB  or function(i1, i2, i3)
    jit.off(true)
    local o1 = ffi.new("float[1]")
    local o2 = ffi.new("float[1]")
    local o3 = ffi.new("float[1]")
    local out = C.igColorConvertHSVtoRGB(i1, i2, i3, o1, o2, o3)
    return o1[0], o2[0], o3[0], out
end
M.GetColumnsCount = M.GetColumnsCount  or function()
    jit.off(true)
    local out = C.igGetColumnsCount()
    return out
end
M.PopButtonRepeat = M.PopButtonRepeat  or function()
    jit.off(true)
    local out = C.igPopButtonRepeat()
    return out
end
M.ShowFontSelector = M.ShowFontSelector  or function(i1)
    jit.off(true)
    local out = C.igShowFontSelector(i1)
    return out
end
M.Spacing = M.Spacing  or function()
    jit.off(true)
    local out = C.igSpacing()
    return out
end
M.IsAnyItemFocused = M.IsAnyItemFocused  or function()
    jit.off(true)
    local out = C.igIsAnyItemFocused()
    return out
end
M.MemFree = M.MemFree  or function(i1)
    jit.off(true)
    local out = C.igMemFree(i1)
    return out
end
M.IsItemClicked = M.IsItemClicked  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igIsItemClicked(i1)
    return out
end
M.ProgressBar = M.ProgressBar  or function(i1, i2, i3)
    jit.off(true)
    if i2 == nil then i2 = M.ImVec2_Float(-FLT_MIN, 0) end
    local out = C.igProgressBar(i1, i2, i3)
    return out
end
M.SetNextWindowBgAlpha = M.SetNextWindowBgAlpha  or function(i1)
    jit.off(true)
    local out = C.igSetNextWindowBgAlpha(i1)
    return out
end
M.GetScrollX = M.GetScrollX  or function()
    jit.off(true)
    local out = C.igGetScrollX()
    return out
end
M.GetMousePos = M.GetMousePos  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetMousePos(o1)
    return o1[0], out
end
M.IsMouseDoubleClicked = M.IsMouseDoubleClicked  or function(i1)
    jit.off(true)
    local out = C.igIsMouseDoubleClicked(i1)
    return out
end
M.LogText = M.LogText  or function(i1, ...)
    jit.off(true)
    local out = C.igLogText(i1, ...)
    return out
end
M.VSliderFloat = M.VSliderFloat  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i6 == nil then i6 = "%.3f" end
    if i7 == nil then i7 = 0 end
    local out = C.igVSliderFloat(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.GetIO = M.GetIO  or function()
    jit.off(true)
    local out = C.igGetIO()
    return out
end
M.DragInt4 = M.DragInt4  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0 end
    if i5 == nil then i5 = 0 end
    if i6 == nil then i6 = "%d" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragInt4(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.Unindent = M.Unindent  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0.0 end
    local out = C.igUnindent(i1)
    return out
end
M.TreePush_Str = M.TreePush_Str  or function(i1)
    jit.off(true)
    local out = C.igTreePush_Str(i1)
    return out
end
M.TreePush_Ptr = M.TreePush_Ptr  or function(i1)
    jit.off(true)
    local out = C.igTreePush_Ptr(i1)
    return out
end
M.SetCursorPos = M.SetCursorPos  or function(i1)
    jit.off(true)
    local out = C.igSetCursorPos(i1)
    return out
end
M.ColorConvertU32ToFloat4 = M.ColorConvertU32ToFloat4  or function(i1)
    jit.off(true)
    local o1 = ffi.new("ImVec4[1]")
    local out = C.igColorConvertU32ToFloat4(o1, i1)
    return o1[0], out
end
M.PushAllowKeyboardFocus = M.PushAllowKeyboardFocus  or function(i1)
    jit.off(true)
    local out = C.igPushAllowKeyboardFocus(i1)
    return out
end
M.IsWindowFocused = M.IsWindowFocused  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igIsWindowFocused(i1)
    return out
end
M.EndTabBar = M.EndTabBar  or function()
    jit.off(true)
    local out = C.igEndTabBar()
    return out
end
M.GetScrollMaxY = M.GetScrollMaxY  or function()
    jit.off(true)
    local out = C.igGetScrollMaxY()
    return out
end
M.BeginTooltip = M.BeginTooltip  or function()
    jit.off(true)
    local out = C.igBeginTooltip()
    return out
end
M.TreeNodeEx_Str = M.TreeNodeEx_Str  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igTreeNodeEx_Str(i1, i2)
    return out
end
M.TreeNodeEx_StrStr = M.TreeNodeEx_StrStr  or function(i1, i2, i3, ...)
    jit.off(true)
    local out = C.igTreeNodeEx_StrStr(i1, i2, i3, ...)
    return out
end
M.TreeNodeEx_Ptr = M.TreeNodeEx_Ptr  or function(i1, i2, i3, ...)
    jit.off(true)
    local out = C.igTreeNodeEx_Ptr(i1, i2, i3, ...)
    return out
end
M.GetDrawData = M.GetDrawData  or function()
    jit.off(true)
    local out = C.igGetDrawData()
    return out
end
M.TextWrapped = M.TextWrapped  or function(i1, ...)
    jit.off(true)
    local out = C.igTextWrapped(i1, ...)
    return out
end
M.TextUnformatted = M.TextUnformatted  or function(i1, i2)
    jit.off(true)
    local out = C.igTextUnformatted(i1, i2)
    return out
end
M.TextDisabled = M.TextDisabled  or function(i1, ...)
    jit.off(true)
    local out = C.igTextDisabled(i1, ...)
    return out
end
M.RadioButton_Bool = M.RadioButton_Bool  or function(i1, i2)
    jit.off(true)
    local out = C.igRadioButton_Bool(i1, i2)
    return out
end
M.RadioButton_IntPtr = M.RadioButton_IntPtr  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igRadioButton_IntPtr(i1, i2, i3)
    return out
end
M.IsMouseClicked = M.IsMouseClicked  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = false end
    local out = C.igIsMouseClicked(i1, i2)
    return out
end
M.CalcItemWidth = M.CalcItemWidth  or function()
    jit.off(true)
    local out = C.igCalcItemWidth()
    return out
end
M.TableSetColumnIndex = M.TableSetColumnIndex  or function(i1)
    jit.off(true)
    local out = C.igTableSetColumnIndex(i1)
    return out
end
M.Indent = M.Indent  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0.0 end
    local out = C.igIndent(i1)
    return out
end
M.SetDragDropPayload = M.SetDragDropPayload  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = 0 end
    local out = C.igSetDragDropPayload(i1, i2, i3, i4)
    return out
end
M.TableHeadersRow = M.TableHeadersRow  or function()
    jit.off(true)
    local out = C.igTableHeadersRow()
    return out
end
M.TableHeader = M.TableHeader  or function(i1)
    jit.off(true)
    local out = C.igTableHeader(i1)
    return out
end
M.SliderAngle = M.SliderAngle  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i3 == nil then i3 = -360.0 end
    if i4 == nil then i4 = 360.0 end
    if i5 == nil then i5 = "%.0f deg" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderAngle(i1, i2, i3, i4, i5, i6)
    return out
end
M.TableGetColumnName = M.TableGetColumnName  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igTableGetColumnName(i1)
    return out
end
M.GetClipboardText = M.GetClipboardText  or function()
    jit.off(true)
    local out = C.igGetClipboardText()
    return out
end
M.TableGetColumnIndex = M.TableGetColumnIndex  or function()
    jit.off(true)
    local out = C.igTableGetColumnIndex()
    return out
end
M.SetClipboardText = M.SetClipboardText  or function(i1)
    jit.off(true)
    local out = C.igSetClipboardText(i1)
    return out
end
M.TableGetColumnCount = M.TableGetColumnCount  or function()
    jit.off(true)
    local out = C.igTableGetColumnCount()
    return out
end
M.TableSetupColumn = M.TableSetupColumn  or function(i1, i2, i3, i4)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    if i3 == nil then i3 = 0.0 end
    if i4 == nil then i4 = 0 end
    local out = C.igTableSetupColumn(i1, i2, i3, i4)
    return out
end
M.GetCursorScreenPos = M.GetCursorScreenPos  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetCursorScreenPos(o1)
    return o1[0], out
end
M.StyleColorsClassic = M.StyleColorsClassic  or function(i1)
    jit.off(true)
    local out = C.igStyleColorsClassic(i1)
    return out
end
M.SetNextWindowFocus = M.SetNextWindowFocus  or function()
    jit.off(true)
    local out = C.igSetNextWindowFocus()
    return out
end
M.GetMouseDragDelta = M.GetMouseDragDelta  or function(i1, i2)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    if i2 == nil then i2 = -1.0 end
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetMouseDragDelta(o1, i1, i2)
    return o1[0], out
end
M.SliderInt4 = M.SliderInt4  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%d" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderInt4(i1, i2, i3, i4, i5, i6)
    return out
end
M.Columns = M.Columns  or function(i1, i2, i3)
    jit.off(true)
    if i1 == nil then i1 = 1 end
    if i3 == nil then i3 = true end
    local out = C.igColumns(i1, i2, i3)
    return out
end
M.SliderFloat4 = M.SliderFloat4  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%.3f" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderFloat4(i1, i2, i3, i4, i5, i6)
    return out
end
M.TableGetSortSpecs = M.TableGetSortSpecs  or function()
    jit.off(true)
    local out = C.igTableGetSortSpecs()
    return out
end
M.InputFloat2 = M.InputFloat2  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = "%.3f" end
    if i4 == nil then i4 = 0 end
    local out = C.igInputFloat2(i1, i2, i3, i4)
    return out
end
M.PushButtonRepeat = M.PushButtonRepeat  or function(i1)
    jit.off(true)
    local out = C.igPushButtonRepeat(i1)
    return out
end
M.PopItemWidth = M.PopItemWidth  or function()
    jit.off(true)
    local out = C.igPopItemWidth()
    return out
end
M.ShowUserGuide = M.ShowUserGuide  or function()
    jit.off(true)
    local out = C.igShowUserGuide()
    return out
end
M.SetColumnWidth = M.SetColumnWidth  or function(i1, i2)
    jit.off(true)
    local out = C.igSetColumnWidth(i1, i2)
    return out
end
M.InvisibleButton = M.InvisibleButton  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igInvisibleButton(i1, i2, i3)
    return out
end
M.SetCurrentContext = M.SetCurrentContext  or function(i1)
    jit.off(true)
    local out = C.igSetCurrentContext(i1)
    return out
end
M.InputDouble = M.InputDouble  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i3 == nil then i3 = 0.0 end
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = "%.6f" end
    if i6 == nil then i6 = 0 end
    local out = C.igInputDouble(i1, i2, i3, i4, i5, i6)
    return out
end
M.SetWindowSize_Vec2 = M.SetWindowSize_Vec2  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetWindowSize_Vec2(i1, i2)
    return out
end
M.SetWindowSize_Str = M.SetWindowSize_Str  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igSetWindowSize_Str(i1, i2, i3)
    return out
end
M.EndPopup = M.EndPopup  or function()
    jit.off(true)
    local out = C.igEndPopup()
    return out
end
M.SetWindowCollapsed_Bool = M.SetWindowCollapsed_Bool  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetWindowCollapsed_Bool(i1, i2)
    return out
end
M.SetWindowCollapsed_Str = M.SetWindowCollapsed_Str  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igSetWindowCollapsed_Str(i1, i2, i3)
    return out
end
M.ListBox_Str_arr = M.ListBox_Str_arr  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = -1 end
    local out = C.igListBox_Str_arr(i1, i2, i3, i4, i5)
    return out
end
M.ListBox_FnBoolPtr = M.ListBox_FnBoolPtr  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i6 == nil then i6 = -1 end
    local out = C.igListBox_FnBoolPtr(i1, i2, i3, i4, i5, i6)
    return out
end
M.SetScrollX = M.SetScrollX  or function(i1)
    jit.off(true)
    local out = C.igSetScrollX(i1)
    return out
end
M.SetScrollHereY = M.SetScrollHereY  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0.5 end
    local out = C.igSetScrollHereY(i1)
    return out
end
M.SetScrollHereX = M.SetScrollHereX  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0.5 end
    local out = C.igSetScrollHereX(i1)
    return out
end
M.GetVersion = M.GetVersion  or function()
    jit.off(true)
    local out = C.igGetVersion()
    return out
end
M.EndCombo = M.EndCombo  or function()
    jit.off(true)
    local out = C.igEndCombo()
    return out
end
M.SetNextWindowViewport = M.SetNextWindowViewport  or function(i1)
    jit.off(true)
    local out = C.igSetNextWindowViewport(i1)
    return out
end
M.PushTextWrapPos = M.PushTextWrapPos  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0.0 end
    local out = C.igPushTextWrapPos(i1)
    return out
end
M.SetNextWindowSizeConstraints = M.SetNextWindowSizeConstraints  or function(i1, i2, i3, i4)
    jit.off(true)
    local out = C.igSetNextWindowSizeConstraints(i1, i2, i3, i4)
    return out
end
M.SetNextWindowSize = M.SetNextWindowSize  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetNextWindowSize(i1, i2)
    return out
end
M.GetDragDropPayload = M.GetDragDropPayload  or function()
    jit.off(true)
    local out = C.igGetDragDropPayload()
    return out
end
M.AlignTextToFramePadding = M.AlignTextToFramePadding  or function()
    jit.off(true)
    local out = C.igAlignTextToFramePadding()
    return out
end
M.SetNextWindowPos = M.SetNextWindowPos  or function(i1, i2, i3)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    if i3 == nil then i3 = M.ImVec2_Float(0, 0) end
    local out = C.igSetNextWindowPos(i1, i2, i3)
    return out
end
M.IsItemEdited = M.IsItemEdited  or function()
    jit.off(true)
    local out = C.igIsItemEdited()
    return out
end
M.SetNextWindowCollapsed = M.SetNextWindowCollapsed  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetNextWindowCollapsed(i1, i2)
    return out
end
M.SetNextWindowContentSize = M.SetNextWindowContentSize  or function(i1)
    jit.off(true)
    local out = C.igSetNextWindowContentSize(i1)
    return out
end
M.IsItemActivated = M.IsItemActivated  or function()
    jit.off(true)
    local out = C.igIsItemActivated()
    return out
end
M.EndTooltip = M.EndTooltip  or function()
    jit.off(true)
    local out = C.igEndTooltip()
    return out
end
M.SetKeyboardFocusHere = M.SetKeyboardFocusHere  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igSetKeyboardFocusHere(i1)
    return out
end
M.SetItemDefaultFocus = M.SetItemDefaultFocus  or function()
    jit.off(true)
    local out = C.igSetItemDefaultFocus()
    return out
end
M.SetCursorScreenPos = M.SetCursorScreenPos  or function(i1)
    jit.off(true)
    local out = C.igSetCursorScreenPos(i1)
    return out
end
M.SetCursorPosY = M.SetCursorPosY  or function(i1)
    jit.off(true)
    local out = C.igSetCursorPosY(i1)
    return out
end
M.ShowAboutWindow = M.ShowAboutWindow  or function(i1)
    jit.off(true)
    local out = C.igShowAboutWindow(i1)
    return out
end
M.PushClipRect = M.PushClipRect  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igPushClipRect(i1, i2, i3)
    return out
end
M.ShowStyleSelector = M.ShowStyleSelector  or function(i1)
    jit.off(true)
    local out = C.igShowStyleSelector(i1)
    return out
end
M.SetAllocatorFunctions = M.SetAllocatorFunctions  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igSetAllocatorFunctions(i1, i2, i3)
    return out
end
M.Separator = M.Separator  or function()
    jit.off(true)
    local out = C.igSeparator()
    return out
end
M.Selectable_Bool = M.Selectable_Bool  or function(i1, i2, i3, i4)
    jit.off(true)
    if i2 == nil then i2 = false end
    if i3 == nil then i3 = 0 end
    if i4 == nil then i4 = M.ImVec2_Float(0, 0) end
    local out = C.igSelectable_Bool(i1, i2, i3, i4)
    return out
end
M.Selectable_BoolPtr = M.Selectable_BoolPtr  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    if i4 == nil then i4 = M.ImVec2_Float(0, 0) end
    local out = C.igSelectable_BoolPtr(i1, i2, i3, i4)
    return out
end
M.SaveIniSettingsToDisk = M.SaveIniSettingsToDisk  or function(i1)
    jit.off(true)
    local out = C.igSaveIniSettingsToDisk(i1)
    return out
end
M.SameLine = M.SameLine  or function(i1, i2)
    jit.off(true)
    if i1 == nil then i1 = 0.0 end
    if i2 == nil then i2 = -1.0 end
    local out = C.igSameLine(i1, i2)
    return out
end
M.ResetMouseDragDelta = M.ResetMouseDragDelta  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    local out = C.igResetMouseDragDelta(i1)
    return out
end
M.StyleColorsLight = M.StyleColorsLight  or function(i1)
    jit.off(true)
    local out = C.igStyleColorsLight(i1)
    return out
end
M.GetWindowHeight = M.GetWindowHeight  or function()
    jit.off(true)
    local out = C.igGetWindowHeight()
    return out
end
M.UpdatePlatformWindows = M.UpdatePlatformWindows  or function()
    jit.off(true)
    local out = C.igUpdatePlatformWindows()
    return out
end
M.SetNextItemOpen = M.SetNextItemOpen  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igSetNextItemOpen(i1, i2)
    return out
end
M.TableSetBgColor = M.TableSetBgColor  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = -1 end
    local out = C.igTableSetBgColor(i1, i2, i3)
    return out
end
M.ShowStackToolWindow = M.ShowStackToolWindow  or function(i1)
    jit.off(true)
    local out = C.igShowStackToolWindow(i1)
    return out
end
M.DestroyContext = M.DestroyContext  or function(i1)
    jit.off(true)
    local out = C.igDestroyContext(i1)
    return out
end
M.InputInt4 = M.InputInt4  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igInputInt4(i1, i2, i3)
    return out
end
M.ColorConvertFloat4ToU32 = M.ColorConvertFloat4ToU32  or function(i1)
    jit.off(true)
    local out = C.igColorConvertFloat4ToU32(i1)
    return out
end
M.GetWindowViewport = M.GetWindowViewport  or function()
    jit.off(true)
    local out = C.igGetWindowViewport()
    return out
end
M.GetWindowDrawList = M.GetWindowDrawList  or function()
    jit.off(true)
    local out = C.igGetWindowDrawList()
    return out
end
M.TableNextRow = M.TableNextRow  or function(i1, i2)
    jit.off(true)
    if i1 == nil then i1 = 0 end
    if i2 == nil then i2 = 0.0 end
    local out = C.igTableNextRow(i1, i2)
    return out
end
M.EndTabItem = M.EndTabItem  or function()
    jit.off(true)
    local out = C.igEndTabItem()
    return out
end
M.SliderScalar = M.SliderScalar  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i7 == nil then i7 = 0 end
    local out = C.igSliderScalar(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.BeginCombo = M.BeginCombo  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igBeginCombo(i1, i2, i3)
    return out
end
M.TableSetColumnEnabled = M.TableSetColumnEnabled  or function(i1, i2)
    jit.off(true)
    local out = C.igTableSetColumnEnabled(i1, i2)
    return out
end
M.Bullet = M.Bullet  or function()
    jit.off(true)
    local out = C.igBullet()
    return out
end
M.StyleColorsDark = M.StyleColorsDark  or function(i1)
    jit.off(true)
    local out = C.igStyleColorsDark(i1)
    return out
end
M.InputInt = M.InputInt  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i3 == nil then i3 = 1 end
    if i4 == nil then i4 = 100 end
    if i5 == nil then i5 = 0 end
    local out = C.igInputInt(i1, i2, i3, i4, i5)
    return out
end
M.SetWindowFontScale = M.SetWindowFontScale  or function(i1)
    jit.off(true)
    local out = C.igSetWindowFontScale(i1)
    return out
end
M.SliderInt = M.SliderInt  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%d" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderInt(i1, i2, i3, i4, i5, i6)
    return out
end
M.GetAllocatorFunctions = M.GetAllocatorFunctions  or function(i1, i2, i3)
    jit.off(true)
    local out = C.igGetAllocatorFunctions(i1, i2, i3)
    return out
end
M.OpenPopup_Str = M.OpenPopup_Str  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igOpenPopup_Str(i1, i2)
    return out
end
M.OpenPopup_ID = M.OpenPopup_ID  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igOpenPopup_ID(i1, i2)
    return out
end
M.GetDrawListSharedData = M.GetDrawListSharedData  or function()
    jit.off(true)
    local out = C.igGetDrawListSharedData()
    return out
end
M.EndChildFrame = M.EndChildFrame  or function()
    jit.off(true)
    local out = C.igEndChildFrame()
    return out
end
M.IsItemActive = M.IsItemActive  or function()
    jit.off(true)
    local out = C.igIsItemActive()
    return out
end
M.End = M.End  or function()
    jit.off(true)
    local out = C.igEnd()
    return out
end
M.DragIntRange2 = M.DragIntRange2  or function(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    jit.off(true)
    if i4 == nil then i4 = 1.0 end
    if i5 == nil then i5 = 0 end
    if i6 == nil then i6 = 0 end
    if i7 == nil then i7 = "%d" end
    if i9 == nil then i9 = 0 end
    local out = C.igDragIntRange2(i1, i2, i3, i4, i5, i6, i7, i8, i9)
    return out
end
M.GetWindowContentRegionMax = M.GetWindowContentRegionMax  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetWindowContentRegionMax(o1)
    return o1[0], out
end
M.Combo_Str_arr = M.Combo_Str_arr  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i5 == nil then i5 = -1 end
    local out = C.igCombo_Str_arr(i1, i2, i3, i4, i5)
    return out
end
M.Combo_Str = M.Combo_Str  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = -1 end
    local out = C.igCombo_Str(i1, i2, i3, i4)
    return out
end
M.Combo_FnBoolPtr = M.Combo_FnBoolPtr  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i6 == nil then i6 = -1 end
    local out = C.igCombo_FnBoolPtr(i1, i2, i3, i4, i5, i6)
    return out
end
M.ColorEdit3 = M.ColorEdit3  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igColorEdit3(i1, i2, i3)
    return out
end
M.EndDisabled = M.EndDisabled  or function()
    jit.off(true)
    local out = C.igEndDisabled()
    return out
end
M.BeginGroup = M.BeginGroup  or function()
    jit.off(true)
    local out = C.igBeginGroup()
    return out
end
M.GetTreeNodeToLabelSpacing = M.GetTreeNodeToLabelSpacing  or function()
    jit.off(true)
    local out = C.igGetTreeNodeToLabelSpacing()
    return out
end
M.CollapsingHeader_TreeNodeFlags = M.CollapsingHeader_TreeNodeFlags  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igCollapsingHeader_TreeNodeFlags(i1, i2)
    return out
end
M.CollapsingHeader_BoolPtr = M.CollapsingHeader_BoolPtr  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igCollapsingHeader_BoolPtr(i1, i2, i3)
    return out
end
M.PopID = M.PopID  or function()
    jit.off(true)
    local out = C.igPopID()
    return out
end
M.BeginTable = M.BeginTable  or function(i1, i2, i3, i4, i5)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    if i4 == nil then i4 = M.ImVec2_Float(0.0, 0.0) end
    if i5 == nil then i5 = 0.0 end
    local out = C.igBeginTable(i1, i2, i3, i4, i5)
    return out
end
M.PopTextWrapPos = M.PopTextWrapPos  or function()
    jit.off(true)
    local out = C.igPopTextWrapPos()
    return out
end
M.GetStyleColorName = M.GetStyleColorName  or function(i1)
    jit.off(true)
    local out = C.igGetStyleColorName(i1)
    return out
end
M.MemAlloc = M.MemAlloc  or function(i1)
    jit.off(true)
    local out = C.igMemAlloc(i1)
    return out
end
M.GetStyle = M.GetStyle  or function()
    jit.off(true)
    local out = C.igGetStyle()
    return out
end
M.BeginPopup = M.BeginPopup  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 0 end
    local out = C.igBeginPopup(i1, i2)
    return out
end
M.BeginDragDropTarget = M.BeginDragDropTarget  or function()
    jit.off(true)
    local out = C.igBeginDragDropTarget()
    return out
end
M.Image = M.Image  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i3 == nil then i3 = M.ImVec2_Float(0, 0) end
    if i4 == nil then i4 = M.ImVec2_Float(1, 1) end
    if i5 == nil then i5 = M.ImVec4_Float(1, 1, 1, 1) end
    if i6 == nil then i6 = M.ImVec4_Float(0, 0, 0, 0) end
    local ptr = ffi.cast("void *", i1)
    M._textures[tostring(ptr)] = i1
    i1 = ptr
    local out = C.igImage(i1, i2, i3, i4, i5, i6)
    return out
end
M.SetTabItemClosed = M.SetTabItemClosed  or function(i1)
    jit.off(true)
    local out = C.igSetTabItemClosed(i1)
    return out
end
M.Button = M.Button  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = M.ImVec2_Float(0, 0) end
    local out = C.igButton(i1, i2)
    return out
end
M.CalcTextSize = M.CalcTextSize  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = false end
    if i4 == nil then i4 = -1.0 end
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igCalcTextSize(o1, i1, i2, i3, i4)
    return o1[0], out
end
M.ColorButton = M.ColorButton  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    if i4 == nil then i4 = M.ImVec2_Float(0, 0) end
    local out = C.igColorButton(i1, i2, i3, i4)
    return out
end
M.GetColumnIndex = M.GetColumnIndex  or function()
    jit.off(true)
    local out = C.igGetColumnIndex()
    return out
end
M.BeginPopupContextItem = M.BeginPopupContextItem  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 1 end
    local out = C.igBeginPopupContextItem(i1, i2)
    return out
end
M.GetItemRectSize = M.GetItemRectSize  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetItemRectSize(o1)
    return o1[0], out
end
M.DragFloat2 = M.DragFloat2  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0.0 end
    if i5 == nil then i5 = 0.0 end
    if i6 == nil then i6 = "%.3f" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragFloat2(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.DragInt = M.DragInt  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = 1.0 end
    if i4 == nil then i4 = 0 end
    if i5 == nil then i5 = 0 end
    if i6 == nil then i6 = "%d" end
    if i7 == nil then i7 = 0 end
    local out = C.igDragInt(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.GetCursorPosY = M.GetCursorPosY  or function()
    jit.off(true)
    local out = C.igGetCursorPosY()
    return out
end
M.BeginMainMenuBar = M.BeginMainMenuBar  or function()
    jit.off(true)
    local out = C.igBeginMainMenuBar()
    return out
end
M.BeginMenu = M.BeginMenu  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = true end
    local out = C.igBeginMenu(i1, i2)
    return out
end
M.ColorPicker3 = M.ColorPicker3  or function(i1, i2, i3)
    jit.off(true)
    if i3 == nil then i3 = 0 end
    local out = C.igColorPicker3(i1, i2, i3)
    return out
end
M.IsKeyDown = M.IsKeyDown  or function(i1)
    jit.off(true)
    local out = C.igIsKeyDown(i1)
    return out
end
M.IsMouseDown = M.IsMouseDown  or function(i1)
    jit.off(true)
    local out = C.igIsMouseDown(i1)
    return out
end
M.LogFinish = M.LogFinish  or function()
    jit.off(true)
    local out = C.igLogFinish()
    return out
end
M.LogButtons = M.LogButtons  or function()
    jit.off(true)
    local out = C.igLogButtons()
    return out
end
M.GetCurrentContext = M.GetCurrentContext  or function()
    jit.off(true)
    local out = C.igGetCurrentContext()
    return out
end
M.GetCursorPosX = M.GetCursorPosX  or function()
    jit.off(true)
    local out = C.igGetCursorPosX()
    return out
end
M.GetWindowWidth = M.GetWindowWidth  or function()
    jit.off(true)
    local out = C.igGetWindowWidth()
    return out
end
M.FindViewportByID = M.FindViewportByID  or function(i1)
    jit.off(true)
    local out = C.igFindViewportByID(i1)
    return out
end
M.GetFontTexUvWhitePixel = M.GetFontTexUvWhitePixel  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetFontTexUvWhitePixel(o1)
    return o1[0], out
end
M.SliderInt3 = M.SliderInt3  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i5 == nil then i5 = "%d" end
    if i6 == nil then i6 = 0 end
    local out = C.igSliderInt3(i1, i2, i3, i4, i5, i6)
    return out
end
M.EndGroup = M.EndGroup  or function()
    jit.off(true)
    local out = C.igEndGroup()
    return out
end
M.IsWindowDocked = M.IsWindowDocked  or function()
    jit.off(true)
    local out = C.igIsWindowDocked()
    return out
end
M.ArrowButton = M.ArrowButton  or function(i1, i2)
    jit.off(true)
    local out = C.igArrowButton(i1, i2)
    return out
end
M.BulletText = M.BulletText  or function(i1, ...)
    jit.off(true)
    local out = C.igBulletText(i1, ...)
    return out
end
M.GetStyleColorVec4 = M.GetStyleColorVec4  or function(i1)
    jit.off(true)
    local out = C.igGetStyleColorVec4(i1)
    return out
end
M.GetCursorPos = M.GetCursorPos  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetCursorPos(o1)
    return o1[0], out
end
M.LogToClipboard = M.LogToClipboard  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = -1 end
    local out = C.igLogToClipboard(i1)
    return out
end
M.BeginPopupContextWindow = M.BeginPopupContextWindow  or function(i1, i2)
    jit.off(true)
    if i2 == nil then i2 = 1 end
    local out = C.igBeginPopupContextWindow(i1, i2)
    return out
end
M.Dummy = M.Dummy  or function(i1)
    jit.off(true)
    local out = C.igDummy(i1)
    return out
end
M.MenuItem_Bool = M.MenuItem_Bool  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = false end
    if i4 == nil then i4 = true end
    local out = C.igMenuItem_Bool(i1, i2, i3, i4)
    return out
end
M.MenuItem_BoolPtr = M.MenuItem_BoolPtr  or function(i1, i2, i3, i4)
    jit.off(true)
    if i4 == nil then i4 = true end
    local out = C.igMenuItem_BoolPtr(i1, i2, i3, i4)
    return out
end
M.CaptureMouseFromApp = M.CaptureMouseFromApp  or function(i1)
    jit.off(true)
    if i1 == nil then i1 = true end
    local out = C.igCaptureMouseFromApp(i1)
    return out
end
M.ImageButton = M.ImageButton  or function(i1, i2, i3, i4, i5, i6, i7)
    jit.off(true)
    if i3 == nil then i3 = M.ImVec2_Float(0, 0) end
    if i4 == nil then i4 = M.ImVec2_Float(1, 1) end
    if i5 == nil then i5 = -1 end
    if i6 == nil then i6 = M.ImVec4_Float(0, 0, 0, 0) end
    if i7 == nil then i7 = M.ImVec4_Float(1, 1, 1, 1) end
    local ptr = ffi.cast("void *", i1)
    M._textures[tostring(ptr)] = i1
    i1 = ptr
    local out = C.igImageButton(i1, i2, i3, i4, i5, i6, i7)
    return out
end
M.PushFont = M.PushFont  or function(i1)
    jit.off(true)
    local out = C.igPushFont(i1)
    return out
end
M.InputText = M.InputText  or function(i1, i2, i3, i4, i5, i6)
    jit.off(true)
    if i4 == nil then i4 = 0 end
    local out = C.igInputText(i1, i2, i3, i4, i5, i6)
    return out
end
M.IsWindowAppearing = M.IsWindowAppearing  or function()
    jit.off(true)
    local out = C.igIsWindowAppearing()
    return out
end
M.GetScrollMaxX = M.GetScrollMaxX  or function()
    jit.off(true)
    local out = C.igGetScrollMaxX()
    return out
end
M.SetTooltip = M.SetTooltip  or function(i1, ...)
    jit.off(true)
    local out = C.igSetTooltip(i1, ...)
    return out
end
M.GetContentRegionAvail = M.GetContentRegionAvail  or function()
    jit.off(true)
    local o1 = ffi.new("ImVec2[1]")
    local out = C.igGetContentRegionAvail(o1)
    return o1[0], out
end
M.InputFloat3 = M.InputFloat3  or function(i1, i2, i3, i4)
    jit.off(true)
    if i3 == nil then i3 = "%.3f" end
    if i4 == nil then i4 = 0 end
    local out = C.igInputFloat3(i1, i2, i3, i4)
    return out
end
M.PopAllowKeyboardFocus = M.PopAllowKeyboardFocus  or function()
    jit.off(true)
    local out = C.igPopAllowKeyboardFocus()
    return out
end