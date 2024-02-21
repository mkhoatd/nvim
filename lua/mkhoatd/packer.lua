local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

local packer = require("packer")

packer.init({
    log = { level = 'trace' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
})


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use { 'theprimeagen/harpoon', branch = 'harpoon2',
        requires = { { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" } }
    }

    use {
        'mbbill/undotree',
    }

    use('tpope/vim-fugitive')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'williamboman/mason.nvim',
    }

    use {
        'williamboman/mason-lspconfig.nvim',
    }
    use {
        'neovim/nvim-lspconfig',
    }
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')
    use {
        'folke/neodev.nvim',
    }
    use {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    }
    use {
        'lvimuser/lsp-inlayhints.nvim',
    }

    use('RRethy/vim-illuminate')

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    }

    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        }
    }
    use { "nvim-tree/nvim-web-devicons" }
    use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use { 'ojroques/nvim-bufdel' }
    use { 'mfussenegger/nvim-dap',
        requires = { "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            'leoluz/nvim-dap-go' },
    }

    use { 'olexsmir/gopher.nvim',
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
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })
    use {
        "benlubas/molten-nvim",
        run = ":UpdateRemotePlugins",
        config = function()
            vim.g.molten_output_win_max_height = 12
        end
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
