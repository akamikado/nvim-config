require'nvim-treesitter.configs'.setup {
	ensure_installed = {"bash", "html", "json", "markdown", "markdown_inline", "regex", "tsx", "python", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
