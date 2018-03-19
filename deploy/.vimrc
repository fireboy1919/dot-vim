"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Uwe Hermann <uwe@hermann-uwe.de>
" URL: http://www.hermann-uwe.de/files/vimrc
" $Id: .vimrc 331 2005-09-07 21:09:32Z uh1763 $
"------------------------------------------------------------------------------

version 6.3

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
function! StartUp()
  
endfunction

autocmd VimEnter * call StartUp()

set nocompatible        " Disable vi compatibility.
set pastetoggle=<F2>
set clipboard=unnamed

set tags+=gems.tags
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-sleuth'
"Plug 'vim-ruby/vim-ruby'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"  Using vim-rooter instead.
" Plugin 'amiorin/vim-project'

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/The-NERD-Commenter'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-syntastic/Syntastic'
Plug 'airblade/vim-rooter'
Plug 'sjl/splice.vim'
" Plugin 'EasyGrep'
Plug 'rking/ag.vim'
" Plug 'Shougo/neocomplete'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc'
Plug 'Chiel92/vim-autoformat'
Plug 'justone/remotecopy'
" Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'suan/vim-instant-markdown'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
call plug#end()

"
" Did you forget to sudo?  Not a problem!
cmap w!! w !sudo tee % >/dev/null

filetype plugin indent on    " required

let g:deoplete#enable_at_startup = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
" tern
"autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>


let g:project_use_nerdtree = 1


:let mapleader = "."
" Git shortcuts
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gl :Glog<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Gpush<CR>

" CtrlP shortcuts
map <leader>f :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>. :CtrlPTag<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"nnoremap <F10>j <c-w>j
"nnoremap <F10>k <c-w>k
"nnoremap <F10>h <c-w>h
"nnoremap <F10>l <c-w>l

"Autoformat using F3

noremap <F6> :Autoformat<CR><CR>


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jshint','jslint','standard']

"------------------------------------------------------------------------------ 
" Standard stuff.
"------------------------------------------------------------------------------
" 2-7-2012: adding spell checking by default for now
"set spell
"no idea what these are for
"something about formatting
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
"
set smarttab						" use shiftwidth to set the width of tabs (at the beginning of lines?) 
set expandtab						" uses spaces to fill in tabs in insert mode

set laststatus=2				" Always show the status line
set cf									" Enable error files and error jumping?
set ruler								" turns on the ruler
set clipboard+=unnamed	" yanks go to the os clipboard
set number		" line numbers
set nobackup            " Do not keep a backup file.
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.
set textwidth=0         " Don't wrap words by default.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set mat=5               "bracket blinking
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set ignorecase          " Case insensitive matching.
set incsearch           " Incremental search.
set smartindent		" I dont indent my code myswlf
"set noautoindent        " I indent my code myself.
"set nocindent           " I indent my code myself.
set scrolloff=5         " Keep a context when scrolling.
"set digraph             " Required for e.g. German umlauts.
set noerrorbells        " No beeps.
" set nomodeline          " Disable modeline.
set modeline            " Enable modeline.
" set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
"original value 8, trying 2
set tabstop=2           " Number of spaces <tab> counts for.
set shiftwidth=2				" Number of spaces for tabs using smartindent
" set ttyscroll=1         " Turn off scrolling (this is faster).
set ttyfast             " We have a fast terminal connection.
set hlsearch            " Highlight search matches.
"set encoding=utf-8      " Set default encoding to UTF-8.
" set showbreak=+         " Show a '+' if a line is longer than the screen.
set laststatus=2        " When to show a statusline.
" set autowrite           " Automatically save before :next, :make etc.
set nostartofline       " Do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.
set viminfo^=!          " Add recently accessed projects menu (project plugin)
set mouse=a
" set ttymouse=xterm2

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:>-,trail:·,eol:$

" Path/file expansion in colon-mode.
set wildmode=list:longest
set wildchar=<TAB>

" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif

" Use brighter colors if your xterm has a dark background.
if &term =~ "xterm"
  set background=dark
endif

 
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" Backups & Files
"set backup                     " Enable creation of backup file.
"set backupdir=~/.vim/backups " Where backups will go.
"set directory=~/.vim/tmp     " Where temporary files will go.

"------------------------------------------------------------------------------
" Function keys.
"------------------------------------------------------------------------------

" toggle nerdtree
map <F5> :NERDTreeToggle <cr>
" toggle taglist
map <F6> :TagbarToggle<CR>
"map <F6> :TlistToggle <cr>


"------------------------------------------------------------------------------
" Correct typos.
"------------------------------------------------------------------------------

"form for typo correction
"iab beacuse    because

" Enable this if you mistype :w as :W or :q as :Q.
" nmap :W :w
" nmap :Q :q


"------------------------------------------------------------------------------
" Abbreviations.
"------------------------------------------------------------------------------

" My name + email address.
"ab uhh Uwe Hermann <uwe@hermann-uwe.de>

" Use 'g' to go to the top of the file.
"map g 1G

" Quit with 'q' instead of ':q'. VERY useful!
"map q :q<CR>


"------------------------------------------------------------------------------
" HTML.
"------------------------------------------------------------------------------

" Print an empty <a> tag.
"mapg! ;h <a href=""></a><ESC>5hi

" Wrap an <a> tag around the URL under the cursor.
"map ;H lBi<a href="<ESC>Ea"></a><ESC>3hi


"------------------------------------------------------------------------------
" Miscellaneous stuff.
"------------------------------------------------------------------------------

" Spellcheck.
"map V :!ispell -x %<CR>:e!<CR><CR>

" ROT13 decode/encode the selected text (visual mode).
" Alternative: 'unmap g' and then use 'g?'.
"vmap rot :!tr A-Za-z N-ZA-Mn-za-m<CR>

" Make p in visual mode replace the selected text with the "" register.
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>


"------------------------------------------------------------------------------
" File-type specific settings.
"------------------------------------------------------------------------------

if has("autocmd")

  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype plugin indent on

  " Drupal *.module and *.engine files.
  augroup module
    autocmd BufRead                     *.module,*.engine set filetype=php
  augroup END

  " Python code.
  augroup python
    autocmd BufReadPre,FileReadPre      *.py set tabstop=4
    autocmd BufReadPre,FileReadPre      *.py set expandtab
  augroup END

  " Ruby code.
  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set tabstop=2
    autocmd BufReadPre,FileReadPre      *.rb set expandtab
  augroup END

  " PHP code.
  augroup php
    autocmd BufReadPre,FileReadPre      *.php set tabstop=4
    autocmd BufReadPre,FileReadPre      *.php set expandtab
  augroup END

  " Java code.
  augroup java
    autocmd BufReadPre,FileReadPre      *.java set tabstop=4
    autocmd BufReadPre,FileReadPre      *.java set expandtab
  augroup END

  " ANT build.xml files.
  augroup xml
    autocmd BufReadPre,FileReadPre      build.xml set tabstop=4
  augroup END

  " (J)Flex files.
  augroup lex
    " autocmd BufRead,BufNewFile          *.flex,*.jflex set filetype=lex
    autocmd BufRead,BufNewFile          *.flex,*.jflex set filetype=jflex
  augroup END 

  " (Nu)SMV files.
  augroup smv
    autocmd BufRead,BufNewFile          *.smv set filetype=smv 
  augroup END
endif



"------------------------------------------------------------------------------
" Local settings.
"------------------------------------------------------------------------------

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

