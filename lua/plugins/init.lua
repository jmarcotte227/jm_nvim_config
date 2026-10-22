-- ============================================================================
-- Native Plugin Declarations (vim.pack) - Neovim 0.12
-- ============================================================================
if not vim.pack then
  vim.notify(
    "vim.pack is not available in this Neovim version.\n" ..
    "Neovim 0.12+ is required for native package management.\n" ..
    "Current version: " .. tostring(vim.version()),
    vim.log.levels.WARN
  )
  return
end

local gh = function(repo)
  return "https://github.com/" .. repo
end

-- Declare and bootstrap plugins using Neovim 0.12's built-in package manager
vim.pack.add({
  -- Core libraries & dependencies
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("MunifTanjim/nui.nvim"),

  -- UI & Themes
  gh("catppuccin/nvim"),
  gh("nvim-lualine/lualine.nvim"),
  gh("saghen/blink.indent"),

  -- Navigation & Explorer
  { src = gh("nvim-neo-tree/neo-tree.nvim"), version = "v3.x" },
  { src = gh("nvim-telescope/telescope.nvim"), version = "0.1.8" },
  gh("nvim-telescope/telescope-ui-select.nvim"),

  -- Mason & Language Server Protocol (LSP)
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("neovim/nvim-lspconfig"),

  -- Formatting
  gh("stevearc/conform.nvim"),

  -- Autocompletion (blink.cmp + snippets)
  { src = gh("saghen/blink.cmp"), version = vim.version.range("^1") },
  gh("rafamadriz/friendly-snippets"),

  -- Treesitter & Utilities
  gh("nvim-treesitter/nvim-treesitter"),
  gh("ThePrimeagen/vim-be-good"),
}, { confirm = false })

-- ============================================================================
-- Load Individual Plugin Configurations
-- ============================================================================
require("plugins.catppuccin")
require("plugins.lualine")
require("plugins.blink-indent")
require("plugins.telescope")
require("plugins.nvimtree")
require("plugins.lsp-config")
require("plugins.conform")
require("plugins.blink-cmp")
require("plugins.treesitter")
