vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(e)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = e.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        map('gh', vim.lsp.buf.hover, '[G]oto [H]over')
        map('<leader>vca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('vrn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>f', vim.lsp.buf.format, '[F]ormat')
    end
})
