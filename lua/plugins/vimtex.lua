-- ============================================================================
-- VimTeX Configuration
-- ============================================================================
-- Global options for VimTeX (must be set on vim.g)

-- PDF viewer settings
if vim.fn.has("win32") == 1 then
  -- SumatraPDF is the standard viewer on Windows with forward/inverse search support
  vim.g.vimtex_view_general_viewer = "SumatraPDF"
  vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
else
  -- Sensible default for Linux / macOS
  vim.g.vimtex_view_method = "zathura"
end

-- Compiler method (latexmk is standard)
vim.g.vimtex_compiler_method = "latexmk"

-- Quickfix behavior: 0 = do not automatically open quickfix window on warnings (only errors)
vim.g.vimtex_quickfix_mode = 0

-- Prevent hiding LaTeX syntax symbols (conceal)
vim.g.vimtex_syntax_conceal_disable = 1
