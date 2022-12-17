let mapleader = "\<Space>"
filetype off

" ==============================================================================
" " # PLUGINS
" ==============================================================================

call plug#begin('~/.vim/plugged')

" GUI 
Plug 'preservim/nerdtree'

" Themes
Plug 'axvr/photon.vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'

" Editor
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" ==============================================================================
" " # EDITOR SETTINGS
" ==============================================================================

filetype plugin indent on
syntax on
filetype plugin on

" Stop `helpful` comment newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set autoindent
set encoding=utf8
set hidden
set nojoinspaces
set noshowmode
set nowrap
set printencoding=utf-8
set printfont=:h10
set printoptions=paper:letter

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

" Neovide specific settings
if exists("g:neovide")
	set guifont=JetBrains\ Mono:h16
	let g:neovide_transparency = 0.85
	let g:neovide_refresh_rate = 120
	let g:neovide_refresh_rate_idle = 0
	let g:neovide_hide_mouse_when_typing = v:true
endif

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
let g:NERDTreeWinPos = "right"
colorscheme zenburn
hi Normal guibg=#062b2a " main background color
hi Visual guifg=#062b2a guibg=#DADF89 ctermfg=236 ctermbg=210
hi clear LineNr " clear the background on line numbers
set signcolumn=no
set cmdheight=1

" ==============================================================================
" " # LANGUAGE SPECIFIC SETTINGS
" ==============================================================================

let g:rustfmt_autosave = 1

augroup javascript_typescript_settings 
	autocmd!
	autocmd FileType typescript set shiftwidth=2
	autocmd FileType typescript set softtabstop=2
	autocmd FileType typescript set tabstop=2
	autocmd FileType javascript set shiftwidth=2
	autocmd FileType javascript set softtabstop=2
	autocmd FileType javascript set tabstop=2
	autocmd FileType json set shiftwidth=2
	autocmd FileType json set softtabstop=2
	autocmd FileType json set tabstop=2
augroup END

" Do not autoclose
let g:autoclose = 0

" LaTeX settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ==============================================================================
" " # KEYBOARD SHORTCUTS
" ==============================================================================

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
nmap <silent> sf :NERDTreeFind<Return>
let g:NERDTreeWinSize=35

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
nnoremap <leader>? :vsplit <CR> <C-w>l <Plug>(coc-definition) zz
nnoremap <C-_> :call nerdcommenter#Comment("x", "toggle")<Return>
nnoremap <C-\> :call nerdcommenter#Comment("x", "toggle")<Return>

"Fix forward jumps
nnoremap <C-n>i <C-i>

"Rust stuff
nmap Rf :RustFmt<Return>
nmap Rr :RustRun<Return>
nmap Rt :RustTest<Return>
nmap Ra :RustEmitAsm<Return>
nmap Ri :RustEmitIr<Return>

"Fatih Golang minis
nmap gb :GoBuild<Return>
nmap gc :GoCoverageToggle<Return>
nmap gR :GoRun<Return>
nmap gt :GoTest<Return>
nmap gD :GoDoc<Return>
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
nmap <leader>R <Plug>(coc-rename)

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
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use Tab to indent forward and backwards in normal mode
nmap <Tab> >>
nmap <s-Tab> <<
vmap <Tab> >>
vmap <s-Tab> <<

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^={coc#status()}%{get(b:,'coc_current_function','')} 
set statusline=%F%m%r%h%w\ %=%l,%v

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
