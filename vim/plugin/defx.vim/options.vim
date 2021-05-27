if !has_key(plugs, 'defx.nvim')
    finish
endif
" -option配置
if !has("g:defx_my_indent")
    let g:defx_my_indent='git:mark:indent:icons:filename:type'
endif
" let g:defx_my_indent='git:mark:indent:filename:type'
call defx#custom#option('_', {'columns': g:defx_my_indent})
" call defx#custom#option('_', {'winwidth': 40,})
" call defx#custom#option('_', {'split': 'vertical',})
call defx#custom#option('_', {'winwidth': 120,})
call defx#custom#option('_', {'winheight': 120,})
call defx#custom#option('_', {'split': 'floating',})
call defx#custom#option('_', {'direction': 'topleft',})
call defx#custom#option('_', {'show_ignored_files': 0,})
call defx#custom#option('_', {'buffer_name': '',})
call defx#custom#option('_', {'toggle': 1,})
call defx#custom#option('_', {'resume': 1,})
call defx#custom#option('_', {'floating_preview': 1,})
call defx#custom#option('_', {'session_file': expand('~/.vim_def_session')})
call defx#custom#option('_', {'root_marker': " "})
" --columns配置
call defx#custom#column('git', 'column_length', 1)
call defx#custom#column('indent', 'indent', " |")
