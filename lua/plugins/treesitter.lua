-- ============================================================================
-- Treesitter Configuration
-- ============================================================================
-- In Neovim 0.12+, tree-sitter highlighting is natively supported by core.
-- Automatically start tree-sitter for filetypes that have a parser installed.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Backward compatibility for nvim-treesitter parser management if configs is present
local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  configs.setup({
    autoinstall = true,
    highlight = { enable = true },
    indent = { enable = true },
  })
end
