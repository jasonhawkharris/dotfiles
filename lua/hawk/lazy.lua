-- @diagnostic disable: undefined-global
--This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    {
        'ojroques/nvim-hardline',
        config = function()
            require("hawk.plugin.hardline")
        end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            require("hawk.plugin.vim-fugitive")
        end
    },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },

        -- If you have a recent version of lazy.nvim, you don't need to add this!
        config = function()
            require("hawk.plugin.sg")
        end
    },
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("hawk.plugin.autoclose")
        end
    },
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("hawk.plugin.windows")
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("hawk.plugin.gitsigns")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            local telescope = require("telescope")

            -- first setup telescope
            telescope.setup({
                -- your config
            })

            -- then load the extension
            telescope.load_extension("live_grep_args")
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("hawk.plugin.treesitter")
        end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            require("hawk.plugin.harpoon")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            transparent_mode = true
        }
    },
    {
        'rose-pine/nvim',
        config = function()
            vim.cmd("colorscheme rose-pine")
            require("hawk.plugin.colors")
        end
    },
    {
        'max397574/better-escape.nvim',
        config = function()
            require("hawk.plugin.better-escape")
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        'mbbill/undotree',
        config = function()
            require("hawk.plugin.undotree")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("hawk.plugin.telescope")
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("hawk.plugin.nvim-tree")
        end
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.theta'.config)
        end
    },
    'ThePrimeagen/vim-be-good',
    'b3nj5m1n/kommentary',
    'sunjon/shade.nvim',
    'nvim-treesitter/playground',
    "BurntSushi/ripgrep",
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }
})
