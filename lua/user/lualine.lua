lvim.builtin.lualine.options = {
  theme = "horizon",
  globalstatus = true,
  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
}

lvim.builtin.lualine.sections.lualine_a = {
  { "mode", separator = { left = "" }, right_padding = 2 },
}

lvim.builtin.lualine.sections.lualine_z = {
  { "location", separator = { right = "" }, left_padding = 2 },
}

lvim.builtin.lualine.sections.lualine_b = { "branch", "diff", "diagnostics" }
lvim.builtin.lualine.sections.lualine_c = {
  { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]" } }
}
