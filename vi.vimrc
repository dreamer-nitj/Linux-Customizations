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

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets', { 'tag': 'b2dda36fc77c6a15d2ec4ea273df610a55e92952' }

" The following examples of different formats supported.
" keep Plugin commands between vundle#begin/end/
" plugin on github repo
Bundle 'Pydiction'
call vundle#end()

" Snipmate and Pydiction both uses Tab key to complete. It can be
" fixed like this:
" Remap snipmate's trigger key from tab to <C-J>
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on
filetype indent plugin on
" python specefic settings
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
au FileType py set autoindent
au FileType py set smartindent
" au FileType py set tabstop=3
" au FileType py set shiftwidth=3
" au FileType py set softtabstop=3

" the listchars will turn tabs into large tringles, and
" trailing spaces and blank lines with spaces into small
" bullets
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" statusline will tell you the filename, type of file that
" Vim thinks it is, what sort of line endings are used, 
" as well as your vertical position in the file.
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
    \ [%l/%L\ (%p%%)

"  
" Enable syntax highlighting
syntax on

" highlight searches
set hlsearch

" set incremental search to true
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

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
set completeopt-=preview
