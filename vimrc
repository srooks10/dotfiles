
" This must be first, because it changes other options as a side effect.
set nocompatible

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader = ","

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()


" ============== General Config =========================
" to alias unnamed register to the + register which is the
" cut clipboard (different from * the selection clipboard
set clipboard=unnamedplus

set number              "Line numbers are good
set history=1000        "Store lots of :cmdline history

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" File-type highlighting and configuration.
syntax on
filetype on
filetype plugin on
filetype indent on

" ============== Messages, Info, Status =================
set showcmd             "Show incomplete cmds down the bottom
set showmode            "Show current mode down the bottom
set gcr=a:blinkon0      "Disable cursor blink
set visualbell          "No sounds
set noerrorbells
set t_vb=               "Disable all bells.
set confirm             " Y-N-C prompt if closing with unsaved changes.
set shortmess+=a        " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2 " Always show statusline, even if only 1 window.
" statusline controlled by plugin
"set statusline=%<\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ %{VirtualEnvStatusline()}\ [%l,%v\ %P%M]

" ============== Moving around, Editing =================
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set showmatch " Briefly jump to a parenthesis once it's balanced
set matchpairs+=<:> " show matching <> (html mainly) as well

set backspace=indent,eol,start  "Allow backspace in insert mode
set whichwrap+=<,>,h,l,[,]  "move to the previous/next line after reaching
                            "first/last character in the line (h,l or arrows)
"set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points
"set formatoptions+=rnlmM " Optimize format options

" ============== Search Settings ========================
set incsearch           "Find the next match as we type the search
set hlsearch            "Hilight searches by default
set ignorecase          "Default to using case insensitive searches,
set smartcase           "unless uppercase letters are used in the rightegex.
set viminfo='100,f1 "Save up to 100 marks, enable capital marks

" ============== Reading, Writing =======================
set noautowrite " Never write a file unless I request it.
set noautowriteall " NEVER.
set noautoread " Don't automatically re-read changed files.
set modeline " Allow vim options to be embedded in files;
set modelines=5 " they must be within the first or last 5 lines.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.

" ============== Swap Files & Persistent Undo ===========
set backup
set undofile
" Store temporary files in a central spot
" Swap files and backups are annoying but can save you a lot of trouble.
" Rather than spread them all around your filesystem, isolate them to a
" single directory. This is especially valuable after an unexpected reboot,
" you don’t have to track down all the leftover temp files.
" Also keep undo history across sessions, by storing in a file
"
" Set directories
function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim-tmp'
    let fallback='~/.tmp,~/tmp,/var/tmp,/tmp'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir'}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                call mkdir(directory)
                exec 'set '.settingname.'='.directory
            else
                echo "Warning: Unable to create directory: ".directory
                echo "Try: mkdir -p ".directory
                exec 'set '.settingname.'='.fallback
                echo "Temporarly set to ".fallback
            endif
        else
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()

" ============== Indentation ============================
set autoindent          "always set autoindenting on
set smartindent         "use smart indent if there is no indent file
set smarttab
set tabstop=4           "<tab> inserts 4 spaces
set shiftwidth=4        "an indent level is 4 spaces wide.
set softtabstop=4       "<BS> over an autoindent deletes 4 spaces.
set expandtab           " Use spaces, not tabs, for autoindent/tab key.
set shiftround          " rounds indent to a multiple of shiftwidth

" ============== Other displayed info ====================
" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
"set list               " commented to be off by default

set fillchars+=diff:⣿,vert:│ " Change fillchars
if exists("&colorcolumn") " because needs vim >= 7.3
    set colorcolumn=79 " show a line at column 79
    " Disable the colorcolumn when switching modes.
    " Make sure this is the first autocmd for the filetype here
    autocmd FileType * setlocal colorcolumn=0
endif

" ============== Folds ==================================
set foldmethod=indent       "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "don't fold by default

" ============== Completion =============================
set wildmode=list:longest,full
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=.git
set wildignore+=*.pyc
set completeopt=menuone,menu,longest,preview

" ============== Scrolling ==============================
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ============== In Terminal ==========================
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" A running gvim will always have a window title, but when vim runs within
" an xterm, by default it inherits the terminal’s current title.
set title

" =============== Load Settings =========================
for f in split(glob(expand("<sfile>:p:h") . "/vim/plugin/settings/*.vim"), '\n')
  exe 'source' f
endfor
