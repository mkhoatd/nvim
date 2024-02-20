-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
local cmp_ui = {
    icons = true,
    lspkind_text = true,
    style = "default",            -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
}
local cmp_style = cmp_ui.style
local cmp = require('cmp')

local field_arrangement = {
    atom = { "kind", "abbr", "menu" },
    atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
    -- default fields order i.e completion word + item.kind + item.kind icons
    fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

    format = function(_, item)
        local icons = {
            Namespace = "󰌗",
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰆧",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈚",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰊄",
            Table = "",
            Object = "󰅩",
            Tag = "",
            Array = "[]",
            Boolean = "",
            Number = "",
            Null = "󰟢",
            String = "󰉿",
            Calendar = "",
            Watch = "󰥔",
            Package = "",
            Copilot = "",
            Codeium = "",
            TabNine = "",
        }
        local icon = (cmp_ui.icons and icons[item.kind]) or ""

        if cmp_style == "atom" or cmp_style == "atom_colored" then
            icon = " " .. icon .. " "
            item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
            item.kind = icon
        else
            icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
            item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
        end

        return item
    end,
}

local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local options = {
    completion = {
        completeopt = "menu,menuone",
    },
    window = {
        completion = {
            side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
            winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            scrollbar = false,
        },
        documentation = {
            border = border "CmpDocBorder",
            winhighlight = "Normal:CmpDoc",
        },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    formatting = formatting_style,
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    preselect = cmp.PreselectMode.None,
    confirmation = {
        completeopt = 'menu,menuone,noinsert',
        default_behavior = cmp.ConfirmBehavior.Insert,
    },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
    options.window.completion.border = border "CmpBorder"
end

require('neodev').setup({})

cmp.setup(options)

local function merge(t1, t2)
    for i = 1, #t2 do t1[#t1 + 1] = t2[i] end
    return t1
end

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

local function mapping(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    local buf_def = "<Cmd>lua vim.lsp.buf.definition()<CR>"
    local buf_def_split = "<Cmd>sp | lua vim.lsp.buf.definition()<CR>"
    local buf_def_vsplit = "<Cmd>vsp | lua vim.lsp.buf.definition()<CR>"
    local buf_hover = "<Cmd>lua vim.lsp.buf.hover()<CR>"
    local buf_incoming_calls = "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>"
    local buf_incoming_calls_opts = merge({ desc = "List all callers" }, opts)
    local buf_rename = "<Cmd>lua vim.lsp.buf.rename()<CR>"
    local buf_rename_opts = merge({ desc = "Rename symbol" }, opts)
    local buf_sig_help = "<Cmd>lua vim.lsp.buf.signature_help()<CR>"
    local buf_sig_help_opts = merge({ desc = "Sig help (cursor over arg)" }, opts)
    local buf_type = "<Cmd>lua vim.lsp.buf.type_definition()<CR>"
    local buf_type_opts = merge({ desc = "Go to 'type' definition" }, opts)
    local diag_next = "<Cmd>lua vim.diagnostic.goto_next()<CR>"
    local diag_next_opts = merge({ desc = "Go to next diagnostic" }, opts)
    local diag_open_float = "<Cmd>lua vim.diagnostic.open_float()<CR>"
    local diag_open_float_opts = merge({ desc = "Float current diag" }, opts)
    local diag_prev = "<Cmd>lua vim.diagnostic.goto_prev()<CR>"
    local diag_prev_opts = merge({ desc = "Go to prev diagnostic" }, opts)
    local diag_show = "<Cmd>lua vim.diagnostic.show()<CR>"
    local diag_show_opts = merge({ desc = "Show project diagnostics" }, opts)


    vim.keymap.set('n', '<c-s>', buf_def_split, opts)
    vim.keymap.set('n', '<c-\\>', buf_def_vsplit, opts)
    vim.keymap.set('n', '<c-]>', buf_def, opts)
    vim.keymap.set('n', '[x', diag_prev, diag_prev_opts)
    vim.keymap.set('n', ']r', diag_open_float, diag_open_float_opts)
    vim.keymap.set('n', ']s', diag_show, diag_show_opts)
    vim.keymap.set('n', ']x', diag_next, diag_next_opts)
    vim.keymap.set('n', 'K', buf_hover, opts)
    vim.keymap.set('n', 'gc', buf_incoming_calls, buf_incoming_calls_opts)
    vim.keymap.set('n', 'gh', buf_sig_help, buf_sig_help_opts)
    vim.keymap.set('n', 'gn', buf_rename, buf_rename_opts)
    vim.keymap.set('n', 'gy', buf_type, buf_type_opts)

    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
        require("nvim-navbuddy").attach(client, bufnr)
        vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
end

--[[ vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
}) ]]

local function default_on_attach(client, bufnr)
    mapping(client, bufnr)
    require('lsp-inlayhints').setup()
    require("lsp-inlayhints").on_attach(client, bufnr)
    require("illuminate").on_attach(client)
end


local lspconfig = require('lspconfig')

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()


require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = border("FloatBorder") }),
    ["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, { border = border("FloatBorder") }),
}

local default_setup = function(server_name)
    if server_name ~= 'gopls' and server_name ~= 'lua_ls' and server_name ~= 'powershell_ls' then
        lspconfig[server_name].setup({
            handlers = handlers,
            capabilities = lsp_capabilities,
            on_attach = default_on_attach
        })
    end
end

mason_lspconfig.setup({
    --[[ ensure_installed = { 'lua_ls', 'pyright', 'dockerls',
        'docker_compose_language_service',
        'jsonls', 'marksman', 'spectral', 'sqlls',
        'gopls', 'golangci_lint_ls' }, ]]
    automatic_installation = true,
    handlers = {
        default_setup,
    },
})

lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    handlers = handlers,
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
        }
    },
    on_attach = default_on_attach
})

lspconfig.gopls.setup({
    capabilities = lsp_capabilities,
    handlers = handlers,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                nilness = true,
                unusedwrite = true,
                useany = true
            },
            experimentalPostfixCompletions = true,
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,

            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true
            }
        }
    },
    on_attach = default_on_attach
})

lspconfig.powershell_es.setup{
  bundle_path = 'C:/Users/mkhoatd/PowerShellEditorServices',
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
})

