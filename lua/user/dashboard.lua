local dashboard = require("alpha.themes.dashboard")

local frames = {
    {
        "  .-------------------------.  ",
        " | .----------------------. |  ",
        " | |      MIX TAPE A      | |  ",
        " | |   ( | )      ( | )   | |  ",
        " | |    `-'        `-'    | |  ",
        " | `----------------------' |  ",
        "  `--.--.____________.--.--'   ",
        "     `._.'          `._.'      "
    },
    {
        "  .-------------------------.  ",
        " | .----------------------. |  ",
        " | |      MIX TAPE A      | |  ",
        " | |   ( / )      ( / )   | |  ",
        " | |    `-'        `-'    | |  ",
        " | `----------------------' |  ",
        "  `--.--.____________.--.--'   ",
        "     `._.'          `._.'      "
    },
    {
        "  .-------------------------.  ",
        " | .----------------------. |  ",
        " | |      MIX TAPE A      | |  ",
        " | |   ( - )      ( - )   | |  ",
        " | |    `-'        `-'    | |  ",
        " | `----------------------' |  ",
        "  `--.--.____________.--.--'   ",
        "     `._.'          `._.'      "
    },
    {
        "  .-------------------------.  ",
        " | .----------------------. |  ",
        " | |      MIX TAPE A      | |  ",
        " | |   ( \\ )      ( \\ )   | |  ",
        " | |    `-'        `-'    | |  ",
        " | `----------------------' |  ",
        "  `--.--.____________.--.--'   ",
        "     `._.'          `._.'      "
    }
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

vim.api.nvim_set_hl(0, "AlphaTapeColor", { fg = "#00E5FF", bold = true })
lvim.builtin.alpha.dashboard.section.header.opts = {
    hl = "AlphaTapeColor",
    position = "center"
}
lvim.builtin.alpha.dashboard.section.header.val = frames[1]

local function get_footer_lines()
    local hour = tonumber(os.date("%H"))
    local greeting = "Boa noite."
    if hour < 12 then
        greeting = "Bom dia."
    elseif hour < 18 then
        greeting = "Boa tarde."
    end

    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local perf = "⚡ Lunarvim carregou " .. stats.loaded .. "/" .. stats.count .. " plugins em " .. ms .. "ms"

    return {
        greeting,
        "",
        perf
    }
end

lvim.builtin.alpha.dashboard.section.footer.opts.hl = "String"
lvim.builtin.alpha.dashboard.section.footer.opts.position = "center"
lvim.builtin.alpha.dashboard.section.footer.val = get_footer_lines()

lvim.builtin.alpha.dashboard.section.buttons.val = {
    dashboard.button("f", "  Buscar Arquivo", ":Telescope find_files<CR>"),
    dashboard.button("n", "  Novo Arquivo", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Projetos", ":Telescope projects<CR>"),
    dashboard.button("r", "  Arquivos Recentes", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "󰊄  Buscar Texto", ":Telescope live_grep<CR>"),
    dashboard.button("c", "  Configurações", ":e ~/.config/lvim/config.lua<CR>"),
    dashboard.button("q", "󰗼  Sair", ":qa<CR>"),
}

local frame_idx = 1
local timer = vim.loop.new_timer()

if timer then
    vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
            timer:start(0, 150, vim.schedule_wrap(function()
                if vim.bo.filetype ~= "alpha" then
                    timer:stop()
                    return
                end
                frame_idx = (frame_idx % #frames) + 1
                require("alpha.themes.dashboard").section.header.val = frames[frame_idx]
                require("alpha").redraw()
            end))
        end,
    })

    vim.api.nvim_create_autocmd("BufLeave", {
        callback = function()
            if vim.bo.filetype == "alpha" then
                timer:stop()
            end
        end,
    })
end
