if !has_key(plugs, 'defx.nvim')
    finish
endif
" Defx相关配置
let g:defx=expand("<sfile>:p")
" 更新defx配置并打开，只在defx.vim中有效
augroup DefxUpdateGroup
    autocmd!
    " autocmd BufRead,BufNewFile defx.vim call s:UpdateDefx()
augroup END
function! s:UpdateDefx() abort
    nnoremap <silent><buffer> <leader>E :w<CR>:source %<CR>:Defx<CR>:set filetype=defx<CR>
endfunction
" 打开关闭
" nnoremap <silent> <leader>e :call Defx_switch()<cr>
nnoremap <silent> <leader>e :Defx<cr>
function! Defx_switch() abort
    if &filetype ==# 'defx'
        execute "normal \<c-w>p"
    else
        call Defx_open()
    endif
endfunction
function! Defx_open() abort
    while &filetype !=# 'defx'
        let l:w=getcwd()
        execute "Defx "
    endwhile
endfunction
" 查找当前文件路径
nnoremap <silent> <leader>S :call Defx_search()<cr>
function! Defx_search() abort
    let l:fp = expand("%:p")
    call Defx_open()
    call defx#call_action('search', [l:fp])
endfunction
" -set配置
augroup DefxSetGroup
    autocmd!
    " autocmd FileType defx set nonumber norelativenumber
    " autocmd FileType defx echom "defx"
    autocmd FileType defx call s:defx_my_settings()
    " 下面两个不是局部参数
    " autocmd FileType defx setlocal nohlsearch
    " autocmd FileType defx setlocal noincsearch 
augroup END

