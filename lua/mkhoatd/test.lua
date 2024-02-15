local function check_os()
    return package.config:sub(1, 1) == "\\" and "win" or "unix"
end

config = function()
    local homedir = ""
    if check_os() == "win" then
        homedir = os.getenv("HOMEPATH")
    else
        homedir = os.getenv("HOME")
    end

    print(homedir)

    local undodir = homedir .. "/.vim/undodir"
    print(undodir)
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

config()
