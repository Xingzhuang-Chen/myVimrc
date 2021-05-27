echo "~愿每一秒都能为未来填上一坑，排掉一患~"
set nocompatible " 不使用vi兼容模式，启用vim高级特性

"
filetype off " 不检测文件类型，Vundle需求
"set rtp+=~/.vim/bundle/Vundle.vim " 将Vundle路径添加到运行路径，用于初始化Vundle
call plug#begin() " 初始化Vundle
"Plug 'VundleVim/Vundle.vim' " 导入Vundle包
Plug 'ajmwagar/vim-deus'

Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-entire'
Plug 'yianwillis/vimcdoc'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'guns/xterm-color-table.vim'
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

" fzf
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" vimspector 调试器
Plug 'puremourning/vimspector'

" ranger
if has('nvim')
    Plug 'rbgrouleff/bclose.vim'
endif
Plug 'francoiscabrol/ranger.vim'

" NerdTree
" Why nerdtree? 
" - Better community.
" - BookMark
" Plug 'preservim/nerdtree'

" defx
" Why defx?
" - Faster
" - Muitiselect
if has('nvim')
    " Plug 'Shougo/defx.nvim', {'do':':UpdateRemotePlugins'}
    Plug 'Xingzhuang-Chen/defx.nvim', {'do':':UpdateRemotePlugins'}
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" denite.nvim
if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/denite.nvim'
    " Plug 'roxma/nvim-yarp'
    " Plug 'roxma/vim-hug-neovim-rpc'
endif

" undotree
" 记录文件的每一次修改
Plug 'mbbill/undotree'

" tagbar
" 展示文件中的标签
Plug 'preservim/tagbar'

" ale
" 语法检查
" Plug 'dense-analysis/ale'

" 缩进可视化
Plug 'nathanaelkane/vim-indent-guides' 

" 当前单词下划线
Plug 'itchyny/vim-cursorword' 

" Git
" 在行号处标记改动
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" session
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

" test
Plug '~/.vim/plugged/test.vim'

call plug#end()
filetype plugin indent on " 恢复文件类型检测
" end Vundle

" config
" 使用24位真彩色
" set t_Co=16777216
set t_Co=256
let mapleader=','
nnoremap <leader>VN :e $MYVIMRC<cr>
nnoremap <leader>VV :e ~/.vimrc<cr>
" 基本设置 ---{{{
set shortmess+=cI
set updatetime=100 " 缓存间隔时间
set hidden " 不保存也能切换buffer
colorscheme pablo
set ignorecase " 忽略大小写
set showmatch " 括号配对时，提示正括号位置
set matchpairs+=<:>
set matchtime=10 " 配对括号提示时间，0.1s为单位
set number " 显示行号
set relativenumber " 显示相对行号
set numberwidth=4 " 行号最小宽度
set wrap " 跨行显示
hi Comment ctermfg=blue " 修改注释颜色，使其在putty中清晰显示
set hlsearch "搜索高亮
set incsearch "搜索立即高亮
set pastetoggle=<C-p> " 切换复制模式
nohlsearch
" }}}--- 基本设置

" 缩进相关配置 ---{{{
set smartindent
set tabstop=4
set shiftround
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
inoremap <esc> <nop>
" :inoremap <esc> <nop>
" }}}--- 快速<esc>

" 状态条 ---{{{
set statusline=%F
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
set laststatus=2
" }}}--- 状态条


" YouCompleteMe
" let g:ycm_key_invoke_completion='<c-f>'
"


hi IndentGuidesOdd ctermbg=black 
hi IndentGuidesEven ctermbg=darkgrey

" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

nnoremap <C-j> +
nnoremap <C-k> -
nnoremap _ kddpk
nnoremap - ddp

set cursorline
hi CursorLine ctermbg=17 cterm=NONE ctermfg=NONE
hi CursorLineNr term=bold cterm=bold ctermfg=012 gui=bold

abbrev ifname if __name__ == "__main__":<CR>...

" Python 路径
" let g:python_host_prog=execute('!which python2')
" let g:python3_host_prog=execute('!which python3')
let g:python3_host_prog="/home/cf/anaconda3/envs/Detection/bin/python3"
