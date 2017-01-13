"" general sources
" [1] http://nvie.com/posts/how-i-boosted-my-vim/
" [2] http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" [3] http://statico.github.com/vim.html
" [4] 
" Other - https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

set nocompatible

"" Enable syntax highlighting
syntax enable

"" Mac OS X clipboard sharing
set clipboard=unnamed


"" Backspace doing backspace things
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"" Setting tab/shift for indent/dedent
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv


"" Enable mouse
set mouse=a


"" Minimum # of lines to keep above/below the cursor
set scrolloff=5

"" increase history and turn off backups [1]
" http://stackoverflow.com/questions/5700389/using-vims-persistent-undo
set history=1000
set undolevels=1000
set undodir=~/.vim/undo,~/tmp,/tmp
set undoreload=10000
set undofile
set hidden
set nobackup
set noswapfile

"" pasting
set pastetoggle=<F2>
if !exists('g:powerline_loaded')
    nnoremap <F2> :set invpaste paste?<CR>
else
    nnoremap <F2> :set invpaste <bar> echo<CR>
endif

"" tabs/spaces + highlight whitespace [1]
set list
set expandtab
set smarttab
set shiftround

"" set viminfo directory
set viminfo+=n~/.vim/viminfo

"" Display line number on startup
set number

"" Always show statusline
set laststatus=2

"" Use 256 colors
set t_Co=256

function! Spaces(...)
    let l:width = a:0 == 1 ? a:1 : 4
    setlocal expandtab
    setlocal listchars=tab:>·,trail:·,extends:»,nbsp:·
    let &l:tabstop = l:width
    let &l:shiftwidth = l:width
    let &l:softtabstop = l:width
endfunction
call Spaces()

function! Tabs(...)
    call call('Spaces', a:000)
    setlocal noexpandtab
    setlocal softtabstop=0
    setlocal listchars=tab:\ \ ,trail:·,extends:»,nbsp:·
endfunction

command! -nargs=? S call Spaces(<args>)
command! -nargs=? T call Tabs(<args>)

"" quick tab/spaces settings [3]
nmap <leader>t :T<CR>
nmap <leader>M :S4<CR>
nmap <leader>m :S2<CR>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-obsession'
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

"" airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

"" syntastic use of html5 tidy instead of html4
let g:syntastic_html_tidy_exec = 'tidy5'
