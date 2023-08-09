return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'ColorScheme',
    config = function()
      require('lualine').setup({
        options = {
          -- @usage 'rose-pine' | 'rose-pine-alt'
          theme = 'rose-pine-alt',
        },
        sections = {
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            {
              'filename',
              path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
            'diagnostics'
          },

          lualine_x = { 'filetype' },
          lualine_y = {},
        }
      })
    end
  },
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup()
    end
  },

  {
    "laytan/cloak.nvim",
    config = function()
      require("cloak").setup({
        enabled = true,
        cloak_character = "*",
        highlight_group = "Comment",
        patterns = {
          {
            file_pattern = {
              ".env*",
              "wrangler.toml",
              ".dev.vars",
            },
            cloak_pattern = "=.+"
          },
        },
      })
      vim.keymap.set("n", "<leader>ct", "<cmd>:CloakToggle<cr>",
        { silent = true, noremap = true }
      )
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("trouble").setup {
        icons = true,
        -- your configuration comes here
        -- or leave it empty to , the default settings
        -- refer to the configuration section below
      }

      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        { silent = true, noremap = true }
      )
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "css", "elixir", "eex" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false
        },
      }
    end
  },
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-context",
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          css = true,
          mode = "background",
          tailwind = true,
          virtualtext = "■",
          always_update = true
        },
      }
    end
  },


}