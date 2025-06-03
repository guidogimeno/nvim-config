return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({
            cmd = "Trouble"
        })

        vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
    end
}
