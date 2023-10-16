-- Get Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- User Plugins
vim.cmd("source " .. vim.fn.expand("~/.config/usuim/plugins.vim"))

-- Concatenate plugin tables
function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

-- Plugins
local plugins = {
  -- Nvim Transparent
  {
    "xiyaowong/nvim-transparent",
    config = function ()
      require('plugins.transparent')
    end
  },

  -- NvimTree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { "nvim-tree/nvim-web-devicons"},
    config = function()
      require('plugins.nvimtree')
    end
  },

  -- Terminal
  {
    'Usuim/toggleterm.nvim'
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
      require("plugins.treesitter")
    end
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require("plugins.dashboard")
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require("plugins.bufferline")
    end
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require("plugins.lualine")
    end
  },

  -- Lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-lua/lsp_extensions.nvim",
      "RishabhRD/popfix",
      "RishabhRD/nvim-lsputils",
    },
    config = function ()
      require('plugins.lsp')
    end
  },

  -- NvimCmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol"
    },
    config = function ()
      require('plugins.cmp')
    end
  },

  -- Crates
  {
    "saecki/crates.nvim",
    config = function ()
      require('crates').setup()
    end
  },
  {
    "cespare/vim-toml"
  },

  --Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    }
  },

  -- Renamer
  {
    "filipdutescu/renamer.nvim",
    config = function ()
      require('renamer').setup()
    end
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function ()
      require('plugins.refactoring')
    end
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nyarthan/telescope-code-actions.nvim"
    },
    config = function ()
      require('plugins.telescope')
    end
  },

  -- Nvim comment
  {
    "terrortylor/nvim-comment",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    config = function ()
      require('plugins.comment')
    end
  },

  -- Neoformat
  {
    "sbdchd/neoformat"
  },

  -- Search and Replace
  {
    "Usuim/searchbox.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  },

  -- Trim on save
  {
    "cappyzawa/trim.nvim",
    config = function ()
      require('trim').setup({
        patterns = {
          [[%s/\s\+$//e]],
          [[%s/\($\n\s*\)\+\%$//]],
          [[%s/\%^\n\+//]],
        },
      })
    end
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    dependencies = {
      "tpope/vim-surround"
    },
    config = function ()
      require('nvim-autopairs').setup()
    end
  },

  -- Identline
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    config = function ()
     require('plugins.ident')
    end
  },

  -- Git
  {
    "tpope/vim-fugitive"
  },
  {
    "tpope/vim-repeat"
  },
  {
    "mhinz/vim-signify"
  },

  -- ToDo
  {
    "folke/todo-comments.nvim",
    config = function ()
      require('plugins.todo')
    end
  },

  -- Workspaces
  {
    "natecraddock/workspaces.nvim",
    config = function ()
      require('plugins.workspaces')
    end
  },

  -- Fzf
  {
    'junegunn/fzf',
    run = ":call fzf#install()"
  },

  -- Fidget
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function ()
      require("fidget").setup()
    end
  },

  -- CCC
  {
    "uga-rosa/ccc.nvim",
    config = function ()
      require("plugins.ccc")
    end
  },
}

local allPlugins = TableConcat(plugins, UserPlugins)

require("lazy").setup(allPlugins)
