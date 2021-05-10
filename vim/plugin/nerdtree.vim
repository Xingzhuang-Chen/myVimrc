if !has_key(plugs, 'NERDTree')
    finish
endif
" NERDTree相关配置
" 打开关闭
" - 开关
nnoremap <silent> <leader>E :call Switch_nerdtree()<CR>
" - 在VCS目录开关
nnoremap <silent> <leader>e :call Switch_nerdtree_vcs()<CR>
" - 镜像已存在的NT
nnoremap <silent> <leader><c-e> :NERDTreeMirror<CR>
" - 打开书签目录
nnoremap <silent> <leader>b :call Open_nerdtree_bookmark()<CR>
" - 查找当前文件
nnoremap <silent> <leader>f :NERDTreeFind<CR>
" - 查找文件
nnoremap <silent> <leader>F :call Nerdtree_find()<CR>
function! Nerdtree_find() abort
    let l:f=input("Fliename:")
    if len(l:f)
        execute "NERDTreeFind " . l:f
    endif
endfunction
function! Switch_nerdtree_vcs() abort
    if &filetype ==# 'nerdtree'
        NERDTreeClose
    else
        while &filetype !=# 'nerdtree'
            NERDTreeToggleVCS
        endwhile
    endif
endfunction
function! Switch_nerdtree() abort
    if &filetype ==# 'nerdtree'
        NERDTreeClose
    else
        while &filetype !=# 'nerdtree'
            NERDTreeToggle
        endwhile
    endif
endfunction
function! Open_nerdtree_bookmark() abort
    let l:bookmark = input('[Bookmark|Directory]:',"", "dir")
    if len(l:bookmark)
        let l:bookmark = expand(l:bookmark)
        execute "NERDTree " . l:bookmark
    endif
endfunction
