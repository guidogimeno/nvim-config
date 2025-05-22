return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim',       opts = {} },
  'hrsh7th/cmp-nvim-lsp',
    },
config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                    map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
                    map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                    map('gh', vim.lsp.buf.hover, '[G]oto [H]over')
                    map('<leader>vca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                    map('vrn', vim.lsp.buf.rename, '[R]e[n]ame')
                    map('<leader>f', vim.lsp.buf.format, '[F]ormat')
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            local servers = {
                html = {},
                jsonls = {},
                gopls = {},
                ts_ls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = 'Replace',
                            },
                            diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
            }

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua',
            })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }
            
            require('mason-lspconfig').setup {
                ensure_installed = {
                    "gopls",
                    "eslint",
                    "ts_ls",
                    "html",
                    "jsonls",
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
  },
}
