set shell=bash
let mapleader = " "
set nocompatible      " Use Vim defaults instead of 100% vi compatibility

" filetype
filetype plugin indent on  " Required


if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" My Bundles here:
" Original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'

NeoBundle 'Lokaltog/powerline'
NeoBundle 'zhaocai/linepower.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimshell.vim'
"NeoBundle 'Shougo/vimfiler.vim'

" Syntax
NeoBundle 'aliva/vim-fish'

" Python
NeoBundle 'nvie/vim-flake8'
NeoBundle 'nvie/vim-rst-tables'
NeoBundle 'fs111/pydoc.vim'

" Color schemas
NeoBundle 'jlesquembre/peaksea'
NeoBundle 'tomasr/molokai'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'altercation/vim-colors-solarized'


" Installation check.
NeoBundleCheck


" Unite options

    " Yank
    let g:unite_source_history_yank_enable = 1
    nnoremap <Leader>y :Unite history/yank<cr>

    " Search
    if executable('ag')
        " Use the_silver_searcher(ag) in unite grep source.
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
          \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
          \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt = ''
    elseif executable('ack-grep')
        " Use ack in unite grep source.
        let g:unite_source_grep_command = 'ack-grep'
        let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
        let g:unite_source_grep_recursive_opt = ''
    endif

    nnoremap <Leader>p :Unite file_rec/async -default-action=tabopen -start-insert<cr>
    nnoremap <Leader>/ :Unite grep:. -default-action=tabopen<cr>

    let g:unite_force_overwrite_statusline = 0


" -----------------------------
" ------- Better cache --------
" -----------------------------
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif


" For smart TAB completion.
let g:neocomplete#disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

" ---------------------------------
" ------- End better cache --------
" ---------------------------------


" Vim shell options
nnoremap <Leader>s :VimShellTab<cr>


set backspace=indent,eol,start  " more powerful backspacing
set background=dark

syntax on

" Show unwanted whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

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
set mouse=a         " allows use the mouse in terminal
" set hidden          " hide buffer even when changed
set guioptions-=m  " Hide menu bar
set guioptions-=T  " Hide tool bar
set guioptions-=e  " Hide gui tabs
set guioptions-=L  " Hide left scrollbar
set guioptions-=R  " Hide right scrollbar
set guioptions-=l  " Hide left scrollbar
set guioptions-=r  " Hide right scrollbar
set wildmenu
set wildmode=full


" clipboard
" to use Xwindow clipboard use "+
set clipboard=unnamedplus  " Use "+ register

" Vim matchit plugin
runtime macros/matchit.vim

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
let NERDTreeIgnore = ['\.pyc$', '__pycache__$[[dir]]' ]

" ------------------
" -- Remaps START --
" ------------------

"inoremap jj <Esc>

" better indentation
" Use . intead
" vnoremap > >gv
" vnoremap < <gv

" Space disable search highlight
noremap <Leader><Space> :noh<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" cmap w!! %!sudo tee > /dev/null %
command Sudow execute "w !sudo tee > /dev/null %"

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Make yank consistent
nnoremap Y y$

" Emmet customization
let g:user_emmet_leader_key='<c-y>'
let g:user_emmet_expandabbr_key = g:user_emmet_leader_key . 'e'

" ------------------
" --- Remaps END ---
" ------------------

" Define python virtualenv name
let vim_interface='vim-interface'
let vim_venv='vim-venv'

" Add vim_venv virtualenv executables to the path
let $PATH = $HOME.'/.virtualenvs/'.vim_venv.'/bin/:'.$PATH

" Add vim_interface virtualenv site-packages to vim python path
py << EOF
import vim
import os.path
import site
v_env = vim.eval('vim_interface')
site.addsitedir(os.path.join(
    os.path.expanduser('~/.virtualenvs'), v_env,'lib/python2.7/site-packages'))
EOF


" --- Python docs options ---
let g:pydoc_highlight=0
let g:pydoc_window_lines=0.5

" --- START Powerline options ---

set guifont=Inconsolata\ for\ Powerline\ 13
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

" --- Table rst options ---
noremap <leader>c :call ReformatTable()<CR>
noremap <leader>f :call ReflowTable()<CR>

" Show syntax highlighting groups for word under cursor
nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" Display tab number and all file names in tab

hi TabNumber    guifg=#f0c0f0 guibg=#707070 gui=NONE
hi TabNumberSel guifg=#f0c0f0 guibg=#000000 gui=NONE


set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T' . ' '

                if t + 1 == tabpagenr()
                        let s .= '%#TabNumberSel#'
                else
                        let s .= '%#TabNumber#'
                endif
                " set page number string
                let s .=  t + 1

                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                let s .=  ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                " let bc = 1  len(tabpagebuflist(t + 1))  counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let ntemp = '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let ntemp = '[Q]'
                        else
                                let ntemp = bufname(b)
                                let ntemp = fnamemodify(ntemp, ':p:t')
                                " If you want to show the path
                                " let ntemp = pathshorten(bufname(b))
                        endif

                        if ntemp != 'NERD_tree_1'
                            let n .= ntemp . ' '
                            " let bc +=1
                        endif

                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        "if bc > 1
                        " let n .= ' '
                        "endif
                        "let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ' '
                        let s.= '[New] '
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                " let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999XX'
        endif
        return s
endfunction
