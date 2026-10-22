-- ============================================================================
-- Mason & LSP Configuration (Neovim 0.12 Native LSP API)
-- ============================================================================
local ok_mason, mason = pcall(require, "mason")
if not ok_mason then
  return
end

-- 1. Initialize Mason
mason.setup()

-- 2. Configure Mason LSP bridge
local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lsp then
  mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "pyright" },
  })
end

-- 3. Configure Completion Capabilities for LSP Servers via blink.cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

-- Apply completion capabilities to all servers
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- 4. Server Specific Configurations
vim.lsp.config("pyright", {})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Enable language servers
vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")

-- 5. Diagnostic Configuration
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
  float = {
    source = "always",
    border = "rounded",
  },
})

-- Diagnostic float keymap
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- 6. LSP Keybindings
local function set_lsp_keymaps(bufnr)
  local opts = bufnr and { buffer = bufnr } or {}
  vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP Hover" }))
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP Definition" }))
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP References" }))
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP Code Action" }))
  vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "LSP Signature Help" }))
end

-- Bind globally
set_lsp_keymaps(nil)

-- Bind buffer-locally when an LSP server attaches
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(event)
    set_lsp_keymaps(event.buf)
  end,
})
