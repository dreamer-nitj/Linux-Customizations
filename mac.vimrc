set nocompatible
filetype off

" vim to turn on/off pasting by pressing F2 key
set pastetoggle=<F2>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'

" Track the engine.
" Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" Plugin 'w0rp/ale'
" Plugin 'majutsushi/tagbar'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" The following examples of different formats supported.
" keep Plugin commands between vundle#begin/end/
" plugin on github repo
" Bundle 'Pydiction'

" Add go lang support
Bundle 'fatih/vim-go'
" Bundle 'AndrewRadev/splitjoin.vim'
" vim will automatically :set paste for you when in insert mode
" Bundle 'ConradIrwin/vim-bracketed-paste'
" This plug-in provides automatic closing of quotes, parenthesis, brackets,
" etc., besides some other related features that should make your time in
" insert mode a little bit easier, like syntax awareness (will not insert the
" closing delimiter in comments and other configurable regions), and
" expansions (off by default), and some more.
"
" Most of the features can be modified or disabled permanently, using global
" variables, or on a FileType basis, using :autocmd.
Bundle 'Raimondi/delimitMate'
" vim syntax file for Dockerfile and snippets for snipMate
" Bundle 'ekalinin/Dockerfile.vim'
" NerdTree file explorer
Bundle 'scrooloose/nerdtree'
" comments support
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'ctrlpvim/ctrlp.vim'
" this is a colorscheme that is used by fatih
Bundle 'fatih/molokai'
call vundle#end()

" Snipmate and Pydiction both uses Tab key to complete. It can be
" fixed like this:
" Remap snipmate's trigger key from tab to <C-J>
inoremap <C-J> <Plug>snipMateNextOrTrigger
snoremap <C-J> <Plug>snipMateNextOrTrigger

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on
filetype indent plugin on
" python specefic settings
" let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'

" au FileType py set tabstop=3
" au FileType py set shiftwidth=3
" au FileType py set softtabstop=3
"
" the listchars will turn tabs into large tringles, and
" trailing spaces and blank lines with spaces into small
" bullets
" set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" statusline will tell you the filename, type of file that
" Vim thinks it is, what sort of line endings are used,
" as well as your vertical position in the file.
" set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}] [%l/%L\ (%p%%)

"
" Enable syntax highlighting
syntax on

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" set tab space length
set tabstop=3
set shiftwidth=3
set expandtab
set softtabstop=3

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Show a visual line under the cursor's current line
" set cursorline
"
" Turn off the preview window when using omni-complete
" set completeopt-=preview

" My venture with vim scripting
"
"
""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
" set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw

" tag bar toggle
nmap <F8> :TagbarToggle<CR>

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Bash specific settings
autocmd FileType sh set makeprg=bash\ -n\ '%'
autocmd FileType sh let &efm = "%E%f:\ line\ %l:\ %m," . &efm

"# ALE
"-----
 
" Only lint on save or when switching back to normal mode
" let g:ale_enabled = 1
" let g:ale_lint_on_text_changed = 'disabled'
" let g:ale_lint_on_enter = 1
" let g:ale_fix_on_save = 0
" let g:ale_lint_on_filetype_changed = 1
 
" Linter configuration
"let g:ale_linters = {
" \  'go': [ 'gometalinter' ],
"\  'python': [ 'flake8', 'mypy', 'pylint' ],
"\}
 
"let g:ale_go_gometalinter_options = '--fast --disable=gotype -E lll --cyclo-over=15'
"let g:ale_python_mypy_options = '--ignore-missing-imports'
 
" Fixer configuration
"let g:ale_fixers = {
"\  'go': [ 'gofmt' ],
"\  'python': [ 'yapf', 'autopep8', 'isort' ],
"\}

" Go specific settings vim-go
let g:go_fmt_command = "goimports"
" Disable gofmt and asmfmt on save.
let g:go_fmt_autosave = 0
let g:go_asmfmt_autosave = 0

" shortcuts to build and run go programs with <leader>b and <leader>r
" First remap the default <Leader> key which is backslash
" to trigger the action in this case now, press ',' followed by
" b for building go program
let mapleader = ","
"
" set the color to use 256 colors
set t_Co=256

