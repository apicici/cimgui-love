require("ffi").cdef[[
typedef struct ImFontAtlasCustomRect ImFontAtlasCustomRect;
typedef struct ImDrawCmdHeader ImDrawCmdHeader;
typedef struct ImGuiStoragePair ImGuiStoragePair;
typedef struct ImGuiTextRange ImGuiTextRange;
typedef struct ImVec4 ImVec4;
typedef struct ImVec2 ImVec2;
typedef struct ImGuiWindowClass ImGuiWindowClass;
typedef struct ImGuiViewport ImGuiViewport;
typedef struct ImGuiTextFilter ImGuiTextFilter;
typedef struct ImGuiTextBuffer ImGuiTextBuffer;
typedef struct ImGuiTableColumnSortSpecs ImGuiTableColumnSortSpecs;
typedef struct ImGuiTableSortSpecs ImGuiTableSortSpecs;
typedef struct ImGuiStyle ImGuiStyle;
typedef struct ImGuiStorage ImGuiStorage;
typedef struct ImGuiSizeCallbackData ImGuiSizeCallbackData;
typedef struct ImGuiPlatformImeData ImGuiPlatformImeData;
typedef struct ImGuiPlatformMonitor ImGuiPlatformMonitor;
typedef struct ImGuiPlatformIO ImGuiPlatformIO;
typedef struct ImGuiPayload ImGuiPayload;
typedef struct ImGuiOnceUponAFrame ImGuiOnceUponAFrame;
typedef struct ImGuiListClipper ImGuiListClipper;
typedef struct ImGuiKeyData ImGuiKeyData;
typedef struct ImGuiInputTextCallbackData ImGuiInputTextCallbackData;
typedef struct ImGuiIO ImGuiIO;
typedef struct ImGuiContext ImGuiContext;
typedef struct ImColor ImColor;
typedef struct ImFontGlyphRangesBuilder ImFontGlyphRangesBuilder;
typedef struct ImFontGlyph ImFontGlyph;
typedef struct ImFontConfig ImFontConfig;
typedef struct ImFontBuilderIO ImFontBuilderIO;
typedef struct ImFontAtlas ImFontAtlas;
typedef struct ImFont ImFont;
typedef struct ImDrawVert ImDrawVert;
typedef struct ImDrawListSplitter ImDrawListSplitter;
typedef struct ImDrawListSharedData ImDrawListSharedData;
typedef struct ImDrawList ImDrawList;
typedef struct ImDrawData ImDrawData;
typedef struct ImDrawCmd ImDrawCmd;
typedef struct ImDrawChannel ImDrawChannel;
struct ImDrawChannel;
struct ImDrawCmd;
struct ImDrawData;
struct ImDrawList;
struct ImDrawListSharedData;
struct ImDrawListSplitter;
struct ImDrawVert;
struct ImFont;
struct ImFontAtlas;
struct ImFontBuilderIO;
struct ImFontConfig;
struct ImFontGlyph;
struct ImFontGlyphRangesBuilder;
struct ImColor;
struct ImGuiContext;
struct ImGuiIO;
struct ImGuiInputTextCallbackData;
struct ImGuiKeyData;
struct ImGuiListClipper;
struct ImGuiOnceUponAFrame;
struct ImGuiPayload;
struct ImGuiPlatformIO;
struct ImGuiPlatformMonitor;
struct ImGuiPlatformImeData;
struct ImGuiSizeCallbackData;
struct ImGuiStorage;
struct ImGuiStyle;
struct ImGuiTableSortSpecs;
struct ImGuiTableColumnSortSpecs;
struct ImGuiTextBuffer;
struct ImGuiTextFilter;
struct ImGuiViewport;
struct ImGuiWindowClass;
typedef int ImGuiCol;
typedef int ImGuiCond;
typedef int ImGuiDataType;
typedef int ImGuiDir;
typedef int ImGuiKey;
typedef int ImGuiNavInput;
typedef int ImGuiMouseButton;
typedef int ImGuiMouseCursor;
typedef int ImGuiSortDirection;
typedef int ImGuiStyleVar;
typedef int ImGuiTableBgTarget;
typedef int ImDrawFlags;
typedef int ImDrawListFlags;
typedef int ImFontAtlasFlags;
typedef int ImGuiBackendFlags;
typedef int ImGuiButtonFlags;
typedef int ImGuiColorEditFlags;
typedef int ImGuiConfigFlags;
typedef int ImGuiComboFlags;
typedef int ImGuiDockNodeFlags;
typedef int ImGuiDragDropFlags;
typedef int ImGuiFocusedFlags;
typedef int ImGuiHoveredFlags;
typedef int ImGuiInputTextFlags;
typedef int ImGuiKeyModFlags;
typedef int ImGuiPopupFlags;
typedef int ImGuiSelectableFlags;
typedef int ImGuiSliderFlags;
typedef int ImGuiTabBarFlags;
typedef int ImGuiTabItemFlags;
typedef int ImGuiTableFlags;
typedef int ImGuiTableColumnFlags;
typedef int ImGuiTableRowFlags;
typedef int ImGuiTreeNodeFlags;
typedef int ImGuiViewportFlags;
typedef int ImGuiWindowFlags;
typedef void* ImTextureID;
typedef unsigned short ImDrawIdx;
typedef unsigned int ImGuiID;
typedef signed char ImS8;
typedef unsigned char ImU8;
typedef signed short ImS16;
typedef unsigned short ImU16;
typedef signed int ImS32;
typedef unsigned int ImU32;
typedef signed long long ImS64;
typedef unsigned long long ImU64;
typedef unsigned short ImWchar16;
typedef unsigned int ImWchar32;
typedef ImWchar16 ImWchar;
typedef int (*ImGuiInputTextCallback)(ImGuiInputTextCallbackData* data);
typedef void (*ImGuiSizeCallback)(ImGuiSizeCallbackData* data);
typedef void* (*ImGuiMemAllocFunc)(size_t sz, void* user_data);
typedef void (*ImGuiMemFreeFunc)(void* ptr, void* user_data);
typedef void (*ImDrawCallback)(const ImDrawList* parent_list, const ImDrawCmd* cmd);
typedef struct ImVector{int Size;int Capacity;void* Data;} ImVector;
typedef struct ImVector_ImDrawChannel {int Size;int Capacity;ImDrawChannel* Data;} ImVector_ImDrawChannel;
typedef struct ImVector_ImDrawCmd {int Size;int Capacity;ImDrawCmd* Data;} ImVector_ImDrawCmd;
typedef struct ImVector_ImDrawIdx {int Size;int Capacity;ImDrawIdx* Data;} ImVector_ImDrawIdx;
typedef struct ImVector_ImDrawVert {int Size;int Capacity;ImDrawVert* Data;} ImVector_ImDrawVert;
typedef struct ImVector_ImFontPtr {int Size;int Capacity;ImFont** Data;} ImVector_ImFontPtr;
typedef struct ImVector_ImFontAtlasCustomRect {int Size;int Capacity;ImFontAtlasCustomRect* Data;} ImVector_ImFontAtlasCustomRect;
typedef struct ImVector_ImFontConfig {int Size;int Capacity;ImFontConfig* Data;} ImVector_ImFontConfig;
typedef struct ImVector_ImFontGlyph {int Size;int Capacity;ImFontGlyph* Data;} ImVector_ImFontGlyph;
typedef struct ImVector_ImGuiPlatformMonitor {int Size;int Capacity;ImGuiPlatformMonitor* Data;} ImVector_ImGuiPlatformMonitor;
typedef struct ImVector_ImGuiStoragePair {int Size;int Capacity;ImGuiStoragePair* Data;} ImVector_ImGuiStoragePair;
typedef struct ImVector_ImGuiTextRange {int Size;int Capacity;ImGuiTextRange* Data;} ImVector_ImGuiTextRange;
typedef struct ImVector_ImGuiViewportPtr {int Size;int Capacity;ImGuiViewport** Data;} ImVector_ImGuiViewportPtr;
typedef struct ImVector_ImTextureID {int Size;int Capacity;ImTextureID* Data;} ImVector_ImTextureID;
typedef struct ImVector_ImU32 {int Size;int Capacity;ImU32* Data;} ImVector_ImU32;
typedef struct ImVector_ImVec2 {int Size;int Capacity;ImVec2* Data;} ImVector_ImVec2;
typedef struct ImVector_ImVec4 {int Size;int Capacity;ImVec4* Data;} ImVector_ImVec4;
typedef struct ImVector_ImWchar {int Size;int Capacity;ImWchar* Data;} ImVector_ImWchar;
typedef struct ImVector_char {int Size;int Capacity;char* Data;} ImVector_char;
typedef struct ImVector_float {int Size;int Capacity;float* Data;} ImVector_float;
struct ImVec2
{
    float x, y;
};
struct ImVec4
{
    float x, y, z, w;
};
typedef enum {
    ImGuiWindowFlags_None = 0,
    ImGuiWindowFlags_NoTitleBar = 1 << 0,
    ImGuiWindowFlags_NoResize = 1 << 1,
    ImGuiWindowFlags_NoMove = 1 << 2,
    ImGuiWindowFlags_NoScrollbar = 1 << 3,
    ImGuiWindowFlags_NoScrollWithMouse = 1 << 4,
    ImGuiWindowFlags_NoCollapse = 1 << 5,
    ImGuiWindowFlags_AlwaysAutoResize = 1 << 6,
    ImGuiWindowFlags_NoBackground = 1 << 7,
    ImGuiWindowFlags_NoSavedSettings = 1 << 8,
    ImGuiWindowFlags_NoMouseInputs = 1 << 9,
    ImGuiWindowFlags_MenuBar = 1 << 10,
    ImGuiWindowFlags_HorizontalScrollbar = 1 << 11,
    ImGuiWindowFlags_NoFocusOnAppearing = 1 << 12,
    ImGuiWindowFlags_NoBringToFrontOnFocus = 1 << 13,
    ImGuiWindowFlags_AlwaysVerticalScrollbar= 1 << 14,
    ImGuiWindowFlags_AlwaysHorizontalScrollbar=1<< 15,
    ImGuiWindowFlags_AlwaysUseWindowPadding = 1 << 16,
    ImGuiWindowFlags_NoNavInputs = 1 << 18,
    ImGuiWindowFlags_NoNavFocus = 1 << 19,
    ImGuiWindowFlags_UnsavedDocument = 1 << 20,
    ImGuiWindowFlags_NoDocking = 1 << 21,
    ImGuiWindowFlags_NoNav = ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
    ImGuiWindowFlags_NoDecoration = ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse,
    ImGuiWindowFlags_NoInputs = ImGuiWindowFlags_NoMouseInputs | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus,
    ImGuiWindowFlags_NavFlattened = 1 << 23,
    ImGuiWindowFlags_ChildWindow = 1 << 24,
    ImGuiWindowFlags_Tooltip = 1 << 25,
    ImGuiWindowFlags_Popup = 1 << 26,
    ImGuiWindowFlags_Modal = 1 << 27,
    ImGuiWindowFlags_ChildMenu = 1 << 28,
    ImGuiWindowFlags_DockNodeHost = 1 << 29
}ImGuiWindowFlags_;
typedef enum {
    ImGuiInputTextFlags_None = 0,
    ImGuiInputTextFlags_CharsDecimal = 1 << 0,
    ImGuiInputTextFlags_CharsHexadecimal = 1 << 1,
    ImGuiInputTextFlags_CharsUppercase = 1 << 2,
    ImGuiInputTextFlags_CharsNoBlank = 1 << 3,
    ImGuiInputTextFlags_AutoSelectAll = 1 << 4,
    ImGuiInputTextFlags_EnterReturnsTrue = 1 << 5,
    ImGuiInputTextFlags_CallbackCompletion = 1 << 6,
    ImGuiInputTextFlags_CallbackHistory = 1 << 7,
    ImGuiInputTextFlags_CallbackAlways = 1 << 8,
    ImGuiInputTextFlags_CallbackCharFilter = 1 << 9,
    ImGuiInputTextFlags_AllowTabInput = 1 << 10,
    ImGuiInputTextFlags_CtrlEnterForNewLine = 1 << 11,
    ImGuiInputTextFlags_NoHorizontalScroll = 1 << 12,
    ImGuiInputTextFlags_AlwaysOverwrite = 1 << 13,
    ImGuiInputTextFlags_ReadOnly = 1 << 14,
    ImGuiInputTextFlags_Password = 1 << 15,
    ImGuiInputTextFlags_NoUndoRedo = 1 << 16,
    ImGuiInputTextFlags_CharsScientific = 1 << 17,
    ImGuiInputTextFlags_CallbackResize = 1 << 18,
    ImGuiInputTextFlags_CallbackEdit = 1 << 19
}ImGuiInputTextFlags_;
typedef enum {
    ImGuiTreeNodeFlags_None = 0,
    ImGuiTreeNodeFlags_Selected = 1 << 0,
    ImGuiTreeNodeFlags_Framed = 1 << 1,
    ImGuiTreeNodeFlags_AllowItemOverlap = 1 << 2,
    ImGuiTreeNodeFlags_NoTreePushOnOpen = 1 << 3,
    ImGuiTreeNodeFlags_NoAutoOpenOnLog = 1 << 4,
    ImGuiTreeNodeFlags_DefaultOpen = 1 << 5,
    ImGuiTreeNodeFlags_OpenOnDoubleClick = 1 << 6,
    ImGuiTreeNodeFlags_OpenOnArrow = 1 << 7,
    ImGuiTreeNodeFlags_Leaf = 1 << 8,
    ImGuiTreeNodeFlags_Bullet = 1 << 9,
    ImGuiTreeNodeFlags_FramePadding = 1 << 10,
    ImGuiTreeNodeFlags_SpanAvailWidth = 1 << 11,
    ImGuiTreeNodeFlags_SpanFullWidth = 1 << 12,
    ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 << 13,
    ImGuiTreeNodeFlags_CollapsingHeader = ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen | ImGuiTreeNodeFlags_NoAutoOpenOnLog
}ImGuiTreeNodeFlags_;
typedef enum {
    ImGuiPopupFlags_None = 0,
    ImGuiPopupFlags_MouseButtonLeft = 0,
    ImGuiPopupFlags_MouseButtonRight = 1,
    ImGuiPopupFlags_MouseButtonMiddle = 2,
    ImGuiPopupFlags_MouseButtonMask_ = 0x1F,
    ImGuiPopupFlags_MouseButtonDefault_ = 1,
    ImGuiPopupFlags_NoOpenOverExistingPopup = 1 << 5,
    ImGuiPopupFlags_NoOpenOverItems = 1 << 6,
    ImGuiPopupFlags_AnyPopupId = 1 << 7,
    ImGuiPopupFlags_AnyPopupLevel = 1 << 8,
    ImGuiPopupFlags_AnyPopup = ImGuiPopupFlags_AnyPopupId | ImGuiPopupFlags_AnyPopupLevel
}ImGuiPopupFlags_;
typedef enum {
    ImGuiSelectableFlags_None = 0,
    ImGuiSelectableFlags_DontClosePopups = 1 << 0,
    ImGuiSelectableFlags_SpanAllColumns = 1 << 1,
    ImGuiSelectableFlags_AllowDoubleClick = 1 << 2,
    ImGuiSelectableFlags_Disabled = 1 << 3,
    ImGuiSelectableFlags_AllowItemOverlap = 1 << 4
}ImGuiSelectableFlags_;
typedef enum {
    ImGuiComboFlags_None = 0,
    ImGuiComboFlags_PopupAlignLeft = 1 << 0,
    ImGuiComboFlags_HeightSmall = 1 << 1,
    ImGuiComboFlags_HeightRegular = 1 << 2,
    ImGuiComboFlags_HeightLarge = 1 << 3,
    ImGuiComboFlags_HeightLargest = 1 << 4,
    ImGuiComboFlags_NoArrowButton = 1 << 5,
    ImGuiComboFlags_NoPreview = 1 << 6,
    ImGuiComboFlags_HeightMask_ = ImGuiComboFlags_HeightSmall | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge | ImGuiComboFlags_HeightLargest
}ImGuiComboFlags_;
typedef enum {
    ImGuiTabBarFlags_None = 0,
    ImGuiTabBarFlags_Reorderable = 1 << 0,
    ImGuiTabBarFlags_AutoSelectNewTabs = 1 << 1,
    ImGuiTabBarFlags_TabListPopupButton = 1 << 2,
    ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 1 << 3,
    ImGuiTabBarFlags_NoTabListScrollingButtons = 1 << 4,
    ImGuiTabBarFlags_NoTooltip = 1 << 5,
    ImGuiTabBarFlags_FittingPolicyResizeDown = 1 << 6,
    ImGuiTabBarFlags_FittingPolicyScroll = 1 << 7,
    ImGuiTabBarFlags_FittingPolicyMask_ = ImGuiTabBarFlags_FittingPolicyResizeDown | ImGuiTabBarFlags_FittingPolicyScroll,
    ImGuiTabBarFlags_FittingPolicyDefault_ = ImGuiTabBarFlags_FittingPolicyResizeDown
}ImGuiTabBarFlags_;
typedef enum {
    ImGuiTabItemFlags_None = 0,
    ImGuiTabItemFlags_UnsavedDocument = 1 << 0,
    ImGuiTabItemFlags_SetSelected = 1 << 1,
    ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 1 << 2,
    ImGuiTabItemFlags_NoPushId = 1 << 3,
    ImGuiTabItemFlags_NoTooltip = 1 << 4,
    ImGuiTabItemFlags_NoReorder = 1 << 5,
    ImGuiTabItemFlags_Leading = 1 << 6,
    ImGuiTabItemFlags_Trailing = 1 << 7
}ImGuiTabItemFlags_;
typedef enum {
    ImGuiTableFlags_None = 0,
    ImGuiTableFlags_Resizable = 1 << 0,
    ImGuiTableFlags_Reorderable = 1 << 1,
    ImGuiTableFlags_Hideable = 1 << 2,
    ImGuiTableFlags_Sortable = 1 << 3,
    ImGuiTableFlags_NoSavedSettings = 1 << 4,
    ImGuiTableFlags_ContextMenuInBody = 1 << 5,
    ImGuiTableFlags_RowBg = 1 << 6,
    ImGuiTableFlags_BordersInnerH = 1 << 7,
    ImGuiTableFlags_BordersOuterH = 1 << 8,
    ImGuiTableFlags_BordersInnerV = 1 << 9,
    ImGuiTableFlags_BordersOuterV = 1 << 10,
    ImGuiTableFlags_BordersH = ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH,
    ImGuiTableFlags_BordersV = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersOuterV,
    ImGuiTableFlags_BordersInner = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH,
    ImGuiTableFlags_BordersOuter = ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH,
    ImGuiTableFlags_Borders = ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter,
    ImGuiTableFlags_NoBordersInBody = 1 << 11,
    ImGuiTableFlags_NoBordersInBodyUntilResize = 1 << 12,
    ImGuiTableFlags_SizingFixedFit = 1 << 13,
    ImGuiTableFlags_SizingFixedSame = 2 << 13,
    ImGuiTableFlags_SizingStretchProp = 3 << 13,
    ImGuiTableFlags_SizingStretchSame = 4 << 13,
    ImGuiTableFlags_NoHostExtendX = 1 << 16,
    ImGuiTableFlags_NoHostExtendY = 1 << 17,
    ImGuiTableFlags_NoKeepColumnsVisible = 1 << 18,
    ImGuiTableFlags_PreciseWidths = 1 << 19,
    ImGuiTableFlags_NoClip = 1 << 20,
    ImGuiTableFlags_PadOuterX = 1 << 21,
    ImGuiTableFlags_NoPadOuterX = 1 << 22,
    ImGuiTableFlags_NoPadInnerX = 1 << 23,
    ImGuiTableFlags_ScrollX = 1 << 24,
    ImGuiTableFlags_ScrollY = 1 << 25,
    ImGuiTableFlags_SortMulti = 1 << 26,
    ImGuiTableFlags_SortTristate = 1 << 27,
    ImGuiTableFlags_SizingMask_ = ImGuiTableFlags_SizingFixedFit | ImGuiTableFlags_SizingFixedSame | ImGuiTableFlags_SizingStretchProp | ImGuiTableFlags_SizingStretchSame
}ImGuiTableFlags_;
typedef enum {
    ImGuiTableColumnFlags_None = 0,
    ImGuiTableColumnFlags_Disabled = 1 << 0,
    ImGuiTableColumnFlags_DefaultHide = 1 << 1,
    ImGuiTableColumnFlags_DefaultSort = 1 << 2,
    ImGuiTableColumnFlags_WidthStretch = 1 << 3,
    ImGuiTableColumnFlags_WidthFixed = 1 << 4,
    ImGuiTableColumnFlags_NoResize = 1 << 5,
    ImGuiTableColumnFlags_NoReorder = 1 << 6,
    ImGuiTableColumnFlags_NoHide = 1 << 7,
    ImGuiTableColumnFlags_NoClip = 1 << 8,
    ImGuiTableColumnFlags_NoSort = 1 << 9,
    ImGuiTableColumnFlags_NoSortAscending = 1 << 10,
    ImGuiTableColumnFlags_NoSortDescending = 1 << 11,
    ImGuiTableColumnFlags_NoHeaderLabel = 1 << 12,
    ImGuiTableColumnFlags_NoHeaderWidth = 1 << 13,
    ImGuiTableColumnFlags_PreferSortAscending = 1 << 14,
    ImGuiTableColumnFlags_PreferSortDescending = 1 << 15,
    ImGuiTableColumnFlags_IndentEnable = 1 << 16,
    ImGuiTableColumnFlags_IndentDisable = 1 << 17,
    ImGuiTableColumnFlags_IsEnabled = 1 << 24,
    ImGuiTableColumnFlags_IsVisible = 1 << 25,
    ImGuiTableColumnFlags_IsSorted = 1 << 26,
    ImGuiTableColumnFlags_IsHovered = 1 << 27,
    ImGuiTableColumnFlags_WidthMask_ = ImGuiTableColumnFlags_WidthStretch | ImGuiTableColumnFlags_WidthFixed,
    ImGuiTableColumnFlags_IndentMask_ = ImGuiTableColumnFlags_IndentEnable | ImGuiTableColumnFlags_IndentDisable,
    ImGuiTableColumnFlags_StatusMask_ = ImGuiTableColumnFlags_IsEnabled | ImGuiTableColumnFlags_IsVisible | ImGuiTableColumnFlags_IsSorted | ImGuiTableColumnFlags_IsHovered,
    ImGuiTableColumnFlags_NoDirectResize_ = 1 << 30
}ImGuiTableColumnFlags_;
typedef enum {
    ImGuiTableRowFlags_None = 0,
    ImGuiTableRowFlags_Headers = 1 << 0
}ImGuiTableRowFlags_;
typedef enum {
    ImGuiTableBgTarget_None = 0,
    ImGuiTableBgTarget_RowBg0 = 1,
    ImGuiTableBgTarget_RowBg1 = 2,
    ImGuiTableBgTarget_CellBg = 3
}ImGuiTableBgTarget_;
typedef enum {
    ImGuiFocusedFlags_None = 0,
    ImGuiFocusedFlags_ChildWindows = 1 << 0,
    ImGuiFocusedFlags_RootWindow = 1 << 1,
    ImGuiFocusedFlags_AnyWindow = 1 << 2,
    ImGuiFocusedFlags_NoPopupHierarchy = 1 << 3,
    ImGuiFocusedFlags_DockHierarchy = 1 << 4,
    ImGuiFocusedFlags_RootAndChildWindows = ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows
}ImGuiFocusedFlags_;
typedef enum {
    ImGuiHoveredFlags_None = 0,
    ImGuiHoveredFlags_ChildWindows = 1 << 0,
    ImGuiHoveredFlags_RootWindow = 1 << 1,
    ImGuiHoveredFlags_AnyWindow = 1 << 2,
    ImGuiHoveredFlags_NoPopupHierarchy = 1 << 3,
    ImGuiHoveredFlags_DockHierarchy = 1 << 4,
    ImGuiHoveredFlags_AllowWhenBlockedByPopup = 1 << 5,
    ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 1 << 7,
    ImGuiHoveredFlags_AllowWhenOverlapped = 1 << 8,
    ImGuiHoveredFlags_AllowWhenDisabled = 1 << 9,
    ImGuiHoveredFlags_RectOnly = ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped,
    ImGuiHoveredFlags_RootAndChildWindows = ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows
}ImGuiHoveredFlags_;
typedef enum {
    ImGuiDockNodeFlags_None = 0,
    ImGuiDockNodeFlags_KeepAliveOnly = 1 << 0,
    ImGuiDockNodeFlags_NoDockingInCentralNode = 1 << 2,
    ImGuiDockNodeFlags_PassthruCentralNode = 1 << 3,
    ImGuiDockNodeFlags_NoSplit = 1 << 4,
    ImGuiDockNodeFlags_NoResize = 1 << 5,
    ImGuiDockNodeFlags_AutoHideTabBar = 1 << 6
}ImGuiDockNodeFlags_;
typedef enum {
    ImGuiDragDropFlags_None = 0,
    ImGuiDragDropFlags_SourceNoPreviewTooltip = 1 << 0,
    ImGuiDragDropFlags_SourceNoDisableHover = 1 << 1,
    ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 1 << 2,
    ImGuiDragDropFlags_SourceAllowNullID = 1 << 3,
    ImGuiDragDropFlags_SourceExtern = 1 << 4,
    ImGuiDragDropFlags_SourceAutoExpirePayload = 1 << 5,
    ImGuiDragDropFlags_AcceptBeforeDelivery = 1 << 10,
    ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 1 << 11,
    ImGuiDragDropFlags_AcceptNoPreviewTooltip = 1 << 12,
    ImGuiDragDropFlags_AcceptPeekOnly = ImGuiDragDropFlags_AcceptBeforeDelivery | ImGuiDragDropFlags_AcceptNoDrawDefaultRect
}ImGuiDragDropFlags_;
typedef enum {
    ImGuiDataType_S8,
    ImGuiDataType_U8,
    ImGuiDataType_S16,
    ImGuiDataType_U16,
    ImGuiDataType_S32,
    ImGuiDataType_U32,
    ImGuiDataType_S64,
    ImGuiDataType_U64,
    ImGuiDataType_Float,
    ImGuiDataType_Double,
    ImGuiDataType_COUNT
}ImGuiDataType_;
typedef enum {
    ImGuiDir_None = -1,
    ImGuiDir_Left = 0,
    ImGuiDir_Right = 1,
    ImGuiDir_Up = 2,
    ImGuiDir_Down = 3,
    ImGuiDir_COUNT
}ImGuiDir_;
typedef enum {
    ImGuiSortDirection_None = 0,
    ImGuiSortDirection_Ascending = 1,
    ImGuiSortDirection_Descending = 2
}ImGuiSortDirection_;
typedef enum {
    ImGuiKey_None = 0,
    ImGuiKey_Tab = 512,
    ImGuiKey_LeftArrow,
    ImGuiKey_RightArrow,
    ImGuiKey_UpArrow,
    ImGuiKey_DownArrow,
    ImGuiKey_PageUp,
    ImGuiKey_PageDown,
    ImGuiKey_Home,
    ImGuiKey_End,
    ImGuiKey_Insert,
    ImGuiKey_Delete,
    ImGuiKey_Backspace,
    ImGuiKey_Space,
    ImGuiKey_Enter,
    ImGuiKey_Escape,
    ImGuiKey_LeftCtrl, ImGuiKey_LeftShift, ImGuiKey_LeftAlt, ImGuiKey_LeftSuper,
    ImGuiKey_RightCtrl, ImGuiKey_RightShift, ImGuiKey_RightAlt, ImGuiKey_RightSuper,
    ImGuiKey_Menu,
    ImGuiKey_0, ImGuiKey_1, ImGuiKey_2, ImGuiKey_3, ImGuiKey_4, ImGuiKey_5, ImGuiKey_6, ImGuiKey_7, ImGuiKey_8, ImGuiKey_9,
    ImGuiKey_A, ImGuiKey_B, ImGuiKey_C, ImGuiKey_D, ImGuiKey_E, ImGuiKey_F, ImGuiKey_G, ImGuiKey_H, ImGuiKey_I, ImGuiKey_J,
    ImGuiKey_K, ImGuiKey_L, ImGuiKey_M, ImGuiKey_N, ImGuiKey_O, ImGuiKey_P, ImGuiKey_Q, ImGuiKey_R, ImGuiKey_S, ImGuiKey_T,
    ImGuiKey_U, ImGuiKey_V, ImGuiKey_W, ImGuiKey_X, ImGuiKey_Y, ImGuiKey_Z,
    ImGuiKey_F1, ImGuiKey_F2, ImGuiKey_F3, ImGuiKey_F4, ImGuiKey_F5, ImGuiKey_F6,
    ImGuiKey_F7, ImGuiKey_F8, ImGuiKey_F9, ImGuiKey_F10, ImGuiKey_F11, ImGuiKey_F12,
    ImGuiKey_Apostrophe,
    ImGuiKey_Comma,
    ImGuiKey_Minus,
    ImGuiKey_Period,
    ImGuiKey_Slash,
    ImGuiKey_Semicolon,
    ImGuiKey_Equal,
    ImGuiKey_LeftBracket,
    ImGuiKey_Backslash,
    ImGuiKey_RightBracket,
    ImGuiKey_GraveAccent,
    ImGuiKey_CapsLock,
    ImGuiKey_ScrollLock,
    ImGuiKey_NumLock,
    ImGuiKey_PrintScreen,
    ImGuiKey_Pause,
    ImGuiKey_Keypad0, ImGuiKey_Keypad1, ImGuiKey_Keypad2, ImGuiKey_Keypad3, ImGuiKey_Keypad4,
    ImGuiKey_Keypad5, ImGuiKey_Keypad6, ImGuiKey_Keypad7, ImGuiKey_Keypad8, ImGuiKey_Keypad9,
    ImGuiKey_KeypadDecimal,
    ImGuiKey_KeypadDivide,
    ImGuiKey_KeypadMultiply,
    ImGuiKey_KeypadSubtract,
    ImGuiKey_KeypadAdd,
    ImGuiKey_KeypadEnter,
    ImGuiKey_KeypadEqual,
    ImGuiKey_GamepadStart,
    ImGuiKey_GamepadBack,
    ImGuiKey_GamepadFaceUp,
    ImGuiKey_GamepadFaceDown,
    ImGuiKey_GamepadFaceLeft,
    ImGuiKey_GamepadFaceRight,
    ImGuiKey_GamepadDpadUp,
    ImGuiKey_GamepadDpadDown,
    ImGuiKey_GamepadDpadLeft,
    ImGuiKey_GamepadDpadRight,
    ImGuiKey_GamepadL1,
    ImGuiKey_GamepadR1,
    ImGuiKey_GamepadL2,
    ImGuiKey_GamepadR2,
    ImGuiKey_GamepadL3,
    ImGuiKey_GamepadR3,
    ImGuiKey_GamepadLStickUp,
    ImGuiKey_GamepadLStickDown,
    ImGuiKey_GamepadLStickLeft,
    ImGuiKey_GamepadLStickRight,
    ImGuiKey_GamepadRStickUp,
    ImGuiKey_GamepadRStickDown,
    ImGuiKey_GamepadRStickLeft,
    ImGuiKey_GamepadRStickRight,
    ImGuiKey_COUNT,
    ImGuiKey_LegacyNativeKey_BEGIN = 0,
    ImGuiKey_LegacyNativeKey_END = 512,
    ImGuiKey_NamedKey_BEGIN = 512,
    ImGuiKey_NamedKey_END = ImGuiKey_COUNT,
    ImGuiKey_NamedKey_COUNT = ImGuiKey_NamedKey_END - ImGuiKey_NamedKey_BEGIN,
    ImGuiKey_KeysData_SIZE = ImGuiKey_COUNT,
    ImGuiKey_KeysData_OFFSET = ImGuiKey_LegacyNativeKey_BEGIN,
    ImGuiKey_Gamepad_BEGIN = ImGuiKey_GamepadStart,
    ImGuiKey_Gamepad_END = ImGuiKey_GamepadRStickRight + 1
}ImGuiKey_;
typedef enum {
    ImGuiKeyModFlags_None = 0,
    ImGuiKeyModFlags_Ctrl = 1 << 0,
    ImGuiKeyModFlags_Shift = 1 << 1,
    ImGuiKeyModFlags_Alt = 1 << 2,
    ImGuiKeyModFlags_Super = 1 << 3
}ImGuiKeyModFlags_;
typedef enum {
    ImGuiNavInput_Activate,
    ImGuiNavInput_Cancel,
    ImGuiNavInput_Input,
    ImGuiNavInput_Menu,
    ImGuiNavInput_DpadLeft,
    ImGuiNavInput_DpadRight,
    ImGuiNavInput_DpadUp,
    ImGuiNavInput_DpadDown,
    ImGuiNavInput_LStickLeft,
    ImGuiNavInput_LStickRight,
    ImGuiNavInput_LStickUp,
    ImGuiNavInput_LStickDown,
    ImGuiNavInput_FocusPrev,
    ImGuiNavInput_FocusNext,
    ImGuiNavInput_TweakSlow,
    ImGuiNavInput_TweakFast,
    ImGuiNavInput_KeyLeft_,
    ImGuiNavInput_KeyRight_,
    ImGuiNavInput_KeyUp_,
    ImGuiNavInput_KeyDown_,
    ImGuiNavInput_COUNT
}ImGuiNavInput_;
typedef enum {
    ImGuiConfigFlags_None = 0,
    ImGuiConfigFlags_NavEnableKeyboard = 1 << 0,
    ImGuiConfigFlags_NavEnableGamepad = 1 << 1,
    ImGuiConfigFlags_NavEnableSetMousePos = 1 << 2,
    ImGuiConfigFlags_NavNoCaptureKeyboard = 1 << 3,
    ImGuiConfigFlags_NoMouse = 1 << 4,
    ImGuiConfigFlags_NoMouseCursorChange = 1 << 5,
    ImGuiConfigFlags_DockingEnable = 1 << 6,
    ImGuiConfigFlags_ViewportsEnable = 1 << 10,
    ImGuiConfigFlags_DpiEnableScaleViewports= 1 << 14,
    ImGuiConfigFlags_DpiEnableScaleFonts = 1 << 15,
    ImGuiConfigFlags_IsSRGB = 1 << 20,
    ImGuiConfigFlags_IsTouchScreen = 1 << 21
}ImGuiConfigFlags_;
typedef enum {
    ImGuiBackendFlags_None = 0,
    ImGuiBackendFlags_HasGamepad = 1 << 0,
    ImGuiBackendFlags_HasMouseCursors = 1 << 1,
    ImGuiBackendFlags_HasSetMousePos = 1 << 2,
    ImGuiBackendFlags_RendererHasVtxOffset = 1 << 3,
    ImGuiBackendFlags_PlatformHasViewports = 1 << 10,
    ImGuiBackendFlags_HasMouseHoveredViewport=1 << 11,
    ImGuiBackendFlags_RendererHasViewports = 1 << 12
}ImGuiBackendFlags_;
typedef enum {
    ImGuiCol_Text,
    ImGuiCol_TextDisabled,
    ImGuiCol_WindowBg,
    ImGuiCol_ChildBg,
    ImGuiCol_PopupBg,
    ImGuiCol_Border,
    ImGuiCol_BorderShadow,
    ImGuiCol_FrameBg,
    ImGuiCol_FrameBgHovered,
    ImGuiCol_FrameBgActive,
    ImGuiCol_TitleBg,
    ImGuiCol_TitleBgActive,
    ImGuiCol_TitleBgCollapsed,
    ImGuiCol_MenuBarBg,
    ImGuiCol_ScrollbarBg,
    ImGuiCol_ScrollbarGrab,
    ImGuiCol_ScrollbarGrabHovered,
    ImGuiCol_ScrollbarGrabActive,
    ImGuiCol_CheckMark,
    ImGuiCol_SliderGrab,
    ImGuiCol_SliderGrabActive,
    ImGuiCol_Button,
    ImGuiCol_ButtonHovered,
    ImGuiCol_ButtonActive,
    ImGuiCol_Header,
    ImGuiCol_HeaderHovered,
    ImGuiCol_HeaderActive,
    ImGuiCol_Separator,
    ImGuiCol_SeparatorHovered,
    ImGuiCol_SeparatorActive,
    ImGuiCol_ResizeGrip,
    ImGuiCol_ResizeGripHovered,
    ImGuiCol_ResizeGripActive,
    ImGuiCol_Tab,
    ImGuiCol_TabHovered,
    ImGuiCol_TabActive,
    ImGuiCol_TabUnfocused,
    ImGuiCol_TabUnfocusedActive,
    ImGuiCol_DockingPreview,
    ImGuiCol_DockingEmptyBg,
    ImGuiCol_PlotLines,
    ImGuiCol_PlotLinesHovered,
    ImGuiCol_PlotHistogram,
    ImGuiCol_PlotHistogramHovered,
    ImGuiCol_TableHeaderBg,
    ImGuiCol_TableBorderStrong,
    ImGuiCol_TableBorderLight,
    ImGuiCol_TableRowBg,
    ImGuiCol_TableRowBgAlt,
    ImGuiCol_TextSelectedBg,
    ImGuiCol_DragDropTarget,
    ImGuiCol_NavHighlight,
    ImGuiCol_NavWindowingHighlight,
    ImGuiCol_NavWindowingDimBg,
    ImGuiCol_ModalWindowDimBg,
    ImGuiCol_COUNT
}ImGuiCol_;
typedef enum {
    ImGuiStyleVar_Alpha,
    ImGuiStyleVar_DisabledAlpha,
    ImGuiStyleVar_WindowPadding,
    ImGuiStyleVar_WindowRounding,
    ImGuiStyleVar_WindowBorderSize,
    ImGuiStyleVar_WindowMinSize,
    ImGuiStyleVar_WindowTitleAlign,
    ImGuiStyleVar_ChildRounding,
    ImGuiStyleVar_ChildBorderSize,
    ImGuiStyleVar_PopupRounding,
    ImGuiStyleVar_PopupBorderSize,
    ImGuiStyleVar_FramePadding,
    ImGuiStyleVar_FrameRounding,
    ImGuiStyleVar_FrameBorderSize,
    ImGuiStyleVar_ItemSpacing,
    ImGuiStyleVar_ItemInnerSpacing,
    ImGuiStyleVar_IndentSpacing,
    ImGuiStyleVar_CellPadding,
    ImGuiStyleVar_ScrollbarSize,
    ImGuiStyleVar_ScrollbarRounding,
    ImGuiStyleVar_GrabMinSize,
    ImGuiStyleVar_GrabRounding,
    ImGuiStyleVar_TabRounding,
    ImGuiStyleVar_ButtonTextAlign,
    ImGuiStyleVar_SelectableTextAlign,
    ImGuiStyleVar_COUNT
}ImGuiStyleVar_;
typedef enum {
    ImGuiButtonFlags_None = 0,
    ImGuiButtonFlags_MouseButtonLeft = 1 << 0,
    ImGuiButtonFlags_MouseButtonRight = 1 << 1,
    ImGuiButtonFlags_MouseButtonMiddle = 1 << 2,
    ImGuiButtonFlags_MouseButtonMask_ = ImGuiButtonFlags_MouseButtonLeft | ImGuiButtonFlags_MouseButtonRight | ImGuiButtonFlags_MouseButtonMiddle,
    ImGuiButtonFlags_MouseButtonDefault_ = ImGuiButtonFlags_MouseButtonLeft
}ImGuiButtonFlags_;
typedef enum {
    ImGuiColorEditFlags_None = 0,
    ImGuiColorEditFlags_NoAlpha = 1 << 1,
    ImGuiColorEditFlags_NoPicker = 1 << 2,
    ImGuiColorEditFlags_NoOptions = 1 << 3,
    ImGuiColorEditFlags_NoSmallPreview = 1 << 4,
    ImGuiColorEditFlags_NoInputs = 1 << 5,
    ImGuiColorEditFlags_NoTooltip = 1 << 6,
    ImGuiColorEditFlags_NoLabel = 1 << 7,
    ImGuiColorEditFlags_NoSidePreview = 1 << 8,
    ImGuiColorEditFlags_NoDragDrop = 1 << 9,
    ImGuiColorEditFlags_NoBorder = 1 << 10,
    ImGuiColorEditFlags_AlphaBar = 1 << 16,
    ImGuiColorEditFlags_AlphaPreview = 1 << 17,
    ImGuiColorEditFlags_AlphaPreviewHalf= 1 << 18,
    ImGuiColorEditFlags_HDR = 1 << 19,
    ImGuiColorEditFlags_DisplayRGB = 1 << 20,
    ImGuiColorEditFlags_DisplayHSV = 1 << 21,
    ImGuiColorEditFlags_DisplayHex = 1 << 22,
    ImGuiColorEditFlags_Uint8 = 1 << 23,
    ImGuiColorEditFlags_Float = 1 << 24,
    ImGuiColorEditFlags_PickerHueBar = 1 << 25,
    ImGuiColorEditFlags_PickerHueWheel = 1 << 26,
    ImGuiColorEditFlags_InputRGB = 1 << 27,
    ImGuiColorEditFlags_InputHSV = 1 << 28,
    ImGuiColorEditFlags_DefaultOptions_ = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_PickerHueBar,
    ImGuiColorEditFlags_DisplayMask_ = ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_DisplayHSV | ImGuiColorEditFlags_DisplayHex,
    ImGuiColorEditFlags_DataTypeMask_ = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_Float,
    ImGuiColorEditFlags_PickerMask_ = ImGuiColorEditFlags_PickerHueWheel | ImGuiColorEditFlags_PickerHueBar,
    ImGuiColorEditFlags_InputMask_ = ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_InputHSV
}ImGuiColorEditFlags_;
typedef enum {
    ImGuiSliderFlags_None = 0,
    ImGuiSliderFlags_AlwaysClamp = 1 << 4,
    ImGuiSliderFlags_Logarithmic = 1 << 5,
    ImGuiSliderFlags_NoRoundToFormat = 1 << 6,
    ImGuiSliderFlags_NoInput = 1 << 7,
    ImGuiSliderFlags_InvalidMask_ = 0x7000000F
}ImGuiSliderFlags_;
typedef enum {
    ImGuiMouseButton_Left = 0,
    ImGuiMouseButton_Right = 1,
    ImGuiMouseButton_Middle = 2,
    ImGuiMouseButton_COUNT = 5
}ImGuiMouseButton_;
typedef enum {
    ImGuiMouseCursor_None = -1,
    ImGuiMouseCursor_Arrow = 0,
    ImGuiMouseCursor_TextInput,
    ImGuiMouseCursor_ResizeAll,
    ImGuiMouseCursor_ResizeNS,
    ImGuiMouseCursor_ResizeEW,
    ImGuiMouseCursor_ResizeNESW,
    ImGuiMouseCursor_ResizeNWSE,
    ImGuiMouseCursor_Hand,
    ImGuiMouseCursor_NotAllowed,
    ImGuiMouseCursor_COUNT
}ImGuiMouseCursor_;
typedef enum {
    ImGuiCond_None = 0,
    ImGuiCond_Always = 1 << 0,
    ImGuiCond_Once = 1 << 1,
    ImGuiCond_FirstUseEver = 1 << 2,
    ImGuiCond_Appearing = 1 << 3
}ImGuiCond_;
struct ImGuiStyle
{
    float Alpha;
    float DisabledAlpha;
    ImVec2 WindowPadding;
    float WindowRounding;
    float WindowBorderSize;
    ImVec2 WindowMinSize;
    ImVec2 WindowTitleAlign;
    ImGuiDir WindowMenuButtonPosition;
    float ChildRounding;
    float ChildBorderSize;
    float PopupRounding;
    float PopupBorderSize;
    ImVec2 FramePadding;
    float FrameRounding;
    float FrameBorderSize;
    ImVec2 ItemSpacing;
    ImVec2 ItemInnerSpacing;
    ImVec2 CellPadding;
    ImVec2 TouchExtraPadding;
    float IndentSpacing;
    float ColumnsMinSpacing;
    float ScrollbarSize;
    float ScrollbarRounding;
    float GrabMinSize;
    float GrabRounding;
    float LogSliderDeadzone;
    float TabRounding;
    float TabBorderSize;
    float TabMinWidthForCloseButton;
    ImGuiDir ColorButtonPosition;
    ImVec2 ButtonTextAlign;
    ImVec2 SelectableTextAlign;
    ImVec2 DisplayWindowPadding;
    ImVec2 DisplaySafeAreaPadding;
    float MouseCursorScale;
    _Bool AntiAliasedLines;
    _Bool AntiAliasedLinesUseTex;
    _Bool AntiAliasedFill;
    float CurveTessellationTol;
    float CircleTessellationMaxError;
    ImVec4 Colors[ImGuiCol_COUNT];
};
struct ImGuiKeyData
{
    _Bool Down;
    float DownDuration;
    float DownDurationPrev;
    float AnalogValue;
};
struct ImGuiIO
{
    ImGuiConfigFlags ConfigFlags;
    ImGuiBackendFlags BackendFlags;
    ImVec2 DisplaySize;
    float DeltaTime;
    float IniSavingRate;
    const char* IniFilename;
    const char* LogFilename;
    float MouseDoubleClickTime;
    float MouseDoubleClickMaxDist;
    float MouseDragThreshold;
    float KeyRepeatDelay;
    float KeyRepeatRate;
    void* UserData;
    ImFontAtlas*Fonts;
    float FontGlobalScale;
    _Bool FontAllowUserScaling;
    ImFont* FontDefault;
    ImVec2 DisplayFramebufferScale;
    _Bool ConfigDockingNoSplit;
    _Bool ConfigDockingWithShift;
    _Bool ConfigDockingAlwaysTabBar;
    _Bool ConfigDockingTransparentPayload;
    _Bool ConfigViewportsNoAutoMerge;
    _Bool ConfigViewportsNoTaskBarIcon;
    _Bool ConfigViewportsNoDecoration;
    _Bool ConfigViewportsNoDefaultParent;
    _Bool MouseDrawCursor;
    _Bool ConfigMacOSXBehaviors;
    _Bool ConfigInputTrickleEventQueue;
    _Bool ConfigInputTextCursorBlink;
    _Bool ConfigDragClickToInputText;
    _Bool ConfigWindowsResizeFromEdges;
    _Bool ConfigWindowsMoveFromTitleBarOnly;
    float ConfigMemoryCompactTimer;
    const char* BackendPlatformName;
    const char* BackendRendererName;
    void* BackendPlatformUserData;
    void* BackendRendererUserData;
    void* BackendLanguageUserData;
    const char* (*GetClipboardTextFn)(void* user_data);
    void (*SetClipboardTextFn)(void* user_data, const char* text);
    void* ClipboardUserData;
    void (*SetPlatformImeDataFn)(ImGuiViewport* viewport, ImGuiPlatformImeData* data);
    void* _UnusedPadding;
    _Bool WantCaptureMouse;
    _Bool WantCaptureKeyboard;
    _Bool WantTextInput;
    _Bool WantSetMousePos;
    _Bool WantSaveIniSettings;
    _Bool NavActive;
    _Bool NavVisible;
    float Framerate;
    int MetricsRenderVertices;
    int MetricsRenderIndices;
    int MetricsRenderWindows;
    int MetricsActiveWindows;
    int MetricsActiveAllocations;
    ImVec2 MouseDelta;
    int KeyMap[ImGuiKey_COUNT];
    _Bool KeysDown[512];
    ImVec2 MousePos;
    _Bool MouseDown[5];
    float MouseWheel;
    float MouseWheelH;
    ImGuiID MouseHoveredViewport;
    _Bool KeyCtrl;
    _Bool KeyShift;
    _Bool KeyAlt;
    _Bool KeySuper;
    float NavInputs[ImGuiNavInput_COUNT];
    ImGuiKeyModFlags KeyMods;
    ImGuiKeyModFlags KeyModsPrev;
    ImGuiKeyData KeysData[ImGuiKey_KeysData_SIZE];
    _Bool WantCaptureMouseUnlessPopupClose;
    ImVec2 MousePosPrev;
    ImVec2 MouseClickedPos[5];
    double MouseClickedTime[5];
    _Bool MouseClicked[5];
    _Bool MouseDoubleClicked[5];
    ImU16 MouseClickedCount[5];
    ImU16 MouseClickedLastCount[5];
    _Bool MouseReleased[5];
    _Bool MouseDownOwned[5];
    _Bool MouseDownOwnedUnlessPopupClose[5];
    float MouseDownDuration[5];
    float MouseDownDurationPrev[5];
    ImVec2 MouseDragMaxDistanceAbs[5];
    float MouseDragMaxDistanceSqr[5];
    float NavInputsDownDuration[ImGuiNavInput_COUNT];
    float NavInputsDownDurationPrev[ImGuiNavInput_COUNT];
    float PenPressure;
    _Bool AppFocusLost;
    ImS8 BackendUsingLegacyKeyArrays;
    _Bool BackendUsingLegacyNavInputArray;
    ImWchar16 InputQueueSurrogate;
    ImVector_ImWchar InputQueueCharacters;
};
struct ImGuiInputTextCallbackData
{
    ImGuiInputTextFlags EventFlag;
    ImGuiInputTextFlags Flags;
    void* UserData;
    ImWchar EventChar;
    ImGuiKey EventKey;
    char* Buf;
    int BufTextLen;
    int BufSize;
    _Bool BufDirty;
    int CursorPos;
    int SelectionStart;
    int SelectionEnd;
};
struct ImGuiSizeCallbackData
{
    void* UserData;
    ImVec2 Pos;
    ImVec2 CurrentSize;
    ImVec2 DesiredSize;
};
struct ImGuiWindowClass
{
    ImGuiID ClassId;
    ImGuiID ParentViewportId;
    ImGuiViewportFlags ViewportFlagsOverrideSet;
    ImGuiViewportFlags ViewportFlagsOverrideClear;
    ImGuiTabItemFlags TabItemFlagsOverrideSet;
    ImGuiDockNodeFlags DockNodeFlagsOverrideSet;
    _Bool DockingAlwaysTabBar;
    _Bool DockingAllowUnclassed;
};
struct ImGuiPayload
{
    void* Data;
    int DataSize;
    ImGuiID SourceId;
    ImGuiID SourceParentId;
    int DataFrameCount;
    char DataType[32 + 1];
    _Bool Preview;
    _Bool Delivery;
};
struct ImGuiTableColumnSortSpecs
{
    ImGuiID ColumnUserID;
    ImS16 ColumnIndex;
    ImS16 SortOrder;
    ImGuiSortDirection SortDirection : 8;
};
struct ImGuiTableSortSpecs
{
    const ImGuiTableColumnSortSpecs* Specs;
    int SpecsCount;
    _Bool SpecsDirty;
};
struct ImGuiOnceUponAFrame
{
     int RefFrame;
};
struct ImGuiTextRange
{
        const char* b;
        const char* e;
};
struct ImGuiTextFilter
{
    char InputBuf[256];
    ImVector_ImGuiTextRange Filters;
    int CountGrep;
};
struct ImGuiTextBuffer
{
    ImVector_char Buf;
};
struct ImGuiStoragePair
{
        ImGuiID key;
        union { int val_i; float val_f; void* val_p; };
};
struct ImGuiStorage
{
    ImVector_ImGuiStoragePair Data;
};
struct ImGuiListClipper
{
    int DisplayStart;
    int DisplayEnd;
    int ItemsCount;
    float ItemsHeight;
    float StartPosY;
    void* TempData;
};
struct ImColor
{
    ImVec4 Value;
};
struct ImDrawCmd
{
    ImVec4 ClipRect;
    ImTextureID TextureId;
    unsigned int VtxOffset;
    unsigned int IdxOffset;
    unsigned int ElemCount;
    ImDrawCallback UserCallback;
    void* UserCallbackData;
};
struct ImDrawVert
{
    ImVec2 pos;
    ImVec2 uv;
    ImU32 col;
};
struct ImDrawCmdHeader
{
    ImVec4 ClipRect;
    ImTextureID TextureId;
    unsigned int VtxOffset;
};
struct ImDrawChannel
{
    ImVector_ImDrawCmd _CmdBuffer;
    ImVector_ImDrawIdx _IdxBuffer;
};
struct ImDrawListSplitter
{
    int _Current;
    int _Count;
    ImVector_ImDrawChannel _Channels;
};
typedef enum {
    ImDrawFlags_None = 0,
    ImDrawFlags_Closed = 1 << 0,
    ImDrawFlags_RoundCornersTopLeft = 1 << 4,
    ImDrawFlags_RoundCornersTopRight = 1 << 5,
    ImDrawFlags_RoundCornersBottomLeft = 1 << 6,
    ImDrawFlags_RoundCornersBottomRight = 1 << 7,
    ImDrawFlags_RoundCornersNone = 1 << 8,
    ImDrawFlags_RoundCornersTop = ImDrawFlags_RoundCornersTopLeft | ImDrawFlags_RoundCornersTopRight,
    ImDrawFlags_RoundCornersBottom = ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight,
    ImDrawFlags_RoundCornersLeft = ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersTopLeft,
    ImDrawFlags_RoundCornersRight = ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight,
    ImDrawFlags_RoundCornersAll = ImDrawFlags_RoundCornersTopLeft | ImDrawFlags_RoundCornersTopRight | ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight,
    ImDrawFlags_RoundCornersDefault_ = ImDrawFlags_RoundCornersAll,
    ImDrawFlags_RoundCornersMask_ = ImDrawFlags_RoundCornersAll | ImDrawFlags_RoundCornersNone
}ImDrawFlags_;
typedef enum {
    ImDrawListFlags_None = 0,
    ImDrawListFlags_AntiAliasedLines = 1 << 0,
    ImDrawListFlags_AntiAliasedLinesUseTex = 1 << 1,
    ImDrawListFlags_AntiAliasedFill = 1 << 2,
    ImDrawListFlags_AllowVtxOffset = 1 << 3
}ImDrawListFlags_;
struct ImDrawList
{
    ImVector_ImDrawCmd CmdBuffer;
    ImVector_ImDrawIdx IdxBuffer;
    ImVector_ImDrawVert VtxBuffer;
    ImDrawListFlags Flags;
    unsigned int _VtxCurrentIdx;
    const ImDrawListSharedData* _Data;
    const char* _OwnerName;
    ImDrawVert* _VtxWritePtr;
    ImDrawIdx* _IdxWritePtr;
    ImVector_ImVec4 _ClipRectStack;
    ImVector_ImTextureID _TextureIdStack;
    ImVector_ImVec2 _Path;
    ImDrawCmdHeader _CmdHeader;
    ImDrawListSplitter _Splitter;
    float _FringeScale;
};
struct ImDrawData
{
    _Bool Valid;
    int CmdListsCount;
    int TotalIdxCount;
    int TotalVtxCount;
    ImDrawList** CmdLists;
    ImVec2 DisplayPos;
    ImVec2 DisplaySize;
    ImVec2 FramebufferScale;
    ImGuiViewport* OwnerViewport;
};
struct ImFontConfig
{
    void* FontData;
    int FontDataSize;
    _Bool FontDataOwnedByAtlas;
    int FontNo;
    float SizePixels;
    int OversampleH;
    int OversampleV;
    _Bool PixelSnapH;
    ImVec2 GlyphExtraSpacing;
    ImVec2 GlyphOffset;
    const ImWchar* GlyphRanges;
    float GlyphMinAdvanceX;
    float GlyphMaxAdvanceX;
    _Bool MergeMode;
    unsigned int FontBuilderFlags;
    float RasterizerMultiply;
    ImWchar EllipsisChar;
    char Name[40];
    ImFont* DstFont;
};
struct ImFontGlyph
{
    unsigned int Colored : 1;
    unsigned int Visible : 1;
    unsigned int Codepoint : 30;
    float AdvanceX;
    float X0, Y0, X1, Y1;
    float U0, V0, U1, V1;
};
struct ImFontGlyphRangesBuilder
{
    ImVector_ImU32 UsedChars;
};
struct ImFontAtlasCustomRect
{
    unsigned short Width, Height;
    unsigned short X, Y;
    unsigned int GlyphID;
    float GlyphAdvanceX;
    ImVec2 GlyphOffset;
    ImFont* Font;
};
typedef enum {
    ImFontAtlasFlags_None = 0,
    ImFontAtlasFlags_NoPowerOfTwoHeight = 1 << 0,
    ImFontAtlasFlags_NoMouseCursors = 1 << 1,
    ImFontAtlasFlags_NoBakedLines = 1 << 2
}ImFontAtlasFlags_;
struct ImFontAtlas
{
    ImFontAtlasFlags Flags;
    ImTextureID TexID;
    int TexDesiredWidth;
    int TexGlyphPadding;
    _Bool Locked;
    _Bool TexReady;
    _Bool TexPixelsUseColors;
    unsigned char* TexPixelsAlpha8;
    unsigned int* TexPixelsRGBA32;
    int TexWidth;
    int TexHeight;
    ImVec2 TexUvScale;
    ImVec2 TexUvWhitePixel;
    ImVector_ImFontPtr Fonts;
    ImVector_ImFontAtlasCustomRect CustomRects;
    ImVector_ImFontConfig ConfigData;
    ImVec4 TexUvLines[(63) + 1];
    const ImFontBuilderIO* FontBuilderIO;
    unsigned int FontBuilderFlags;
    int PackIdMouseCursors;
    int PackIdLines;
};
struct ImFont
{
    ImVector_float IndexAdvanceX;
    float FallbackAdvanceX;
    float FontSize;
    ImVector_ImWchar IndexLookup;
    ImVector_ImFontGlyph Glyphs;
    const ImFontGlyph* FallbackGlyph;
    ImFontAtlas* ContainerAtlas;
    const ImFontConfig* ConfigData;
    short ConfigDataCount;
    ImWchar FallbackChar;
    ImWchar EllipsisChar;
    ImWchar DotChar;
    _Bool DirtyLookupTables;
    float Scale;
    float Ascent, Descent;
    int MetricsTotalSurface;
    ImU8 Used4kPagesMap[(0xFFFF +1)/4096/8];
};
typedef enum {
    ImGuiViewportFlags_None = 0,
    ImGuiViewportFlags_IsPlatformWindow = 1 << 0,
    ImGuiViewportFlags_IsPlatformMonitor = 1 << 1,
    ImGuiViewportFlags_OwnedByApp = 1 << 2,
    ImGuiViewportFlags_NoDecoration = 1 << 3,
    ImGuiViewportFlags_NoTaskBarIcon = 1 << 4,
    ImGuiViewportFlags_NoFocusOnAppearing = 1 << 5,
    ImGuiViewportFlags_NoFocusOnClick = 1 << 6,
    ImGuiViewportFlags_NoInputs = 1 << 7,
    ImGuiViewportFlags_NoRendererClear = 1 << 8,
    ImGuiViewportFlags_TopMost = 1 << 9,
    ImGuiViewportFlags_Minimized = 1 << 10,
    ImGuiViewportFlags_NoAutoMerge = 1 << 11,
    ImGuiViewportFlags_CanHostOtherWindows = 1 << 12
}ImGuiViewportFlags_;
struct ImGuiViewport
{
    ImGuiID ID;
    ImGuiViewportFlags Flags;
    ImVec2 Pos;
    ImVec2 Size;
    ImVec2 WorkPos;
    ImVec2 WorkSize;
    float DpiScale;
    ImGuiID ParentViewportId;
    ImDrawData* DrawData;
    void* RendererUserData;
    void* PlatformUserData;
    void* PlatformHandle;
    void* PlatformHandleRaw;
    _Bool PlatformRequestMove;
    _Bool PlatformRequestResize;
    _Bool PlatformRequestClose;
};
struct ImGuiPlatformIO
{
    void (*Platform_CreateWindow)(ImGuiViewport* vp);
    void (*Platform_DestroyWindow)(ImGuiViewport* vp);
    void (*Platform_ShowWindow)(ImGuiViewport* vp);
    void (*Platform_SetWindowPos)(ImGuiViewport* vp, ImVec2 pos);
    ImVec2 (*Platform_GetWindowPos)(ImGuiViewport* vp);
    void (*Platform_SetWindowSize)(ImGuiViewport* vp, ImVec2 size);
    ImVec2 (*Platform_GetWindowSize)(ImGuiViewport* vp);
    void (*Platform_SetWindowFocus)(ImGuiViewport* vp);
    _Bool (*Platform_GetWindowFocus)(ImGuiViewport* vp);
    _Bool (*Platform_GetWindowMinimized)(ImGuiViewport* vp);
    void (*Platform_SetWindowTitle)(ImGuiViewport* vp, const char* str);
    void (*Platform_SetWindowAlpha)(ImGuiViewport* vp, float alpha);
    void (*Platform_UpdateWindow)(ImGuiViewport* vp);
    void (*Platform_RenderWindow)(ImGuiViewport* vp, void* render_arg);
    void (*Platform_SwapBuffers)(ImGuiViewport* vp, void* render_arg);
    float (*Platform_GetWindowDpiScale)(ImGuiViewport* vp);
    void (*Platform_OnChangedViewport)(ImGuiViewport* vp);
    int (*Platform_CreateVkSurface)(ImGuiViewport* vp, ImU64 vk_inst, const void* vk_allocators, ImU64* out_vk_surface);
    void (*Renderer_CreateWindow)(ImGuiViewport* vp);
    void (*Renderer_DestroyWindow)(ImGuiViewport* vp);
    void (*Renderer_SetWindowSize)(ImGuiViewport* vp, ImVec2 size);
    void (*Renderer_RenderWindow)(ImGuiViewport* vp, void* render_arg);
    void (*Renderer_SwapBuffers)(ImGuiViewport* vp, void* render_arg);
    ImVector_ImGuiPlatformMonitor Monitors;
    ImVector_ImGuiViewportPtr Viewports;
};
struct ImGuiPlatformMonitor
{
    ImVec2 MainPos, MainSize;
    ImVec2 WorkPos, WorkSize;
    float DpiScale;
};
struct ImGuiPlatformImeData
{
    _Bool WantVisible;
    ImVec2 InputPos;
    float InputLineHeight;
};
extern  ImVec2* ImVec2_ImVec2_Nil(void);
extern  void ImVec2_destroy(ImVec2* self);
extern  ImVec2* ImVec2_ImVec2_Float(float _x,float _y);
extern  ImVec4* ImVec4_ImVec4_Nil(void);
extern  void ImVec4_destroy(ImVec4* self);
extern  ImVec4* ImVec4_ImVec4_Float(float _x,float _y,float _z,float _w);
extern  ImGuiContext* igCreateContext(ImFontAtlas* shared_font_atlas);
extern  void igDestroyContext(ImGuiContext* ctx);
extern  ImGuiContext* igGetCurrentContext(void);
extern  void igSetCurrentContext(ImGuiContext* ctx);
extern  ImGuiIO* igGetIO(void);
extern  ImGuiStyle* igGetStyle(void);
extern  void igNewFrame(void);
extern  void igEndFrame(void);
extern  void igRender(void);
extern  ImDrawData* igGetDrawData(void);
extern  void igShowDemoWindow(_Bool* p_open);
extern  void igShowMetricsWindow(_Bool* p_open);
extern  void igShowStackToolWindow(_Bool* p_open);
extern  void igShowAboutWindow(_Bool* p_open);
extern  void igShowStyleEditor(ImGuiStyle* ref);
extern  _Bool igShowStyleSelector(const char* label);
extern  void igShowFontSelector(const char* label);
extern  void igShowUserGuide(void);
extern  const char* igGetVersion(void);
extern  void igStyleColorsDark(ImGuiStyle* dst);
extern  void igStyleColorsLight(ImGuiStyle* dst);
extern  void igStyleColorsClassic(ImGuiStyle* dst);
extern  _Bool igBegin(const char* name,_Bool* p_open,ImGuiWindowFlags flags);
extern  void igEnd(void);
extern  _Bool igBeginChild_Str(const char* str_id,const ImVec2 size,_Bool border,ImGuiWindowFlags flags);
extern  _Bool igBeginChild_ID(ImGuiID id,const ImVec2 size,_Bool border,ImGuiWindowFlags flags);
extern  void igEndChild(void);
extern  _Bool igIsWindowAppearing(void);
extern  _Bool igIsWindowCollapsed(void);
extern  _Bool igIsWindowFocused(ImGuiFocusedFlags flags);
extern  _Bool igIsWindowHovered(ImGuiHoveredFlags flags);
extern  ImDrawList* igGetWindowDrawList(void);
extern  float igGetWindowDpiScale(void);
extern  void igGetWindowPos(ImVec2 *pOut);
extern  void igGetWindowSize(ImVec2 *pOut);
extern  float igGetWindowWidth(void);
extern  float igGetWindowHeight(void);
extern  ImGuiViewport* igGetWindowViewport(void);
extern  void igSetNextWindowPos(const ImVec2 pos,ImGuiCond cond,const ImVec2 pivot);
extern  void igSetNextWindowSize(const ImVec2 size,ImGuiCond cond);
extern  void igSetNextWindowSizeConstraints(const ImVec2 size_min,const ImVec2 size_max,ImGuiSizeCallback custom_callback,void* custom_callback_data);
extern  void igSetNextWindowContentSize(const ImVec2 size);
extern  void igSetNextWindowCollapsed(_Bool collapsed,ImGuiCond cond);
extern  void igSetNextWindowFocus(void);
extern  void igSetNextWindowBgAlpha(float alpha);
extern  void igSetNextWindowViewport(ImGuiID viewport_id);
extern  void igSetWindowPos_Vec2(const ImVec2 pos,ImGuiCond cond);
extern  void igSetWindowSize_Vec2(const ImVec2 size,ImGuiCond cond);
extern  void igSetWindowCollapsed_Bool(_Bool collapsed,ImGuiCond cond);
extern  void igSetWindowFocus_Nil(void);
extern  void igSetWindowFontScale(float scale);
extern  void igSetWindowPos_Str(const char* name,const ImVec2 pos,ImGuiCond cond);
extern  void igSetWindowSize_Str(const char* name,const ImVec2 size,ImGuiCond cond);
extern  void igSetWindowCollapsed_Str(const char* name,_Bool collapsed,ImGuiCond cond);
extern  void igSetWindowFocus_Str(const char* name);
extern  void igGetContentRegionAvail(ImVec2 *pOut);
extern  void igGetContentRegionMax(ImVec2 *pOut);
extern  void igGetWindowContentRegionMin(ImVec2 *pOut);
extern  void igGetWindowContentRegionMax(ImVec2 *pOut);
extern  float igGetScrollX(void);
extern  float igGetScrollY(void);
extern  void igSetScrollX(float scroll_x);
extern  void igSetScrollY(float scroll_y);
extern  float igGetScrollMaxX(void);
extern  float igGetScrollMaxY(void);
extern  void igSetScrollHereX(float center_x_ratio);
extern  void igSetScrollHereY(float center_y_ratio);
extern  void igSetScrollFromPosX(float local_x,float center_x_ratio);
extern  void igSetScrollFromPosY(float local_y,float center_y_ratio);
extern  void igPushFont(ImFont* font);
extern  void igPopFont(void);
extern  void igPushStyleColor_U32(ImGuiCol idx,ImU32 col);
extern  void igPushStyleColor_Vec4(ImGuiCol idx,const ImVec4 col);
extern  void igPopStyleColor(int count);
extern  void igPushStyleVar_Float(ImGuiStyleVar idx,float val);
extern  void igPushStyleVar_Vec2(ImGuiStyleVar idx,const ImVec2 val);
extern  void igPopStyleVar(int count);
extern  void igPushAllowKeyboardFocus(_Bool allow_keyboard_focus);
extern  void igPopAllowKeyboardFocus(void);
extern  void igPushButtonRepeat(_Bool repeat);
extern  void igPopButtonRepeat(void);
extern  void igPushItemWidth(float item_width);
extern  void igPopItemWidth(void);
extern  void igSetNextItemWidth(float item_width);
extern  float igCalcItemWidth(void);
extern  void igPushTextWrapPos(float wrap_local_pos_x);
extern  void igPopTextWrapPos(void);
extern  ImFont* igGetFont(void);
extern  float igGetFontSize(void);
extern  void igGetFontTexUvWhitePixel(ImVec2 *pOut);
extern  ImU32 igGetColorU32_Col(ImGuiCol idx,float alpha_mul);
extern  ImU32 igGetColorU32_Vec4(const ImVec4 col);
extern  ImU32 igGetColorU32_U32(ImU32 col);
extern  const ImVec4* igGetStyleColorVec4(ImGuiCol idx);
extern  void igSeparator(void);
extern  void igSameLine(float offset_from_start_x,float spacing);
extern  void igNewLine(void);
extern  void igSpacing(void);
extern  void igDummy(const ImVec2 size);
extern  void igIndent(float indent_w);
extern  void igUnindent(float indent_w);
extern  void igBeginGroup(void);
extern  void igEndGroup(void);
extern  void igGetCursorPos(ImVec2 *pOut);
extern  float igGetCursorPosX(void);
extern  float igGetCursorPosY(void);
extern  void igSetCursorPos(const ImVec2 local_pos);
extern  void igSetCursorPosX(float local_x);
extern  void igSetCursorPosY(float local_y);
extern  void igGetCursorStartPos(ImVec2 *pOut);
extern  void igGetCursorScreenPos(ImVec2 *pOut);
extern  void igSetCursorScreenPos(const ImVec2 pos);
extern  void igAlignTextToFramePadding(void);
extern  float igGetTextLineHeight(void);
extern  float igGetTextLineHeightWithSpacing(void);
extern  float igGetFrameHeight(void);
extern  float igGetFrameHeightWithSpacing(void);
extern  void igPushID_Str(const char* str_id);
extern  void igPushID_StrStr(const char* str_id_begin,const char* str_id_end);
extern  void igPushID_Ptr(const void* ptr_id);
extern  void igPushID_Int(int int_id);
extern  void igPopID(void);
extern  ImGuiID igGetID_Str(const char* str_id);
extern  ImGuiID igGetID_StrStr(const char* str_id_begin,const char* str_id_end);
extern  ImGuiID igGetID_Ptr(const void* ptr_id);
extern  void igTextUnformatted(const char* text,const char* text_end);
extern  void igText(const char* fmt,...);
extern  void igTextV(const char* fmt,va_list args);
extern  void igTextColored(const ImVec4 col,const char* fmt,...);
extern  void igTextColoredV(const ImVec4 col,const char* fmt,va_list args);
extern  void igTextDisabled(const char* fmt,...);
extern  void igTextDisabledV(const char* fmt,va_list args);
extern  void igTextWrapped(const char* fmt,...);
extern  void igTextWrappedV(const char* fmt,va_list args);
extern  void igLabelText(const char* label,const char* fmt,...);
extern  void igLabelTextV(const char* label,const char* fmt,va_list args);
extern  void igBulletText(const char* fmt,...);
extern  void igBulletTextV(const char* fmt,va_list args);
extern  _Bool igButton(const char* label,const ImVec2 size);
extern  _Bool igSmallButton(const char* label);
extern  _Bool igInvisibleButton(const char* str_id,const ImVec2 size,ImGuiButtonFlags flags);
extern  _Bool igArrowButton(const char* str_id,ImGuiDir dir);
extern  void igImage(ImTextureID user_texture_id,const ImVec2 size,const ImVec2 uv0,const ImVec2 uv1,const ImVec4 tint_col,const ImVec4 border_col);
extern  _Bool igImageButton(ImTextureID user_texture_id,const ImVec2 size,const ImVec2 uv0,const ImVec2 uv1,int frame_padding,const ImVec4 bg_col,const ImVec4 tint_col);
extern  _Bool igCheckbox(const char* label,_Bool* v);
extern  _Bool igCheckboxFlags_IntPtr(const char* label,int* flags,int flags_value);
extern  _Bool igCheckboxFlags_UintPtr(const char* label,unsigned int* flags,unsigned int flags_value);
extern  _Bool igRadioButton_Bool(const char* label,_Bool active);
extern  _Bool igRadioButton_IntPtr(const char* label,int* v,int v_button);
extern  void igProgressBar(float fraction,const ImVec2 size_arg,const char* overlay);
extern  void igBullet(void);
extern  _Bool igBeginCombo(const char* label,const char* preview_value,ImGuiComboFlags flags);
extern  void igEndCombo(void);
extern  _Bool igCombo_Str_arr(const char* label,int* current_item,const char* const items[],int items_count,int popup_max_height_in_items);
extern  _Bool igCombo_Str(const char* label,int* current_item,const char* items_separated_by_zeros,int popup_max_height_in_items);
extern  _Bool igCombo_FnBoolPtr(const char* label,int* current_item,_Bool(*items_getter)(void* data,int idx,const char** out_text),void* data,int items_count,int popup_max_height_in_items);
extern  _Bool igDragFloat(const char* label,float* v,float v_speed,float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragFloat2(const char* label,float v[2],float v_speed,float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragFloat3(const char* label,float v[3],float v_speed,float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragFloat4(const char* label,float v[4],float v_speed,float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragFloatRange2(const char* label,float* v_current_min,float* v_current_max,float v_speed,float v_min,float v_max,const char* format,const char* format_max,ImGuiSliderFlags flags);
extern  _Bool igDragInt(const char* label,int* v,float v_speed,int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragInt2(const char* label,int v[2],float v_speed,int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragInt3(const char* label,int v[3],float v_speed,int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragInt4(const char* label,int v[4],float v_speed,int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragIntRange2(const char* label,int* v_current_min,int* v_current_max,float v_speed,int v_min,int v_max,const char* format,const char* format_max,ImGuiSliderFlags flags);
extern  _Bool igDragScalar(const char* label,ImGuiDataType data_type,void* p_data,float v_speed,const void* p_min,const void* p_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igDragScalarN(const char* label,ImGuiDataType data_type,void* p_data,int components,float v_speed,const void* p_min,const void* p_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderFloat(const char* label,float* v,float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderFloat2(const char* label,float v[2],float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderFloat3(const char* label,float v[3],float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderFloat4(const char* label,float v[4],float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderAngle(const char* label,float* v_rad,float v_degrees_min,float v_degrees_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderInt(const char* label,int* v,int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderInt2(const char* label,int v[2],int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderInt3(const char* label,int v[3],int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderInt4(const char* label,int v[4],int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderScalar(const char* label,ImGuiDataType data_type,void* p_data,const void* p_min,const void* p_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igSliderScalarN(const char* label,ImGuiDataType data_type,void* p_data,int components,const void* p_min,const void* p_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igVSliderFloat(const char* label,const ImVec2 size,float* v,float v_min,float v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igVSliderInt(const char* label,const ImVec2 size,int* v,int v_min,int v_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igVSliderScalar(const char* label,const ImVec2 size,ImGuiDataType data_type,void* p_data,const void* p_min,const void* p_max,const char* format,ImGuiSliderFlags flags);
extern  _Bool igInputText(const char* label,char* buf,size_t buf_size,ImGuiInputTextFlags flags,ImGuiInputTextCallback callback,void* user_data);
extern  _Bool igInputTextMultiline(const char* label,char* buf,size_t buf_size,const ImVec2 size,ImGuiInputTextFlags flags,ImGuiInputTextCallback callback,void* user_data);
extern  _Bool igInputTextWithHint(const char* label,const char* hint,char* buf,size_t buf_size,ImGuiInputTextFlags flags,ImGuiInputTextCallback callback,void* user_data);
extern  _Bool igInputFloat(const char* label,float* v,float step,float step_fast,const char* format,ImGuiInputTextFlags flags);
extern  _Bool igInputFloat2(const char* label,float v[2],const char* format,ImGuiInputTextFlags flags);
extern  _Bool igInputFloat3(const char* label,float v[3],const char* format,ImGuiInputTextFlags flags);
extern  _Bool igInputFloat4(const char* label,float v[4],const char* format,ImGuiInputTextFlags flags);
extern  _Bool igInputInt(const char* label,int* v,int step,int step_fast,ImGuiInputTextFlags flags);
extern  _Bool igInputInt2(const char* label,int v[2],ImGuiInputTextFlags flags);
extern  _Bool igInputInt3(const char* label,int v[3],ImGuiInputTextFlags flags);
extern  _Bool igInputInt4(const char* label,int v[4],ImGuiInputTextFlags flags);
extern  _Bool igInputDouble(const char* label,double* v,double step,double step_fast,const char* format,ImGuiInputTextFlags flags);
extern  _Bool igInputScalar(const char* label,ImGuiDataType data_type,void* p_data,const void* p_step,const void* p_step_fast,const char* format,ImGuiInputTextFlags flags);
extern  _Bool igInputScalarN(const char* label,ImGuiDataType data_type,void* p_data,int components,const void* p_step,const void* p_step_fast,const char* format,ImGuiInputTextFlags flags);
extern  _Bool igColorEdit3(const char* label,float col[3],ImGuiColorEditFlags flags);
extern  _Bool igColorEdit4(const char* label,float col[4],ImGuiColorEditFlags flags);
extern  _Bool igColorPicker3(const char* label,float col[3],ImGuiColorEditFlags flags);
extern  _Bool igColorPicker4(const char* label,float col[4],ImGuiColorEditFlags flags,const float* ref_col);
extern  _Bool igColorButton(const char* desc_id,const ImVec4 col,ImGuiColorEditFlags flags,ImVec2 size);
extern  void igSetColorEditOptions(ImGuiColorEditFlags flags);
extern  _Bool igTreeNode_Str(const char* label);
extern  _Bool igTreeNode_StrStr(const char* str_id,const char* fmt,...);
extern  _Bool igTreeNode_Ptr(const void* ptr_id,const char* fmt,...);
extern  _Bool igTreeNodeV_Str(const char* str_id,const char* fmt,va_list args);
extern  _Bool igTreeNodeV_Ptr(const void* ptr_id,const char* fmt,va_list args);
extern  _Bool igTreeNodeEx_Str(const char* label,ImGuiTreeNodeFlags flags);
extern  _Bool igTreeNodeEx_StrStr(const char* str_id,ImGuiTreeNodeFlags flags,const char* fmt,...);
extern  _Bool igTreeNodeEx_Ptr(const void* ptr_id,ImGuiTreeNodeFlags flags,const char* fmt,...);
extern  _Bool igTreeNodeExV_Str(const char* str_id,ImGuiTreeNodeFlags flags,const char* fmt,va_list args);
extern  _Bool igTreeNodeExV_Ptr(const void* ptr_id,ImGuiTreeNodeFlags flags,const char* fmt,va_list args);
extern  void igTreePush_Str(const char* str_id);
extern  void igTreePush_Ptr(const void* ptr_id);
extern  void igTreePop(void);
extern  float igGetTreeNodeToLabelSpacing(void);
extern  _Bool igCollapsingHeader_TreeNodeFlags(const char* label,ImGuiTreeNodeFlags flags);
extern  _Bool igCollapsingHeader_BoolPtr(const char* label,_Bool* p_visible,ImGuiTreeNodeFlags flags);
extern  void igSetNextItemOpen(_Bool is_open,ImGuiCond cond);
extern  _Bool igSelectable_Bool(const char* label,_Bool selected,ImGuiSelectableFlags flags,const ImVec2 size);
extern  _Bool igSelectable_BoolPtr(const char* label,_Bool* p_selected,ImGuiSelectableFlags flags,const ImVec2 size);
extern  _Bool igBeginListBox(const char* label,const ImVec2 size);
extern  void igEndListBox(void);
extern  _Bool igListBox_Str_arr(const char* label,int* current_item,const char* const items[],int items_count,int height_in_items);
extern  _Bool igListBox_FnBoolPtr(const char* label,int* current_item,_Bool(*items_getter)(void* data,int idx,const char** out_text),void* data,int items_count,int height_in_items);
extern  void igPlotLines_FloatPtr(const char* label,const float* values,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride);
extern  void igPlotLines_FnFloatPtr(const char* label,float(*values_getter)(void* data,int idx),void* data,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size);
extern  void igPlotHistogram_FloatPtr(const char* label,const float* values,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size,int stride);
extern  void igPlotHistogram_FnFloatPtr(const char* label,float(*values_getter)(void* data,int idx),void* data,int values_count,int values_offset,const char* overlay_text,float scale_min,float scale_max,ImVec2 graph_size);
extern  void igValue_Bool(const char* prefix,_Bool b);
extern  void igValue_Int(const char* prefix,int v);
extern  void igValue_Uint(const char* prefix,unsigned int v);
extern  void igValue_Float(const char* prefix,float v,const char* float_format);
extern  _Bool igBeginMenuBar(void);
extern  void igEndMenuBar(void);
extern  _Bool igBeginMainMenuBar(void);
extern  void igEndMainMenuBar(void);
extern  _Bool igBeginMenu(const char* label,_Bool enabled);
extern  void igEndMenu(void);
extern  _Bool igMenuItem_Bool(const char* label,const char* shortcut,_Bool selected,_Bool enabled);
extern  _Bool igMenuItem_BoolPtr(const char* label,const char* shortcut,_Bool* p_selected,_Bool enabled);
extern  void igBeginTooltip(void);
extern  void igEndTooltip(void);
extern  void igSetTooltip(const char* fmt,...);
extern  void igSetTooltipV(const char* fmt,va_list args);
extern  _Bool igBeginPopup(const char* str_id,ImGuiWindowFlags flags);
extern  _Bool igBeginPopupModal(const char* name,_Bool* p_open,ImGuiWindowFlags flags);
extern  void igEndPopup(void);
extern  void igOpenPopup_Str(const char* str_id,ImGuiPopupFlags popup_flags);
extern  void igOpenPopup_ID(ImGuiID id,ImGuiPopupFlags popup_flags);
extern  void igOpenPopupOnItemClick(const char* str_id,ImGuiPopupFlags popup_flags);
extern  void igCloseCurrentPopup(void);
extern  _Bool igBeginPopupContextItem(const char* str_id,ImGuiPopupFlags popup_flags);
extern  _Bool igBeginPopupContextWindow(const char* str_id,ImGuiPopupFlags popup_flags);
extern  _Bool igBeginPopupContextVoid(const char* str_id,ImGuiPopupFlags popup_flags);
extern  _Bool igIsPopupOpen(const char* str_id,ImGuiPopupFlags flags);
extern  _Bool igBeginTable(const char* str_id,int column,ImGuiTableFlags flags,const ImVec2 outer_size,float inner_width);
extern  void igEndTable(void);
extern  void igTableNextRow(ImGuiTableRowFlags row_flags,float min_row_height);
extern  _Bool igTableNextColumn(void);
extern  _Bool igTableSetColumnIndex(int column_n);
extern  void igTableSetupColumn(const char* label,ImGuiTableColumnFlags flags,float init_width_or_weight,ImGuiID user_id);
extern  void igTableSetupScrollFreeze(int cols,int rows);
extern  void igTableHeadersRow(void);
extern  void igTableHeader(const char* label);
extern  ImGuiTableSortSpecs* igTableGetSortSpecs(void);
extern  int igTableGetColumnCount(void);
extern  int igTableGetColumnIndex(void);
extern  int igTableGetRowIndex(void);
extern  const char* igTableGetColumnName(int column_n);
extern  ImGuiTableColumnFlags igTableGetColumnFlags(int column_n);
extern  void igTableSetColumnEnabled(int column_n,_Bool v);
extern  void igTableSetBgColor(ImGuiTableBgTarget target,ImU32 color,int column_n);
extern  void igColumns(int count,const char* id,_Bool border);
extern  void igNextColumn(void);
extern  int igGetColumnIndex(void);
extern  float igGetColumnWidth(int column_index);
extern  void igSetColumnWidth(int column_index,float width);
extern  float igGetColumnOffset(int column_index);
extern  void igSetColumnOffset(int column_index,float offset_x);
extern  int igGetColumnsCount(void);
extern  _Bool igBeginTabBar(const char* str_id,ImGuiTabBarFlags flags);
extern  void igEndTabBar(void);
extern  _Bool igBeginTabItem(const char* label,_Bool* p_open,ImGuiTabItemFlags flags);
extern  void igEndTabItem(void);
extern  _Bool igTabItemButton(const char* label,ImGuiTabItemFlags flags);
extern  void igSetTabItemClosed(const char* tab_or_docked_window_label);
extern  ImGuiID igDockSpace(ImGuiID id,const ImVec2 size,ImGuiDockNodeFlags flags,const ImGuiWindowClass* window_class);
extern  ImGuiID igDockSpaceOverViewport(const ImGuiViewport* viewport,ImGuiDockNodeFlags flags,const ImGuiWindowClass* window_class);
extern  void igSetNextWindowDockID(ImGuiID dock_id,ImGuiCond cond);
extern  void igSetNextWindowClass(const ImGuiWindowClass* window_class);
extern  ImGuiID igGetWindowDockID(void);
extern  _Bool igIsWindowDocked(void);
extern  void igLogToTTY(int auto_open_depth);
extern  void igLogToFile(int auto_open_depth,const char* filename);
extern  void igLogToClipboard(int auto_open_depth);
extern  void igLogFinish(void);
extern  void igLogButtons(void);
extern  void igLogTextV(const char* fmt,va_list args);
extern  _Bool igBeginDragDropSource(ImGuiDragDropFlags flags);
extern  _Bool igSetDragDropPayload(const char* type,const void* data,size_t sz,ImGuiCond cond);
extern  void igEndDragDropSource(void);
extern  _Bool igBeginDragDropTarget(void);
extern  const ImGuiPayload* igAcceptDragDropPayload(const char* type,ImGuiDragDropFlags flags);
extern  void igEndDragDropTarget(void);
extern  const ImGuiPayload* igGetDragDropPayload(void);
extern  void igBeginDisabled(_Bool disabled);
extern  void igEndDisabled(void);
extern  void igPushClipRect(const ImVec2 clip_rect_min,const ImVec2 clip_rect_max,_Bool intersect_with_current_clip_rect);
extern  void igPopClipRect(void);
extern  void igSetItemDefaultFocus(void);
extern  void igSetKeyboardFocusHere(int offset);
extern  _Bool igIsItemHovered(ImGuiHoveredFlags flags);
extern  _Bool igIsItemActive(void);
extern  _Bool igIsItemFocused(void);
extern  _Bool igIsItemClicked(ImGuiMouseButton mouse_button);
extern  _Bool igIsItemVisible(void);
extern  _Bool igIsItemEdited(void);
extern  _Bool igIsItemActivated(void);
extern  _Bool igIsItemDeactivated(void);
extern  _Bool igIsItemDeactivatedAfterEdit(void);
extern  _Bool igIsItemToggledOpen(void);
extern  _Bool igIsAnyItemHovered(void);
extern  _Bool igIsAnyItemActive(void);
extern  _Bool igIsAnyItemFocused(void);
extern  void igGetItemRectMin(ImVec2 *pOut);
extern  void igGetItemRectMax(ImVec2 *pOut);
extern  void igGetItemRectSize(ImVec2 *pOut);
extern  void igSetItemAllowOverlap(void);
extern  ImGuiViewport* igGetMainViewport(void);
extern  _Bool igIsRectVisible_Nil(const ImVec2 size);
extern  _Bool igIsRectVisible_Vec2(const ImVec2 rect_min,const ImVec2 rect_max);
extern  double igGetTime(void);
extern  int igGetFrameCount(void);
extern  ImDrawList* igGetBackgroundDrawList_Nil(void);
extern  ImDrawList* igGetForegroundDrawList_Nil(void);
extern  ImDrawList* igGetBackgroundDrawList_ViewportPtr(ImGuiViewport* viewport);
extern  ImDrawList* igGetForegroundDrawList_ViewportPtr(ImGuiViewport* viewport);
extern  ImDrawListSharedData* igGetDrawListSharedData(void);
extern  const char* igGetStyleColorName(ImGuiCol idx);
extern  void igSetStateStorage(ImGuiStorage* storage);
extern  ImGuiStorage* igGetStateStorage(void);
extern  _Bool igBeginChildFrame(ImGuiID id,const ImVec2 size,ImGuiWindowFlags flags);
extern  void igEndChildFrame(void);
extern  void igCalcTextSize(ImVec2 *pOut,const char* text,const char* text_end,_Bool hide_text_after_double_hash,float wrap_width);
extern  void igColorConvertU32ToFloat4(ImVec4 *pOut,ImU32 in);
extern  ImU32 igColorConvertFloat4ToU32(const ImVec4 in);
extern  void igColorConvertRGBtoHSV(float r,float g,float b,float* out_h,float* out_s,float* out_v);
extern  void igColorConvertHSVtoRGB(float h,float s,float v,float* out_r,float* out_g,float* out_b);
extern  _Bool igIsKeyDown(ImGuiKey key);
extern  _Bool igIsKeyPressed(ImGuiKey key,_Bool repeat);
extern  _Bool igIsKeyReleased(ImGuiKey key);
extern  int igGetKeyPressedAmount(ImGuiKey key,float repeat_delay,float rate);
extern  const char* igGetKeyName(ImGuiKey key);
extern  void igCaptureKeyboardFromApp(_Bool want_capture_keyboard_value);
extern  _Bool igIsMouseDown(ImGuiMouseButton button);
extern  _Bool igIsMouseClicked(ImGuiMouseButton button,_Bool repeat);
extern  _Bool igIsMouseReleased(ImGuiMouseButton button);
extern  _Bool igIsMouseDoubleClicked(ImGuiMouseButton button);
extern  int igGetMouseClickedCount(ImGuiMouseButton button);
extern  _Bool igIsMouseHoveringRect(const ImVec2 r_min,const ImVec2 r_max,_Bool clip);
extern  _Bool igIsMousePosValid(const ImVec2* mouse_pos);
extern  _Bool igIsAnyMouseDown(void);
extern  void igGetMousePos(ImVec2 *pOut);
extern  void igGetMousePosOnOpeningCurrentPopup(ImVec2 *pOut);
extern  _Bool igIsMouseDragging(ImGuiMouseButton button,float lock_threshold);
extern  void igGetMouseDragDelta(ImVec2 *pOut,ImGuiMouseButton button,float lock_threshold);
extern  void igResetMouseDragDelta(ImGuiMouseButton button);
extern  ImGuiMouseCursor igGetMouseCursor(void);
extern  void igSetMouseCursor(ImGuiMouseCursor cursor_type);
extern  void igCaptureMouseFromApp(_Bool want_capture_mouse_value);
extern  const char* igGetClipboardText(void);
extern  void igSetClipboardText(const char* text);
extern  void igLoadIniSettingsFromDisk(const char* ini_filename);
extern  void igLoadIniSettingsFromMemory(const char* ini_data,size_t ini_size);
extern  void igSaveIniSettingsToDisk(const char* ini_filename);
extern  const char* igSaveIniSettingsToMemory(size_t* out_ini_size);
extern  _Bool igDebugCheckVersionAndDataLayout(const char* version_str,size_t sz_io,size_t sz_style,size_t sz_vec2,size_t sz_vec4,size_t sz_drawvert,size_t sz_drawidx);
extern  void igSetAllocatorFunctions(ImGuiMemAllocFunc alloc_func,ImGuiMemFreeFunc free_func,void* user_data);
extern  void igGetAllocatorFunctions(ImGuiMemAllocFunc* p_alloc_func,ImGuiMemFreeFunc* p_free_func,void** p_user_data);
extern  void* igMemAlloc(size_t size);
extern  void igMemFree(void* ptr);
extern  ImGuiPlatformIO* igGetPlatformIO(void);
extern  void igUpdatePlatformWindows(void);
extern  void igRenderPlatformWindowsDefault(void* platform_render_arg,void* renderer_render_arg);
extern  void igDestroyPlatformWindows(void);
extern  ImGuiViewport* igFindViewportByID(ImGuiID id);
extern  ImGuiViewport* igFindViewportByPlatformHandle(void* platform_handle);
extern  ImGuiStyle* ImGuiStyle_ImGuiStyle(void);
extern  void ImGuiStyle_destroy(ImGuiStyle* self);
extern  void ImGuiStyle_ScaleAllSizes(ImGuiStyle* self,float scale_factor);
extern  void ImGuiIO_AddKeyEvent(ImGuiIO* self,ImGuiKey key,_Bool down);
extern  void ImGuiIO_AddKeyAnalogEvent(ImGuiIO* self,ImGuiKey key,_Bool down,float v);
extern  void ImGuiIO_AddKeyModsEvent(ImGuiIO* self,ImGuiKeyModFlags modifiers);
extern  void ImGuiIO_AddMousePosEvent(ImGuiIO* self,float x,float y);
extern  void ImGuiIO_AddMouseButtonEvent(ImGuiIO* self,int button,_Bool down);
extern  void ImGuiIO_AddMouseWheelEvent(ImGuiIO* self,float wh_x,float wh_y);
extern  void ImGuiIO_AddMouseViewportEvent(ImGuiIO* self,ImGuiID id);
extern  void ImGuiIO_AddFocusEvent(ImGuiIO* self,_Bool focused);
extern  void ImGuiIO_AddInputCharacter(ImGuiIO* self,unsigned int c);
extern  void ImGuiIO_AddInputCharacterUTF16(ImGuiIO* self,ImWchar16 c);
extern  void ImGuiIO_AddInputCharactersUTF8(ImGuiIO* self,const char* str);
extern  void ImGuiIO_ClearInputCharacters(ImGuiIO* self);
extern  void ImGuiIO_ClearInputKeys(ImGuiIO* self);
extern  void ImGuiIO_SetKeyEventNativeData(ImGuiIO* self,ImGuiKey key,int native_keycode,int native_scancode,int native_legacy_index);
extern  ImGuiIO* ImGuiIO_ImGuiIO(void);
extern  void ImGuiIO_destroy(ImGuiIO* self);
extern  ImGuiInputTextCallbackData* ImGuiInputTextCallbackData_ImGuiInputTextCallbackData(void);
extern  void ImGuiInputTextCallbackData_destroy(ImGuiInputTextCallbackData* self);
extern  void ImGuiInputTextCallbackData_DeleteChars(ImGuiInputTextCallbackData* self,int pos,int bytes_count);
extern  void ImGuiInputTextCallbackData_InsertChars(ImGuiInputTextCallbackData* self,int pos,const char* text,const char* text_end);
extern  void ImGuiInputTextCallbackData_SelectAll(ImGuiInputTextCallbackData* self);
extern  void ImGuiInputTextCallbackData_ClearSelection(ImGuiInputTextCallbackData* self);
extern  _Bool ImGuiInputTextCallbackData_HasSelection(ImGuiInputTextCallbackData* self);
extern  ImGuiWindowClass* ImGuiWindowClass_ImGuiWindowClass(void);
extern  void ImGuiWindowClass_destroy(ImGuiWindowClass* self);
extern  ImGuiPayload* ImGuiPayload_ImGuiPayload(void);
extern  void ImGuiPayload_destroy(ImGuiPayload* self);
extern  void ImGuiPayload_Clear(ImGuiPayload* self);
extern  _Bool ImGuiPayload_IsDataType(ImGuiPayload* self,const char* type);
extern  _Bool ImGuiPayload_IsPreview(ImGuiPayload* self);
extern  _Bool ImGuiPayload_IsDelivery(ImGuiPayload* self);
extern  ImGuiTableColumnSortSpecs* ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs(void);
extern  void ImGuiTableColumnSortSpecs_destroy(ImGuiTableColumnSortSpecs* self);
extern  ImGuiTableSortSpecs* ImGuiTableSortSpecs_ImGuiTableSortSpecs(void);
extern  void ImGuiTableSortSpecs_destroy(ImGuiTableSortSpecs* self);
extern  ImGuiOnceUponAFrame* ImGuiOnceUponAFrame_ImGuiOnceUponAFrame(void);
extern  void ImGuiOnceUponAFrame_destroy(ImGuiOnceUponAFrame* self);
extern  ImGuiTextFilter* ImGuiTextFilter_ImGuiTextFilter(const char* default_filter);
extern  void ImGuiTextFilter_destroy(ImGuiTextFilter* self);
extern  _Bool ImGuiTextFilter_Draw(ImGuiTextFilter* self,const char* label,float width);
extern  _Bool ImGuiTextFilter_PassFilter(ImGuiTextFilter* self,const char* text,const char* text_end);
extern  void ImGuiTextFilter_Build(ImGuiTextFilter* self);
extern  void ImGuiTextFilter_Clear(ImGuiTextFilter* self);
extern  _Bool ImGuiTextFilter_IsActive(ImGuiTextFilter* self);
extern  ImGuiTextRange* ImGuiTextRange_ImGuiTextRange_Nil(void);
extern  void ImGuiTextRange_destroy(ImGuiTextRange* self);
extern  ImGuiTextRange* ImGuiTextRange_ImGuiTextRange_Str(const char* _b,const char* _e);
extern  _Bool ImGuiTextRange_empty(ImGuiTextRange* self);
extern  void ImGuiTextRange_split(ImGuiTextRange* self,char separator,ImVector_ImGuiTextRange* out);
extern  ImGuiTextBuffer* ImGuiTextBuffer_ImGuiTextBuffer(void);
extern  void ImGuiTextBuffer_destroy(ImGuiTextBuffer* self);
extern  const char* ImGuiTextBuffer_begin(ImGuiTextBuffer* self);
extern  const char* ImGuiTextBuffer_end(ImGuiTextBuffer* self);
extern  int ImGuiTextBuffer_size(ImGuiTextBuffer* self);
extern  _Bool ImGuiTextBuffer_empty(ImGuiTextBuffer* self);
extern  void ImGuiTextBuffer_clear(ImGuiTextBuffer* self);
extern  void ImGuiTextBuffer_reserve(ImGuiTextBuffer* self,int capacity);
extern  const char* ImGuiTextBuffer_c_str(ImGuiTextBuffer* self);
extern  void ImGuiTextBuffer_append(ImGuiTextBuffer* self,const char* str,const char* str_end);
extern  void ImGuiTextBuffer_appendfv(ImGuiTextBuffer* self,const char* fmt,va_list args);
extern  ImGuiStoragePair* ImGuiStoragePair_ImGuiStoragePair_Int(ImGuiID _key,int _val_i);
extern  void ImGuiStoragePair_destroy(ImGuiStoragePair* self);
extern  ImGuiStoragePair* ImGuiStoragePair_ImGuiStoragePair_Float(ImGuiID _key,float _val_f);
extern  ImGuiStoragePair* ImGuiStoragePair_ImGuiStoragePair_Ptr(ImGuiID _key,void* _val_p);
extern  void ImGuiStorage_Clear(ImGuiStorage* self);
extern  int ImGuiStorage_GetInt(ImGuiStorage* self,ImGuiID key,int default_val);
extern  void ImGuiStorage_SetInt(ImGuiStorage* self,ImGuiID key,int val);
extern  _Bool ImGuiStorage_GetBool(ImGuiStorage* self,ImGuiID key,_Bool default_val);
extern  void ImGuiStorage_SetBool(ImGuiStorage* self,ImGuiID key,_Bool val);
extern  float ImGuiStorage_GetFloat(ImGuiStorage* self,ImGuiID key,float default_val);
extern  void ImGuiStorage_SetFloat(ImGuiStorage* self,ImGuiID key,float val);
extern  void* ImGuiStorage_GetVoidPtr(ImGuiStorage* self,ImGuiID key);
extern  void ImGuiStorage_SetVoidPtr(ImGuiStorage* self,ImGuiID key,void* val);
extern  int* ImGuiStorage_GetIntRef(ImGuiStorage* self,ImGuiID key,int default_val);
extern  _Bool* ImGuiStorage_GetBoolRef(ImGuiStorage* self,ImGuiID key,_Bool default_val);
extern  float* ImGuiStorage_GetFloatRef(ImGuiStorage* self,ImGuiID key,float default_val);
extern  void** ImGuiStorage_GetVoidPtrRef(ImGuiStorage* self,ImGuiID key,void* default_val);
extern  void ImGuiStorage_SetAllInt(ImGuiStorage* self,int val);
extern  void ImGuiStorage_BuildSortByKey(ImGuiStorage* self);
extern  ImGuiListClipper* ImGuiListClipper_ImGuiListClipper(void);
extern  void ImGuiListClipper_destroy(ImGuiListClipper* self);
extern  void ImGuiListClipper_Begin(ImGuiListClipper* self,int items_count,float items_height);
extern  void ImGuiListClipper_End(ImGuiListClipper* self);
extern  _Bool ImGuiListClipper_Step(ImGuiListClipper* self);
extern  void ImGuiListClipper_ForceDisplayRangeByIndices(ImGuiListClipper* self,int item_min,int item_max);
extern  ImColor* ImColor_ImColor_Nil(void);
extern  void ImColor_destroy(ImColor* self);
extern  ImColor* ImColor_ImColor_Int(int r,int g,int b,int a);
extern  ImColor* ImColor_ImColor_U32(ImU32 rgba);
extern  ImColor* ImColor_ImColor_Float(float r,float g,float b,float a);
extern  ImColor* ImColor_ImColor_Vec4(const ImVec4 col);
extern  void ImColor_SetHSV(ImColor* self,float h,float s,float v,float a);
extern  void ImColor_HSV(ImColor *pOut,float h,float s,float v,float a);
extern  ImDrawCmd* ImDrawCmd_ImDrawCmd(void);
extern  void ImDrawCmd_destroy(ImDrawCmd* self);
extern  ImTextureID ImDrawCmd_GetTexID(ImDrawCmd* self);
extern  ImDrawListSplitter* ImDrawListSplitter_ImDrawListSplitter(void);
extern  void ImDrawListSplitter_destroy(ImDrawListSplitter* self);
extern  void ImDrawListSplitter_Clear(ImDrawListSplitter* self);
extern  void ImDrawListSplitter_ClearFreeMemory(ImDrawListSplitter* self);
extern  void ImDrawListSplitter_Split(ImDrawListSplitter* self,ImDrawList* draw_list,int count);
extern  void ImDrawListSplitter_Merge(ImDrawListSplitter* self,ImDrawList* draw_list);
extern  void ImDrawListSplitter_SetCurrentChannel(ImDrawListSplitter* self,ImDrawList* draw_list,int channel_idx);
extern  ImDrawList* ImDrawList_ImDrawList(const ImDrawListSharedData* shared_data);
extern  void ImDrawList_destroy(ImDrawList* self);
extern  void ImDrawList_PushClipRect(ImDrawList* self,ImVec2 clip_rect_min,ImVec2 clip_rect_max,_Bool intersect_with_current_clip_rect);
extern  void ImDrawList_PushClipRectFullScreen(ImDrawList* self);
extern  void ImDrawList_PopClipRect(ImDrawList* self);
extern  void ImDrawList_PushTextureID(ImDrawList* self,ImTextureID texture_id);
extern  void ImDrawList_PopTextureID(ImDrawList* self);
extern  void ImDrawList_GetClipRectMin(ImVec2 *pOut,ImDrawList* self);
extern  void ImDrawList_GetClipRectMax(ImVec2 *pOut,ImDrawList* self);
extern  void ImDrawList_AddLine(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,ImU32 col,float thickness);
extern  void ImDrawList_AddRect(ImDrawList* self,const ImVec2 p_min,const ImVec2 p_max,ImU32 col,float rounding,ImDrawFlags flags,float thickness);
extern  void ImDrawList_AddRectFilled(ImDrawList* self,const ImVec2 p_min,const ImVec2 p_max,ImU32 col,float rounding,ImDrawFlags flags);
extern  void ImDrawList_AddRectFilledMultiColor(ImDrawList* self,const ImVec2 p_min,const ImVec2 p_max,ImU32 col_upr_left,ImU32 col_upr_right,ImU32 col_bot_right,ImU32 col_bot_left);
extern  void ImDrawList_AddQuad(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,const ImVec2 p4,ImU32 col,float thickness);
extern  void ImDrawList_AddQuadFilled(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,const ImVec2 p4,ImU32 col);
extern  void ImDrawList_AddTriangle(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,ImU32 col,float thickness);
extern  void ImDrawList_AddTriangleFilled(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,ImU32 col);
extern  void ImDrawList_AddCircle(ImDrawList* self,const ImVec2 center,float radius,ImU32 col,int num_segments,float thickness);
extern  void ImDrawList_AddCircleFilled(ImDrawList* self,const ImVec2 center,float radius,ImU32 col,int num_segments);
extern  void ImDrawList_AddNgon(ImDrawList* self,const ImVec2 center,float radius,ImU32 col,int num_segments,float thickness);
extern  void ImDrawList_AddNgonFilled(ImDrawList* self,const ImVec2 center,float radius,ImU32 col,int num_segments);
extern  void ImDrawList_AddText_Vec2(ImDrawList* self,const ImVec2 pos,ImU32 col,const char* text_begin,const char* text_end);
extern  void ImDrawList_AddText_FontPtr(ImDrawList* self,const ImFont* font,float font_size,const ImVec2 pos,ImU32 col,const char* text_begin,const char* text_end,float wrap_width,const ImVec4* cpu_fine_clip_rect);
extern  void ImDrawList_AddPolyline(ImDrawList* self,const ImVec2* points,int num_points,ImU32 col,ImDrawFlags flags,float thickness);
extern  void ImDrawList_AddConvexPolyFilled(ImDrawList* self,const ImVec2* points,int num_points,ImU32 col);
extern  void ImDrawList_AddBezierCubic(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,const ImVec2 p4,ImU32 col,float thickness,int num_segments);
extern  void ImDrawList_AddBezierQuadratic(ImDrawList* self,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,ImU32 col,float thickness,int num_segments);
extern  void ImDrawList_AddImage(ImDrawList* self,ImTextureID user_texture_id,const ImVec2 p_min,const ImVec2 p_max,const ImVec2 uv_min,const ImVec2 uv_max,ImU32 col);
extern  void ImDrawList_AddImageQuad(ImDrawList* self,ImTextureID user_texture_id,const ImVec2 p1,const ImVec2 p2,const ImVec2 p3,const ImVec2 p4,const ImVec2 uv1,const ImVec2 uv2,const ImVec2 uv3,const ImVec2 uv4,ImU32 col);
extern  void ImDrawList_AddImageRounded(ImDrawList* self,ImTextureID user_texture_id,const ImVec2 p_min,const ImVec2 p_max,const ImVec2 uv_min,const ImVec2 uv_max,ImU32 col,float rounding,ImDrawFlags flags);
extern  void ImDrawList_PathClear(ImDrawList* self);
extern  void ImDrawList_PathLineTo(ImDrawList* self,const ImVec2 pos);
extern  void ImDrawList_PathLineToMergeDuplicate(ImDrawList* self,const ImVec2 pos);
extern  void ImDrawList_PathFillConvex(ImDrawList* self,ImU32 col);
extern  void ImDrawList_PathStroke(ImDrawList* self,ImU32 col,ImDrawFlags flags,float thickness);
extern  void ImDrawList_PathArcTo(ImDrawList* self,const ImVec2 center,float radius,float a_min,float a_max,int num_segments);
extern  void ImDrawList_PathArcToFast(ImDrawList* self,const ImVec2 center,float radius,int a_min_of_12,int a_max_of_12);
extern  void ImDrawList_PathBezierCubicCurveTo(ImDrawList* self,const ImVec2 p2,const ImVec2 p3,const ImVec2 p4,int num_segments);
extern  void ImDrawList_PathBezierQuadraticCurveTo(ImDrawList* self,const ImVec2 p2,const ImVec2 p3,int num_segments);
extern  void ImDrawList_PathRect(ImDrawList* self,const ImVec2 rect_min,const ImVec2 rect_max,float rounding,ImDrawFlags flags);
extern  void ImDrawList_AddCallback(ImDrawList* self,ImDrawCallback callback,void* callback_data);
extern  void ImDrawList_AddDrawCmd(ImDrawList* self);
extern  ImDrawList* ImDrawList_CloneOutput(ImDrawList* self);
extern  void ImDrawList_ChannelsSplit(ImDrawList* self,int count);
extern  void ImDrawList_ChannelsMerge(ImDrawList* self);
extern  void ImDrawList_ChannelsSetCurrent(ImDrawList* self,int n);
extern  void ImDrawList_PrimReserve(ImDrawList* self,int idx_count,int vtx_count);
extern  void ImDrawList_PrimUnreserve(ImDrawList* self,int idx_count,int vtx_count);
extern  void ImDrawList_PrimRect(ImDrawList* self,const ImVec2 a,const ImVec2 b,ImU32 col);
extern  void ImDrawList_PrimRectUV(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 uv_a,const ImVec2 uv_b,ImU32 col);
extern  void ImDrawList_PrimQuadUV(ImDrawList* self,const ImVec2 a,const ImVec2 b,const ImVec2 c,const ImVec2 d,const ImVec2 uv_a,const ImVec2 uv_b,const ImVec2 uv_c,const ImVec2 uv_d,ImU32 col);
extern  void ImDrawList_PrimWriteVtx(ImDrawList* self,const ImVec2 pos,const ImVec2 uv,ImU32 col);
extern  void ImDrawList_PrimWriteIdx(ImDrawList* self,ImDrawIdx idx);
extern  void ImDrawList_PrimVtx(ImDrawList* self,const ImVec2 pos,const ImVec2 uv,ImU32 col);
extern  void ImDrawList__ResetForNewFrame(ImDrawList* self);
extern  void ImDrawList__ClearFreeMemory(ImDrawList* self);
extern  void ImDrawList__PopUnusedDrawCmd(ImDrawList* self);
extern  void ImDrawList__TryMergeDrawCmds(ImDrawList* self);
extern  void ImDrawList__OnChangedClipRect(ImDrawList* self);
extern  void ImDrawList__OnChangedTextureID(ImDrawList* self);
extern  void ImDrawList__OnChangedVtxOffset(ImDrawList* self);
extern  int ImDrawList__CalcCircleAutoSegmentCount(ImDrawList* self,float radius);
extern  void ImDrawList__PathArcToFastEx(ImDrawList* self,const ImVec2 center,float radius,int a_min_sample,int a_max_sample,int a_step);
extern  void ImDrawList__PathArcToN(ImDrawList* self,const ImVec2 center,float radius,float a_min,float a_max,int num_segments);
extern  ImDrawData* ImDrawData_ImDrawData(void);
extern  void ImDrawData_destroy(ImDrawData* self);
extern  void ImDrawData_Clear(ImDrawData* self);
extern  void ImDrawData_DeIndexAllBuffers(ImDrawData* self);
extern  void ImDrawData_ScaleClipRects(ImDrawData* self,const ImVec2 fb_scale);
extern  ImFontConfig* ImFontConfig_ImFontConfig(void);
extern  void ImFontConfig_destroy(ImFontConfig* self);
extern  ImFontGlyphRangesBuilder* ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder(void);
extern  void ImFontGlyphRangesBuilder_destroy(ImFontGlyphRangesBuilder* self);
extern  void ImFontGlyphRangesBuilder_Clear(ImFontGlyphRangesBuilder* self);
extern  _Bool ImFontGlyphRangesBuilder_GetBit(ImFontGlyphRangesBuilder* self,size_t n);
extern  void ImFontGlyphRangesBuilder_SetBit(ImFontGlyphRangesBuilder* self,size_t n);
extern  void ImFontGlyphRangesBuilder_AddChar(ImFontGlyphRangesBuilder* self,ImWchar c);
extern  void ImFontGlyphRangesBuilder_AddText(ImFontGlyphRangesBuilder* self,const char* text,const char* text_end);
extern  void ImFontGlyphRangesBuilder_AddRanges(ImFontGlyphRangesBuilder* self,const ImWchar* ranges);
extern  void ImFontGlyphRangesBuilder_BuildRanges(ImFontGlyphRangesBuilder* self,ImVector_ImWchar* out_ranges);
extern  ImFontAtlasCustomRect* ImFontAtlasCustomRect_ImFontAtlasCustomRect(void);
extern  void ImFontAtlasCustomRect_destroy(ImFontAtlasCustomRect* self);
extern  _Bool ImFontAtlasCustomRect_IsPacked(ImFontAtlasCustomRect* self);
extern  ImFontAtlas* ImFontAtlas_ImFontAtlas(void);
extern  void ImFontAtlas_destroy(ImFontAtlas* self);
extern  ImFont* ImFontAtlas_AddFont(ImFontAtlas* self,const ImFontConfig* font_cfg);
extern  ImFont* ImFontAtlas_AddFontDefault(ImFontAtlas* self,const ImFontConfig* font_cfg);
extern  ImFont* ImFontAtlas_AddFontFromFileTTF(ImFontAtlas* self,const char* filename,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges);
extern  ImFont* ImFontAtlas_AddFontFromMemoryTTF(ImFontAtlas* self,void* font_data,int font_size,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges);
extern  ImFont* ImFontAtlas_AddFontFromMemoryCompressedTTF(ImFontAtlas* self,const void* compressed_font_data,int compressed_font_size,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges);
extern  ImFont* ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(ImFontAtlas* self,const char* compressed_font_data_base85,float size_pixels,const ImFontConfig* font_cfg,const ImWchar* glyph_ranges);
extern  void ImFontAtlas_ClearInputData(ImFontAtlas* self);
extern  void ImFontAtlas_ClearTexData(ImFontAtlas* self);
extern  void ImFontAtlas_ClearFonts(ImFontAtlas* self);
extern  void ImFontAtlas_Clear(ImFontAtlas* self);
extern  _Bool ImFontAtlas_Build(ImFontAtlas* self);
extern  void ImFontAtlas_GetTexDataAsAlpha8(ImFontAtlas* self,unsigned char** out_pixels,int* out_width,int* out_height,int* out_bytes_per_pixel);
extern  void ImFontAtlas_GetTexDataAsRGBA32(ImFontAtlas* self,unsigned char** out_pixels,int* out_width,int* out_height,int* out_bytes_per_pixel);
extern  _Bool ImFontAtlas_IsBuilt(ImFontAtlas* self);
extern  void ImFontAtlas_SetTexID(ImFontAtlas* self,ImTextureID id);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesDefault(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesKorean(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesJapanese(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesChineseFull(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesCyrillic(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesThai(ImFontAtlas* self);
extern  const ImWchar* ImFontAtlas_GetGlyphRangesVietnamese(ImFontAtlas* self);
extern  int ImFontAtlas_AddCustomRectRegular(ImFontAtlas* self,int width,int height);
extern  int ImFontAtlas_AddCustomRectFontGlyph(ImFontAtlas* self,ImFont* font,ImWchar id,int width,int height,float advance_x,const ImVec2 offset);
extern  ImFontAtlasCustomRect* ImFontAtlas_GetCustomRectByIndex(ImFontAtlas* self,int index);
extern  void ImFontAtlas_CalcCustomRectUV(ImFontAtlas* self,const ImFontAtlasCustomRect* rect,ImVec2* out_uv_min,ImVec2* out_uv_max);
extern  _Bool ImFontAtlas_GetMouseCursorTexData(ImFontAtlas* self,ImGuiMouseCursor cursor,ImVec2* out_offset,ImVec2* out_size,ImVec2 out_uv_border[2],ImVec2 out_uv_fill[2]);
extern  ImFont* ImFont_ImFont(void);
extern  void ImFont_destroy(ImFont* self);
extern  const ImFontGlyph* ImFont_FindGlyph(ImFont* self,ImWchar c);
extern  const ImFontGlyph* ImFont_FindGlyphNoFallback(ImFont* self,ImWchar c);
extern  float ImFont_GetCharAdvance(ImFont* self,ImWchar c);
extern  _Bool ImFont_IsLoaded(ImFont* self);
extern  const char* ImFont_GetDebugName(ImFont* self);
extern  void ImFont_CalcTextSizeA(ImVec2 *pOut,ImFont* self,float size,float max_width,float wrap_width,const char* text_begin,const char* text_end,const char** remaining);
extern  const char* ImFont_CalcWordWrapPositionA(ImFont* self,float scale,const char* text,const char* text_end,float wrap_width);
extern  void ImFont_RenderChar(ImFont* self,ImDrawList* draw_list,float size,ImVec2 pos,ImU32 col,ImWchar c);
extern  void ImFont_RenderText(ImFont* self,ImDrawList* draw_list,float size,ImVec2 pos,ImU32 col,const ImVec4 clip_rect,const char* text_begin,const char* text_end,float wrap_width,_Bool cpu_fine_clip);
extern  void ImFont_BuildLookupTable(ImFont* self);
extern  void ImFont_ClearOutputData(ImFont* self);
extern  void ImFont_GrowIndex(ImFont* self,int new_size);
extern  void ImFont_AddGlyph(ImFont* self,const ImFontConfig* src_cfg,ImWchar c,float x0,float y0,float x1,float y1,float u0,float v0,float u1,float v1,float advance_x);
extern  void ImFont_AddRemapChar(ImFont* self,ImWchar dst,ImWchar src,_Bool overwrite_dst);
extern  void ImFont_SetGlyphVisible(ImFont* self,ImWchar c,_Bool visible);
extern  _Bool ImFont_IsGlyphRangeUnused(ImFont* self,unsigned int c_begin,unsigned int c_last);
extern  ImGuiViewport* ImGuiViewport_ImGuiViewport(void);
extern  void ImGuiViewport_destroy(ImGuiViewport* self);
extern  void ImGuiViewport_GetCenter(ImVec2 *pOut,ImGuiViewport* self);
extern  void ImGuiViewport_GetWorkCenter(ImVec2 *pOut,ImGuiViewport* self);
extern  ImGuiPlatformIO* ImGuiPlatformIO_ImGuiPlatformIO(void);
extern  void ImGuiPlatformIO_destroy(ImGuiPlatformIO* self);
extern  ImGuiPlatformMonitor* ImGuiPlatformMonitor_ImGuiPlatformMonitor(void);
extern  void ImGuiPlatformMonitor_destroy(ImGuiPlatformMonitor* self);
extern  ImGuiPlatformImeData* ImGuiPlatformImeData_ImGuiPlatformImeData(void);
extern  void ImGuiPlatformImeData_destroy(ImGuiPlatformImeData* self);
extern  int igGetKeyIndex(ImGuiKey key);
extern  void igLogText(const char *fmt, ...);
extern  void ImGuiTextBuffer_appendf(struct ImGuiTextBuffer *buffer, const char *fmt, ...);
extern  float igGET_FLT_MAX();
extern  float igGET_FLT_MIN();
extern  ImVector_ImWchar* ImVector_ImWchar_create();
extern  void ImVector_ImWchar_destroy(ImVector_ImWchar* self);
extern  void ImVector_ImWchar_Init(ImVector_ImWchar* p);
extern  void ImVector_ImWchar_UnInit(ImVector_ImWchar* p);

]]