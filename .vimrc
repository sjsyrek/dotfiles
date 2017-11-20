" Steve Syrek's .vimrc file
"
" Many settings adopted or adapted from:
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
" https://github.com/Dridus/dotfiles/blob/master/vimrc
" http://www.stephendiehl.com/posts/vim_2016.html

execute pathogen#infect()

set autoindent                         " copy indent from current line when starting a new line
set autoread                           " auto reload files when they change
set backspace=indent,eol,start         " better backspacing
set backup                             " backup before writing to a new file
set backupdir=~/.vim/backup            " put backup files here
set clipboard=unnamedplus,autoselect   " use the global clipboard
set cmdheight=1                        " number of screen lines to use for the command-line
set colorcolumn=114                    " highlight a screen column
set completeopt=menuone,menu,longest   " use a popup menu to show auto-completions
set conceallevel=1                     " conceal keywords with special glyphs
set cursorline                         " highlight the current screen line
set directory=~/.vim/tmp//             " directory for swp files
set encoding=utf-8                     " character encoding for use inside vim
set expandtab                          " fill tabs with spaces
set fileformats=unix,dos,mac           " read end-of-line formats correctly
set foldcolumn=0                       " display a column indicating open and closed folds, when non-zero
set foldlevelstart=99                  " open all folds when beginning to edit
set foldmethod=indent                  " folds are determined by indentation
set foldnestmax=5                      " maximum nesting of folds
set formatoptions="ro1j"               " format options for handling comments and line breaks 
set hidden                             " don't unload buffers when abandoned
set grepprg=rg\                        " use ripgrep for searching
set history=1000                       " remember this many commands
set hlsearch                           " highlight search matches
set ignorecase smartcase               " ignore case when searching unless the pattern contains uppercase letters
set incsearch                          " show search results as you are typing
set laststatus=2                       " always show the status line
set lazyredraw                         " don't redraw the screen when executing macros, etc.
set linebreak                          " wrap long lines for display purposes, even if there's space
set matchtime=2                        " show matching brackets for 2/10 of a second instead of 5/10
set modelines=0                        " don't check for set commands
set nocompatible                       " Because we don't care about compatibility with vi
set noerrorbells                       " don't make any noise
set nolist                             " make sure list mode is off
set nojoinspaces                       " do not insert two spaces after '.', '?', and '!'
set number                             " show fixed line numbers
set relativenumber                     " show line numbers relative to the cursor position
set ruler                              " show the line and column number of the cursor position
set sessionoptions-=options            " save and restore everything when using :mksession
set scrolloff=7                        " minimum number of lines keep above and below the cursor
set shell=zsh                          " which shell to use for ! and :! commands
set shiftwidth=2                       " number of spaces to use for each step of autoindent
set showcmd                            " show command in the last line of the screen
set showmatch                          " highlight matching brackets
set showmode                           " show the current mode, if not normal mode, on the last line
set showtabline=2                      " always show the tabline
set smartindent                        " do smart autoindenting when starting a new line
set smarttab                           " insert spaces instead of tabs at the beginning of a line
set softtabstop=2                      " number of spaces that a tab counts for while editing
set splitbelow                         " put new windows splits below the current window
set splitright                         " put new window vsplits to the right of the current window
set switchbuf=useopen                  " jump to the first open window that contains a buffer when switching
set tabstop=2                          " number of spaces that a tab counts for
set textwidth=80                       " maximum width of text that is being inserted
set timeoutlen=2000                    " wait 2 seconds for a mapped key sequence to complete
set ttimeoutlen=100                    " wait 1/10 of a second for key codes to complete
set ttyfast                            " improves smoothnes of redrawing the screen
set undofile                           " create undo files
set undodir=~/.vim/backup              " put undo files here
set vb t_vb=                           " no visual bells OR whistles
set wildignore+=*\\tmp\\*,*.swp,*.swo  " ignore vim temporary files when expanding wildcards
set wildignore+=**.zip,.git            " ignore these file patterns when expanding wildcards
set wildignore+=.cabal-sandbox         " ignore cabal-sandbox files when expanding wildcards
set wildmenu                           " enable tab completion of commands
set wildmode=longest,list,full         " complete longest common strings, then list alternatives for wildmenu
set wrap                               " wrap lines that don't fit in the window (for display only)

syntax enable                          " syntax highlighting

filetype plugin indent on              " enable filetype and indent detection

" Pretty ligatures
if has("gui_macvim")
  set macligatures
  set guifont=Fira\ Code\ Light:h10
endif

" Make sure colors work in tmux and other weird places
if &term =~ '256color'
  set t_ut=                           
endif

" Highlighting
highlight Search ctermbg=69
highlight CursorLineNr ctermfg=12 cterm=bold

" Gary Bernhardt's color scheme
set background=dark
set t_Co=256
color grb256

" Color schemes (select only one)
colorscheme gruvbox
" colorscheme solarized

" Key mappings
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " ,W to strip all trailing whitespace in the current file
nnoremap <leader>w <C-w>v<C-w>l " ,w to split the window vertically and switch to the new split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>a :Ack
inoremap ;; <ESC> " ;; to exit insert mode

" Syntastic
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ghc-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" Supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" Haskell tab completion
let g:haskellmode_completion_ghc=1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Nerdtree
map <Leader>n :NERDTreeToggle<CR>

" Tabularize
let g:haskell_tabular=1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" Ctrl-p
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" Miscellaneous
let mapleader=","
let g:sh_noisk=1
let g:slime_target="tmux"
let g:slime_python_ipython=1

autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Because vim doesn't understand Markdown
autocmd FocusLost * :wa " automatically save all buffers if vim loses focus

" JavaScript
let g:javascript_conceal_function="ƒ"
let g:javascript_conceal_null="ø"
let g:javascript_plugin_flow=1
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1

let g:jsx_ext_required = 0 " JSX syntax highlighting for all .js files

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" PureScript
let purescript_indent_if=3
let purescript_indent_case=5
let purescript_indent_let=4
let purescript_indent_where=6
let purescript_indent_do=3
let purescript_indent_in=1
let purescript_indent_dot=v:true

" Haskell commands
" t + w	           Insert type for toplevel declaration
" t + q	           Query type of expression under cursor
" t + s	           Case split expression under cursor
" t + e	           Erase type query
" a + =	           Align on equal sign
" a + -	           Align on case match
" Ctrl + x + o	   Tab complete under cursor
" \ + t	           Open fuzzy file finder
" \ + n	           Open file explorer
" \ + c + Space	   Toggle comment of text under cursor
" \ + c + s	       Toggle “sexy” comment of text

