return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', opt = true }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'RishabhRD/popfix' }
  use { 'RishabhRD/nvim-lsputils' }

  -- Autocomple
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'hrsh7th/vim-vsnip' }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Start screen
  use { 'mhinz/vim-startify' }

  -- Terminal
  use {"akinsho/toggleterm.nvim"}

  -- Buffer / Tabs
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- Status bar
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'}

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Better Escape for no lag jk
  use {
    "max397574/better-escape.nvim",
    config = function()
        require("better_escape").setup()
    end,
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
    require("project_nvim").setup {
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", "Cargo.toml", ".svn", "Makefile", "package.json" },
        -- ignore_lsp = {"rust-analyzer"},
        silent_chdir = false
    }
    end
  }

  -- Syntax
  use 'tomlion/vim-solidity'

 -- Themes
  use 'EdenEast/nightfox.nvim'
end)

