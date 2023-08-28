return require("nvim-treesitter.configs").setup {
	ensure_installed = {"lua", "vim", "go", "javascript"},
	highlight = {
		enable = false,
	}
}
