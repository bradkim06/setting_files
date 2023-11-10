" ============================================================================
" vimrc of bradkim06
" ============================================================================

" lua require('basic')

" " Vimscript file settings folderble
" augroup filetype_vim
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
" augroup END

" With a map leader it's possible to do extra key combinations
let mapleader      = ' '
let maplocalleader = ' '

" BASIC  {{{
" ============================================================================

syntax on
filetype plugin on
set wildmode=full
set hidden
set incsearch
" treat all numerals as decimal, regardless of whether they are padded with zeros.
set nrformats=
" set background=dark
set wildignorecase
set hlsearch
set encoding=utf-8
set fileencodings=utf8

set clipboard=unnamed
set nu
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a

" 80 chars/line
set textwidth=80

if exists('&colorcolumn')
    set colorcolumn=80
endif

let g:python3_host_prog = '/opt/homebrew/bin/python3'

" ============================================================================
" => Moving around, tabs, windows and buffers
" ============================================================================
" MYVIMRC edit
nnoremap <leader>ve         :edit $MYVIMRC<cr>
nnoremap <leader>vl         :edit ~/.config/nvim/lua/basic.lua<cr>
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

" ============================================================================
" => Useful Mappings
" ============================================================================
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Remap Control+p to act as the Up arrow key in command-line mode
cnoremap <C-p> <Up>

" Remap Control+n to act as the Down arrow key in command-line mode
cnoremap <C-n> <Down>

" Search for the Current Selection (Redux)
xnoremap * :<C-u>call <SID>SetSearchPattern()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>SetSearchPattern()<CR>?<C-R>=@/<CR><CR>

" 이 함수는 비주양행 모드에서 선택한 텍스트를 검색 패턴으로 설정합니다.
function! s:SetSearchPattern()
  " 현재 's' 레지스터 값을 임시 변수에 저장합니다.
  let temp = getreg('s')

  " 비주양행 모드에서 선택 영역을 's' 레지스터에 복사합니다.
  norm! gv"sy

  " 검색 패턴을 설정합니다. 이때, 특수 문자와 줄바꿈 문자를 이스케이프합니다.
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')

  " 원래 's' 레지스터 값을 복원합니다.
  let @s = temp
endfunction

" ============================================================================
" color
" ============================================================================
" Important!!

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


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

    "파일을 열 때 커서 위치 복원
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

" ============================================================================
" => Helper mapping
" ============================================================================
" comfortable command mode
" nnoremap ; :

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" current year-month-date input
inoremap <F5> <C-R>=strftime("%Y-%m-%d")<cr>
inoremap <F6> <C-R>=strftime("%Y-%m-%dT%H:%M:%S")<cr>

" ============================================================================
" => Helper functions
" ============================================================================
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

nnoremap <F3> :!west build<cr>
nnoremap <F4> :!west flash<cr>
"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ============================================================================
" }}} BASIC SETTINGS

" Plug-In {{{ 1
" ============================================================================
" Use silent! to suppress error messages if plug#begin() is not defined
silent! if plug#begin('~/.vim/plugged')

" plug#newly {{{
" ============================================================================
Plug 'tpope/vim-surround'
" universal set of defaults
Plug 'tpope/vim-sensible'

" Simplify the creation of Doxygen comments in C, C++, Python
Plug 'vim-scripts/DoxygenToolkit.vim'      

let g:DoxygenToolkit_authorName="bradkim06@gmail.com"

" AI for Vim
Plug 'madox2/vim-ai'                       

" This prompt instructs model to work with syntax highlighting
let s:initial_chat_prompt =<< trim END
>>> system

You are a general assistant.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
END

let g:vim_ai_complete = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-4",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 4000,
\    "temperature": 0.7,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}

let g:vim_ai_edit = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-4",
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "max_tokens": 4000,
\    "temperature": 0.7,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}

" edit text with a custom prompt
xnoremap <leader>s :AIEdit check this c code for write comments, like a skilled Linux kernel C developer in Doxygen style.<CR>
xnoremap <leader>c :AI Please write a commit message like a Linux kernel developer would.<CR>
xnoremap <C-R> :AIEdit check this c code for bugs and code smells, and Improve the variable names, write comments in doxygen style like a skilled Linux kernel C developer.<CR>

" ============================================================================
" }}} plug#newly

