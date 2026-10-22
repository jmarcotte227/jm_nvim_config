-- ============================================================================
-- Core Options & Leader Key
-- ============================================================================
-- Mapleader must be defined before any mappings are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Indentation and Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Line Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Enable bytecode cache for faster startup
if vim.loader then
  vim.loader.enable()
end

-- ============================================================================
-- Load Plugins & Configurations
-- ============================================================================
require("plugins")
