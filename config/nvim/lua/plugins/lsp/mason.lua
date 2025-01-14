local lang_list = {
  "lua_ls",
  "tsserver",
  "html",
  "cssls",
}

local linter_list = {
  "stylua",
  "prettier",
  "eslint_d",
}

local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = lang_list,
  automatic_installation = true,
})

mason_null_ls.setup({
  ensure_installed = linter_list,
  automatic_installation = true,
})
