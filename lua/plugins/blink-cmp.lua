-- ============================================================================
-- blink.cmp Configuration (Fast autocompletion - replaces nvim-cmp)
-- ============================================================================
local ok, blink = pcall(require, "blink.cmp")
if not ok then
  return
end

blink.setup({
  -- Keymap configuration matching your previous nvim-cmp setup
  keymap = {
    preset = "super-tab",
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true,
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "rounded" },
    },
    menu = {
      border = "rounded",
    },
  },

  -- Automatically show function arguments / signatures when filling in parentheses
  signature = {
    enabled = true,
    window = {
      border = "rounded",
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
