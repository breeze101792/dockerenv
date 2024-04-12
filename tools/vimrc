#!/bin/vim
""""    Overview
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
" AutoCmd
" KeyMap
" Function

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" COPY Start
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""    Basic Config vim env
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                 " disable vi compatiable
set shortmess=I                  " Disable screen welcome message, Read :help shortmess for everything else.
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8
set autochdir
set showtabline=2
" set t_ti= t_te=                " leave content when vim exit

""     performance / buffer ---
set hidden                       " can put buffer to the background without writing
                                 " to disk, will remember history/marks.
set lazyredraw                   " don't update the display while executing macros
set updatetime=500
set ttyfast                      " Send more characters at a given time.
set switchbuf+=usetab,newtab     " use new tab when open through quickfix
set redrawtime=1000
"" Command timeout, only affect on mapping command
"" timeout and timeoutlen apply to mappings
set timeout
set timeoutlen=500
set ttimeoutlen=200
"" ttimeout and ttimeoutlen apply to key codes.

""   regexp
" set gdefault                     " RegExp global by default, will add g in the sed
set magic                          " Enable extended regexes.
set regexpengine=1                 " use old reg eng, this may disable some reg syntax


""    Others
set report=0                     " Show all changes.
set title                        " Show the filename in the window title bar.
set splitbelow splitright        " how to split new windows.
" :e ++ff=unix " Show ^M windows

""    Old/Compatiable options
" set re=1 " this force vim use old rex engine


""""    Editor Settings (inside buffer)
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent                                   " smart indent
" set mps+=<:>                                    " hilighted matched ()
set showmatch                                     " show the matching part of the pair for [] {} and ()
set backspace=indent,eol,start                    " when press backspace
set undolevels=999                                " More undo (default=100)
set linebreak                                     " Avoid wrapping a line in the middle of a word.
" set wrap                                          " Enable line wrapping.
" set virtualedit=block                           " in visal mode can select empty space


" Number
set number                                        " show line number
" set relativenumber                                " use relaaive number
" set numberwidth=5                               " width of numbers line (default on gvim is 4)

" Search
set ignorecase smartcase                          " search with ignore case
set incsearch                                     " increamental search
" set hlsearch                                    " hightlight search word

""    Spelling options
" set spelllang=en_us                             " spell checking
" set spell                                       " Enable spellchecking.

""    file options
" set autowrite                                   " auto save when switch document
" set noswapfile
set directory=~/.vim/swp//
" set nobackup                                    " no backup when overright
" set backupdir=~/.vim/backup//
" set autoread                                    " reload files if changed externally

""    clipboard options
set clipboard=unnamed                             " Access system clipboard
set clipboard+=unnamedplus                        " use systemc clip buffer instead
set history=1000                                  " Increase the undo limit.

" soft tab
set expandtab                                     " extend tab (soft tab)
set tabstop=4                                     " set tab len to 4
set softtabstop=4                                 " let tab stop in 4
set shiftround                                    " When shifting lines, round the indentation to the nearest multiple of  " shiftwidth.
set shiftwidth=4                                  " When shifting, indent using four spaces.
set smarttab                                      " Insert tabstop number of spaces when the tab key is pressed.

" show special char
if get(g:, 'IDE_CFG_SPECIAL_CHARS', "n") == "y"
    set showbreak=↪\
    set listchars=tab:▸-,nbsp:␣,trail:·,precedes:←,extends:→
else
    set showbreak=→\
    set listchars=tab:▸-,nbsp:␣,trail:·,precedes:←,extends:→
endif
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set listchars=tab:>-,trail:~,extends:>,precedes:<
" set listchars=tab:▸\ ,nbsp:␣,trail:·,precedes:←,extends:→,eol:↲
set list

""""    IDE Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax one
" set synmaxcol=100        " arbitrary number < 3000 (default value)
syntax sync maxlines=50
" syntax sync minlines=200
" since vim-plug will auto enable the following 2 lines, don't enable it
" syntax enable              " Enable syntax at theme, otherwise it will source to may file, enable syntax hi, cann't be place after theme settings
" filetype plugin indent on  " base on file type do auto indend

" set formatoptions
" set tags=./tags,tags;/     " tag path, this will be setted on auto function
set cscopetag              " set tags=tags
set nocscopeverbose        " set cscopeverbose

" Folding
set foldmethod=syntax " can be set to syntax, indent, manual
set foldnestmax=10    " Only fold up to three nested levels.
set foldlevel=99
" set foldminlines=3    " show the min line of folded code
set nofoldenable

" OmniCppComplete
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

""""    Interface Settings (Out side buffer)
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                " force terminal use 256 color
set scroll=5                " scroll move for ctrl+u/d
set scrolloff=3             " scroll offset, n line for scroll when in top/buttom line
set sidescrolloff=5         " The number of screen columns to keep to the left and right of the cursor.
set display+=lastline       " Always try to show a paragraph’s last line.
set noerrorbells            " Disable beep on errors.

" Menu
" set wildmode=longest,list:list
set wildmenu                " Display command line’s tab complete options as a menu.
set completeopt+=menu
set completeopt+=menuone
set completeopt+=longest
set wildignore+=*.so,*.swp,*.zip,*.o,*.a,*.d,*.img,*.tar.*
" set completeopt+=preview  " complete menu use list insdead of window, this will move main window(stable-window may fix)

