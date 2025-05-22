vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- split screen and navigation
vim.keymap.set('n', '<leader>v', ':vsplit<CR><C-w>l', { noremap = true })
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', { noremap = true })

-- move code
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- quickfix list TODO: buscar otro keymap
-- vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>')
-- vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>')

-- scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- keep search terms in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- keep buffer after pasting into the highligh term
vim.keymap.set('x', 'p', '"_dP')

-- search and replace
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- golang shortcuts
vim.keymap.set('n', '<leader>ie', 'i    if err != nil {<CR>return err<CR>}<CR><Esc>')
