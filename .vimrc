colorscheme koehler

let g:user42 = 'rzamolo-'
let g:mail42 = 'rzamolo-@student.42madrid.com'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Colorschemes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sjl/badwolf'
Plug 'lifepillar/vim-solarized8'
Plug 'scheakur/vim-scheakur'
Plug 'Badacadabra/vim-archery'
Plug 'sainnhe/edge'

" Other
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'dyng/ctrlsf.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-dispatch'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

filetype plugin indent on

" ------------------------------------------------------------
" THEME CONFIGURATION
" ------------------------------------------------------------
let g:edge_style = 'aura'
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 1

if has('termguicolors')
    set termguicolors
endif

set guifont=Hack\ 11            " Set font
set background=dark             " Set background
colorscheme hybrid_material     " Set color scheme

" ------------------------------------------------------------
" AUTO-PAIRS
" ------------------------------------------------------------

let g:AutoPairsShortcutToggle = '<C-P>'

" ------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------

let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

" ------------------------------------------------------------
" TAGBAR
" ------------------------------------------------------------

let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" ------------------------------------------------------------
" CTRLSF
" ------------------------------------------------------------

let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_close = { "normal": 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view = 'normal'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '46'
let g:ctrlsf_default_root = 'cwd'   " projcet

" ------------------------------------------------------------
" FSWITCH
" ------------------------------------------------------------
"
" Set fswtichdst and fswitchloc variables with BufEnter event takes place
" on a file whose name matches {*.cpp}.
"
" au! BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '../inc'

au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h   let b:fswitchdst = 'cpp,c'

" fswitchdst  - Denotes the files extensions that is the target extension of
"               the current file's companion file.
"
" fswitchlocs - Contains a set of directories that indicate directory names
"               that should be formulated when trying to find the alternate
"               file.

" ------------------------------------------------------------
" VIM-PROTODEF
" ------------------------------------------------------------

nmap <buffer> <silent> <leader> ,PP
nmap <buffer> <silent> <leader> ,PN

" NOTE: This doesn't seem to disable the sorting.
let g:disable_protodef_sorting = 1

" ------------------------------------------------------------
" YCM
" ------------------------------------------------------------

" Mapping to close the completion menu (default <C-y>)
let g:ycm_key_list_stop_completion = ['<C-x>']

" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                " Don't confirm python conf
let g:ycm_always_populate_location_list = 1     " Always populae diagnostics list
let g:ycm_enable_diagnostic_signs = 1           " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1         " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20               " Max number of completion suggestions
let g:ycm_max_num_identifier_candidates = 10    " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                      " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                " Show diagnostic display features
let g:ycm_error_symbol = '>>'                   " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1           " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1    " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1           " Echo line's diagnostic that cursor is on

" ------------------------------------------------------------
" VIM SETTINGS
" ------------------------------------------------------------

set number              " Enable line numbers
syntax on               " Enable synax highlighting
set incsearch           " Enable incremental search
set hlsearch            " Enable highlight search
set splitbelow          " Always split below
set mouse=a             " Enable mouse drag on window splits
set tabstop=4           " How many columns of whitespace a \t is worth
set shiftwidth=4        " How many columns of whitespace a “level of indentation” is worth
set colorcolumn=80
set autoindent
set ruler
set cursorline
set noexpandtab


if !has('nvim')
    set termwinsize=12x0    " Set terminal size
endif

" ------------------------------------------------------------
" MAPPINGS
" ------------------------------------------------------------

"General
nmap        <C-B>     :buffers<CR>
nmap        <C-J>     :term<CR>
"
"NERDTree
nmap        <F2>      :NERDTreeToggle<CR>

"tagbar
nmap        <F8>      :TagbarToggle<CR>

"ctrlds
nmap        <C-F>f    <Plug>CtrlSFPrompt
xmap        <C-F>f    <Plug>CtrlSFVwordPath
xmap        <C-F>F    <Plug>CtrlSFVwordExec
nmap        <C-F>n    <Plug>CtrlSFCwordPath
nmap        <C-F>p    <Plug>CtrlSFPwordPath
nnoremap    <C-F>o    :CtrlSFOpen<CR>
nnoremap    <C-F>t    :CtrlSFToggle<CR>
inoremap    <C-F>t    <Esc>:CtrlSFToggle<CR>

"fswitch
nmap        <C-Z>     :vsplit <bar> :wincmd l <bar> :FSRight<CR>

"YCM
nmap        <C-L>     :lopen<CR>
nmap        <C-L>l    :lclose<CR>

" --------------------------------------------------------------------------------
" BUILD SYSTEM
" --------------------------------------------------------------------------------

" Vim settings
" --------------------------------------

" Always render sign column so editor doesn't snap when there's a YCM error
set signcolumn=yes

" Mappings
" --------------------------------------

" Open vim-dispatch window and scroll to bottom
nnoremap    <C-m>m    :Copen<CR> <bar> G

" Build debug and release targets
nnoremap    <C-m>bd   :Dispatch! make -C build/Debug<CR>
nnoremap    <C-m>br   :Dispatch! make -C build/Release<CR>

" Functions
" ---------------------------------------

" Map <F6> to the Debug executable with passed filename
function SetBinaryDebug(filename)
    let bpath = getcwd() . "/bin/Debug/" . a:filename
    execute "nnoremap <F6> :Dispatch "
            \ bpath
            \ . " <CR> <bar> :Copen<CR>"
    echo "<F6> will run: " . bpath
endfunction

" Map <F7> to the Release executable with passed filename
function SetBinaryRelease(filename)
    let bpath = getcwd() . "/bin/Release/" . a:filename
    execute "nnoremap <F7> :Dispatch "
                \ bpath
                \ . "<CR> <bar> :Copen<CR>"
    echo "<F7> will run: " . bpath
endfunction