" Status/Command
set showcmd      " show partial command on last line of screen.
set laststatus=2 " status bar always show
set cmdheight=1  " Command line height
set shortmess=aO " option to avoid hit enter, a for all, O for overwrite when reading file
set ruler        " enable status bar ruler
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" Other settings
" use group to set it
set mouse=c
" set mouse=a
" set paste

" setup column cursor line, this will slow down vim speed
" set cursorcolumn
" This is for linux, we should not let our code length beyound 80 chars
set colorcolumn=81

" setup row cursor line
set cursorline
if version >= 802
    set cursorlineopt=number " only line number will be highlighted, dosen't
endif

" Windows fill chars
" set fillchars=stl:^,stlnc:=,vert:\ ,fold:-,diff:-
set fillchars+=vert:│

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COPY End

""""    Lite setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
set noswapfile
syntax on
" FIXME, remove this line
" -------->
set listchars=tab:>-,nbsp:␣,trail:·,precedes:←,extends:→
set hlsearch
" <--------

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    KeyMap
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    Patch for disable anoying key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap q: <nop>
nnoremap q/ <nop>
map q <nop>

" for quick save and exit
nnoremap <leader>wa :wa<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<ENTER>
nnoremap <leader>wqa :wqa<CR>
nnoremap qq :q!<ENTER>

" open an shell without close vim
nnoremap <leader>sh :sh<CR>

" select all content
map <C-a> <Esc>ggVG<CR>

" Edit
nmap <S-k> <Esc>dd<Up>p
nnoremap <S-j> <Esc>dd<Down>p
" inseart an line below
nnoremap <leader><CR> o<Esc>

" duplicate current tab
map <leader>d <Esc>:tab split<CR>

" tab manipulation with hjkl
map <C-h> <Esc>:tabprev<CR>
map <C-l> <Esc>:tabnext<CR>
map <S-h> <Esc>:tabmove -1 <CR>
map <S-l> <Esc>:tabmove +1 <CR>

" tab manipulation with arror keys
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <S-Left> <Esc>:tabmove -1 <CR>
map <S-Right> <Esc>:tabmove +1 <CR>
map <C-o> <Esc>:tabnew<SPACE>

" Add hilighted word with " or '
nnoremap "" viw<esc>a"<esc>hbi"<esc>wwl
nnoremap '' viw<esc>a'<esc>hbi'<esc>wwl

"" Lite settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comments
noremap <silent> ,cc :<C-b>silent <C-e>norm ^i<C-r>=b:comment_leader<CR><CR>
noremap <silent> ,uc :<C-b>silent <C-e>norm ^xx<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    Auto Groups
""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup file_open_gp
    autocmd!
    " memorize last open line
    autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
augroup END

" Call the function after opening a buffer
augroup tab_gp
    autocmd!
    autocmd BufReadPost * call TabsOrSpaces()
augroup END

augroup syntax_hi_gp
    autocmd!
    autocmd Syntax * call matchadd(
                \ 'Debug',
                \ '\v\W\zs<(NOTE|CHANGED|BUG|HACK|TRICKY)>'
                \ )
augroup END

"" Lite settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comments
" TODO, change to use leader+m
augroup comment_gp_
    autocmd!
    autocmd FileType c,cpp,go                let b:comment_leader = '// '
    autocmd FileType ruby,python             let b:comment_leader = '# '
    autocmd FileType conf,fstab,sh,bash,tmux let b:comment_leader = '# '
    autocmd FileType tex                     let b:comment_leader = '% '
    autocmd FileType mail                    let b:comment_leader = '> '
    autocmd FileType vim                     let b:comment_leader = '" '
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""    Function
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -------------------------------------------
"  Tabline override
" -------------------------------------------
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)

set tabline=%!MyTabLine()

" Set the entire tabline
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999Xclose'
    endif

    return s
endfunction

" Set the label for a single tab
function! MyTabLabel(n)

    " This is run in the scope of the active tab, so t:name
    " won't work.
    let l:tabname = gettabvar(a:n, 'name', '')

    " This variable exists!
    if l:tabname != ''
        return l:tabname
    endif

    " If it's not found fall back to the buffer name
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let l:bname = bufname(buflist[winnr - 1])

    " Unnamed buffer, scratch buffer, etc. Could be more detailed.
    if l:bname == ''
        let l:bname = '[No Name]'
    endif

    return l:bname
endfunction

" -------------------------------------------
"  Mouse_on_off for cursor chage
" -------------------------------------------
command! MouseToggle call MouseToggle()

function! MouseToggle()
    if &mouse == 'c'
        set mouse=a
    else
        set mouse=c
    endif
    return
endfunc

" -------------------------------------------
"  Tab op
" -------------------------------------------
function! TabCloseOthers(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tabcloseothers call TabCloseOthers('<bang>')
command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')
" -------------------------------------------
"  TabsOrSpaces
" -------------------------------------------
function! TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    " if getfsize(bufname("%")) > 256000
    "     " File is very large, just use the default.
    "     setlocal expandtab
    "     return
    " endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^  "'))
    " echo 'Tabs Or Spaces: '.numTabs.', '.numSpaces

    if numTabs > numSpaces
        setlocal noexpandtab
    else
        setlocal expandtab
    endif
endfunction
