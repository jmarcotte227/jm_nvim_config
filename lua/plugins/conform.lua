-- ============================================================================
-- conform.nvim Configuration (Formatting - replaces none-ls)
-- ============================================================================
local ok, conform = pcall(require, "conform")
if not ok then
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

-- Format keymap: preserves <leader>gf in both normal and visual modes
vim.keymap.set({ "n", "v" }, "<leader>gf", function()
  conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer (conform)" })
