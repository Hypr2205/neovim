local status, nls = pcall(require, "null-ls")

if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

nls.setup({
	sources = {
		-- Formatting
		fmt.prettierd,
		fmt.eslint_d,
		fmt.prettier.with({
			filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
		}),
		fmt.stylua,

		-- Diagnostics
		dgn.eslint_d.with({
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		dgn.shellcheck,

		-- Code Actions
		cda.eslint_d,
		cda.shellcheck,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
