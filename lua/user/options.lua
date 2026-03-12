lvim.transparent_window = true

lvim.colorscheme = "sonokai"

lvim.builtin.illuminate.active = false

lvim.builtin.which_key.setup.window.border = "rounded"
lvim.builtin.which_key.setup.window.margin = { 1, 3, 1, 3 }
lvim.builtin.which_key.setup.window.padding = { 1, 2, 1, 2 }
lvim.builtin.which_key.setup.window.winblend = 10

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  cmd = { "clangd" },
})

lvim.builtin.gitsigns.opts.signs = {
  add = { text = "▎" },
  change = { text = "▎" },
  delete = { text = "" },
  topdelete = { text = "" },
  changedelete = { text = "▎" },
  untracked = { text = "▎" },
}

lvim.builtin.bufferline.options = {
  mode = "buffers",
  always_show_bufferline = true,

  indicator = {
    style = "icon",
    icon = "▎",
  },

  separator_style = "slant",

  show_buffer_close_icons = false,
  show_close_icon = false,

  diagnostics = "nvim_lsp",

  offsets = {
    {
      filetype = "NvimTree",
      text = "󰙅 Explorer",
      highlight = "Directory",
      text_align = "left",
    },
  },
}

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
  end,
})

vim.lsp.inlay_hint.enable(true)
vim.opt.clipboard = "unnamedplus"

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.signcolumn = "auto"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.numberwidth = 2

if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ["+"] = '/mnt/c/bin/win32yank.exe -i --crlf',
      ["*"] = '/mnt/c/bin/win32yank.exe -i --crlf',
    },
    paste = {
      ["+"] = '/mnt/c/bin/win32yank.exe -o --lf',
      ["*"] = '/mnt/c/bin/win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })
