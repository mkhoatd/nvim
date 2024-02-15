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
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
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
        requires = "neovim/nvim-lspconfig"
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
    use { "junegunn/fzf", run = "./install --bin" }
    use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { "nvim-tree/nvim-web-devicons" }
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
