return {
	"rose-pine/neovim",
	priority = 1000,
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			dark_variant = "moon",
			disable_background = true,
			disable_italic = true,
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
