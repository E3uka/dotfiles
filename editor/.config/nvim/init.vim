let mapleader = "\<Space>"
filetype off

" ==============================================================================
" " # PLUGINS
" ==============================================================================

call plug#begin('~/.vim/plugged')

" Themes
Plug 'axvr/photon.vim'
Plug 'jnurmine/Zenburn'
Plug 'yorickpeterse/nvim-grey'

" Editor
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'stevearc/oil.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://codeberg.org/ziglang/zig.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
lua require("oil").setup()

" ==============================================================================
" " # EDITOR SETTINGS
" ==============================================================================

filetype plugin indent on
filetype plugin on
syntax on

" Stop `helpful` comment newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set autowrite
set autoindent
set encoding=utf8
set hidden
set nojoinspaces
set noshowmode
set nowrap

" Case insensitive forward and backwards search
set ignorecase
set smartcase

" Sane splits
set splitbelow
set splitright

" Sane tabs
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Wrapping options
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines
set formatoptions+=n " detect lists for formatting
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions=tc " wrap text and comments using textwidth

" ==============================================================================
" " # GUI SETTINGS
" ==============================================================================

set backspace=2 " backspace over newlines
set diffopt+=indent-heuristic 
set diffopt+=iwhite " No whitespace in vimdiff
set guioptions-=T "Remove toolbar
set laststatus=2
set lazyredraw
set mouse=a
set nofoldenable
set number
set relativenumber
set ruler
set shortmess+=c
set showcmd
set synmaxcol=500
set termguicolors
set ttyfast
colorscheme grey
set signcolumn=no
set cmdheight=1
set colorcolumn=120

" hi Normal guibg=#062b2a " main background color
" hi Visual guifg=#062b2a guibg=#DADF89 ctermfg=236 ctermbg=210
hi NormalFloat guibg=#dce3e3 " main background color
hi clear LineNr " clear the background on line numbers

" ==============================================================================
" " # LANGUAGE SPECIFIC SETTINGS
" ==============================================================================

let g:autoclose = 0 " Do not autoclose quick fix list

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:rustfmt_autosave = 1

" LaTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ==============================================================================
" " # KEYBOARD SHORTCUTS
" ==============================================================================

" split windows
nmap ss :split<Return><C-w>l
nmap sv :vsplit<Return><C-w>j

" switch windows
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" resize windows
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" vim tabs
function! s:list_cmd()
	let base = fnamemodify(expand('%'), ':h:.:S')
	return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

nmap <silent> tn :tabnext<Return>
nmap <silent> tp :tabprev<Return>

" open new file adjacent to current file
nmap te :e <C-R>=expand("%:p:h") . "/" <CR>

" open new file in new tab adjacent to current file
nmap tE :tabedit <C-R>=expand("%:p:h") . "/" <CR>

" vim scrolling speedup
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" ripgrep as vim grep
if executable('rg')
	set grepprg=rg\ --vimgrep\ -uu\ --smart-case\ --follow
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Oil settings
nnoremap <leader><leader>f :Oil --preview<CR>

" FZF settings
nnoremap <C-p> :Files<CR>
nnoremap <leader><leader>l :BLines<CR>
nnoremap <leader><leader>r :Rg<CR>
nnoremap <leader>B :BMarks<CR>
nnoremap <leader>L :Locate /<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>l :Lines<CR>


" Highlighting
nnoremap <silent> <leader>h :syntax off<CR>
nnoremap <silent> <leader><leader>h :syntax on<CR>

" Damian Conway Setups
nmap S :%s//g<LEFT><LEFT>
nnoremap v <C-V>
nnoremap <C-V> v
nmap <silent> <BS> :nohlsearch<CR>
nmap <expr> <leader>M ':%s/' .@/ . '//g<LEFT><LEFT>'
nmap <expr> <leader>m ':.,$s/' .@/ . '//g<LEFT><LEFT>'

" Ebuka Special
nnoremap <leader>? :vsplit <CR> <C-w>l <Plug>(coc-definition)

" Fix forward jumps
nnoremap <C-n>i <C-i>

" Fatih Golang minis
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_autosave = 1 
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" -------------------COC GITHUB STUFF------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc rename
nnoremap <leader>r :call CocActionAsync('rename')<CR>

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
