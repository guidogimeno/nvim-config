vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- split screen and navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { noremap = true })

-- copy and paste from clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")

-- move code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- scroll
vim.keymap.set("n", "}", "<C-d>zz")
vim.keymap.set("n", "{", "<C-u>zz")

-- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep buffer after pasting into the highligh term
vim.keymap.set("x", "p", "\"_dP")

-- search and replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- dap
vim.keymap.set("n", "<F5>", ":lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<F6>", ":lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F7>", ":lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<F8>", ":lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require('dap-go').debug_test()<CR>")
vim.keymap.set("n", "<leader>ds", ":lua require('dap').terminate()<CR>")

-- golang shortcuts
vim.keymap.set("n", "<leader>ie", "i    if err != nil {<CR>return err<CR>}<CR><Esc>")

