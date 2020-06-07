echo 'load my vimrc.'
set nocompatible " 不使用vi兼容模式，启用vim高级特性

" Vundle
filetype off " 不检测文件类型，Vundle需求
set rtp+=~/.vim/bundle/Vundle.vim " 将Vundle路径添加到运行路径，用于初始化Vundle
call vundle#begin() " 初始化Vundle
Plugin 'VundleVim/Vundle.vim' " 导入Vundle包

call vundle#end()
filetype plugin indent on " 恢复文件类型检测
" end Vundle

" 基本设置 ---{{{
echo '>^.^<'
set showmatch " 括号配对时，提示正括号位置
set matchtime=10 " 配对括号提示时间，0.1s为单位
set number " 显示行号
set relativenumber " 显示相对行号
set numberwidth=4 " 行号最小宽度
set wrap " 跨行显示
hi Comment ctermfg=blue " 修改注释颜色，使其在putty中清晰显示
set hlsearch "搜索高亮
set incsearch "搜索立即高亮
nohlsearch
" }}}--- 基本设置

" 缩进相关配置 ---{{{
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
"}}}---

" 取消方向键映射 ---{{{
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
vnoremap <right> <nop>
vnoremap <left> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
" }}}--- 取消方向键映射

" 快速<esc> ---{{{
inoremap jk <esc>
" :inoremap <esc> <nop>
" }}}--- 快速<esc>

" 状态条 ---{{{
set statusline=%F
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
" }}}--- 状态条


