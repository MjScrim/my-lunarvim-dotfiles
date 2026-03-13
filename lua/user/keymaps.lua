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

lvim.builtin.which_key.mappings["r"]["q"] = {
  function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    dapui.close()
    dap.terminate()
    
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("DAP Terminal") or name:match("dap%-terminal") then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end

    dap.repl.close()
  end,
  "Exit Debug."
}

lvim.builtin.which_key.mappings["d"] = nil

lvim.builtin.terminal.open_mapping = "<c-z>"

lvim.keys.normal_mode["n"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["m"] = "<cmd>BufferLineCyclePrev<CR>"
