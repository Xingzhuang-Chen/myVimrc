if !has_key(plugs, 'vim-session')
    finish
endif

" 默认保存到当前目录
let g:session_directory = '.'
let g:session_default_name = 'session'

" 自动保存
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_autosave_periodic = 1

" 开关session
nnoremap <silent> <leader>sc :CloseSession<cr>
nnoremap <silent> <leader>so :OpenSession session<cr>
" 保存session
nnoremap <silent> <leader>ss :SaveSession<cr>
