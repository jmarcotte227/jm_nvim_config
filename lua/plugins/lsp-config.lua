return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- vim.lsp.config(
      --           "pyright",{}
      --       )
      -- vim.lsp.config(
      --           "lua_ls",{}
      --       )
      vim.lsp.enable("pyright")
      vim.lsp.enable("lua_ls")
      
        vim.diagnostic.config({
          virtual_lines = {
            current_line = true
          }
        })
      vim.keymap.set('n','K', vim.lsp.buf.hover, {})
      vim.keymap.set('n','<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n','<leader>gr', vim.lsp.buf.references, {})
      vim.keymap.set({'n','v'},'<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

