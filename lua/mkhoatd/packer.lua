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

local function check_os()
    return package.config:sub(1, 1) == "\\" and "win" or "unix"
end


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
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
    use('theprimeagen/harpoon')
    use {
        'mbbill/undotree',
        config = function()
            local undodir = os.getenv("HOME") .. "/.vim/undodir"
            local fn = vim.fn
            if fn.empty(fn.glob(undodir)) > 0 then
                if check_os() == "win" then
                    local command = "mkdir " .. undodir .. " -force"
                    local pipe = io.popen("powershell -command -", "w")
                    pipe:write(command)
                    pipe.close()
                else
                    local command = "mkdir -p " .. undodir
                    os.execute(command)
                end
            end
            vim.opt.undodir = undodir
        end
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
        config = function()
            require('mason').setup()
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { 'lua_ls', 'pyright', 'dockerls', 'docker_compose_language_service', 'jsonls', 'marksman', 'spectral', 'sqlls', 'gopls', 'golangci_lint_ls' },
                automatic_installation = true,
            }
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.pyright.setup {}
            lspconfig.dockerls.setup {}
            lspconfig.docker_compose_language_service.setup {}
            lspconfig.jsonls.setup {}
            lspconfig.marksman.setup {}
            lspconfig.spectral.setup {}
            lspconfig.sqlls.setup {}
            lspconfig.gopls.setup {}
            lspconfig.golangci_lint_ls.setup {}
        end
    }
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')
    use {
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup({
                library = {
                    enabled = true,
                    runtime = true,
                    types = true,
                    plugins = true
                },

            })
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            })
        end
    }
    use {
        'm4xshen/autoclose.nvim',
        config = function ()
            require("autoclose").setup()
        end

}
    use ('nvim-tree/nvim-web-devicons')


    if packer_bootstrap then
        require('packer').sync()
    end
end)