function! Incr_count()
   if !exists("s:call_count")
      let s:call_count = 0
   endif
   let s:call_count = s:call_count + 1
   echo "called " s:call_count " times"
endfunction

function! FileSize()
   let bytes = getfsize(expand("%:p"))
   if bytes <= 0
      return ""
   endif
   if bytes < 1024
      return bytes
   else
      return (bytes / 1024) . "K"
   endif
endfunction

" lets experiment with rulerformat in the statusline,
" define highlight groups for colorscheme that we will
" use in the statusline to switch between colors

" define 3 custom highlight groups
" hi User1 ctermbg=green ctermfg=red guibg=green guifg=red
" hi User2 ctermbg=red ctermfg=blue guibg=red guifg=blue
" hi User3 ctermbg=blue ctermfg=green guibg=blue guifg=green
"
" Colors (adapted from ligh2011.vim):
" hi User1 guifg=#ffdad8  guibg=#880c0e
" hi User2 guifg=#000000  guibg=#F4905C
" hi User3 guifg=#292b00  guibg=#f4f597
" hi User4 guifg=#112605  guibg=#aefe7B
" hi User5 guifg=#051d00  guibg=#7dcc7d
" hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
" hi User8 guifg=#ffffff  guibg=#5b7fbb
" hi User9 guifg=#ffffff  guibg=#810085
" hi User0 guifg=#ffffff  guibg=#094afe

hi User1 ctermbg=white ctermfg=green
hi User2 ctermbg=white ctermfg=black
hi User3 ctermbg=white ctermfg=black
hi User4 ctermbg=white ctermfg=black
hi User5 ctermbg=white ctermfg=black
hi User6 ctermbg=white ctermfg=black
hi User7 ctermbg=white ctermfg=black
hi User8 ctermbg=white ctermfg=black
hi User9 ctermbg=white ctermfg=black
hi User0 ctermbg=white ctermfg=black

" this function tells if the highlight search
" is on by putting 'H' or empty on statusline
function! HighlightSearch()
   if &hls
      return 'H'
   else
      return ''
   endif
endfunction

function! VimModeGet()
   let mode = mode()
   if mode == 'n'
      return 'NORMAL'
   else
      return 'INSERT'
   endif
endfunction

" set statusline=
" set statusline+=%7*\ %{VimModeGet()}\                           "vim mode
" set statusline+=%7*\[%n]                                  "buffernr
" set statusline+=%1*\ %<%F\                                "File+path
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
" set statusline+=%5*\ %{&spelllang}\ %{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
"
" =============================================================
" ======================== STATUSLINE =========================
let s:modes = {
      \ 'n': 'NORMAL',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \ 'v': 'VISUAL',
      \ 'V': 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT',
      \ 'S': 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  if cur_mode == "NORMAL"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22'
  elseif cur_mode == "INSERT"
    exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
  elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
  endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
" set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*

" right section seperator
set statusline+=%=

" encoding and fileformat
" set statusline+=%1*
set statusline+=%#myInfoColor#
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%#myInfoColor#
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%#myInfoColor#
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..)
" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v/%L
set statusline+=\ %*

" put quickfix window always to the bottom
autocmd FileType qf wincmd J
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" there is a matchit.vim for customizing the behavior of
" set matchpairs, for now lets add a simple matchpairs for
" specific filetypes which matches = and ; characters
au FileType c,cpp,java set mps+==:;
" au BufNew,BufRead,BufReadPre *.go echo 'hello go programmer'
"
" let's try to change the colorscheme here
" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" this code should help in comment/uncomment by pressing ',ic' => comment code
" ',uc' => uncomment code
"insert and remove comments in visual and normal mode
" autocmd FileType go vmap ,ic :s/^/\/\//g<CR>:let @/ = ""<CR>
" autocmd FileType go map  ,ic :s/^/\/\//g<CR>:let @/ = ""<CR>
" autocmd FileType go vmap ,rc :s/^\/\///g<CR>:let @/ = ""<CR>
" autocmd FileType go map  ,rc :s/^\/\///g<CR>:let @/ = ""<CR>

