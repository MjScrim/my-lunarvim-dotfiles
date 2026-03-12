lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  { "mfussenegger/nvim-jdtls" }, 
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        filter = "octagon"
      })
    end,
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = "espresso"
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_transparent_background = true
      vim.g.sonokai_better_performance = true
    end
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
      require("kanagawa").setup({
        transparent = true,
        theme = "dragon",
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { bg = "none" },
            LazyNormal = { bg = "none" },
            MasonNormal = { bg = "none" },
          }
        end,
      })
    end,
  }, 
  { "stevearc/dressing.nvim" },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline",
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        floating_window = true,
        hint_enable = false,
        handler_opts = {
          border = "rounded"
        }
      })
    end
  },
  {
  "echasnovski/mini.indentscope",
    version = false,
    config = function()
      require("mini.indentscope").setup({
        draw = {
          delay = 100,
          animation = require("mini.indentscope").gen_animation.exponentialIn,
        },
        symbol = "│",
        options = { try_as_border = true },
      })
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border = "rounded",
        },
      })
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      animate = {
        enabled = true,
      },
      left = {
        {
          ft = "NvimTree",
          title = "NvimTree",
          size = { width = 30 },
        },
      },
      bottom = {
        {
          ft = "toggleterm",
          title = "Terminal",
          size = { height = 15 },
        },
      },
    }
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out",
        timeout = 3000,
        background_colour = "#000000",
        render = "minimal",
      })
      vim.notify = notify
    end
  },
  {
    "Bekaboo/dropbar.nvim",
    config = function()
      require("dropbar").setup()
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end
      })
    end
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens"
    },
    config = function()
      require("scrollbar").setup({
        handlers = {
          diagnostic = true,
          search = true,
          gitsigns = true,
        },
      })
    end
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
        }
      },
    }
  },
  {
  "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "NONE",
        inactive = false,
      },
    }
  }, 
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end
  }
}
