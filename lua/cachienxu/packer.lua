vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage it self
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use("nvim-telescope/telescope-file-browser.nvim") -- Telescope file browser

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use('nvim-treesitter/nvim-treesitter', { run = 'TSUpdate' })
  use('nvim-treesitter/playground')
  -- LSP Support
  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  -- Autocompletion
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')

  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- LSP Ui
  use("glepnir/lspsaga.nvim")            -- LSP UIs
  use("onsails/lspkind-nvim")            -- vscode-like pictograms

  use("kyazdani42/nvim-web-devicons")    -- Icons
  use("akinsho/nvim-bufferline.lua")     -- Tabs
  use("norcalli/nvim-colorizer.lua")     -- Color code highlightings
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostic, code actions..
  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim")             -- Git blame & browse
  use({ "akinsho/toggleterm.nvim", tag = "*" })
  use("windwp/nvim-autopairs")           -- Autopairs
  use("windwp/nvim-ts-autotag")          -- Autotag
  use("hoob3rt/lualine.nvim")            -- Statusline
end)
