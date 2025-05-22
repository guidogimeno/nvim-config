return {
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" }, -- Required for zenbones
    priority = 1000, -- Load early to avoid flashes
    config = function()
      vim.cmd.colorscheme("zenbones") -- Use "zenbones-dark" for dark variant
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenbones",
    },
  },
}
