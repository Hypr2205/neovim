local status, mason = pcall(require, "mason")
if not status then
  return
end

local status2, masonlsp = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

mason.setup({})

masonlsp.setup({
  automatic_installation = true,
  ensure_installed = {
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "tsserver",
    "tailwindcss",
  },
})
