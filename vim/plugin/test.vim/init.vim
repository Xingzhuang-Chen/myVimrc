" 一步一步实现外挂comment插件

" ============================== 
" functions
" ============================== 
function! init#main() abort
    new
    setlocal nobuflisted buftype=nofile bufhidden=delete noswapfile
    execute 'normal \<c-w>\<c-p>'
endfunction


