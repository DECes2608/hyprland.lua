-- dagzirvesi.lua
-- Duvar kağıdındaki dağ fotoğrafından türetilen renk paleti:
-- Koyu teal gökyüzü + turuncu kayalıklar + beyaz kar zirvesi

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "dagzirvesi"
vim.o.termguicolors = true

local c = {
  -- Arka planlar (transparan için NONE)
  bg        = "NONE",
  bg1       = "#1a2a2e",   -- float, popup arka planı
  bg2       = "#1f3035",   -- satır numarası, cursorline
  bg3       = "#243a3f",   -- seçim, visual
  bg4       = "#2e5060",   -- border, separator

  -- Ön planlar
  fg        = "#dce8e8",   -- ana metin (kar beyazı)
  fg2       = "#a8c8c8",   -- yorumlar, soluk metin
  fg3       = "#6a9898",   -- satır numaraları
  fg4       = "#3d6868",   -- çok soluk (yok sayılan)

  -- Vurgu: turuncu (kayalık tonu)
  orange    = "#c4622a",   -- cursor, eşleşme, önemli
  orange2   = "#e07840",   -- keyword, bold vurgu
  orange3   = "#f0a060",   -- string, açık turuncu
  orange4   = "#a04820",   -- hata alt çizgisi

  -- Teal (gökyüzü tonu)
  teal      = "#2e7f7f",   -- fonksiyon adları
  teal2     = "#48a8a8",   -- tip, class
  teal3     = "#8fb8b8",   -- özel değişkenler
  teal4     = "#c0dede",   -- operator

  -- Kar beyazı tonları
  snow      = "#dce8e8",   -- normal metin
  snow2     = "#f0f8f8",   -- bold metin

  -- Semantik
  red       = "#c04848",   -- hata
  yellow    = "#c8a050",   -- uyarı
  green     = "#5a9a6a",   -- bilgi / hint
  blue      = "#4888b8",   -- özel
}

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Temel editör ──────────────────────────────────────────
hi("Normal",          { fg = c.fg,    bg = c.bg })
hi("NormalFloat",     { fg = c.fg,    bg = c.bg1 })
hi("NormalNC",        { fg = c.fg2,   bg = c.bg })
hi("FloatBorder",     { fg = c.bg4,   bg = c.bg1 })
hi("ColorColumn",     { bg = c.bg2 })
hi("Cursor",          { fg = c.bg1,   bg = c.orange })
hi("CursorLine",      { bg = c.bg2 })
hi("CursorLineNr",    { fg = c.orange2, bold = true })
hi("LineNr",          { fg = c.fg3 })
hi("SignColumn",      { fg = c.fg3,   bg = c.bg })
hi("VertSplit",       { fg = c.bg4,   bg = c.bg })
hi("WinSeparator",    { fg = c.bg4,   bg = c.bg })
hi("StatusLine",      { fg = c.fg2,   bg = c.bg1 })
hi("StatusLineNC",    { fg = c.fg4,   bg = c.bg1 })
hi("TabLine",         { fg = c.fg3,   bg = c.bg1 })
hi("TabLineFill",     { bg = c.bg1 })
hi("TabLineSel",      { fg = c.orange2, bg = c.bg2, bold = true })
hi("Pmenu",           { fg = c.fg,    bg = c.bg1 })
hi("PmenuSel",        { fg = c.snow2, bg = c.bg3, bold = true })
hi("PmenuSbar",       { bg = c.bg2 })
hi("PmenuThumb",      { bg = c.orange })
hi("WildMenu",        { fg = c.snow2, bg = c.bg3 })

-- ── Arama & seçim ─────────────────────────────────────────
hi("Visual",          { bg = c.bg3 })
hi("VisualNOS",       { bg = c.bg3 })
hi("Search",          { fg = c.bg1,   bg = c.orange2 })
hi("IncSearch",       { fg = c.bg1,   bg = c.orange, bold = true })
hi("CurSearch",       { fg = c.bg1,   bg = c.orange, bold = true })
hi("Substitute",      { fg = c.bg1,   bg = c.orange3 })
hi("MatchParen",      { fg = c.orange, bold = true, underline = true })

-- ── Sözdizimi ─────────────────────────────────────────────
hi("Comment",         { fg = c.fg2,   italic = true })
hi("Constant",        { fg = c.orange3 })
hi("String",          { fg = c.orange3 })
hi("Character",       { fg = c.orange3 })
hi("Number",          { fg = c.teal3 })
hi("Boolean",         { fg = c.orange2, bold = true })
hi("Float",           { fg = c.teal3 })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.teal2, bold = true })
hi("Statement",       { fg = c.orange2 })
hi("Keyword",         { fg = c.orange2, bold = true })
hi("Conditional",     { fg = c.orange2 })
hi("Repeat",          { fg = c.orange2 })
hi("Label",           { fg = c.teal2 })
hi("Operator",        { fg = c.teal4 })
hi("Exception",       { fg = c.red })
hi("PreProc",         { fg = c.teal3 })
hi("Include",         { fg = c.teal2 })
hi("Define",          { fg = c.teal2 })
hi("Macro",           { fg = c.teal3 })
hi("Type",            { fg = c.teal2 })
hi("StorageClass",    { fg = c.orange2 })
hi("Structure",       { fg = c.teal2 })
hi("Typedef",         { fg = c.teal2 })
hi("Special",         { fg = c.orange3 })
hi("Underlined",      { underline = true })
hi("Bold",            { bold = true })
hi("Italic",          { italic = true })
hi("Error",           { fg = c.red })
hi("Todo",            { fg = c.orange, bold = true })