" -map配置
function! s:defx_my_settings() abort
    " Define mappings
    " 打开当前项（文档或文件夹）
    nnoremap <silent><buffer><expr> <CR>
              \ defx#do_action('drop')
    " 返回上一级目录
    nnoremap <silent><buffer><expr> h
              \ defx#do_action('open_directory',
              \ fnamemodify(defx#get_candidates()[0].action__path, ':h'))
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
    \ defx#do_action('open_directory')
    " 以垂直分割的方式在新窗口打开文件
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')
    " 在弹出窗口预览文件
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('preview')
    " 切换目录展开状态
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_tree', 'toggle')
    " 关闭当前展开目录
    nnoremap <silent><buffer><expr> i
              \ defx#do_action('close_tree')
    " 关闭所有tree
    nnoremap <silent><buffer><expr> I
              \ defx#do_action('call', 'defx#Close_all_tree')
    " 新建目录
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    " 新建文件
    " nnoremap <silent><buffer><expr> N
    " \ defx#do_action('new_file')
    " 新建多个文件，空格分割
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_multiple_files')
    " 切换另一种列表形式
    if !has("g:defx_my_indent")
        let g:defx_my_indent='git:mark:indent:icons:filename:type'
    endif
    execute "nnoremap <silent><buffer><expr> ci defx#do_action('toggle_columns', '" . g:defx_my_indent . "')"
    " 按时间排序
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
    " 删除文件
    nnoremap <silent><buffer><expr> D
    \ defx#do_action('remove')
    " 重命名文件
    nnoremap <silent><buffer><expr> R
    \ defx#do_action('rename')
    " 对当前所有选中项执行命令
    nnoremap <silent><buffer><expr> !
              \ defx#do_action('execute_command')
    " 在Vim外部打开选中的文件
    nnoremap <silent><buffer><expr> X
    \ defx#do_action('execute_system')
    " 复制路径
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    " 切换是否显示隐藏文件
    nnoremap <silent><buffer><expr> <c-h>
    \ defx#do_action('toggle_ignored_files')
    " 重复动作，类似于vim的.操作
    " nnoremap <silent><buffer><expr> ;
    " \ defx#do_action('repeat')
    " 切换目录
    " nnoremap <silent><buffer><expr> ~
    " \ defx#do_action('cd')
    " 退出Defx
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    " 选中当前项
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    " 选中可视化行
    vnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select_visual') . 'j'
    " 选中全部
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> #
    \ defx#do_action('clear_select_all')
    " 取消全选
    " 从低端回到第一行
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    " 从顶端跳到最后一行
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    " 重画，同vim重绘
    nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
    " 输出选中对象的路径
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    " 修改vim工作目录到Defx目录
    " nnoremap <silent><buffer><expr> cd
    " \ defx#do_action('change_vim_cwd') . ":echo 'Workdir change to '.getcwd()<CR>"
    nnoremap <silent><buffer><expr> cd defx#Change_to_current_dir()
    " 移动光标到父目录
    nnoremap <silent><buffer><expr> u defx#do_action('search',
    \ fnamemodify(defx#get_candidate().action__path, ':h'))
    " 切换目录
    nnoremap <silent><buffer><expr> <c-j> defx#Change_dir()
    " 保存当前session
    nnoremap <silent><buffer><expr> <leader>sa defx#do_action('add_session')
    " 打开defx session列表
    if has_key(g:plugs, 'denite.nvim')
        nnoremap <silent><buffer> sf :Denite defx/session<cr>
    endif
    " 载入会话session
    if has_key(g:plugs, 'vim-session')
        " function! Defx_my_load_session(context) abort
        "     if !(len(a:context['targets']) ==# 1)
        "         return ''
        "     endif
        "     let l:session_file = string(a:context['targets'][0])
        "     let l:session_file_name = split(l:session_file, '/')[-1][:-2]
        "     if l:session_file_name ==# g:session_default_name . '.vim'
        "         echom 'OpenSession ' . l:session_file 
        "         return 'OpenSession ' . l:session_file . '<cr>'
        "     endif
        "     return ''
        " endfunction
        " nnoremap <silent><buffer><expr> sl
        "             \ defx#do_action('call', 'Defx_my_load_session')
        nnoremap <silent><buffer> sl
                    \ :OpenSession session<cr>
    endif

  
    " ---Test
    function! Test(context) abort
        echom len(a:context)
      echomsg string(a:context)
    endfunction
    nnoremap <silent><buffer><expr> t
              \ defx#do_action('call', 'Test')

    nnoremap <silent><buffer> T
              \ :echom defx#get_candidate().is_opened_tree<CR>

endfunction


" 切换cwd到defx当前目录
function! defx#Change_to_current_dir() abort
    call defx#call_action('change_vim_cwd', [])
    if has_key(g:plugs, 'vim-session')
        let g:session_directory=getcwd()
    endif
    echom 'Workdir change to '.getcwd()
    return ''
endfunction
" 切换当前目录
function! defx#Change_dir() abort
    let l:defx_cwd=s:get_defx_cwd()
    let l:cwd=getcwd()
    call defx#call_action('change_vim_cwd', [])
    let l:cdr=input("Change directory:", "", "dir")
    execute "cd " . l:cwd
    if len(l:cdr)
        return defx#do_action('cd', expand(l:cdr, ':p'))
    else
        return ""
    endif
endfunction
" 获取当前列表目录
function! s:get_defx_cwd() abort
    return defx#do_action("call", "s:_get_defx_cwd")
endfunction
function! s:_get_defx_cwd(context) abort
    return a:context['cwd']
endfunction
" 关闭所有Tree
function! defx#Close_all_tree(context) abort
    let l:c_wd=a:context.cwd
    let l:c_id=2
    while l:c_id <=# line('$')
        execute string(l:c_id)
        if defx#get_candidate().is_opened_tree
            call defx#call_action('close_tree', [])
        endif
        let l:c_id+=1
    endwhile
    return ""
endfunction
" 关闭当前Tree,废弃
function! defx#Close_current_tree() abort
    let l:c_line = line('.')
    let cand = defx#get_candidates()
    while l:c_line!=#1 && !cand[l:c_line-1].is_opened_tree
        let l:c_line -= 1
    endwhile
    if cand[l:c_line-1].is_opened_tree
        execute string(l:c_line)
        return defx#do_action('close_tree')
    else
      return ""
  endif
endfunction