" plug#formatter {{{ 2
" Plug command is used to manage plugins in Vim
" Here we are adding two plugins: vim-maktaba and vim-codefmt from Google
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" An augroup is used to define a group of autocommands that will be set up together
" Here we are defining an augroup named autoformat_settings
augroup autoformat_settings
  " autocmd is used to execute commands automatically in response to certain events
  " Here we are setting up autocommands for different file types to auto format buffer using different formatters

  " For bzl file type, use buildifier formatter
  autocmd FileType bzl AutoFormatBuffer buildifier

  " For c, cpp, proto, javascript, arduino file types, use clang-format formatter
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format

  " For dart file type, use dartfmt formatter
  autocmd FileType dart AutoFormatBuffer dartfmt

  " For go file type, use gofmt formatter
  autocmd FileType go AutoFormatBuffer gofmt

  " For gn file type, use gn formatter
  autocmd FileType gn AutoFormatBuffer gn

  " For html, css, sass, scss, less, json file types, use js-beautify formatter
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify

  " For java file type, use google-java-format formatter
  autocmd FileType java AutoFormatBuffer google-java-format

  " For python file type, use yapf formatter
  " Alternatively, you can use autopep8 formatter for python file type
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8

  " For rust file type, use rustfmt formatter
  autocmd FileType rust AutoFormatBuffer rustfmt

  " For vue file type, use prettier formatter
  autocmd FileType vue AutoFormatBuffer prettier

  " For swift file type, use swift-format formatter
  autocmd FileType swift AutoFormatBuffer swift-format

  " For sh file type, use shfmt formatter
  autocmd FileType sh AutoFormatBuffer shfmt
augroup END
" ============================================================================
" }}} plug#formatter

" plug#coc.nvim {{{
" ============================================================================
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)

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


" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

"nmap gi <Plug>(coc-git-chunkinfo)
"nmap gs <Plug>(coc-git-chunkStage)
"nmap gu <Plug>(coc-git-chunkUndo)

" Show all diagnostics
nnoremap <silent><nowait> <space>l  :<C-u>CocList diagnostics<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" coc-extensions

" let g:coc_global_extensions = ['coc-clangd']

" language formatter
" ============================================================================
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Define a variable to hold the file formats we want to auto format
let formatFiles = "*.json,*.go"

" Execute an auto command before saving the buffer
" This command will call the 'format' action from CocAction for the specified file formats
execute "autocmd BufWritePre " . formatFiles . " call CocAction('format')"

" coc-snippet
" ============================================================================
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" ============================================================================
" }}} plug#coc.nvim

" plug#junegunn {{{
" ============================================================================
" general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

" ============================================================================
" => fzf & fzf.vim plug-in
" ============================================================================
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!.idea'"

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

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
  copen
  cc
endfunction

let g:fzf_action = { 'ctrl-v': 'vsplit' }

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['right,50%', 'ctrl-t']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }


nnoremap <silent> <Leader>b        :Buffers<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>ag       :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>/        :Rg<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <F1> :Maps<cr>

" ============================================================================
" }}} plug#junegunn

" plug#vim-airline {{{
" ============================================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
let g:airline_theme='gruvbox'
" Lean & mean status/tabline for vim that's light as air.
let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" show only file name on tabs
let g:airline#extensions#tabline#fnamemod = ':t'

" ============================================================================
" }}} plug#vim-airline

" plug#beauty {{{
" ============================================================================
" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'                

" Enhanced C and C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'

" additional vim c++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" icon diplay
Plug 'ryanoasis/vim-devicons'

" Parentheses Rainbow Color
Plug 'luochen1990/rainbow'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" help you read complex code by showing diff level of parentheses in diff color

" ============================================================================
" }}} plug#beauty

" plug#colorscheme {{{
" ============================================================================
Plug 'morhetz/gruvbox'

" ============================================================================
" }}} plug#colorscheme

" plug#util {{{
" ============================================================================
" 'tpope/vim-commentary' is a plugin for commenting out lines of code
Plug 'tpope/vim-commentary'

" autocmd FileType c,cpp setlocal commentstring=/*\ %s
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" 'kdheepak/lazygit.nvim' is a plugin for integrating the lazygit terminal UI with Neovim
Plug 'kdheepak/lazygit.nvim'

nnoremap <F2> :LazyGit<cr>

" 'preservim/nerdtree' is a plugin for exploring filesystems and to open files and directories
Plug 'preservim/nerdtree'

nnoremap <C-t> :NERDTreeToggle<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" ============================================================================
" }}} plug#util

" plug#markdown {{{
" ============================================================================
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" ============================================================================
" }}} plug#markdown

" End of plug#begin block
call plug#end()
endif
" ============================================================================
" }}} Plug-In

colorscheme gruvbox
