" Put full path of current node into the default register

call NERDTreeAddKeyMap({ 'key' : '<leader>yy', 'callback' : 'NERDTreeYankCurrentNodePath' })
call NERDTreeAddKeyMap({ 'key' : '<localleader>yy', 'callback' : 'NERDTreeYankCurrentNodeToA' })
call NERDTreeAddKeyMap({ 'key' : 'yy', 'callback' : 'NERDTreeYankCurrentNodeName' })

function! NERDTreeYankCurrentNodePath()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('"', n.path.str())
    endif
endfunction

function! NERDTreeYankCurrentNodeToA()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('a', n.path.str())
    endif
endfunction

function! NERDTreeYankCurrentNodeName()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('"', fnamemodify(n.path.str(), ":t"))
    endif
endfunction
