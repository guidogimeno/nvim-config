vim.cmd("colorscheme gruvbox")

vim.cmd([[
	augroup CustomCommentCollor
		autocmd!
		autocmd VimEnter * hi comment guifg=#2ea542
	augroup END
]])

vim.cmd([[
	augroup CustomHI
		autocmd!
		autocmd VimEnter * NoMatchParen 
	augroup END
]])

