-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/mkhoatd/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?.lua;/Users/mkhoatd/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?/init.lua;/Users/mkhoatd/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?.lua;/Users/mkhoatd/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mkhoatd/.cache/nvim/packer_hererocks/2.1.1703358377/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["autoclose.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14autoclose\frequire\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  harpoon = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nç\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\1\v\0\0\vlua_ls\fpyright\rdockerls$docker_compose_language_service\vjsonls\rmarksman\rspectral\nsqlls\ngopls\21golangci_lint_ls\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    config = { "\27LJ\2\ní\1\0\0\a\0\15\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\1\a\0009\1\2\0015\3\r\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\4=\4\14\3B\1\2\1K\0\1\0\rsettings\1\0\0\bLua\1\0\0\15completion\1\0\0\1\0\1\16callSnippet\fReplace\vlua_ls\14lspconfig\flibrary\1\0\0\1\0\4\fplugins\2\fruntime\2\fenabled\2\ntypes\2\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¦\2\0\0\4\0\f\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0014\3\0\0B\1\2\0019\1\4\0009\1\3\0014\3\0\0B\1\2\0019\1\5\0009\1\3\0014\3\0\0B\1\2\0019\1\6\0009\1\3\0014\3\0\0B\1\2\0019\1\a\0009\1\3\0014\3\0\0B\1\2\0019\1\b\0009\1\3\0014\3\0\0B\1\2\0019\1\t\0009\1\3\0014\3\0\0B\1\2\0019\1\n\0009\1\3\0014\3\0\0B\1\2\0019\1\v\0009\1\3\0014\3\0\0B\1\2\1K\0\1\0\21golangci_lint_ls\ngopls\nsqlls\rspectral\rmarksman\vjsonls$docker_compose_language_service\rdockerls\nsetup\fpyright\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nÒ\2\0\0\b\1\21\0/6\0\0\0009\0\1\0'\2\2\0B\0\2\2'\1\3\0&\0\1\0006\1\4\0009\1\5\0019\2\6\0019\4\a\1\18\6\0\0B\4\2\0A\2\0\2)\3\0\0\1\3\2\0X\2\27€-\2\0\0B\2\1\2\a\2\b\0X\2\16€'\2\t\0\18\3\0\0'\4\n\0&\2\4\0026\3\v\0009\3\f\3'\5\r\0'\6\14\0B\3\3\2\18\6\3\0009\4\15\3\18\a\2\0B\4\3\0019\4\16\3B\4\1\1X\2\a€'\2\17\0\18\3\0\0&\2\3\0026\3\0\0009\3\18\3\18\5\2\0B\3\2\0016\2\4\0009\2\19\2=\0\20\2K\0\1\0\0\0\fundodir\bopt\fexecute\14mkdir -p \nclose\nwrite\6w\26powershell -command -\npopen\aio\f -force\vmkdir \bwin\tglob\nempty\afn\bvim\18/.vim/undodir\tHOME\vgetenv\aos\0" },
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mkhoatd/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: autoclose.nvim
time([[Config for autoclose.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14autoclose\frequire\0", "config", "autoclose.nvim")
time([[Config for autoclose.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n¦\2\0\0\4\0\f\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0014\3\0\0B\1\2\0019\1\4\0009\1\3\0014\3\0\0B\1\2\0019\1\5\0009\1\3\0014\3\0\0B\1\2\0019\1\6\0009\1\3\0014\3\0\0B\1\2\0019\1\a\0009\1\3\0014\3\0\0B\1\2\0019\1\b\0009\1\3\0014\3\0\0B\1\2\0019\1\t\0009\1\3\0014\3\0\0B\1\2\0019\1\n\0009\1\3\0014\3\0\0B\1\2\0019\1\v\0009\1\3\0014\3\0\0B\1\2\1K\0\1\0\21golangci_lint_ls\ngopls\nsqlls\rspectral\rmarksman\vjsonls$docker_compose_language_service\rdockerls\nsetup\fpyright\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\ní\1\0\0\a\0\15\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\1\a\0009\1\2\0015\3\r\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\4=\4\14\3B\1\2\1K\0\1\0\rsettings\1\0\0\bLua\1\0\0\15completion\1\0\0\1\0\1\16callSnippet\fReplace\vlua_ls\14lspconfig\flibrary\1\0\0\1\0\4\fplugins\2\fruntime\2\fenabled\2\ntypes\2\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nÒ\2\0\0\b\1\21\0/6\0\0\0009\0\1\0'\2\2\0B\0\2\2'\1\3\0&\0\1\0006\1\4\0009\1\5\0019\2\6\0019\4\a\1\18\6\0\0B\4\2\0A\2\0\2)\3\0\0\1\3\2\0X\2\27€-\2\0\0B\2\1\2\a\2\b\0X\2\16€'\2\t\0\18\3\0\0'\4\n\0&\2\4\0026\3\v\0009\3\f\3'\5\r\0'\6\14\0B\3\3\2\18\6\3\0009\4\15\3\18\a\2\0B\4\3\0019\4\16\3B\4\1\1X\2\a€'\2\17\0\18\3\0\0&\2\3\0026\3\0\0009\3\18\3\18\5\2\0B\3\2\0016\2\4\0009\2\19\2=\0\20\2K\0\1\0\0\0\fundodir\bopt\fexecute\14mkdir -p \nclose\nwrite\6w\26powershell -command -\npopen\aio\f -force\vmkdir \bwin\tglob\nempty\afn\bvim\18/.vim/undodir\tHOME\vgetenv\aos\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\1\v\0\0\vlua_ls\fpyright\rdockerls$docker_compose_language_service\vjsonls\rmarksman\rspectral\nsqlls\ngopls\21golangci_lint_ls\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
