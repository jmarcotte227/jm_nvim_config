return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.pylint.with({
          -- This passes the flag directly to the pylint command line
          extra_args = { "--generated-members=cv2.*" },
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
