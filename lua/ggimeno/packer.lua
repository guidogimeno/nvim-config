-- This file can be loaded by calling 'lua require('plugins')' from your init.vim

-- Only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

  	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.2',
  		requires = { {'nvim-lua/plenary.nvim'} }
  	}

  	use({ 'rose-pine/neovim', as = 'rose-pine' })

	use('theprimeagen/harpoon')

	use({
	'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end
	})

	use{'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end
			},
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use {'fatih/vim-go'}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {"akinsho/toggleterm.nvim", tag = '*'}

	use "terrortylor/nvim-comment"

	use('tpope/vim-fugitive')

	use {"mfussenegger/nvim-dap"}

	use {"leoluz/nvim-dap-go"}

	use {"rcarriga/nvim-dap-ui"}

	use {"theHamsta/nvim-dap-virtual-text"}

	use {"Exafunction/codeium.vim"}
end)
