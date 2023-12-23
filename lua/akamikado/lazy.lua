local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- mason.nvim package manager
	{
		"williamboman/mason.nvim",
	},

	-- telescope.nvim for fuzzy finding
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {{'nvim-lua/plenary.nvim'}}
	},

	-- treesitter.nvim
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
	},

    -- neodev.nvim auto-configures lua-language-server 
    {
        "folke/neodev.nvim",
        opts = {} 
    },

    -- nvim-lspconfig
    {'neovim/nvim-lspconfig'},

    -- mason-lspconfig.nvim
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('lsp-zero').extend_lspconfig()

            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {'tsserver','asm_lsp', 'bashls', 'clangd', 'cssls', 'dockerls', 'docker_compose_language_service', 'html', 'jsonls', 'eslint', 'lua_ls', 'marksman','pylsp', 'sqlls',},
                handlers = {
                    require('lsp-zero').default_setup,
                },
            })
        end
    },

    -- nvim-cmp for auto-completion
    {
        'hrsh7th/nvim-cmp'
    },

    {
        'hrsh7th/cmp-nvim-lsp'
    },

    {
        "hrsh7th/cmp-path"
    },

    {
        "hrsh7th/cmp-buffer"
    },

    -- lsp-zero autoconfigures some lsp servers
    {   'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x'
    },

    -- luansip for snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- cmp_luasnip for autocompletion of luasnip
    {
        "saadparwaiz1/cmp_luasnip"
    },

    -- mini.pairs for autocompletion of brackets, quotes, etc.
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {},
    },

    -- mini.comment for better commenting
    {
        'echasnovski/mini.comment'
    },

    -- undotree
    {
        'mbbill/undotree'
    },

    -- colorscheme
    {
        'Mofiqul/dracula.nvim'
    },

    -- for formatting
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        lazy = true,
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>cF",
                function()
                    require("conform").format({ formatters = { "injected" } })
                end,
                mode = { "n", "v" },
                desc = "Format Injected Langs",
            },
        },
    },

    -- finishes html tags
    {
	    'windwp/nvim-ts-autotag',
	    opts = {},
    },

    -- starting page
    {
	    'nvimdev/dashboard-nvim',
	    event = 'VimEnter',
	    config = function()
		    require('dashboard').setup {}
	    end,
	    dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },

    -- will show indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- lua-line
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local drac = require('lualine.themes.dracula')
            require('lualine').setup({
                options = {
                    theme = drac,
                },
            })
    	end
    },

    --nvim-lint
    {
        'mfussenegger/nvim-lint',
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },
        opts = {
            linters_by_ft = {
                ['*'] = {'global linter'},
            }
        },
        config = function ()
        end
    }

})

