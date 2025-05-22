return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                path_display = { 'truncate' },
            },
        }
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, { desc = '[?] Find Document [S]ymbols' })
    end,
}
