set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932,sjis,utf-161e
set fileformats=unix,dos
execute pathogen#infect()
execute pathogen#helptags()
syntax enable filetype plugin indent on 

colorscheme slate
set laststatus=2
set ruler
set showmode
set showcmd
set number
set hidden
set wildmenu
set iminsert=0
set hlsearch
set autoindent

set noundofile
set backup
set noswapfile
if (has('win32') || has('win64'))
    set backupdir=$TEMP
else 
    set backupdir=/tmp
endif

set shiftwidth=0 softtabstop=0 tabstop=4 expandtab
let g:vim_indent_cont=8
set textwidth=0

augroup vimrc
autocmd!
autocmd FileType vim setlocal keywordprg=:help
augroup END 
nnoremap <Leader>ev :e ~/dotfiles/.vimrc
nnoremap <Leader>ch :e ~/dotfiles/cheatsheets/cheatSheet.txt
nnoremap q: <Nop>

let s:lastiminsert = 0
" IMEの状態を保持しておく、置換モードではIMEの状態を保持しない
" 置換モードではIMEの状態を保持しない。置換モードではIMEオフなので、置換モード後の挿入モードが常にIMEオフになることを避ける
autocmd InsertLeave * if v:insertmode !=# 'r' | let s:lastiminsert = &iminsert | set iminsert=0 | endif
" IMEの状態を復帰する。改行時には続けてIMEオンのままにしたいため。
" 挿入モード（IMEオン）→ノーマルモード→挿入モード（IMEオン） となるが。これはむしろできなくていい
" 置換モードではIMEの状態を復帰しない
autocmd InsertEnter * if v:insertmode ==# 'i' | let &iminsert = s:lastiminsert | endif

