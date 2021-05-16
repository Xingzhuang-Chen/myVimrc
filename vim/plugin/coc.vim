if !has_key(plugs, 'coc.nvim')
    finish
endif
let g:coc_global_extensions = ['coc-json', 
            \'coc-vimlsp', 
            \'coc-marketplace', 
            \'coc-actions', 
            \'coc-explorer', 
            \'coc-pyright',
            \'coc-translator',
            \]

" Use <c-f> to trigger completion.
inoremap <silent><expr> <c-f> coc#refresh()

" 使用<tab>切换补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车选择
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 语法错误跳转
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 函数跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gY <Plug>(coc-references)

" 显示光标下字符的document
" Use K to show documentation in preview window.
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 重命名变量
nmap <leader>rn <Plug>(coc-rename)

" 调整格式
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

" vscode action
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" explorer
nnoremap <leader>E :CocCommand explorer<CR>

" translator
" do not use 'nore' mapping
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
