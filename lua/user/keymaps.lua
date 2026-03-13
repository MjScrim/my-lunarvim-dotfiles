lvim.keys.normal_mode["<C-a>"] = "ggVG"
lvim.keys.normal_mode["d"] = '"_d'
lvim.keys.visual_mode["d"] = '"_d'
lvim.keys.visual_mode["<C-c>"] = '"+y'
lvim.keys.visual_mode["<C-v>"] = '"+p'
lvim.keys.visual_mode["<C-x>"] = '"+d'
lvim.keys.insert_mode["<C-v>"] = "<C-r>+"

lvim.builtin.which_key.mappings["p"] = {
  name = "Java",
  i = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
}

lvim.builtin.which_key.mappings["r"] = lvim.builtin.which_key.mappings["d"]
lvim.builtin.which_key.mappings["r"].name = "Debug/Run"

lvim.builtin.which_key.mappings["d"] = nil

lvim.builtin.terminal.open_mapping = "<c-z>"

lvim.keys.normal_mode["n"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["m"] = "<cmd>BufferLineCyclePrev<CR>"
