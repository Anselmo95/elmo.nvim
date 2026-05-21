local M = {}

M.setup  = function ()
  local colors = require("elmo.colors").get_colors()

  local groups = {
    --
    -- See :h highlight-groups
    --
    ColorColumn    = { bg = colors.black_olive }, -- Columns set with 'colorcolumn'
    -- Conceal        = { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         = { }, -- Character under the cursor
    -- CurSearch      = { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        = { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       = { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   = { bg = colors.dark_charcoal }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     = { bg = colors.dark_charcoal }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      = { fg = colors.macaroni_and_cheese }, -- Directory names (and other special names in listings)
    DiffAdd        = { fg = colors.screamin_green }, -- Diff mode: Added line |diff.txt|
    DiffChange     = { fg = colors.laser_lemon }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     = { fg = colors.jelly_bean }, -- Diff mode: Deleted line |diff.txt|
    DiffText       = { fg = colors.pastel_red, bg = colors.blood_red, bold = true }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer    = { fg = colors.vampire_black }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     = { bg = colors.fashion_fuchsia }, -- Cursor in a focused terminal
    -- TermCursorNC   = { }, -- Cursor in an unfocused terminal
    ErrorMsg       = { fg = colors.bright_gray, bg = colors.electric_red }, -- Error messages on the command line
    VertSplit      = { fg = colors.black_olive, bg = colors.black_olive }, -- Column separating vertically split windows
    Folded         = { fg = colors.taupe_gray, bg = colors.black_olive }, -- Line used for closed folds
    FoldColumn     = { fg = colors.taupe_gray, bg = colors.black_olive }, -- 'foldcolumn'
    SignColumn     = { bg = colors.black_olive }, -- Column where |signs| are displayed
    IncSearch      = { fg = colors.argent, bg = colors.brandeis_blue }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     = { fg = colors.argent, bg = colors.brandeis_blue }, -- |:substitute| replacement text highlighting
    LineNr         = { fg = colors.taupe_gray, bg = colors.black_olive }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    = { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    = { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   = { fg = colors.taupe_gray, bg = colors.black_olive }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold = { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign = { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     = { fg = colors.raspberry, bold = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        = { fg = colors.mint_green, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        = { }, -- Area for messages and cmdline
    -- MsgSeparator   = { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        = { fg = colors.argent, bg = colors.true_blue }, -- |more-prompt|
    NonText        = { fg = colors.philippine_gray, bold = true }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         = { fg = colors.gainsboro, bg = colors.vampire_black }, -- Normal text
    -- NormalFloat    = { }, -- Normal text in floating windows.
    -- FloatBorder    = { }, -- Border of floating windows.
    -- FloatTitle     = { }, -- Title of floating windows.
    -- NormalNC       = { }, -- normal text in non-current windows
    Pmenu          = { fg = colors.platinum, bg = colors.vampire_black }, -- Popup menu: Normal item.
    PmenuSel       = { fg = colors.jelly_bean, bg = colors.outer_space, bold = true }, -- Popup menu: Selected item.
    -- PmenuKind      = { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   = { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     = { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  = { }, -- Popup menu: Selected item "extra text"
    PmenuSbar      = { bg = colors.outer_space }, -- Popup menu: Scrollbar.
    PmenuThumb     = { bg = colors.jelly_bean }, -- Popup menu: Thumb of the scrollbar.
    -- Question       = { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   = { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         = { fg = colors.argent, bg = colors.raspberry }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     = { fg = colors.black_olive }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       = { fg = colors.argent, bg = colors.jelly_bean }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       = { fg = colors.argent, bg = colors.true_blue }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     = { fg = colors.argent, bg = colors.violet_ryb }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      = { fg = colors.argent, bg = colors.spanish_viridian }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     = { fg = colors.platinum, bg = colors.black_olive }, -- Status line of current window
    StatusLineNC   = { fg = colors.css_gray, bg = colors.black_olive }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        = { fg = colors.css_gray, bg = colors.dark_charcoal }, -- Tab pages line, not active tab page label
    TabLineFill    = { fg = colors.cookies_and_cream, bg = colors.dark_charcoal }, -- Tab pages line, where there are no labels
    TabLineSel     = { fg = colors.platinum, bg = colors.dark_charcoal, bold = true }, -- Tab pages line, active tab page label
    Title          = { fg = colors.mint_green }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         = { fg = colors.argent, bg = colors.sea_blue }, -- Visual mode selection
    VisualNOS      = { fg = colors.argent, bg = colors.ucla_blue }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     = { fg = colors.argent, bg = colors.true_blue }, -- Warning messages
    -- Whitespace     = { fg = colors.blood_red }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   = { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       = { fg = colors.raspberry, bg = colors.black_olive, bold = true }, -- Current match in 'wildmenu' completion
    -- WinBar         = { }, -- Window bar of current window
    -- WinBarNC       = { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        = { fg = colors.davys_grey }, -- Any comment

    Constant       = { fg = colors.medium_sky_blue }, -- (*) Any constant
    String         = { fg = colors.light_cobalt_blue }, --   A string constant: "this is a string"
    Character      = { fg = colors.light_cobalt_blue }, --   A character constant: 'c', '\n'
    Number         = { fg = colors.medium_sky_blue }, --   A number constant: 234, 0xff
    Boolean        = { fg = colors.medium_sky_blue }, --   A boolean constant: TRUE, false
    Float          = { fg = colors.medium_sky_blue }, --   A floating point constant: 2.3e10

    Identifier     = { fg = colors.white }, -- (*) Any variable name
    Function       = { fg = colors.macaroni_and_cheese }, --   Function name (also: methods for classes)

    Statement      = { fg = colors.yellow_green_crayola }, -- (*) Any statement
    Conditional    = { fg = colors.yellow_green_crayola }, --   if, then, else, endif, switch, etc.
    Repeat         = { fg = colors.yellow_green_crayola }, --   for, do, while, etc.
    Label          = { fg = colors.white }, --   case, default, etc.
    Operator       = { fg = colors.yellow_green_crayola }, --   "sizeof", "+", "*", etc.
    -- Keyword        = { }, --   any other keyword
    -- Exception      = { }, --   try, catch, throw

    PreProc        = { fg = colors.navajo_white }, -- (*) Generic Preprocessor
    -- Include        = { }, --   Preprocessor #include
    -- Define         = { }, --   Preprocessor #define
    -- Macro          = { }, --   Same as Define
    -- PreCondit      = { }, --   Preprocessor #if, #else, #endif, etc.

    Type           = { fg = colors.pearl_aqua }, -- (*) int, long, char, etc.
    -- StorageClass   = { }, --   static, register, volatile, etc.
    -- Structure      = { }, --   struct, union, enum, etc.
    -- Typedef        = { }, --   A typedef

    Special        = { fg = colors.pale_chestnut }, -- (*) Any special symbol
    -- SpecialChar    = { }, --   Special character in a constant
    -- Tag            = { }, --   You can use CTRL-] on this
    -- Delimiter      = { }, --   Character that needs attention
    -- SpecialComment = { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          = { }, --   Debugging statements

    Underlined     = { underline = true }, -- Text that stands out, HTML links
    -- Ignore         = { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          = { fg = colors.bright_gray, bg = colors.electric_red }, -- Any erroneous construct
    Todo           = { fg = colors.navajo_white }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            = { } , -- Used for highlighting "text" references
    -- LspReferenceRead            = { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           = { } , -- Used for highlighting "write" references
    -- LspCodeLens                 = { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        = { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter = { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            = { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             = { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             = { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             = { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               = { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError = { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  = { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  = { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  = { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    = { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   = { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    = { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    = { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    = { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      = { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    = { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     = { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     = { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     = { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       = { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        = { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         = { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         = { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         = { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           = { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- ["@text.literal"]

    -- ["@text.literal"]    = { }, -- Comment
    -- ["@text.reference"]  = { }, -- Identifier
    -- ["@text.title"]      = { }, -- Title
    ["@text.uri"]        = { link = "Underlined" }, -- Underlined
    ["@text.underline"]  = { link = "Underlined" }, -- Underlined
    ["@text.todo"]       = { link = "Todo" }, -- Todo
    ["@comment"]         = { link = "Comment" }, -- Comment
    -- ["@punctuation"]     = { }, -- Delimiter
    -- ["@constant"]        = { }, -- Constant
    -- ["@constant.builtin"]= { }, -- Special
    -- ["@constant.macro"]  = { }, -- Define
    -- ["@define"]          = { }, -- Define
    -- ["@macro"]           = { }, -- Macro
    ["@string"]          = { link = "String" }, -- String
    -- ["@string.escape"]   = { }, -- SpecialChar
    -- ["@string.special"]  = { }, -- SpecialChar
    ["@character"]       = { link = "Character" }, -- Character
    -- ["@character.special"] = { }, -- SpecialChar
    ["@number"]          = { link = "Number" }, -- Number
    ["@boolean"]         = { link = "Boolean" }, -- Boolean
    ["@float"]           = { link = "Float" }, -- Float
    -- ["@function"]        = { }, -- Function
    -- ["@function.builtin"]= { }, -- Special
    -- ["@function.macro"]  = { }, -- Macro
    -- ["@parameter"]       = { }, -- Identifier
    -- ["@method"]          = { }, -- Function
    -- ["@field"]           = { }, -- Identifier
    -- ["@property"]        = { }, -- Identifier
    -- ["@constructor"]     = { }, -- Special
    -- ["@conditional"]     = { }, -- Conditional
    -- ["@repeat"]          = { }, -- Repeat
    -- ["@label"]           = { }, -- Label
    -- ["@operator"]        = { }, -- Operator
    -- ["@keyword"]         = { }, -- Keyword
    -- ["@exception"]       = { }, -- Exception
    ["@variable"]        = { link = "Identifier" }, -- Identifier
    ["@type"]            = { link = "Type" }, -- Type
    -- ["@type.definition"] = { }, -- Typedef
    -- ["@storageclass"]    = { }, -- StorageClass
    -- ["@structure"]       = { }, -- Structure
    -- ["@namespace"]       = { }, -- Identifier
    -- ["@include"]         = { }, -- Include
    ["@preproc"]         = { link = "PreProc" }, -- PreProc
    -- ["@debug"]           = { }, -- Debug
    -- ["@tag"]             = { }, -- Tag

    -- VHDL
    ["@module.vhdl"]             = { link = "@variable" },
    ["@type.builtin.vhdl"]       = { link = "@Type" },
    ["@constant.vhdl"]           = { link = "@variable" },
    ["@type.definition.vhdl"]    = { link = "@variable" },
    ["@lsp.type.namespace.vhdl"] = { link = "@label.vhdl" },
    ["@label.vhdl"]              = { link = "@variable" },
    ["@constructor.vhdl"]        = { link = "@keyword.vhdl" },
    ["@constant.builtin.vhdl"]   = { link = "@number.vhdl" },
    ["@operator.vhdl"]           = { link = "@keyword.vhdl" },

    -- Cpp
    ["@lsp.type.namespace.cpp"]      = { link = "Function" },
  }

  return groups

end

return M

    -- qfLineNr = { fg = colors.outer_space },
    -- qfSeparator = { fg = colors.sonic_silver },
    -- EasyMotionTarget = { fg = colors.laser_lemon, bold = true },
    -- EasyMotionTarget2First = { fg = colors.raspberry },
    -- EasyMotionTarget2Second = { fg = colors.laser_lemon },
    -- RFCType = { fg = colors.davys_grey },
    -- RFCID = { fg = colors.rajah },
    -- RFCTitle = { fg = colors.bright_gray },
    -- RFCDelim = { fg = colors.davys_grey },
    -- SignifySignAdd = { fg = colors.screamin_green, bg = colors.black_olive, bold = true },
    -- SignifySignDelete = { fg = colors.jelly_bean, bg = colors.black_olive, bold = true },
    -- SignifySignChange = { fg = colors.laser_lemon, bg = colors.black_olive, bold = true },
    -- StartifyBracket = { fg = colors.davys_grey },
    -- StartifyFile = { fg = colors.bright_gray },
    -- StartifyFooter = { fg = colors.davys_grey },
    -- StartifyHeader = { fg = colors.light_green },
    -- StartifyNumber = { fg = colors.rajah },
    -- StartifyPath = { fg = colors.philippine_gray },
    -- StartifySection = { fg = colors.pale_chestnut },
    -- StartifySelect = { fg = colors.sky_blue_crayola },
    -- StartifySlash = { fg = colors.davys_grey },
    -- StartifySpecial = { fg = colors.davys_grey },

-- vi:nowrap
