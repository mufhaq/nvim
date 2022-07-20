_G.M = {}

function M.init()
	vim.cmd([[
    function SnipRun()
        let b:caret = winsaveview()
        %SnipRun
        call winrestview(b:caret)
    endfunction
    ]])
end

M.user = {}

function M.user.sniprun()
	vim.cmd([[
    call SnipRun()
    ]])
end

return M
