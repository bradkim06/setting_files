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
Plug 'martinlroth/vim-devicetree'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
" Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-test/vim-test'
Plug 'sainnhe/everforest'
Plug 'vim-autoformat/vim-autoformat'
Plug 'ilyachur/cmake4vim'
" Plug 'puremourning/vimspector'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'madox2/vim-ai'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => formatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  autocmd FileType swift AutoFormatBuffer swift-format
  autocmd FileType sh AutoFormatBuffer shfmt
augroup END

" Plug 'rhysd/vim-clang-format'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced C and C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'

" additional vim c++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sainnhe/sonokai'
" Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'joshdick/onedark.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => beauty
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" icon diplay
Plug 'ryanoasis/vim-devicons'
" Scroll Bar
" Plug 'sslivkoff/vim-scroll-barnacle'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'luochen1990/rainbow'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-commentary plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-commentary'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lazygit.nvim plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kdheepak/lazygit.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdtree'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
endif

" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
set wildignorecase
set hlsearch
set encoding=utf-8
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
" nnoremap d "_d
" xnoremap d "_d
" xnoremap p "_dP

" yank to clipboard
nnoremap y "+y
nnoremap p "+p

if exists('&colorcolumn')
    set colorcolumn=80
endif

let g:python3_host_prog = '/opt/homebrew/bin/python3'

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
nnoremap <F3> :!west build<cr>
" nnoremap <F3> :!west build -b nrf52dk_nrf52832 -- -DCONFIG_COMPILER_SAVE_TEMPS=y<cr>
nnoremap <F4> :!west flash<cr>
" nnoremap <F4> :!west flash --erase --runner jlink<cr>
" nnoremap <F4> :!./flash.sh<cr>


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
" => nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-t> :NERDTreeToggle<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language formatter
let formatFiles = "*.json,*.go"
execute "autocmd BufWritePre " . formatFiles . " call CocAction('format')"
" autocmd BufWritePre *.markdown call CocAction('fixAll');

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
" nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>

" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)

nmap gi <Plug>(coc-git-chunkinfo)
nmap gs <Plug>(coc-git-chunkStage)
nmap gu <Plug>(coc-git-chunkUndo)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clang Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clang-Format
let g:clang_format#style_options = {
            \ "SortIncludeds": "false",
            \ "IndentWidth": 4,
            \ "Standard" : "C++11"}
" " map to <Leader>cf in C++ code
" autocmd FileType c,cc,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cc,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
" autocmd FileType c,cc,cpp ClangFormatAutoEnable
" " if you install vim-operator-user
" autocmd FileType c,cc,cpp map <buffer><Leader>x <Plug>(operator-clang-format)
" " Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" autocmd FileType c,cpp ClangFormatAutoEnable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf & fzf.vim plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>/        :Rg<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <F1> :Maps<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
let g:airline_theme='everforest'
" Lean & mean status/tabline for vim that's light as air.
let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" show only file name on tabs
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'espresso'
let g:sonokai_enable_italic = 1
let g:sonokai_spell_foreground = 'colored'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'
let g:sonokai_current_word = 'grey background'
let g:sonokai_disable_italic_comment = 1


" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:everforest_background = 'hard'
let g:everforest_cursor = 'auto'
let g:everforest_current_word = 'underline'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_diagnostic_virtual_text = 'colored'

" For better performance
let g:everforest_better_performance = 1

syntax on
" set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" help you read complex code by showing diff level of parentheses in diff color
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-commentary plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType c,cpp setlocal commentstring=/*\ %s
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lazygit.nvim plug-in
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :LazyGit<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
            \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto-pair
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:AutoPairsShortcutToggle = ''
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto-format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufWrite *.c,*.h :Autoformat
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cmake4vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:cmake_usr_args = "-GNinja"
" let g:cmake_build_target = "build.ninja"
let g:cmake_compile_commands = 1
let g:cmake_compile_commands_link = 1
let g:cmake_build_executor_height = 20
let g:cmake_build_dir_prefix = "build-"
let g:cmake_build_type = "Debug"
" let g:cmake_change_build_command = 1
let g:cmake_kits = {
            \"bradkim06": {
            \"generator": "Ninja"
            \} }

" autocmd BufWritePre *.markdown call CocAction('fixAll');
autocmd VimEnter * :CMakeSelectKit bradkim06

" coc-extensions
" let g:coc_global_extensions = ['coc-clangd']

" doxygen
let g:DoxygenToolkit_authorName="bradkim06@gmail.com"

" snippet
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
\    "max_tokens": 1000,
\    "temperature": 0.1,
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
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "enable_auth": 1,
\    "selection_boundary": "",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}


let g:vim_ai_debug=1
" edit text with a custom prompt
xnoremap <leader>s :AIEdit check this c code for write comments, like a skilled Linux kernel C developer in Doxygen style.<CR>
xnoremap <leader>c :AI Please write a commit message like a Linux kernel developer would.<CR>
xnoremap <C-R> :AIEdit check this c code for bugs and code smells, and Improve the variable names, write comments in doxygen style like a skilled Linux kernel C developer.<CR>


" YcmCompleter
" let g:ycm_show_detailed_diag_in_popup=1
" let g:ycm_enable_semantic_highlighting=1
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_collect_identifiers_from_tags_files = 1

" function! Rename()
"   let name = input('Input RefactorRename: ')
"   :execute "YcmCompleter RefactorRename " . name
" endfunction

" nnoremap <C-d> :YcmCompleter GoTo<CR>
" nnoremap gr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>rn :call Rename()<CR>
" nnoremap <leader>f :YcmCompleter FixIt<CR>
" nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
" nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)

" " Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif

" " Use homebrew's clangd
" let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" Show all diagnostics
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" BufRead,BufNewFile 이벤트가 발생할 때, 파일 확장자가 .dts 또는 .dtsi인 경우, 
" 파일 유형을 'dts'로 설정합니다.
au BufRead,BufNewFile *.dts,*.dtsi set filetype=dts

" 파일 유형이 'dts'인 경우, 자동 들여쓰기(autoindent)를 설정합니다.
autocmd FileType dts set autoindent
