""""""""""""""""""""""""""
" .vimrc
""""""""""""""""""""""""""

" [1]: http://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
" [2]: http://nvie.com/posts/how-i-boosted-my-vim/

" The base default vimrc file is $VIM/../defaults.vim

" Not needed as simply having a personal .vimrc file necessarily means vim will set nocompatible [1]
" set nocompatible

" Enable syntax highlighting
syntax enable

" Mac OS X clipboard sharing // not seeing any differences so this will be
" disabled until something is figured out
set clipboard=unnamed

" Configure backspace so that it acts as it should (deletes)
set backspace=eol,start,indent

" Configure arrow keys and 'h' and 'l' to move to previous/next line when
" reaching the first/last character in the line
set whichwrap+=<,>,h,l

" Customizing tabs/indents
set tabstop=4 " maximum width of a tab; useful with softtabstop, hardtabstop, and smarttab
set expandtab " always use spaces instead of tabs
set softtabstop=2 " insert 2 spaces when tab is pressed 
set shiftwidth=2 " width of an indent
set shiftround " round indent to nearest shiftwidth multiple

" Remapping tab/shift for indent/dedent
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" Paste mode
set pastetoggle=<F2>

" Enable mouse
set mouse=a

" Minimum number of lines to keep above/below the cursor
set scrolloff=5

" Display line numbers
set number

" Always show current position
" set ruler

" Increase history and turn off backups [2]
set history=1000
set undolevels=1000
set undodir=~/.vim/undo,~/tmp,/tmp
set undoreload=10000
set undofile
set hidden
set nobackup
set noswapfile

" Set .viminfo directory
set viminfo+=n~/.vim/viminfo

" Always show status line (shows the file second line from bottom currently)
set laststatus=2

" Use 256 colors (e.g., allows for the statusline to be colored)
set t_Co=256

" Format the status line (HasPaste generates an error - unknown function)
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" The following for vundle to work:
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

" airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1


" syntastic (no noticable change from the lines below)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_eslint_exec = '/usr/local/lib/node_modules/eslint/bin/eslint.js'
let g:syntastic_sass_lint_exec = '/usr/local/lib/node_modules/sass-lint/bin/sass-lint.js'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_scss_checkers = ['sass_lint']

" Enable powerline
" set rtp+=~/.powerline/bindings/vim


" Helper functions

" Returns true if paste mode is enabled
" function! HasPaste()
"   if &paste
"     return 'PASTE MODE  '
"   endif
"   return ''
" endfunction
