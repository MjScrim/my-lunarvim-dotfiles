#lvim.transparent_window = true

lvim.colorscheme = "default"

lvim.autocommands = {
  {
    "ColorScheme",
    {
      callback = function()
        local fg = "#ebdbb2"
        local yellow = "#fabd2f"
        local gray_types = "#a89984"
        local bg = "#1d2021"

        local hl = function(group, color, gui)
          vim.api.nvim_set_hl(0, group, { 
            fg = color, 
            bg = nil, 
            bold = (gui == "bold"), 
            italic = (gui == "italic") 
          })
        end

        vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = bg })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282828" })

        local yellow_groups = {
          "Statement", "Keyword", "Conditional", "Repeat", "Label", 
          "Exception", "Structure", "Typedef", "@keyword", 
          "@keyword.return", "@keyword.function", "@keyword.operator",
          "@keyword.storage", "@type.qualifier"
        }
        for _, group in ipairs(yellow_groups) do hl(group, yellow) end

        local gray_groups = {
          "Type", "StorageClass", "@type", "@type.builtin", 
          "@storageclass", "@keyword.modifier", "@keyword.type"
        }
        for _, group in ipairs(gray_groups) do hl(group, gray_types) end

        local neutrals = {
          "Identifier", "Function", "Constant", "Number", "Operator", "Delimiter",
          "@variable", "@variable.parameter", "@property", "@function", "@function.call",
          "@operator", "@punctuation.bracket", "@punctuation.delimiter", "@constant",
          "@number", "@variable.member"
        }
        for _, group in ipairs(neutrals) do hl(group, fg) end

        hl("String", "#b8bb26")
        hl("@string", "#b8bb26")
        hl("Comment", "#928374", "italic")
        hl("@comment", "#928374", "italic")
      end,
    },
  },
}

lvim.lsp.on_attach_callback = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
end

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
