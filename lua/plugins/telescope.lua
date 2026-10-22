-- ============================================================================
-- Telescope Configuration
-- ============================================================================
local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

telescope.setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

pcall(telescope.load_extension, "ui-select")
