"                      _
"             __   __ (_)  _ __ ___    _ __    ___
"             \ \ / / | | | '_ ` _ \  | '__|  / __|
"              \ V /  | | | | | | | | | |    | (__
"               \_/   |_| |_| |_| |_| |_|     \___|
"
"
" Author: José Luis Lafuente <jl@lafuente.me>
"

" Basic setup {{{  ============================================================

set shell=bash
set nocompatible      " Use Vim defaults instead of 100% vi compatibility

" }}}



" NEOBUNDLE {{{ ===============================================================


" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}



"if has('vim_starting')
"   set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"
"call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
"NeoBundleFetch 'Shougo/neobundle.vim'

" BUNDLES (plugins administrated by NeoBundle) {{{

" Vimproc, asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'


" Utils
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'mattn/webapi-vim'


" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'int3/vim-extradite'
NeoBundle 'airblade/vim-gitgutter'


" Text edition
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'gorkunov/smartpairs.vim'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'henrik/vim-indexed-search'


" GUI
NeoBundle 'jimsei/winresizer'
NeoBundle 'bling/vim-airline'
" NeoBundle 'Lokaltog/powerline'
" NeoBundle 'zhaocai/linepower.vim'


" Autocomplete
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'SirVer/ultisnips'
NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css', 'html.handlebars']}}


" File explorer
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
"NeoBundle 'Shougo/vimfiler.vim'


" Syntax
NeoBundle 'aliva/vim-fish'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}
"NeoBundle 'Rykka/riv.vim'
NeoBundle 'heartsentwined/vim-emblem'
"NeoBundle 'http://hg.nginx.org/nginx/', {'type': 'hg', 'name': 'nginx-syntax', 'rtp': 'contrib/vim'}
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'kurayama/systemd-vim-syntax'
NeoBundle 'wting/rust.vim'
"NeoBundleLazy 'calebsmith/vim-lambdify', {'autoload': {'filetypes': ['python', 'javascript']}}


" Python
NeoBundle 'nvie/vim-flake8'
NeoBundle 'nvie/vim-rst-tables'
NeoBundle 'fs111/pydoc.vim'
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}
NeoBundle 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}
" NeoBundle 'scrooloose/syntastic'


" Color schemas
NeoBundle 'jlesquembre/peaksea'
NeoBundle 'tomasr/molokai'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ap/vim-css-color'


" DB
NeoBundle 'vim-scripts/dbext.vim'


call neobundle#end()
" END BUNDLES }}}

" Auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Installation check.
NeoBundleCheck

" }}}


" END NEOBUNDLE }}}

" VIM Setup {{{ ===============================================================

filetype plugin indent on      " Indent and plugins by filetype
let mapleader = " "
"let maplocalleader = ' '


" Basic options {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set backspace=indent,eol,start  " more powerful backspacing
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set ruler                       " show cursorposition
set showcmd                     " display incomplete commands
set number                      " show linennumbers
set linespace=0
set mouse=a                     " allows use the mouse in terminal
set hidden                      " hide buffer even when changed
set guioptions-=m               " Hide menu bar
set guioptions-=T               " Hide tool bar
set guioptions-=e               " Hide gui tabs
set guioptions-=L               " Hide left scrollbar
set guioptions-=R               " Hide right scrollbar
set guioptions-=l               " Hide left scrollbar
set guioptions-=r               " Hide right scrollbar
set nocursorcolumn              " some weird stuff to make it faster
set nocursorline                " some weird stuff to make it faster

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
" set smartcase                   " smart case ignore
" set ignorecase                  " ignore case letters
" Disable search highlight
noremap <Leader><Space> :noh<CR>

" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}


" Backups {{{

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set backup
set swapfile

let tmpvim_dir = "/tmp/vim/"
execute "set backupdir=".tmpvim_dir."backup/"
execute "set undodir=".tmpvim_dir."undo/"
execute "set directory=".tmpvim_dir."swap/"
set viminfo+=n$HOME/.vim/tmp/viminfo
set viewdir=$HOME/.vim/tmp/views

" make this dirs if no exists previously
function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)
silent! call MakeDirIfNoExists(&viewdir)

" }}}