" comment support for xml based files
" autocmd FileType xml vmap ,ic :s/^\(.*\)$/<!--\1-->/g<CR>:let @/ = ""<CR>
" autocmd FileType xml map ,ic :s/^\(.*\)$/<!--\1-->/g<CR>:let @/ = ""<CR>
" autocmd FileType xml vmap ,rc :s/^\/\///g<CR>:let @/ = ""<CR>
" autocmd FileType xml map  ,rc :s/^\/\///g<CR>:let @/ = ""<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" define a autocmd group for go based files
augroup go
   autocmd!
   autocmd FileType go set expandtab shiftwidth=4 tabstop=4

   " Show by default 4 spaces for a tab
   autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

   " :GoBuild and :GoTestCompile
   autocmd FileType go nmap <Leader>b  <Plug>(go-build)

   " :GoTest
   autocmd FileType go nmap <Leader>t  <Plug>(go-test)

   " :GoRun
   autocmd FileType go nmap <Leader>r  <Plug>(go-run)

   " :GoDoc
   autocmd FileType go nmap <Leader>d <Plug>(go-doc)

   " :GoCoverageToggle
   autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

   " :GoInfo
   autocmd FileType go nmap <Leader>i <Plug>(go-info)

   " :GoMetaLinter
   autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

   " :GoDef but opens in a vertical split
   autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
   " :GoDef but opens in a horizontal split
   autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

   " :GoAlternate  commands :A, :AV, :AS and :AT
   autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
   autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
   autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
   autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

   " comment out line support using <localleader>c pressing
   autocmd FileType go nnoremap <buffer> <localleader>c I// <esc>
   autocmd FileType go map <C-n> :cnext<CR>
   autocmd FileType go map <C-m> :cprevious<CR>
   autocmd FileType go nnoremap <leader>a :cclose<CR>

augroup END

augroup python
   autocmd!

   autocmd FileType py set autoindent
   autocmd FileType py set smartindent

augroup END

" define a autocmd group for Markdown based files
augroup md
   autocmd!

   " operator non-recursive mapping for selecting the text inside headings for
   " Markdown
   autocmd BufNewFile,BufRead *.md onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

   " operator non-recursive mapping for selecting the text around headings for
   " Markdown
   autocmd BufNewFile,BufRead *.md onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

   " for 'inside next email address' mapping
   autocmd BufNewFile,BufRead *.md onoremap <buffer> in@ :<c-u>execute "normal! f@lvf<space>h"<cr>

   " for 'inside last email address' mapping
   autocmd BufNewFile,BufRead *.md onoremap <buffer> il@ :<c-u>execute "normal! F@lvf<space>h"<cr>
augroup END

" define a autocmd group for vim files ---------------------- {{{
augroup filetype_vim
   autocmd!

   autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" this highlights the go build tags like +build linux, darwin etc
let g:go_highlight_build_constraints = 1

" this highlights go generate tags that are processed with go generate
" command
let g:go_highlight_generate_tags = 1

" set this for jumping around quickfix list in :GoReferrers, :GoDescribe
let g:go_list_type = "quickfix"

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
" make it easier to open editing vimrc file
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
" make it easier to source the $MYVIMRC file
" nnoremap <Leader>sv :source $MYVIMRC<cr>
" define a mapping so that i can press Ctrl-u in insert-mode
" to convert the current word to uppercase. By default, Ctrl-u is
" mapped to delete all the entered characters in current line
" which is rarely used.
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwU
vnoremap <Leader>" <esc>`>a"<esc>`<i"<esc>
" lets make it easier to switch to normal mode
" also remove the old mapping to go to normal mode
" by pressing <esc> character
inoremap jk <esc>
inoremap <esc> <nop>


let NERDTreeShowHidden=1

" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


"if !exists("g:UltiSnipsJumpForwardTrigger")
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif

"if !exists("g:UltiSnipsJumpBackwardTrigger")
"  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif

"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Try to fix the vim's paste mode which inserts [200~ characters
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set rtp+=/Users/ankit.kumar/.local/lib/python3.6/site-packages/powerline/bindings/vim

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Meslo\ LG\ S\ for\ Powerline
   endif
endif

" disable ultisnips
" set runtimepath-=~/.vim/bundle/vim-snippets
