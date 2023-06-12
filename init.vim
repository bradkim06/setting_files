"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc of bradkim06
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader      = ' '
let maplocalleader = ' '


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-In
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! if plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => color & visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" Enhanced C and C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'

" additional vim c++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" color plugin
Plug 'sainnhe/sonokai'

" icon diplay
Plug 'ryanoasis/vim-devicons'

" help you read complex code by showing diff level of parentheses in diff color
Plug 'luochen1990/rainbow'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 3rd party
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment stuff out
Plug 'tpope/vim-commentary'
Plug 'kdheepak/lazygit.nvim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lazygit.nvim plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :LazyGit<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" show only file name on tabs
let g:airline#extensions#tabline#fnamemod = ':t'            


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf & fzf.vim plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea'"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:60%', 'ctrl-/']

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'xoffset': 1 } }

nnoremap <silent> <Leader>b        :Buffers<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>/        :Rg<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <F1> :Maps<cr>


" ============================================================================
" color {{{
" ============================================================================
" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'espresso'
let g:sonokai_enable_italic = 1
let g:sonokai_spell_foreground = 'colored'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:sonokai_current_word = 'grey background'
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

if has('nvim')
  " https://github.com/neovim/neovim/issues/2897#issuecomment-115464516
  let g:terminal_color_0 = '#4e4e4e'
  let g:terminal_color_1 = '#d68787'
  let g:terminal_color_2 = '#5f865f'
  let g:terminal_color_3 = '#d8af5f'
  let g:terminal_color_4 = '#85add4'
  let g:terminal_color_5 = '#d7afaf'
  let g:terminal_color_6 = '#87afaf'
  let g:terminal_color_7 = '#d0d0d0'
  let g:terminal_color_8 = '#626262'
  let g:terminal_color_9 = '#d75f87'
  let g:terminal_color_10 = '#87af87'
  let g:terminal_color_11 = '#ffd787'
  let g:terminal_color_12 = '#add4fb'
  let g:terminal_color_13 = '#ffafaf'
  let g:terminal_color_14 = '#87d7d7'
  let g:terminal_color_15 = '#e4e4e4'

  set fillchars=vert:\|,fold:-
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
else
  let g:terminal_ansi_colors = [
    \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
    \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
    \ '#626262', '#d75f87', '#87af87', '#ffd787',
    \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4']
endif

" }}}
" ============================================================================


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-commentary plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c,cpp setlocal commentstring=//\ %s
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" silent! execute "PlugUpgrade"
" silent! execute "PlugUpdate"
"
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
" set encoding=utf-8
" set fileencodings=utf-8
set fileencodings=utf8,euc-kr
" set fileencodings=utf-8

set clipboard=unnamed
set nu
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set expandtab smarttab
set mouse=a

" 80 chars/line
set textwidth=0

" black hole register
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP

" yank to clipboard
nnoremap y "+y
nnoremap p "+p

if exists('&colorcolumn')
  set colorcolumn=80
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MYVIMRC edit
nnoremap <leader>ve         :edit $MYVIMRC<cr>
nnoremap <leader>vs         :source $MYVIMRC<cr>

" Close all buffer except the curren
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <S-q> :BufOnly<CR>

" close current buffer
nnoremap <Leader>q :bd<CR>

" move next buffer
nnoremap <Tab> :bnext<CR>
" move previous buffer
nnoremap <S-Tab> :bprevious<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comfortable command mode
" nnoremap ; :

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" current year-month-date input
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<cr>
inoremap <F6> <C-R>=strftime("%Y-%m-%dT%H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Current Filename
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


" compile c++
function! CompileCPP()
    let build_name = expand('%:r')
    let file_name = expand('%')
    exec ':!clang++ -std=c++17 -O2 -Wno-unused-result -o ' . build_name . ' ' . file_name
    exec ':term ./' . build_name
endfunction

" compile c
function! CompileC()
    let build_name = expand('%:r')
    let file_name = expand('%')
    exec ':!clang -std=c18 -O2 -Wno-unused-result -o ' . build_name . ' ' . file_name
    exec ':term ./' . build_name
endfunction

" nnoremap <F3> :call CompileCPP()<cr>
nnoremap <F3> :call CompileC()<cr>


" Auto Update Plug-In
function! OnVimEnter() abort
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()

" nnoremap <F3> :!ceedling clean && ceedling logging test:'%'<cr>
" nnoremap <F4> :!ceedling clean && ceedling logging gcov:'%' utils:gcov<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1000

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <C-d> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>f  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Mappings for CoCList
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>R  :<C-u>CocListResume<CR>

 " navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)

nmap gi <Plug>(coc-git-chunkinfo)
nmap gs <Plug>(coc-git-chunkStage)
nmap gu <Plug>(coc-git-chunkUndo)
