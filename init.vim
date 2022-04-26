" ============================================================================
" .vimrc of bradkim06 {{{
" ============================================================================


let mapleader      = ' '
let maplocalleader = ' '

" }}}
" ============================================================================
"
"
" ============================================================================
" Plug {{{
" ============================================================================

silent! if plug#begin('~/.vim/plugged')
" Plug 'Shougo/deoplete.nvim'
" Plug 'sbdchd/neoformat'
" Plug 'dense-analysis/ale'
Plug 'buoto/gotests-vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" color
Plug 'octol/vim-cpp-enhanced-highlight'
"
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

" Plug 'rhysd/vim-clang-format'
" let g:clang_format#style_options = {
"             \ "AccessModifierOffset" : -4,
"             \ "AllowShortIfStatementsOnASingleLine" : "true",
"             \ "AlwaysBreakTemplateDeclarations" : "true",
"             \ "Standard" : "C++11"}

" " map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" " if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" " Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" " autocmd FileType c ClangFormatAutoEnable

Plug 'tpope/vim-commentary'
autocmd FileType c,cpp setlocal commentstring=//\ %s
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

Plug 'kdheepak/lazygit.nvim'
nnoremap <F2> :LazyGit<cr>

Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
call plug#end()
endif


" }}}
" ============================================================================
"
" ============================================================================
" vim-airline {{{
" ============================================================================

let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 1   " show tabline only if there is more than 1 buffer
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
" let g:airline_theme = 'gruvbox_material'
let g:airline_theme = 'sonokai'

" }}}
" ============================================================================
"
" ============================================================================
" fzf {{{
" ============================================================================
"
let $FZF_DEFAULT_OPTS .= ' --inline-info'
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

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p100%,100%' }
else
  let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
endif

nnoremap <silent> <Leader><Enter>  :Buffers<CR>
" TODO
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>/        :Rg<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <F1> :Maps<cr>

" }}}
" ============================================================================

" ============================================================================
" color {{{
" ============================================================================
"
" Important!!
if has('termguicolors')
  set termguicolors
endif
set background=dark

" The configuration options should be placed before `colorscheme sonokai`.
" let g:sonokai_style = 'espresso'
" let g:sonokai_enable_italic = 1
" let g:sonokai_spell_foreground = 'colored'
" let g:sonokai_diagnostic_text_highlight = 1
" let g:sonokai_diagnostic_line_highlight = 1
" let g:sonokai_diagnostic_virtual_text = 'colored'
" let g:sonokai_current_word = 'grey background'
" let g:sonokai_disable_italic_comment = 1
" colorscheme sonokai

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_palette = {
      \ 'bg0':              ['#101010',   '234'],
      \ 'bg1':              ['#262727',   '235'],
      \ 'bg2':              ['#282828',   '235'],
      \ 'bg3':              ['#3c3836',   '237'],
      \ 'bg4':              ['#3c3836',   '237'],
      \ 'bg5':              ['#504945',   '239'],
      \ 'bg_statusline1':   ['#282828',   '235'],
      \ 'bg_statusline2':   ['#32302f',   '235'],
      \ 'bg_statusline3':   ['#504945',   '239'],
      \ 'bg_diff_green':    ['#32361a',   '22'],
      \ 'bg_visual_green':  ['#333e34',   '22'],
      \ 'bg_diff_red':      ['#3c1f1e',   '52'],
      \ 'bg_visual_red':    ['#442e2d',   '52'],
      \ 'bg_diff_blue':     ['#0d3138',   '17'],
      \ 'bg_visual_blue':   ['#2e3b3b',   '17'],
      \ 'bg_visual_yellow': ['#C3B1E1',   '94'],
      \ 'bg_current_word':  ['#FF5733',   '236'],
      \ 'fg0':              ['#d4be98',   '223'],
      \ 'fg1':              ['#ddc7a1',   '223'],
      \ 'red':              ['#ea6962',   '167'],
      \ 'orange':           ['#e78a4e',   '208'],
      \ 'yellow':           ['#d8a657',   '214'],
      \ 'green':            ['#a9b665',   '142'],
      \ 'aqua':             ['#89b482',   '108'],
      \ 'blue':             ['#7daea3',   '109'],
      \ 'purple':           ['#d3869b',   '175'],
      \ 'bg_red':           ['#ea6962',   '167'],
      \ 'bg_green':         ['#a9b665',   '142'],
      \ 'bg_yellow':        ['#d8a657',   '214'],
      \ 'grey0':            ['#7c6f64',   '243'],
      \ 'grey1':            ['#928374',   '245'],
      \ 'grey2':            ['#a89984',   '246'],
      \ 'none':             ['NONE',      'NONE']
      \ }