-- ── Diagnostic ────────────────────────────────────────────
hi("DiagnosticError",            { fg = c.red })
hi("DiagnosticWarn",             { fg = c.yellow })
hi("DiagnosticInfo",             { fg = c.teal2 })
hi("DiagnosticHint",             { fg = c.fg3 })
hi("DiagnosticUnderlineError",   { sp = c.red,    underline = true })
hi("DiagnosticUnderlineWarn",    { sp = c.yellow, underline = true })
hi("DiagnosticUnderlineInfo",    { sp = c.teal2,  underline = true })
hi("DiagnosticUnderlineHint",    { sp = c.fg3,    underline = true })
hi("DiagnosticVirtualTextError", { fg = c.red,    italic = true })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow, italic = true })
hi("DiagnosticVirtualTextInfo",  { fg = c.teal2,  italic = true })
hi("DiagnosticVirtualTextHint",  { fg = c.fg3,    italic = true })

-- ── Git işaretleri (gitsigns) ─────────────────────────────
hi("GitSignsAdd",    { fg = c.green })
hi("GitSignsChange", { fg = c.orange2 })
hi("GitSignsDelete", { fg = c.red })

-- ── Telescope ─────────────────────────────────────────────
hi("TelescopeNormal",         { fg = c.fg,    bg = c.bg1 })
hi("TelescopeBorder",         { fg = c.bg4,   bg = c.bg1 })
hi("TelescopePromptBorder",   { fg = c.orange, bg = c.bg1 })
hi("TelescopePromptNormal",   { fg = c.snow2, bg = c.bg1 })
hi("TelescopePromptPrefix",   { fg = c.orange })
hi("TelescopeSelection",      { fg = c.snow2, bg = c.bg3, bold = true })
hi("TelescopeMatching",       { fg = c.orange2, bold = true })
hi("TelescopeResultsTitle",   { fg = c.teal2 })
hi("TelescopePreviewTitle",   { fg = c.teal3 })

-- ── Neo-tree / Nvim-tree ───────────────────────────────────
hi("NeoTreeNormal",           { fg = c.fg,  bg = c.bg1 })
hi("NeoTreeNormalNC",         { fg = c.fg2, bg = c.bg1 })
hi("NeoTreeRootName",         { fg = c.orange2, bold = true })
hi("NeoTreeDirectoryName",    { fg = c.teal2 })
hi("NeoTreeDirectoryIcon",    { fg = c.teal })
hi("NeoTreeFileIcon",         { fg = c.fg3 })
hi("NeoTreeGitAdded",         { fg = c.green })
hi("NeoTreeGitModified",      { fg = c.orange2 })
hi("NeoTreeGitDeleted",       { fg = c.red })
hi("NeoTreeIndentMarker",     { fg = c.bg4 })
hi("NeoTreeExpander",         { fg = c.fg3 })
hi("NeoTreeCursorLine",       { bg = c.bg2 })

-- ── Which-key ─────────────────────────────────────────────
hi("WhichKey",          { fg = c.orange2 })
hi("WhichKeyGroup",     { fg = c.teal2 })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.fg4 })
hi("WhichKeyFloat",     { bg = c.bg1 })
hi("WhichKeyBorder",    { fg = c.bg4, bg = c.bg1 })

-- ── Indent blankline ──────────────────────────────────────
hi("IblIndent",         { fg = c.bg4 })
hi("IblScope",          { fg = c.bg4 })

-- ── Treesitter ────────────────────────────────────────────
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.teal3, italic = true })
hi("@variable.parameter",    { fg = c.fg2 })
hi("@function",              { fg = c.teal2, bold = true })
hi("@function.builtin",      { fg = c.teal2 })
hi("@function.call",         { fg = c.teal2 })
hi("@method",                { fg = c.teal2 })
hi("@keyword",               { fg = c.orange2, bold = true })
hi("@keyword.return",        { fg = c.orange2, bold = true })
hi("@keyword.function",      { fg = c.orange2 })
hi("@conditional",           { fg = c.orange2 })
hi("@repeat",                { fg = c.orange2 })
hi("@string",                { fg = c.orange3 })
hi("@string.escape",         { fg = c.orange, bold = true })
hi("@number",                { fg = c.teal3 })
hi("@boolean",               { fg = c.orange2, bold = true })
hi("@type",                  { fg = c.teal2 })
hi("@type.builtin",          { fg = c.teal2, italic = true })
hi("@constructor",           { fg = c.teal2 })
hi("@property",              { fg = c.fg2 })
hi("@field",                 { fg = c.fg2 })
hi("@comment",               { fg = c.fg2, italic = true })
hi("@punctuation.bracket",   { fg = c.teal4 })
hi("@punctuation.delimiter", { fg = c.teal4 })
hi("@tag",                   { fg = c.orange2 })
hi("@tag.attribute",         { fg = c.teal3 })
hi("@tag.delimiter",         { fg = c.fg3 })

-- ── Lualine (tema tablosu) ────────────────────────────────
-- plugins/dagzirvesi-lualine.lua içinde ayrıca tanımlanıyor
