require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "tsx", "json", "toml", "html", "css", "c", "cpp", "lua", "rust" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	sync_install = false,
	auto_install = true,
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
