require("mkhoatd")

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'mbbill/undotree',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'folke/neodev.nvim',
    'ojroques/nvim-bufdel',
    'nvim-tree/nvim-web-devicons',
    'mbbill/undotree',
    'nvim-treesitter/playground',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'lvimuser/lsp-inlayhints.nvim',
    'RRethy/vim-illuminate',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = { 'nvim-lspconfig' },
        config = function()
            require('lspsaga').setup({})
        end,
    },
    {
        'SmiteshP/nvim-navic',
        dependencies = {
            'neovim/nvim-lspconfig'
        }
    },
    {
        'SmiteshP/nvim-navbuddy',
        dependencies = {
            'neovim/nvim-lspconfig',
            'SmiteshP/nvim-navic',
            'MunifTanjim/nui.nvim',
            'numToStr/Comment.nvim',        -- Optional
            'nvim-telescope/telescope.nvim' -- Optional
        }
    },
    {
        'ibhagwan/fzf-lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = { "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            'leoluz/nvim-dap-go' },
    },
    {
        'olexsmir/gopher.nvim',
        config = function()
            require("gopher").setup {
                commands = {
                    dlv = "dlv",
                    go = "go",
                    gomodifytags = "gomodifytags",
                    gotests = "~/go/bin/gotests", -- also you can set custom command path
                    impl = "impl",
                    iferr = "iferr",
                },
            }
        end
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "dockerfile", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                ignore_install = { "help" },

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,


                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    },
    {
        'theprimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    }
})

require('mkhoatd.plugins.colors')
require('mkhoatd.plugins.comment')
require('mkhoatd.plugins.dap')
require('mkhoatd.plugins.fugitive')
require('mkhoatd.plugins.harpoon')
require('mkhoatd.plugins.lsp')
require('mkhoatd.plugins.lspsaga')
require('mkhoatd.plugins.navic')
require('mkhoatd.plugins.telescope')
require('mkhoatd.plugins.treesitter')
require('mkhoatd.plugins.undotree')

vim.opt.swapfile = false

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    vim.g.neovide_window_blurred = true
    --[[     vim.g.neovide_transparency = 0.95 ]]
    vim.g.neovide_floating_blur_amount_x = 20.0
    vim.g.neovide_floating_blur_amount_y = 20.0
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
end
