" 一个不错的airline入门博客
" https://tuckerchapman.com/2020/09/15/getting-started-vim-airline/
if !has_key(plugs, 'vim-airline')
    finish
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" ~/full/path-to/file-name.js
" let g:airline#extensions#tabline#formatter = 'default' " f/p/file-name.js
" let g:airline#extensions#tabline#formatter = 'jsformatter' " path-to/f
" let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js

" 解决箭头
" 可以在nerd font网站上搜索箭头字符
" https://blog.csdn.net/sjhuangx/article/details/47302731
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


