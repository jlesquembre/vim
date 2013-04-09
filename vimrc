" pathogen.vim
execute pathogen#infect()


set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

set background=dark

syntax on

" colorsheme
colorscheme peaksea

" backup rules
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set backup
silent execute '!mkdir -p $HOME/.vim/tmp/backup'
set backupdir=$HOME/.vim/tmp/backup
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
set directory=$HOME/.vim/tmp/swap
silent execute '!mkdir -p $HOME/.vim/tmp/views'
set viewdir=$HOME/.vim/tmp/views

" commandline history
set history=1000

" some weird stuff to make it faster
set nocursorcolumn
set nocursorline

" some interface options
set ruler           " show cursorposition
set showcmd         " display incomplete commands
set incsearch       " incremental searching
set hlsearch        " highlight searchresult
set number          " show linennumbers
set linespace=0
" set hidden          " hide buffer even when changed

" filetype
filetype on
filetype plugin on
filetype indent on

" tabstop settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" make sure you dont change logfiles
augroup readonly_files
    au BufNewFile,BufRead /var/log/* set readonly
    au BufNewFile,BufRead /var/log/* set nomodifiable
augroup END

" NERDTree Options
map <F2> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Other options
"inoremap jj <Esc>
set guifont=Inconsolata\ for\ Powerline\ 13


" Add the vim virtualenv to vim path
py << EOF
import os.path
activate_this = os.path.expanduser('~/.virtualenvs/vim/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))
EOF



" --- START Powerline options ---

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Always display the statusline in all windows
set laststatus=2

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

"Fix terminal timeout when pressing escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" --- END Powerline options ---
