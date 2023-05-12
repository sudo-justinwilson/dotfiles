" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    au FileType crontab set nobackup nowritebackup
    au! BufRead,BufNewFile *.pp setfiletype puppet
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd           " Show (partial) command in status line.
set showmatch         " Show matching brackets.
set smartcase         " Do smart case matching
set incsearch         " Incremental search
set hlsearch          " Highlight search terms
set term=$TERM        " Set term based on $TERM
set history=1000      " Store a ton of history (default is 20)
set scrolljump=1      " Lines to scroll when cursor leaves screen
set scrolloff=3       " Minimum lines to keep above and below cursor
set foldenable        " Auto fold code
set autoindent        " Indent at the same level of the previous line
set expandtab         " Tabs are spaces, not tabs
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)

"Tab formatting
set shiftwidth=2   " Use indents of 4 spaces
set tabstop=2      " An indentation every four columns
set softtabstop=2  " Let backspace delete indent
autocmd FileType vim,sh,python,php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Easy backspace
set backspace=indent,eol,start

" Show list instead of just completing
set wildmenu
set wildmode=list:longest,full

" Show mode
set showmode

" Allow modelines
set modeline
set modelines=2

" Statusline config
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Set a colorscheme
colorscheme elflord

" Map it so search '/' uses extended regex:
nnoremap / /\v
vnoremap / /\v

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

""  JUSTIN
set number
set mouse=a
"" map file extensions:
"" I've installed terraform syntax highlighter:
""autocmd BufNewFile,BufRead *.tf set syntax=yaml
""autocmd BufNewFile,BufRead *.hcl set syntax=yaml
autocmd BufNewFile,BufRead *.Jenkinsfile set syntax=groovy
"" swapfiles:
set ignorecase
:set directory=~/.vim/swapfiles//
""  JUSTIN

"" try to map .pp files to ruby syntax
""augroup twig_ft
augroup puppet
  au!
  "autocmd BufNewFile,BufRead *.html.twig   set syntax=html
  autocmd BufNewFile,BufRead *.pp   set syntax=ruby
augroup END
"" try to map .pp files to ruby syntax

"" manually set highlight color for visual selection:
hi Visual term=reverse cterm=reverse guibg=Grey
""hi Visual term=reverse cterm=reverse guibg=White