" Make sure you dont change logfiles {{{
augroup readonly_files
    au BufNewFile,BufRead /var/log/* set readonly
    au BufNewFile,BufRead /var/log/* set nomodifiable
augroup END

" }}}


" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=full                   " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}


" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
"set autoindent                 " set on the auto-indent

" }}}


" Ok, a vim for men, get off the cursor keys {{{

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" }}}


" Colorscheme {{{

syntax enable                  " enable the syntax highlight
"syntax on
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
colorscheme peaksea

" }}}


" Font {{{

set guifont=Inconsolata\ for\ Powerline\ 13

" }}}


" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}


" New windows {{{

"nnoremap <Leader>v <C-w>v
"nnoremap <Leader>h <C-w>s

" }}}


" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}


" Spelling {{{

nmap <silent> <leader>l :set spell!<CR>
set spelllang=en_us

" }}}

" Better ex commands {{{

"nnoremap ; :
"nnoremap : ;

" }}}


" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>
command Sudow execute "w !sudo tee > /dev/null %"

" }}}


" Pretty format commands {{{

command Pxml execute "%!xmllint --format %"
command Pjson execute "%!python -m json.tool"

" }}}


" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

" }}}


" Quick breakpoints {{{

au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

au FileType javascript map <silent> <leader>b odebugger;<esc>
au FileType javascript map <silent> <leader>B Odebugger;<esc>

" }}}


" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
"map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" }}}


cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" Expansion of the Active File Directory {{{

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" }}}


" Disable diff mode {{{

noremap <Leader>d :diffoff<CR>

" }}}


" Copy & Paste {{{

set clipboard=unnamedplus  " Use "+ register
nnoremap Y y$

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" }}}


" Load matchit by default {{{

runtime! macros/matchit.vim

" }}}

" END VIM SETUP }}}

" PLUGINS Setup {{{ ===========================================================


" Unite {{{

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

" }}}



" NeoComplete {{{

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
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
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

" }}}


" Neobundle {{{

let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'

" }}}


" Vimshell {{{

nnoremap <Leader>s :VimShellTab<cr>

" }}}


" Gitgutter {{{

nnoremap <Leader>g :GitGutterToggle<cr>

" }}}



" NERDTree {{{

map <F2> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__$[[dir]]' ]
map <leader>f :NERDTreeFind<CR>

" }}}



" Emmet {{{

let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_expandabbr_key = g:user_emmet_leader_key . 'e'

map <leader>e <c-y>

" Next options conflict with UltiSnips, don't use it for now
"let g:emmet_filetypes = ['html', 'html.handlebars']
"execute 'autocmd FileType ' . join(g:emmet_filetypes, ',') . ' imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")'

" }}}



" UltiSnips {{{

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" }}}



" Extradite {{{

let g:extradite_resize = 0

" }}}


"  Pydoc {{{

let g:pydoc_highlight=0
let g:pydoc_window_lines=0.5

" }}}


"  Powerline {{{

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"call vam#ActivateAddons(['powerline'])

" Always display the statusline in all windows
" set laststatus=2

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set noshowmode

" Fix terminal timeout when pressing escape
"if ! has('gui_running')
"    set ttimeoutlen=10
"    augroup FastEscape
"        autocmd!
"        au InsertEnter * set timeoutlen=0
"        au InsertLeave * set timeoutlen=1000
"    augroup END
"endif

" }}}


" Airline {{{

set laststatus=2
set noshowmode
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }


" }}}


" Better whitespace {{{

let g:better_whitespace_filetypes_blacklist = ['unite']

" }}}


" Expand region {{{

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}}


"  rst tables {{{

noremap <leader>c :call ReformatTable()<CR>
noremap <leader>r :call ReflowTable()<CR>

" }}}


"  json syntax {{{

let g:vim_json_syntax_conceal = 0

" }}}


"  nginx syntax {{{

au BufRead,BufNewFile */nginx/*.conf set ft=nginx

" }}}


" END PLUGINS SETUP }}}


" Other Customizations {{{ ====================================================


" Python support {{{

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

" }}}


" Show syntax highlighting groups for word under cursor {{{

nmap <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}


" Quickly select text you just pasted {{{

noremap gV `[v`]

" }}}


" Custom tab line {{{

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


" }}}

" END OTHER CUSTOMIZATIONS }}}
