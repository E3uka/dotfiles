let mapleader = "\<Space>"
filetype off

" =============================================================================
" " # PLUGINS
" =============================================================================

call plug#begin('~/.vim/plugged')

" GUI 
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Themes
Plug 'morhetz/gruvbox'

" Editor
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-highlightedyank'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Language support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'lervag/vimtex'

" Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" =============================================================================
" " # EDITOR SETTINGS
" =============================================================================

filetype plugin indent on
syntax on
filetype plugin on

set autoindent
set encoding=utf8
set noshowmode
set hidden
set nowrap
set nojoinspaces
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Sane tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" =============================================================================
" " # GUI SETTINGS
" =============================================================================

set guioptions-=T "Remove toolbar
set backspace=2 " backspace over newlines
set nofoldenable
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber
set number
set diffopt+=iwhite " No whitespace in vimdiff
set diffopt+=indent-heuristic 
set colorcolumn=80
set showcmd
set mouse=a
set shortmess+=c
set ruler

set termguicolors
colorscheme gruvbox

hi Normal guibg=NONE " disables background
hi Normal guifg=#e8e8e8 " make text just off-white

" =============================================================================
" " # LANGUAGE SPECIFIC SETTINGS
" =============================================================================

" markdown column
au FileType markdown set colorcolumn=80

" markdown column
au FileType sql set colorcolumn=

" Python
au FileType python set colorcolumn=100

" PHP
au FileType php set colorcolumn=100

" Rust
au FileType rust set colorcolumn=100
let g:rustfmt_autosave = 1

"Do not autoclose
let g:autoclose = 0

" LaTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" =============================================================================
" " # KEYBOARD SHORTCUTS
" =============================================================================

"split windows
nmap ss :split<Return><C-w>l
nmap sv :vsplit<Return><C-w>j

"switch windows
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

"resize windows
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"vim tabs
function! s:list_cmd()
	let base = fnamemodify(expand('%'), ':h:.:S')
	return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
	\                               'options': '--tiebreak=index'}, <bang>0)

nmap <silent> tn :tabnext<Return>
nmap <silent> tp :tabprev<Return>

"open new file adjacent to current file
nmap te :e <C-R>=expand("%:p:h") . "/" <CR>

"open new file in new tab adjacent to current file
nmap tE :tabedit <C-R>=expand("%:p:h") . "/" <CR>

"vim scrolling speedup
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"NerdTree
nmap <silent> se :NERDTreeToggle<Return>
let g:NERDTreeWinSize=25

" FZF settings
nnoremap <leader><leader>f :Files<CR>
nnoremap <C-p> :Files<CR>

nnoremap <leader>l :Lines<CR>
nnoremap <leader>L :Locate /<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader><leader>l :BLines<CR>
nnoremap <C-Tab> :Windows<CR>
nnoremap <leader>r :Rg<CR>

"Highlighting
nnoremap <silent> <leader>h :syntax off<CR>
nnoremap <silent> <leader><leader>h :syntax on<CR>

"Damian Conway Setups
nmap S :%s//g<LEFT><LEFT>
nnoremap v <C-V>
nnoremap <C-V> v
nmap <silent> <BS> :nohlsearch<CR>
nmap <expr> M ':%s/' .@/ . '//g<LEFT><LEFT>'
nmap <expr> m ':.,$s/' .@/ . '//g<LEFT><LEFT>'

"Ebuka Special
nmap ? :vsplit <CR> <C-w>l <Plug>(coc-definition) zz

"Fatih Golang minis
nmap gb :GoBuild<Return>
nmap gc :GoCoverage<Return>
nmap gR :GoRun<Return>
nmap gt :GoTest<Return>
nmap gD :GoDoc<Return>
nmap gh :GoSameIds<Return>
nmap gH :GoSameIdsClear<Return>
nmap gI :GoImports<Return>
" Look into guru in the future - https://github.com/fatih/vim-go/wiki/Tutorial#quick-setup and gorename
set autowrite
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"let g:go_fmt_command = "goImports"
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" -------------------COC GITHUB STUFF------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
    " Use `complete_info` if your (NeoVim version supports it.
    inoremap <)expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>" 
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