" let g:gruvbox_material_background = 'soft'
" let g:gruvbox_material_ui_contrast = 'soft'
" let g:gruvbox_material_diagnostic_line_highlight = 1
" let g:gruvbox_material_menu_selection_background = 'orange'
" let g:gruvbox_material_visual = 'green background'
" let g:gruvbox_material_current_word = 'grey background'
" let g:gruvbox_material_palette.bg_current_word = 'red'

colorscheme gruvbox-material

" let g:gruvbox_termcolors=256
" let g:gruvbox_contrast_dark="hard"
" silent! colo gruvbox

" let g:seoul256_background = 233
" silent! colo seoul256

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

" silent! execute "PlugUpgrade"
" silent! execute "PlugUpdate"
"
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

set fileencodings=utf8,euc-kr

set clipboard=unnamed
set nu
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set expandtab smarttab
set mouse=a

" 80 chars/line
set textwidth=0

if exists('&colorcolumn')
  set colorcolumn=80
endif


nnoremap ; :

" MYVIMRC
nnoremap <leader>ev         :edit $MYVIMRC<cr>
nnoremap <leader>sv         :source $MYVIMRC<cr>

" Buffer
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <S-q> :BufOnly<cr>

nnoremap <Leader>q :bd<cr>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" yank to clipboard
nnoremap y "+y
nnoremap p "+p

" }}}
" ============================================================================
"
" let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/opt/homebrew/bin/python3'
let g:loaded_perl_provider = 0

" ============================================================================
" ALE {{{
" ============================================================================

"nnoremap <C-d> :ALEGoToDefinition<cr>
"nnoremap <leader>gr :ALEFindReferences<cr>
"nnoremap <leader>rn :ALERename<cr>


"" Enable completion where available.
"" This setting must be set before ALE is loaded.
""
"" You should not turn this setting on if you wish to use ALE as a completion
"" source for other completion plugins, like Deoplete.
"let g:ale_completion_enabled = 1
"let g:ale_completion_autoimport = 1
"set omnifunc=ale#completion#OmniFunc

"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '.'
"let g:ale_linters = {
"    \ 'python': ['pylint'],
"    \ 'vim': ['vint'],
"    \ 'cpp': ['clangd'],
"    \ 'c': ['clangd']
"\}
"let g:ale_fixers = {
"\   'c': ['clang-format'],
"\   'cpp': ['clang-format'],
"\}
"let g:ale_linters_explicit = 1
"let g:ale_fix_on_save = 1

"" custom setting for clangformat
"let g:neoformat_try_node_exe = 1
"let g:neoformat_cpp_clangformat = {
"    \ 'exe': 'clang-format',
"    \ 'args': ['--style="{IndentWidth: 4}"']
"\}
"let g:neoformat_enabled_cpp = ['clangformat']
"let g:neoformat_enabled_c = ['clangformat']
" }}}
" ============================================================================
"
"

let file_name = expand('%:t:r')
nnoremap <F3> :!ceedling clean && ceedling logging test:'%'<cr>
nnoremap <F4> :!ceedling clean && ceedling logging gcov:'%' utils:gcov<cr>


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
" nmap [c <Plug>(coc-git-prevconflict)
" nmap ]c <Plug>(coc-git-nextconflict)
nmap gs :CocCommand git.chunkStage<cr>
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>

" GoTo code navigation.
nmap <silent> <C-d> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" coc-snippets
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

inoremap <F5> <C-R>=strftime("%Y-%m-%d")<cr>

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
let g:gotests_bin = '/opt/homebrew/bin/gotests'
