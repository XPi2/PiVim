local utils = require('utils')

-- Map leader to space
vim.g.mapleader = ' '

-- Set default indent
local indent = 4

local fn = vim.fn
local cmd = vim.cmd
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Enable theme, syntax & term colorscheme
require('nightfox').load('nordfox')
vim.opt.termguicolors = true

-- Fix indentation
cmd 'filetype plugin indent on' -- Enable file-specific indentation rules
utils.opt('b', 'expandtab', true) -- Convert tabs to spaces
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'shiftround', true) -- When shifting lines, round the indentation to the nearest multiple of shiftwidth
-- Search
utils.opt('o', 'ignorecase', true) -- Ignore cases
utils.opt('o', 'smartcase', true) -- Automatically switch search to case-sensitive when search query contains an uppercase letter
-- Text rendering
cmd 'syntax enable' -- Enable syntax highlighting
utils.opt('o', 'scrolloff', 5) -- The number of screen lines to keep above and below the cursor
-- Files
utils.opt('o', 'hidden', true) -- Hidde files in the background instead of closing them
utils.opt('o', 'splitbelow', true) -- Split window horizontal below by default
utils.opt('o', 'splitright', true) -- Split window vertical to the right by default
-- UI
utils.opt('w', 'number', true) -- Show line number by default
utils.opt('w', 'relativenumber', true) -- Show relative line number to the cursor
utils.opt('o', 'wildmode', 'list:longest') -- Display command line’s tab complete options as a menu

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Setup plugins
require("nvim-tree").setup {}
require("bufferline").setup {}
require('lualine').setup {
  options = {
    theme = "nightfox"
  }
}
require("telescope").setup()
require("telescope").load_extension "file_browser"

-- require('Comment').setup()
