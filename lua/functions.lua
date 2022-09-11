_G.M = {}

function M.init()
	vim.cmd([[
    function SnipRun()
        let caret = winsaveview()
        %SnipRun
        call winrestview(caret)
    endfunction
    ]])
end

M.user = {}

function M.user.sniprun()
	vim.cmd([[
    call SnipRun()
    ]])
end

function M.user.closerunner()
	vim.cmd("SnipClose")
	vim.cmd("RunClose")
end

return M
