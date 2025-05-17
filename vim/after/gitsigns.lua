-- Define GitSigns highlights with specific colors
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "", ctermbg = "", ctermfg = "Green" }) -- Green for add
vim.api.nvim_set_hl(0, "GitSignsAddLn", { fg = "", bg = "#d0ffd0", ctermbg = "LightGreen" }) -- Light green background
vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#00ff00", ctermfg = "Green" }) -- Green for add line number
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffff00", bg = "", ctermbg = "", ctermfg = "Yellow" }) -- Yellow for change
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = "", bg = "#ffffc0", ctermbg = "LightYellow" }) -- Light yellow background
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#ffff00", ctermfg = "Yellow" }) -- Yellow for change line number
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#ffa500", bg = "", ctermbg = "", ctermfg = "DarkYellow" }) -- Orange for changedelete
vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { fg = "", bg = "#ffecd0", ctermbg = "Yellow" }) -- Light orange background
vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { fg = "#ffa500", ctermfg = "DarkYellow" }) -- Orange for changedelete line number
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "", ctermbg = "", ctermfg = "Red" }) -- Red for delete
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { fg = "", bg = "#ffd0d0", ctermbg = "LightRed" }) -- Light red background
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#ff0000", ctermfg = "Red" }) -- Red for delete line number
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#ff0000", bg = "", ctermbg = "", ctermfg = "Red" }) -- Red for topdelete
vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { fg = "", bg = "#ffd0d0", ctermbg = "LightRed" }) -- Light red background for topdelete
vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { fg = "#ff0000", ctermfg = "Red" }) -- Red for topdelete line number

-- Setup GitSigns
require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {

    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {

    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'

    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    style = 'minimal',
    relative = 'cursor',
    row = 0,

    col = 1
  },
}
