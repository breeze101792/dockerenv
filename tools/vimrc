""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This file is auto generated, do not modify it.
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------------
"" Import from Environment.vim
"------------------------------------------------------
if !exists("g:IDE_ENV_INS")
    if has("nvim")
        let g:IDE_ENV_INS = "nvim"
    else
        let g:IDE_ENV_INS = "vim"
    endif
endif
if !exists("g:IDE_ENV_OS")
    if has("macunix")
        let g:IDE_ENV_OS = "Darwin"
    elseif has("unix")
        let g:IDE_ENV_OS = "Linux"
    elseif has("win64") || has("win32") || has("win16")
        let g:IDE_ENV_OS = "Windows"
    else
        let g:IDE_ENV_OS = "Linux"
    endif
endif
let g:IDE_ENV_IDE_TITLE = get(g:, 'IDE_ENV_IDE_TITLE', "VIM")
let g:IDE_ENV_HEART_BEAT = get(g:, 'IDE_ENV_HEART_BEAT', 30000)
let g:IDE_ENV_CACHED_COLORSCHEME = get(g:, 'IDE_ENV_CACHED_COLORSCHEME', "autogen")
if g:IDE_ENV_INS == "nvim"
    let g:IDE_ENV_COLORSCHEME_TABLINE = get(g:, 'IDE_ENV_COLORSCHEME_TABLINE', "wombat_invert")
else
    let g:IDE_ENV_COLORSCHEME_TABLINE = get(g:, 'IDE_ENV_COLORSCHEME_TABLINE', "wombat_lab")
endif
if g:IDE_ENV_INS == "nvim"
    let g:IDE_ENV_ROOT_PATH = get(g:, 'IDE_ENV_ROOT_PATH', $HOME."/.config/nvim")
else
    let g:IDE_ENV_ROOT_PATH = get(g:, 'IDE_ENV_ROOT_PATH', $HOME."/.vim")
endif
let g:IDE_ENV_CSCOPE_EXC = get(g:, 'IDE_ENV_CSCOPE_EXC', "cscope")
let g:IDE_ENV_CONFIG_PATH = get(g:, 'IDE_ENV_CONFIG_PATH', $HOME."/.vim")
let g:IDE_ENV_CLIP_PATH = get(g:, 'IDE_ENV_CLIP_PATH', g:IDE_ENV_CONFIG_PATH."/clip")
let g:IDE_ENV_PROJ_DATA_PATH = get(g:, 'IDE_ENV_PROJ_DATA_PATH', "./")
let g:IDE_ENV_PROJ_SCRIPT = get(g:, 'IDE_ENV_PROJ_SCRIPT', "")
let g:IDE_ENV_TAGS_DB = get(g:, 'IDE_ENV_TAGS_DB', "")
let g:IDE_ENV_CSCOPE_DB = get(g:, 'IDE_ENV_CSCOPE_DB', "")
let g:IDE_ENV_CCTREE_DB = get(g:, 'IDE_ENV_CCTREE_DB', "")
let g:IDE_ENV_SESSION_AUTOSAVE_PATH = get(g:, 'IDE_ENV_SESSION_AUTOSAVE_PATH', g:IDE_ENV_CONFIG_PATH."/session_autosave")
let g:IDE_ENV_SESSION_PATH = get(g:, 'IDE_ENV_SESSION_PATH', g:IDE_ENV_CONFIG_PATH."/session")
let g:IDE_ENV_REQ_TAG_UPDATE=0
let g:IDE_ENV_REQ_SESSION_RESTORE=""
let g:IDE_ENV_DEF_PAGE_WIDTH=80
let g:IDE_ENV_DEF_FILE_SIZE_THRESHOLD=100 * 1000 * 1000
"------------------------------------------------------
"" Import from Settings.vim
"------------------------------------------------------
set nocompatible                 " disable vi compatiable
set shortmess=I                  " Disable screen welcome message, Read :help shortmess for everything else.
set encoding=utf-8
set formatoptions+=mM
set fileencodings=utf-8
if exists('&autochdir')
    set autochdir
endif
if has('termguicolors')
  set termguicolors
endif
set showtabline=2
set hidden                       " can put buffer to the background without writing
set lazyredraw                   " don't update the display while executing macros
set updatetime=500               " how long wil vim wait after your interaction to start plugins/other event
set ttyfast                      " Send more characters at a given time.
set switchbuf+=usetab,newtab     " use new tab when open through quickfix
set redrawtime=1000
set timeout
set timeoutlen=500
set ttimeoutlen=200
set report=0                     " Show all changes.
set smartindent                                   " smart indent
set showmatch                                     " show the matching part of the pair for [] {} and ()
set backspace=indent,eol,start                    " when press backspace
set undolevels=999                                " More undo (default=100)
set linebreak                                     " Avoid wrapping a line in the middle of a word.
set title                        " Show the filename in the window title bar.
set splitbelow splitright        " how to split new windows.
set number                                        " show line number
set ignorecase smartcase                          " search with ignore case
set incsearch                                     " increamental search
exec "set directory=" . get(g:, 'IDE_ENV_CONFIG_PATH', '~/.vim') . "/swp/"
set history=1000                                  " Increase the undo limit.
set expandtab                                     " extend tab (soft tab)
set tabstop=4                                     " set tab len to 4
set softtabstop=4                                 " let tab stop in 4
set shiftround                                    " When shifting lines, round the indentation to the nearest multiple of  " shiftwidth.
set shiftwidth=4                                  " When shifting, indent using four spaces.
set smarttab                                      " Insert tabstop number of spaces when the tab key is pressed.
if get(g:, 'IDE_CFG_SPECIAL_CHARS', "n") == "y"
    set showbreak=↪\
    set listchars=tab:▸-,nbsp:␣,trail:·,precedes:←,extends:→
else
    set showbreak=->\
    set listchars=tab:>-,trail:~,extends:>,precedes:<
endif
set list
if exists('&nofixendofline')
    set nofixendofline " enable this will cause vim add new line at the end of line
endif
syntax sync maxlines=50
if has('cscope')
    set cscopetag              " set tags=tags
    set nocscopeverbose        " set cscopeverbose
endif
set foldnestmax=10    " Only fold up to three nested levels.
set foldlevel=99
set nofoldenable
set t_Co=256                " force terminal use 256 color
set scroll=5                " scroll move for ctrl+u/d
set scrolloff=3             " scroll offset, n line for scroll when in top/buttom line
set sidescrolloff=5         " The number of screen columns to keep to the left and right of the cursor.
set display+=lastline       " Always try to show a paragraph’s last line.
set noerrorbells            " Disable beep on errors.
set wildmenu                " Display command line’s tab complete options as a menu.
set completeopt+=menu
set completeopt+=menuone
set completeopt+=longest
set wildignore+=*.so,*.swp,*.zip,*.o,*.a,*.d,*.img,*.tar.*
set showcmd      " show partial command on last line of screen.
set laststatus=2 " status bar always show
set cmdheight=1  " Command line height
set shortmess=aO " option to avoid hit enter, a for all, O for overwrite when reading file
set ruler        " enable status bar ruler
set mouse=c
if get(g:, 'IDE_CFG_HIGH_PERFORMANCE_HOST', 'n') == 'y'
    set cursorcolumn
endif
if exists('&colorcolumn') 
    set colorcolumn=81
endif
set cursorline
if exists('&cursorlineopt') 
    set cursorlineopt=number " only line number will be highlighted, dosen't
endif
if get(g:, 'IDE_CFG_SPECIAL_CHARS', "n") == "y"
    set fillchars+=vert:│
else
    set fillchars+=vert:\|
endif
set t_SI="\e[6 q"
set t_EI="\e[2 q"
set t_SR="\e[4 q"
let g:matchparen_timeout = 60
let g:matchparen_insert_timeout = 60
if 0
    let g:vim_debug_enable = 1
    Check syntax time
    syntime on
    syntime report
endif
"------------------------------------------------------
"" Import from KeyMaps.vim
"------------------------------------------------------
nnoremap q: <nop>
nnoremap q/ <nop>
map q <nop>
nnoremap <leader>wqa :wqa<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>qe :exit()<CR>
nnoremap qq :q!<CR>
nnoremap qa :qa<CR>
nnoremap <leader>sh :tab terminal<CR>
map <C-a> <Esc>ggVG<CR>
nnoremap <S-k> <Esc>dd<Up>P
nnoremap <S-j> <Esc>dd<Down>P
nnoremap <leader><CR> o<Esc>
map <leader>d <Esc>:tab split<CR>
map <C-h> <Esc>:tabprev<CR>
map <C-l> <Esc>:tabnext<CR>
map <S-h> <Esc>:tabmove -1 <CR>
map <S-l> <Esc>:tabmove +1 <CR>
nnoremap <C-k> <C-b>
nnoremap <C-j> <C-f>
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <S-Left> <Esc>:tabmove -1 <CR>
map <S-Right> <Esc>:tabmove +1 <CR>
if exists('&autochdir') && &autochdir
    map <C-o> <Esc>:tabnew<SPACE>
endif
nnoremap "" viw<esc>a"<esc>hbi"<esc>wwl
nnoremap '' viw<esc>a'<esc>hbi'<esc>wwl
nnoremap <C-W>M <C-W>\| <C-W>_
nnoremap <C-W>m <C-W>=
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <Leader>v :execute 'match Search /\%'.virtcol('.').'v/'<CR>
nmap <silent> <Leader>fp :PureToggle<CR>
nmap <silent> <Leader>fr :Reload<CR>
nmap <silent> <Leader>fa <Esc>ggVG<CR>
nmap <silent> <Leader>fc :LLMToggle<CR>
map <silent> <Leader>f1 <F1><CR>
map <silent> <Leader>f2 <F2><CR>
map <silent> <Leader>f3 <F3><CR>
map <silent> <Leader>f4 <F4><CR>
map <silent> <Leader>f5 <F5><CR>
map <silent> <Leader>f6 <F6><CR>
map <silent> <Leader>f7 <F7><CR>
map <silent> <Leader>f8 <F8><CR>
map <silent> <Leader>f9 <F9><CR>
"------------------------------------------------------
"" Import from Autocmd.vim
"------------------------------------------------------
augroup mouse_gp
    autocmd!
    autocmd VimEnter * :set mouse=c
    autocmd VimLeave * :set mouse=c
augroup END
augroup menu_gp
    autocmd!
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup END
augroup syntax_hi_gp
    autocmd!
    autocmd Syntax * call matchadd(
                \ 'Debug',
                \ '\v\W\zs<(NOTE|HACK)>'
                \ )
    autocmd Syntax * call matchadd(
                \ 'Todo',
                \ '\v\W\zs<(BUG|IDEA)>'
                \ )
augroup END
"------------------------------------------------------
"" Import from Tools.vim
"------------------------------------------------------
command! MouseToggle call MouseToggle()
function! MouseToggle()
    if &mouse == 'c'
        set mouse=a
    else
        set mouse=c
    endif
    return
endfunc
command! LineNumToggle call LineNumToggle()
function! LineNumToggle()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
    return
endfunc
command! -range -nargs=? SimpleCommentCode <line1>,<line2>call SimpleCommentCode(<q-args>)
function! SimpleCommentCode(pattern) range
    let b:comment_padding = ' '
    let b:comment_leader = '#'
    if a:pattern != ''
        let b:comment_leader = '#'
    elseif &filetype ==# 'c' || &filetype ==# 'cpp'
        let b:comment_leader = '\/\/'
    elseif &filetype ==# 'sh' || &filetype ==# 'conf' || &filetype ==# 'bash'
        let b:comment_leader = '#'
    elseif &filetype ==# 'python' || &filetype ==# 'ruby'
        let b:comment_leader = '#'
    elseif &filetype ==# 'vim'
        let b:comment_leader = '"'
    endif
    let flag_comment=0
    let match_ret=0
    let b:comment_pattern = b:comment_leader.b:comment_padding
    try
        let match_ret=execute(a:firstline.','.a:lastline.'s/^\s*'.b:comment_leader.'/ /n')
        let token=split(match_ret[1:], ' ')
        if len(token) < 4
            let flag_comment=1
        else
            let pattern_matches=token[0]
            let line_matches=token[3]
            let test=char2nr(pattern_matches[0])
            if a:lastline - a:firstline + 1== pattern_matches
                let flag_comment=0
            else
                let flag_comment=1
            endif
        endif
    catch
        let flag_comment=1
    endtry
    echom "Comment Code: '".b:comment_leader."', comment: ".flag_comment.", cnt:".match_ret
    if flag_comment == 1
        call execute(a:firstline.','.a:lastline.'s/^/'.b:comment_pattern.'/g')
    else
        call execute(a:firstline.','.a:lastline.'g/^\s*'.b:comment_leader.'/s/'.b:comment_leader.'[ ]\?//')
    endif
endfunction
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
"------------------------------------------------------
"" Import from lite.vim
"------------------------------------------------------
let g:IDE_ENV_OS = "Linux"
let g:IDE_ENV_INS = "vim"
let g:IDE_ENV_IDE_TITLE = "LITE"
try
    colorscheme desert
catch
    echom 'colorscheme industry not found.'
endtry
try
    syntax on
catch
    echom 'Syntax enable fail.'
endtry
set listchars=tab:>-,trail:~,extends:>,precedes:<
set noswapfile
if exists('&colorcolumn') 
    set colorcolumn=""
endif
if exists('&autochdir')
    set autochdir
endif
augroup tab_gp
    autocmd!
    autocmd BufReadPost * call TabsOrSpaces()
augroup END
noremap <C-_> :SimpleCommentCode<CR>
map <leader>b <Esc>:buffers<CR>
nnoremap <leader>m :call HighlightWordsToggle(expand('<cword>'))<CR>
if has("nvim")
    cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
    cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
endif
function! TabsOrSpaces()
    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^  "'))
    if numTabs > numSpaces
        setlocal noexpandtab
    else
        setlocal expandtab
    endif
endfunction
if !exists("*Reload") ||  !exists(":Reload")
    command! Reload call Reload()
    function! Reload()
        if !empty(glob($MYVIMRC))
            source $MYVIMRC
            echom 'Lite reloaded.'
        else
            echom 'No RC file found.'. $MYVIMRC
        endif
    endfunc
end
command! PureToggle call PureToggle()
function! PureToggle()
    if &paste
        echo 'Disable Pure mode'
        setlocal nopaste
        setlocal number
        setlocal list
    else
        echo 'Enable Pure mode'
        setlocal paste
        setlocal nonumber
        setlocal nolist
    endif
endfunc
let s:function_patterns = {
    \ 'python': [
    \   '^\s*\(async\s\+\)\?def\s\+\zs\(\w\+\)\ze\s*(',
    \ ],
    \ 'c': [
    \   '^\s*\(\h\w*\s\+\)\+\zs\(\h\w*\)\ze\s*([^)]*)\s*{',
    \   '^\s*\zs\(\h\w*\)\ze\s*([^)]*)\s*{',
    \ ],
    \ 'cpp': [
    \   '^\s*\(\h\w*\s\+\)\+\zs\(\h\w*\)\ze\s*([^)]*)\s*{',
    \   '^\s*\zs\(\h\w*\)\ze\s*([^)]*)\s*{',
    \ ],
    \ 'sh': [
    \   '^\s*function\s\+\zs\(\w\+\)\ze\s*()',
    \   '^\s*function\s\+\zs\(\w\+\)\ze\s*{', 
    \   '^\s*\zs\(\w\+\)\ze\s*()',            
    \ ],
    \ 'lua': [
    \   '^\s*function\s\+\zs\(\w\+\)\ze\s*(',
    \   '^\s*local\s\+function\s\+\zs\(\w\+\)\ze\s*(',
    \ ],
    \ 'vim': [
    \   '^\s*fu\%[nction]!\?\s\+\(s:\)\?\zs\(\w\+\)\ze\s*()',
    \ ],
\}
command! GetCurrentFunction call GetCurrentFunction()
function! GetCurrentFunction()
    let l:pos = getpos('.')          " Save cursor position
    let l:view = winsaveview()       " Save window view
    let l:filetype = &filetype
    let l:patterns = get(s:function_patterns, l:filetype, [])
    if empty(l:patterns)
        call cursor(l:pos)
        call winrestview(l:view)
        return ""
    endif
    try
        normal! [{
    catch /E/
    endtry
    let l:start_line = line('.')
    for l:line_num in reverse(range(1, l:start_line))
        let l:line_content = getline(l:line_num)
        for l:pattern in l:patterns
            let l:match = matchstr(l:line_content, l:pattern)
            if !empty(l:match)
                call cursor(l:pos)
                call winrestview(l:view)
                return l:match
            endif
        endfor
    endfor
    call cursor(l:pos)
    call winrestview(l:view)
    return ""
endfun
let g:StatusLine_extra_info_function = function('GetCurrentFunction')
"------------------------------------------------------
"" Import from StatusLine.vim
"------------------------------------------------------
let g:StatusLine_extra_info_function = get(g:, 'StatusLine_extra_info_function', '')
function! StatusLineGetCurrentMode()
    let l:mode = mode()
    let l:mode_name = ''
    if l:mode == 'n'
        let l:mode_name = 'Normal '
    elseif l:mode == 'no'
        let l:mode_name = 'N·Operator Pending '
    elseif l:mode == 'v'
        let l:mode_name = 'Visual '
    elseif l:mode == 'V'
        let l:mode_name = 'V·Line '
    elseif l:mode ==# "\<C-V>"
        let l:mode_name = 'V·Block '
    elseif l:mode == 'i'
        let l:mode_name = 'Insert '
    elseif l:mode == 'R'
        let l:mode_name = 'Replace '
    elseif l:mode == 'Rv'
        let l:mode_name = 'V·Replace '
    elseif l:mode == 'c'
        let l:mode_name = 'Command '
    elseif l:mode == 'ce'
        let l:mode_name = 'Ex '
    else
        let l:mode_name = l:mode
    endif
    return l:mode_name
endfunction
function! StatusLineUpdateColor()
    let currentmode=StatusLineGetCurrentMode()
    if (mode() ==# 'i')
        exe 'hi! User1 ctermfg=000 ctermbg=001' 
    elseif (mode() =~# '\v(v|V)' || currentmode ==# 'V·Block')
        exe 'hi! User1 ctermfg=000 ctermbg=002' 
    elseif (mode() ==# 'R')
        exe 'hi! User1 ctermfg=000 ctermbg=006' 
    else
        exe 'hi! User1 ctermfg=000 ctermbg=003' 
    endif
    return ''
endfunction
function! StatusLineGetReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
endfunction
function! StatusLineGetFilePositon()
    return printf('%.2f%%', ( 100.0 * line('.') / line('$') ))
endfunction
hi! StatusLine  ctermfg=000 ctermbg=003
hi! User1 ctermfg=000 ctermbg=003
hi! User2 ctermfg=007 ctermbg=000
hi! User3 ctermfg=007 ctermbg=236
hi! User4 ctermfg=007 ctermbg=240
hi! User5 ctermfg=007 ctermbg=008
hi! User7 ctermfg=007 ctermbg=240
hi! User8 ctermfg=007 ctermbg=236
hi! User9 ctermfg=015 ctermbg=232
set statusline=%{StatusLineUpdateColor()}                 " Changing the statusline color
set statusline+=%1*\ %{toupper(StatusLineGetCurrentMode())}          " Current mode
set statusline+=%8*\ %<%F\ %{StatusLineGetReadOnly()}\ %m\ %w\       " File+path
set statusline+=%*
set statusline+=%8*\ %=                                    " Space
if g:StatusLine_extra_info_function != ''
    set statusline+=%8*\ %{g:StatusLine_extra_info_function()}\                     " Col, Rownumber/total (%)
endif
set statusline+=%5*\ %{(&filetype!=''?&filetype:'None')}   " FileType
set statusline+=%5*\ \[%{(&fenc!=''?&fenc:&enc)}\|%{&ff}]\ " Encoding & Fileformat
set statusline+=%1*\ %2l:%-2c\ %{StatusLineGetFilePositon()}\                     " Col, Rownumber/total (%)
set tabline=%!TabLineCompose()
hi! TabLine cterm=None ctermfg=007 ctermbg=240
hi! TabLineSel cterm=None ctermfg=000 ctermbg=003
hi! TabLineFill cterm=None ctermfg=007 ctermbg=236
hi! TabTitle cterm=bold ctermfg=000 ctermbg=014
function! TabLineCompose() " acclamation to avoid conflict
    let s = '' " complete tabline goes here
    let title = get(g:, 'IDE_ENV_IDE_TITLE', "VIM")
    let s .= '%#TabTitle# ' . title . ' '
    for t in range(tabpagenr('$'))
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        let s .= t + 1 . ' '
        let s .= TabLineLabel(t + 1) . ' '
    endfor
    let s .= '%#TabLineFill#%T'
    let s .= '%=%#TabLine# %n '
    return s
endfunction"
function! TabLineLabel(n)
    let t = a:n
    let bname = ''
    let tmp_str = ''      " temp string for buffer names while we loop and check buftype
    let modify_cnt = 0       " &modified counter
    let buf_cnt = len(tabpagebuflist(t))     " counter to avoid last ' '
    for each_buf_in_tab in tabpagebuflist(t)
        if getbufvar( each_buf_in_tab, "&buftype"  ) == 'help'
            let tmp_str .= '[H]' . fnamemodify( bufname(each_buf_in_tab), ':t:bname/.txt$//'  )
        elseif getbufvar( each_buf_in_tab, "&buftype"  ) == 'quickfix'
            let tmp_str .= '[Q]'
        else
            let tmp_str .= fnamemodify(bufname(each_buf_in_tab), ':t')
        endif
        if getbufvar( each_buf_in_tab, "&modified"  )
            let modify_cnt += 1
        endif
        if buf_cnt > 1
            let tmp_str .= ' '
        endif
        let buf_cnt -= 1
    endfor
    if t == tabpagenr()
        let bname .= '%#TabLineSel#'
    else
        let bname .= '%#TabLine#'
    endif
    if tmp_str == ''
        let bname.= '[New]'
    else
        let bname .= tmp_str
    endif
    if modify_cnt > 0
        let bname .= ' +'
    endif
    return bname
endfunction
"------------------------------------------------------
"" Import from HighlightWord.vim
"------------------------------------------------------
nnoremap <leader>ha :call HighlightWordsAdd(expand('<cword>'))<CR>
nnoremap <leader>hr :call HighlightWordsRemove(expand('<cword>'))<CR>
nnoremap <leader>m :call HighlightWordsToggle(expand('<cword>'))<CR>
nnoremap <leader>ch :call HighlightClearAllWords()<CR>
command! -nargs=1 HighlightWordsAdd call HighlightWordsAdd(<q-args>)
command! -nargs=1 HighlightWordsRemove call HighlightWordsRemove(<q-args>)
command! HighlightClearAllWords call HighlightClearAllWords()
command! HighlightSyncGlobal call HighlightSyncGlobal()
autocmd WinEnter,BufEnter * :call HighlightSyncGlobal()
let g:highlighted_color_list = [
            \ ['Black', 'Cyan',   '#000000', '#00ffff'],
            \ ['Black', 'White',  '#000000', '#ffffff'],
            \ ['Black', 'Yellow', '#000000', '#ffff00'],
            \ ['White', 'Black',  '#ffffff', '#000000'],
            \ ['White', 'Blue',   '#ffffff', '#0000ff'],
            \ ['White', 'Green',  '#ffffff', '#00ff00'],
            \ ['White', 'Magenta','#ffffff', '#ff00ff'],
            \ ['White', 'Red',    '#ffffff', '#ff0000'],
            \ [232 , 117 , '#000000' , '#40e0d0'] ,
            \ [232 , 166 , '#000000' , '#98fb98'] ,
            \ [232 , 179 , '#000000' , '#cd7f32'] ,
            \ [232 , 208 , '#000000' , '#ffa500'] ,
            \ [232 , 213 , '#000000' , '#ffbf00'] ,
            \ [232 , 214 , '#000000' , '#ff7f50'] ,
            \ [232 , 219 , '#000000' , '#ff69b4'] ,
            \ [232 , 220 , '#000000' , '#ffd700'] ,
            \ [232 , 227 , '#000000' , '#f4a460'] ,
            \ [232 , 229 , '#000000' , '#dda0dd'] ,
            \ [232 , 235 , '#000000' , '#ee82ee'] ,
            \ [232 , 245 , '#000000' , '#808080'] ,
            \ [232 , 250 , '#000000' , '#c0c0c0'] ,
            \ [232 , 255 , '#000000' , '#f5f5dc'] ,
            \ [232 , 82  , '#000000' , '#32cd32'] ,
            \ [255 , 118 , '#ffffff' , '#4682b4'] ,
            \ [255 , 124 , '#ffffff' , '#800000'] ,
            \ [255 , 130 , '#ffffff' , '#4b0082'] ,
            \ [255 , 135 , '#ffffff' , '#8a2be2'] ,
            \ [255 , 140 , '#ffffff' , '#808000'] ,
            \ [255 , 171 , '#ffffff' , '#a52a2a'] ,
            \ [255 , 196 , '#ffffff' , '#ff0000'] ,
            \ [255 , 23  , '#ffffff' , '#000080'] ,
            \ [255 , 44  , '#ffffff' , '#008080'] ,
            \ ]
if ! exists('g:global_highlighted_words')
    let g:global_highlighted_words = {}
endif
let g:highlight_color_index = len(g:global_highlighted_words) % len(g:highlighted_color_list)
function! HighlightWord(word, color_idx)
    let l:group_name = 'UserHL_' . substitute(a:word, '\W', '_', 'g')
    let l:ctermfg = g:highlighted_color_list[a:color_idx][0]
    let l:ctermbg = g:highlighted_color_list[a:color_idx][1]
    let l:guifg   = g:highlighted_color_list[a:color_idx][2]
    let l:guibg   = g:highlighted_color_list[a:color_idx][3]
    let b:highlighted_words[a:word] = {
                \ 'color_index': a:color_idx,
                \ 'group_name': l:group_name
                \ }
    execute 'highlight ' . l:group_name .
                \ ' ctermfg=' . l:ctermfg .
                \ ' ctermbg=' . l:ctermbg .
                \ ' guifg='   . l:guifg .
                \ ' guibg='   . l:guibg .
                \ ' cterm=bold gui=bold'
    execute 'syntax match ' . l:group_name . ' /'. escape(a:word, '/\') . '\C/ containedin=ALL'
endfunction
function! HighlightWordsToggle(...) abort
  if a:0 == 0
    let l:input = input('Enter words to toggle highlight (separate with spaces): ')
    let l:words = split(l:input)
  else
    let l:words = a:000
  endif
  if !exists('b:highlighted_words')
    let b:highlighted_words = {}
  endif
  for l:word in l:words
    if has_key(b:highlighted_words, l:word)
        call HighlightWordsRemove(l:word)
    else
        call HighlightWordsAdd(l:word)
    endif
  endfor
endfunction
function! HighlightWordsAdd(...) abort
  if a:0 == 0
    let l:input = input('Enter words to add highlight (separate with spaces): ')
    let l:words = split(l:input)
  else
    let l:words = a:000
  endif
  if !exists('b:highlighted_words')
    let b:highlighted_words = {}
  endif
  for l:word in l:words
    let l:group_name = 'UserHL_' . substitute(l:word, '\W', '_', 'g')
    if !has_key(b:highlighted_words, l:word)
      let l:ctermfg = g:highlighted_color_list[g:highlight_color_index][0]
      let l:ctermbg = g:highlighted_color_list[g:highlight_color_index][1]
      let l:guifg   = g:highlighted_color_list[g:highlight_color_index][2]
      let l:guibg   = g:highlighted_color_list[g:highlight_color_index][3]
      if !has_key(g:global_highlighted_words, l:word)
          let g:global_highlighted_words[l:word] = {
                      \ 'color_index': g:highlight_color_index,
                      \ 'group_name': l:group_name
                      \ }
      endif
      call HighlightWord(l:word, g:highlight_color_index)
      let g:highlight_color_index = (g:highlight_color_index + 1) % len(g:highlighted_color_list)
      echo 'Added highlight for "' . l:word . '".'
    else
      echo 'Highlight for "' . l:word . '" already exists.'
    endif
  endfor
endfunction
function! HighlightWordsRemove(...) abort
  if a:0 == 0
    let l:input = input('Enter words to remove highlight (separate with spaces): ')
    let l:words = split(l:input)
  else
    let l:words = a:000
  endif
  if !exists('b:highlighted_words')
    let b:highlighted_words = {}
  endif
  for l:word in l:words
    let l:group_name = 'UserHL_' . substitute(l:word, '\W', '_', 'g')
    if has_key(b:highlighted_words, l:word)
      execute 'syntax clear ' . l:group_name
      execute 'highlight clear ' . l:group_name
      call remove(b:highlighted_words, l:word)
      echo 'Removed highlight for "' . l:word . '".'
      if has_key(g:global_highlighted_words, l:word)
        call remove(g:global_highlighted_words, l:word)
      endif
    else
      echo 'Highlight for "' . l:word . '" does not exist.'
    endif
  endfor
endfunction
function! HighlightClearAllWords() abort
  if exists('b:highlighted_words')
    for l:word in keys(b:highlighted_words)
        let l:group_name = 'UserHL_' . substitute(l:word, '\W', '_', 'g')
      execute 'syntax clear ' . l:group_name
      execute 'highlight clear ' . l:group_name
    endfor
    unlet b:highlighted_words
    echo 'All highlights cleared.'
    let g:global_highlighted_words = {}
  else
    echo 'No highlights to clear.'
  endif
endfunction
function! HighlightSyncGlobal() abort
    if !exists('b:highlighted_words')
        let b:highlighted_words = {}
    endif
    for l:word in keys(g:global_highlighted_words)
        if !has_key(b:highlighted_words, l:word)
            let l:color_idx = g:global_highlighted_words[l:word].color_index
            let l:group_name = g:global_highlighted_words[l:word].group_name
            call HighlightWord(l:word, l:color_idx)
            let b:highlighted_words[l:word] = {
                        \ 'color_index': l:color_idx,
                        \ 'group_name': l:group_name
                        \ }
        endif
    endfor
    for l:word in keys(b:highlighted_words)
        if !has_key(g:global_highlighted_words, l:word)
            let l:color_idx = b:highlighted_words[l:word].color_index
            let l:group_name = b:highlighted_words[l:word].group_name
            call HighlightWord(l:word, l:color_idx)
            let g:global_highlighted_words[l:word] = {
                        \ 'color_index': l:color_idx,
                        \ 'group_name': l:group_name
                        \ }
        endif
    endfor
endfunction
"------------------------------------------------------
"" Import from Bookmark.vim
"------------------------------------------------------
nnoremap ml :call MarkJumpToMarkList()<CR>
nnoremap mm :call MarkToggleLine()<CR>
nnoremap mn :call MarkJumpToNext()<CR>
nnoremap mp :call MarkJumpToPrev()<CR>
nnoremap mt :call MarkingToggle()<CR>
command! MarkJumpToMarkList call MarkJumpToMarkList()
command! MarkJumpToNext call MarkJumpToNext()
command! MarkJumpToPrev call MarkJumpToPrev()
command! MarkToggleLine call MarkToggleLine()
command! MarkingToggle call MarkingToggle()
augroup BookmarkSync
    autocmd!
    autocmd WinEnter,BufEnter * call MarkSyncMarks()
augroup END
let g:bookmark_marking_enabled = 1
let g:bookmark_center_jumped_line = 0
highlight BookMarkLine cterm=bold ctermbg=240 gui=bold guibg=#585858
function! MarkingToggle()
    if g:bookmark_marking_enabled
        let g:bookmark_marking_enabled = 0
        echo "Marking functionality disabled."
        call ClearAllMarks()
    else
        let g:bookmark_marking_enabled = 1
        echo "Marking functionality enabled."
    endif
endfunction
function! MarkLine()
    if !g:bookmark_marking_enabled
        echo "Please enable marking functionality first."
        return
    endif
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    let l:lnum = line('.')
    if !has_key(b:bookmark_marked_lines, l:lnum)
        let l:matchid = matchadd('BookMarkLine', '\%' . l:lnum . 'l')
        let b:bookmark_marked_lines[l:lnum] = l:matchid
        if !exists('w:match_ids')
            let w:match_ids = {}
        endif
        let w:match_ids[l:lnum] = l:matchid
        echo "Marked line " . l:lnum . "."
    else
        echo "Line " . l:lnum . " is already marked."
    endif
endfunction
function! UnmarkLine()
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    let l:lnum = line('.')
    if has_key(b:bookmark_marked_lines, l:lnum)
        let l:matchid = b:bookmark_marked_lines[l:lnum]
        call matchdelete(l:matchid)
        call remove(b:bookmark_marked_lines, l:lnum)
        if exists('w:match_ids') && has_key(w:match_ids, l:lnum)
            call remove(w:match_ids, l:lnum)
        endif
        echo "Unmarked line " . l:lnum . "."
    else
        echo "Line " . l:lnum . " is not marked."
    endif
endfunction
function! MarkToggleLine()
    if !g:bookmark_marking_enabled
        echo "Please enable marking functionality first."
        return
    endif
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    let l:lnum = line('.')
    if has_key(b:bookmark_marked_lines, l:lnum)
        call UnmarkLine()
    else
        call MarkLine()
    endif
endfunction
function! ClearAllMarks()
    if exists('w:match_ids')
        for l:lnum in keys(w:match_ids)
            let l:matchid = w:match_ids[l:lnum]
            call matchdelete(l:matchid)
        endfor
    endif
    let w:match_ids = {}
    let b:bookmark_marked_lines = {}
endfunction
function! MarkJumpToMarkList()
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    if empty(keys(b:bookmark_marked_lines))
        echo "No marked lines."
        return
    endif
    let l:marked_lnums = sort(map(keys(b:bookmark_marked_lines), 'str2nr(v:val)'))
    let l:choices = []
    for l:lnum in l:marked_lnums
        let l:line_text = getline(l:lnum)
        call add(l:choices, l:lnum . ': ' . substitute(l:line_text, '^\s*', '', ''))
    endfor
    let l:choice = inputlist(['Select a line to jump to:'] + l:choices)
    if l:choice > 0 && l:choice <= len(l:marked_lnums)
        execute l:marked_lnums[l:choice - 1]
        if g:bookmark_center_jumped_line == 1
            normal! zz " Center the jumped line
        endif
    else
        echo "Invalid choice."
    endif
endfunction
function! MarkJumpToPrev()
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    if empty(keys(b:bookmark_marked_lines))
        echo "No marked lines."
        return
    endif
    let l:current_line = line('.')
    let l:marked_lnums = sort(map(keys(b:bookmark_marked_lines), 'str2nr(v:val)'))
    let l:prev_marks = filter(copy(l:marked_lnums), 'v:val < l:current_line')
    if !empty(l:prev_marks)
        let l:target_line = l:prev_marks[-1]
        execute l:target_line
        if g:bookmark_center_jumped_line == 1
            normal! zz " Center the jumped line
        endif
        echo "Jumped to previous marked line " . l:target_line . "."
    else
        echo "No previous marked line."
    endif
endfunction
function! MarkJumpToNext()
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    if empty(keys(b:bookmark_marked_lines))
        echo "No marked lines."
        return
    endif
    let l:current_line = line('.')
    let l:marked_lnums = sort(map(keys(b:bookmark_marked_lines), 'str2nr(v:val)'))
    let l:next_marks = filter(copy(l:marked_lnums), 'v:val > l:current_line')
    if !empty(l:next_marks)
        let l:target_line = l:next_marks[0]
        execute l:target_line
        if g:bookmark_center_jumped_line == 1
            normal! zz " Center the jumped line
        endif
        echo "Jumped to next marked line " . l:target_line . "."
    else
        echo "No next marked line."
    endif
endfunction
function! MarkSyncMarks()
    if ! exists('b:bookmark_marked_lines')
        call ClearAllMarks()
    endif
    if ! exists('w:match_ids')
        let w:match_ids = {}
    endif
    for l:lnum in keys(b:bookmark_marked_lines)
        let l:matchid = b:bookmark_marked_lines[l:lnum]
        if !exists('w:match_ids') || !has_key(w:match_ids, l:lnum)
            call matchadd('BookMarkLine', '\%' . l:lnum . 'l', 10, l:matchid)
            if !exists('w:match_ids')
                let w:match_ids = {}
            endif
            let w:match_ids[l:lnum] = l:matchid
        endif
    endfor
    try
        for l:lnum in keys(w:match_ids)
            let l:matchid = w:match_ids[l:lnum]
            if !exists('b:bookmark_marked_lines') || !has_key(b:bookmark_marked_lines, l:lnum)
                call matchdelete(l:matchid)
                call remove(w:match_ids, l:lnum)
            endif
        endfor
    endtry
endfunction
"------------------------------------------------------
"" Import from CodeTags.vim
"------------------------------------------------------
if has('cscope')
    nnoremap <silent>ca :cscope find a <cword><CR>
    nnoremap <silent>cc :cscope find c <cword><CR>
    nnoremap <silent>cd :cscope find d <cword><CR>
    nnoremap <silent>ce :cscope find e <cword><CR>
    nnoremap <silent>cf :cscope find f <cword><CR>
    nnoremap <silent>cg :cscope find g <cword><CR>
    nnoremap <silent>ci :cscope find i <cword><CR>
    nnoremap <silent>cs :cscope find s <cword><CR>
    nnoremap <silent>ct :cscope find t <cword><CR>
endif
command! CodeTagSetup call CodeTagSetup()
command! CodeTagLoadTags call CodeTagLoadTags()
command! CodeTagUpdateList call CodeTagUpdateList()
command! CodeTagUpdateTags call CodeTagUpdateTags()
let g:codetag_folder_name='.vimproject'
let g:codetag_ctag_name='tags'
let g:codetag_proj_list_name='proj.files'
let g:codetag_cscope_name='cscope.db'
let g:codetag_source_extensions=['*.c', '*.cpp', '*.h', '*.hpp', '*.py', '*.sh', '*.lua']
function! CodeTagGetProjectRoot()
    let git_root = system('git rev-parse --show-toplevel 2>/dev/null')
    if git_root != ''
        return trim(git_root)
    endif
    let repo_root = system('pwd')
    if repo_root != ''
        return trim(repo_root)
    endif
    return ''
endfunction
function! CodeTagGenerateSourceList(search_path, src_list_path)
    let name_conditions = []
    for ext in g:codetag_source_extensions
        call add(name_conditions, '-name "' . ext . '"')
    endfor
    let find_command = 'find ' . a:search_path . ' ' . join(name_conditions, ' -o ') . ' > ' . a:src_list_path
    call system(find_command)
endfunc
function! CodeTagGenerateCtags(tag_path, src_list_path)
    if ! filereadable(a:src_list_path)
        echoe "Project list file not found.".a:src_list_path
        return 1
    endif
    call system('ctags -R --c++-kinds=+p --C-kinds=+p --fields=+iaS --extra=+q -L ' . a:src_list_path . ' -f ' . a:tag_path)
endfunc
function! CodeTagGenerateCscope(tag_path, src_list_path)
    if ! filereadable(a:src_list_path)
        echoe "Project list file not found.".a:src_list_path
        return 1
    endif
    call system('cscope -c -b -R -q -U -i ' . a:src_list_path . ' -f '. a:tag_path)
endfunc
function! CodeTagGenerateTags()
    let user_input=0
    let root = CodeTagGetProjectRoot()
    if root == ''
        echo "Error: Could not determine project root"
        return
    endif
    let tags_dir = root . '/' . g:codetag_folder_name
    if !isdirectory(tags_dir)
        call system('mkdir -p ' . tags_dir)
    endif
    let project_list_file = tags_dir . '/'.g:codetag_proj_list_name
    echom "Generate project srouce code list ".project_list_file
    if filereadable(project_list_file)
        let answer = input("Cscope list already exists. Do you want to rebuild it? (y/n)")
        echo ""
        if answer =~ '^[Yy]$'
            call CodeTagGenerateSourceList(root, project_list_file)
        endif
    else
        call CodeTagGenerateSourceList(root, project_list_file)
    endif
    let ctags_file = tags_dir . '/'.g:codetag_ctag_name
    echom "Generate ctags ". ctags_file
    if filereadable(ctags_file) && l:user_input
        let answer = input("CTags file already exists. Do you want to rebuild it? (y/n)")
        echo ""
        if answer =~ '^[Yy]$'
        call CodeTagGenerateCtags(ctags_file, project_list_file)
        endif
    else
        call CodeTagGenerateCtags(ctags_file, project_list_file)
    endif
    let cscope_tags = tags_dir . '/'.g:codetag_cscope_name
    echom "Generate cscope ".cscope_tags
    if filereadable(cscope_tags) && l:user_input
        let answer = input("Cscope file already exists. Do you want to rebuild it? (y/n)")
        echo ""
        if answer =~ '^[Yy]$'
            call CodeTagGenerateCscope(cscope_tags, project_list_file)
        endif
    else
        call CodeTagGenerateCscope(cscope_tags, project_list_file)
    endif
endfunction
function! CodeTagUpdateList()
    let user_input=0
    let root = CodeTagGetProjectRoot()
    if root == ''
        echo "Error: Could not determine project root"
        return
    endif
    let tags_dir = root . '/' . g:codetag_folder_name
    if !isdirectory(tags_dir)
        call system('mkdir -p ' . tags_dir)
    endif
    let project_list_file = tags_dir . '/'.g:codetag_proj_list_name
    if ! filereadable(project_list_file)
        echom "Generate project srouce code list ".project_list_file
        call CodeTagGenerateSourceList(root, project_list_file)
    endif
    echo "Source list update finished."
endfunction
function! CodeTagUpdateTags()
    let user_input=0
    let root = CodeTagGetProjectRoot()
    if root == ''
        echo "Error: Could not determine project root"
        return
    endif
    let tags_dir = root . '/' . g:codetag_folder_name
    if !isdirectory(tags_dir)
        call system('mkdir -p ' . tags_dir)
    endif
    let project_list_file = tags_dir . '/'.g:codetag_proj_list_name
    if ! filereadable(project_list_file)
        echom "Generate project srouce code list ".project_list_file
        call CodeTagGenerateSourceList(root, project_list_file)
    endif
    let ctags_file = tags_dir . '/'.g:codetag_ctag_name
    call CodeTagGenerateCtags(ctags_file, project_list_file)
    let cscope_tags = tags_dir . '/'.g:codetag_cscope_name
    call CodeTagGenerateCscope(cscope_tags, project_list_file)
    echo "Tag update finished."
endfunction
function! CodeTagLoadTags()
    let root = CodeTagGetProjectRoot()
    if root == ''
        echo "Error: Could not determine project root"
        return
    endif
    let tags_dir = root . '/' . g:codetag_folder_name
    echom "Load tag from ".tags_dir
    if isdirectory(tags_dir)
        execute 'set tags^='.tags_dir.'/'.g:codetag_ctag_name
        execute 'helptags '.tags_dir
        if has('cscope')
            execute 'cscope add '.tags_dir.'/'.g:codetag_cscope_name
        endif
    endif
endfunction
function! CodeTagSetup()
    silent call CodeTagUpdateList()
    silent call CodeTagUpdateTags()
    silent call CodeTagLoadTags()
    echo "Tag setup finished."
endfunction
"------------------------------------------------------
"" Import from SearchProject.vim
"------------------------------------------------------
nnoremap <leader>sg :call SearchProjectGrep(expand("<cword>"))<CR>
nnoremap <leader>sf :call SearchProjectFind(expand("<cword>"))<CR>
nnoremap <C-p> :call SearchProjectFindInput()<CR>
command! SearchProjectFind call SearchProjectFind()
command! SearchProjectGrep call SearchProjectGrep()
function! SearchProjectRoot()
    let git_root = system('git rev-parse --show-toplevel 2>/dev/null')
    if git_root != ''
        return trim(git_root)
    endif
    let repo_root = system('pwd')
    if repo_root != ''
        return trim(repo_root)
    endif
    return ''
endfunction
function! SearchProjectFindInput()
    let pattern = input("Find file: ")
    call SearchProjectFind(pattern)
endfunction
function! SearchProjectGrepInput()
    let pattern = input("Grep file: ")
    call SearchProjectGrep(pattern)
endfunction
function! SearchProjectFind(pattern)
    let root = SearchProjectRoot()
    let command = 'find ' . root . ' -type f -iname "*' . a:pattern . '*" -print'
    let output = system(command)
    let results = []
    let lines = split(output, "\n")
    for line in lines
        if line != ''
            let file = line
            let lnum = 1  " Default to line 1 since we're just searching by filename
            call add(results, {
                        \ 'bufnr': 0,
                        \ 'filename': file,
                        \ 'lnum': lnum,
                        \ 'text': 'Matched file',
                        \ 'vcol': 0
                        \ })
        endif
    endfor
    if len(results) > 0
        call setloclist(0, results, 'r')
        lwindow
    else
        echo "No files found matching pattern: " . a:pattern
    endif
endfunction
function! SearchProjectGrep(pattern)
    let root = SearchProjectRoot()
    let command = 'find ' . root . ' -type f -exec grep -Hn ' . shellescape(a:pattern) . ' {} +'
    let output = system(command)
    let results = []
    let lines = split(output, "\n")
    for line in lines
        if line =~ '^.*:'  " Match lines in format: file:line:content
            let parts = split(line, ":", 3)
            let file = parts[0]
            let lnum = parts[1]
            let text = parts[2]
            call add(results, {
                        \ 'bufnr': 0,
                        \ 'filename': file,
                        \ 'lnum': lnum,
                        \ 'text': text,
                        \ 'vcol': 0
                        \ })
        endif
    endfor
    if len(results) > 0
        call setloclist(0, results, 'r')
        lwindow
    else
        echo "No results found"
    endif
endfunction
"------------------------------------------------------
"" Import from TabGroup.vim
"------------------------------------------------------
augroup AutoTabGroup
    autocmd!
    autocmd VimLeave * :silent! call TabGroupAutoSave()
augroup END
nmap <silent> tl :TabGroupOpenList<CR>
nmap <silent> tn :TabGroupNew<CR>
nmap <silent> ts :TabGroupStore<CR>
let g:tabgroup_default_group_name="_entry_"
let g:tabgroup_default_session_path=expand('~')."/.vim/session/tabgroup"
let g:tabgroup_project_folder_name='.vimproject'
let g:tabgroup_current_group_name=g:tabgroup_default_group_name
function! TabGroupPrivate_BufKeyMaping()
    nnoremap <buffer> <CR>  :call TabGroupSelectUnderCursor_Load()<CR>
    nnoremap <buffer> h     :quit<CR>
    nnoremap <buffer> l     :call TabGroupSelectUnderCursor_Load()<CR>
    nnoremap <buffer> d     :call TabGroupSelectUnderCursor_Delete()<CR>
    nnoremap <buffer> r     :call TabGroupSelectUnderCursor_Reload()<CR>
    nnoremap <buffer> <esc> :quit<CR>
endfunc
function! TabGroupPrivate_IsLegalName(group_name)
    if a:group_name =~# '^[a-zA-Z0-9_]\+$'
        return v:true
    else
        return v:false
    endif
endfunction
function! TabGroup_IsModified()
    for buf in getbufinfo()
        if buf.changed
            return v:true
        endif
    endfor
    return v:false
endfunction
function! TabGroupPrivate_GetProjectRootPath()
    let current_dir = getcwd()
    let project_path = ""
    let l:project_markers = [g:tabgroup_project_folder_name]
    while current_dir != '/' && !empty(current_dir)
        for marker in l:project_markers
            if isdirectory(current_dir . '/' . marker)
                let project_path = current_dir
                break
            endif
        endfor
        if !empty(project_path)
            break " Found a marker, exit the while loop
        endif
        let current_dir = fnamemodify(current_dir, ':h') " Go up one directory
    endwhile
    return project_path
endfunction
function! TabGroupPrivate_GetPath(...)
    let l:group_name = g:tabgroup_current_group_name
    if a:0 == 1
        let l:group_name = a:1
    endif
    let project_root_path=TabGroupPrivate_GetProjectRootPath()
    let session_path=""
    if project_root_path == ""
        let session_path=g:tabgroup_default_session_path . '/' .l:group_name
    else
        let l:tab_group_root_path=project_root_path . '/' . g:tabgroup_project_folder_name . '/tabgroup'
        let session_path=l:tab_group_root_path . '/' .l:group_name
    endif
    return session_path
endfunction
function! TabGroupPrivate_Load(group_name)
    let group_name = a:group_name
    let session_path=TabGroupPrivate_GetPath(a:group_name)
    let session_file=session_path."/session.vim"
    if empty(glob(session_path)) || !isdirectory(session_path)
        echom "Folder not found. Session: ". session_path
        return v:false
    endif
    if TabGroup_IsModified()
        echom "Please save change first."
        return v:false
    else
        silent! %bd!
        silent! tabonly!
    endif
    if !empty(glob(session_file))
        silent! exec 'source ' . session_file
        return v:true
    else
        echom "Session load failed. file not found.". session_file
        return v:false
    endif
endfunction
function! TabGroupPrivate_Store(group_name)
    let group_name = a:group_name
    if !TabGroupPrivate_IsLegalName(l:group_name)
        echom "Error: Tab group name can only contain alphanumeric characters (a-zA-Z0-9) and underscores, and cannot be empty."
        return v:false
    endif
    let session_path=TabGroupPrivate_GetPath(group_name)
    if empty(glob(session_path))
        call system('mkdir -p "' . session_path . '"')
    endif
    let session_file=session_path."/session.vim"
    let current_buffer_name=expand('%:p')
    let buf_cnt=0
    let tab_cnt=0
    let bufcount = bufnr("$")
    if bufcount == 1 && group_name == g:tabgroup_default_group_name
        echo "Igreno save tab with " . g:tabgroup_default_group_name ." group."
        return v:true
    endif
    call writefile(['" Vim session file'], session_file, "")
    call writefile(['" Session open buffer'], session_file, "a")
    call writefile(['""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'], session_file, "a")
    for each_buf in getbufinfo()
        if !empty(glob(each_buf.name)) && buflisted(each_buf.name) == 1
            call writefile(['badd +'. each_buf.lnum . " " . each_buf.name], session_file, "a")
            let buf_cnt = buf_cnt + 1
        endif
    endfor
    let tabcount = tabpagenr("$")
    let current_tab_idx = tabpagenr()
    let tabidx = 1
    call writefile(['" Session opened tab'], session_file, "a")
    call writefile(['""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'], session_file, "a")
    let tab_buffers = []
    while tabidx <= tabcount
        let buflist_in_tab = tabpagebuflist(tabidx)
        if !empty(buflist_in_tab)
            let main_buf_nr = buflist_in_tab[0] " Get the first buffer in the tab
            let currtabname = expand('#' . main_buf_nr . ':p')
            let buf_info = getbufinfo(main_buf_nr)[0]
            if !empty(glob(currtabname)) && buflisted(currtabname) == 1
                call add(tab_buffers, {'path': currtabname, 'lnum': buf_info.lnum})
                let tab_cnt = tab_cnt + 1
            endif
        endif
        let tabidx = tabidx + 1
    endwhile
    for i in range(len(tab_buffers))
        let tab_buf = tab_buffers[i]
        if i == 0
            call writefile(['edit +'. tab_buf.lnum . ' ' . tab_buf.path], session_file, "a")
        else
            call writefile(['tabnew +'. tab_buf.lnum . ' ' . tab_buf.path], session_file, "a")
        endif
    endfor
    call writefile(["let session_original_tabnr=" . current_tab_idx], session_file, "a")
    call writefile(["exe 'tabnext ' . session_original_tabnr"], session_file, "a")
    call writefile(['" Restore settings'], session_file, "a")
    call writefile(['""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'], session_file, "a")
    call writefile(['"Open buffer:'. bufname("%")], session_file, "a")
    return v:true
endfunction
function! TabGroupAutoSave()
    let l:group_name = g:tabgroup_current_group_name
    if l:group_name == ""
        let l:group_name = g:tabgroup_default_group_name
    endif
    if TabGroupPrivate_Store(l:group_name) == v:true
        let g:tabgroup_current_group_name = l:group_name
        return v:true
    else
        echoe 'Group ' . l:group_name . ' Stored fail.'
        return v:false
    endif
endfunction
function! TabGroupSelectUnderCursor_Load()
    let lnum = line('.') - 1
    if lnum == 0
        echo "Don't select title bar."
        return
    else
        let group_name = getloclist(0)[lnum].text
        lclose
        call TabGroupLoad(group_name)
    endif
endfunction
function! TabGroupSelectUnderCursor_Delete()
    let lnum = line('.') - 1
    let loclist = getloclist(0)
    if lnum <= 0 || lnum >= len(loclist)
        return
    endif
    let l:group_name = loclist[lnum].text
    if l:group_name == g:tabgroup_current_group_name
        echom "Can't remove the current group."
        return v:false
    endif
    if TabGroupDelete(l:group_name)
        call remove(loclist, lnum)
        let new_lnum = line('.') - 1
        call setloclist(0, loclist, 'r')
        execute new_lnum
        call TabGroupPrivate_BufKeyMaping()
    endif
    if len(loclist) <= 1
        lclose
    endif
endfunction
function! TabGroupSelectUnderCursor_Reload()
    let lnum = line('.') - 1
    let loclist = getloclist(0)
    if lnum <= 0 || lnum >= len(loclist)
        return
    endif
    let l:group_name = loclist[lnum].text
    let l:user_check = input('You want to load group without saving current one?(y/N) ')
    if l:user_check =~? '^[yY]\(es\)\?$'
        if TabGroupPrivate_Load(l:group_name)
            echo l:group_name . " load successfully."
            lclose
        else
            echom l:group_name . " load failed."
        endif
    endif
endfunction
command! TabGroupHelp call TabGroupHelp()
function! TabGroupHelp()
    echom "TabGroup Commands:"
    echom "  :TabGroupOpenList - Open a list of saved tab groups to load, delete, or reload."
    echom "  :TabGroupNew [name] - Create a new tab group. If [name] is not provided, prompts for a name."
    echom "  :TabGroupStore [name] - Save the current tab group. If [name] is not provided, prompts for a name or saves to the current group."
    echom "  :TabGroupLoad [name] - Load a specified tab group. If [name] is not provided, loads the current group."
    echom "  :TabGroupDelete <name> - Delete a specified tab group. Cannot delete the current or default group."
    echom ""
    echom "Key Mappings:"
    echom "  tl - Open tab group list (:TabGroupOpenList)"
    echom "  tn - Create new tab group (:TabGroupNew)"
    echom "  ts - Store current tab group (:TabGroupStore)"
    echom ""
    echom "In Tab Group Selector (location list):"
    echom "  <CR> / l - Load the tab group under the cursor."
    echom "  d - Delete the tab group under the cursor."
    echom "  r - Reload the tab group under the cursor without saving current changes."
    echom "  h / <esc> - Close the tab group selector."
endfunc
command! TabGroupOpenList call TabGroupOpenList()
function! TabGroupOpenList()
    let session_root_path = TabGroupPrivate_GetPath('')
    if empty(glob(session_root_path)) || !isdirectory(session_root_path)
        echom "No tab groups root path found: " . session_root_path
        return 0
    endif
    let group_dir_paths = glob(session_root_path . '/*', 1, 1)
    let group_names = []
    for dir_path in group_dir_paths
        if isdirectory(dir_path)
            let group_name = fnamemodify(dir_path, ':t') " Get just the directory name
            call add(group_names, group_name)
        endif
    endfor
    if empty(group_names)
        echom "No tab groups found in: " . session_root_path
        return
    endif
    let loc_list = []
    let current_group_idx = -1
    call add(loc_list, {'text': ' -- Tab Group Selector -- ||', 'lnum': 0, 'valid': 0}) " Mark current group with lnum 1
    for i in range(len(group_names))
        let group_name = group_names[i]
        if group_name == g:tabgroup_current_group_name
            let current_group_idx = i
            call add(loc_list, {'text': group_name, 'lnum': 2, 'valid': 1}) " Mark current group with lnum 1
        else
            call add(loc_list, {'text': group_name, 'lnum': 1, 'valid': 0})
        endif
    endfor
    call setloclist(0, loc_list, 'r')
    lopen
    if current_group_idx != -1
        call cursor(current_group_idx + 1 + 1, 1)
    endif
    call TabGroupPrivate_BufKeyMaping()
endfunction
command! -nargs=*  TabGroupNew call TabGroupNew(<f-args>)
function! TabGroupNew(...)
    let l:group_name = ""
    if a:0 == 1
        let l:group_name = a:1
    else
        let l:group_name = input("Enter a new group name: ")
        echo "\n"
        if l:group_name == ''
            return 0
        endif
        if !TabGroupPrivate_IsLegalName(l:group_name)
            echom "Error: Tab group name can only contain alphanumeric characters (a-zA-Z0-9) and underscores, and cannot be empty."
            return 0
        endif
    endif
    if l:group_name == g:tabgroup_current_group_name
        echom "Ignore creating the same group(" . l:group_name . ") as current."
        return 0
    endif
    let session_path=TabGroupPrivate_GetPath(l:group_name)
    if ! empty(glob(session_path))
        echom "Tab group '" . l:group_name . "' already exists at: " . session_path
        return 0 " Return 0 to indicate it wasn't a new creation
    else
        if TabGroupAutoSave() == v:false
            echom "Auto save fail"
            return v:false
        endif
        if TabGroup_IsModified()
            echom "Please save change first."
            return v:false
        else
            silent! %bd!
            silent! tabonly!
            echo "\n"
        endif
        call TabGroupStore(l:group_name)
    endif
endfunction
command! -nargs=*  TabGroupStore call TabGroupStore(<f-args>)
function! TabGroupStore(...)
    let l:group_name = ""
    if a:0 == 1
        let l:group_name = a:1
    else
        let l:group_name = input("Enter a name for storing current group(Enter to save in original group.): ")
        echo "\n"
        if l:group_name == ''
            if TabGroupAutoSave()
                echo "Save on " . g:tabgroup_current_group_name
                return v:true
            else
                echom "Save group fail on " . g:tabgroup_current_group_name
                return v:false
            endif
        endif
    endif
    if TabGroupPrivate_Store(l:group_name) == v:true
        let g:tabgroup_current_group_name = l:group_name
        call TabGroupTitle(g:tabgroup_current_group_name)
        echo 'Group ' . l:group_name . ' Stored finished. Tab:' . tabpagenr("$") . ', Buf:'.bufnr("$")
    else
        echoe 'Group ' . l:group_name . ' Stored fail.'
        return v:false
    endif
endfunction
command! -nargs=*  TabGroupLoad call TabGroupLoad(<f-args>)
function! TabGroupLoad(...)
    let group_name = g:tabgroup_current_group_name
    if a:0 == 1
        let group_name=a:1
    endif
    if group_name == g:tabgroup_current_group_name
        echom "Ignore loading the same group(" . group_name . ")"
        return v:false
    endif
    if TabGroupAutoSave() == v:false
        echo 'Auto save fail, please check if there is any unsave change of it.'
        return v:false
    endif
    if TabGroupPrivate_Load(group_name)
        let g:tabgroup_current_group_name = group_name
        call TabGroupTitle(g:tabgroup_current_group_name)
        echo 'Group ' . group_name . ' loaded. Tab:' . tabpagenr("$") . ', Buf:'.bufnr("$")
        return v:true
    else
        echoe 'Group ' . group_name . ' loade fail.'
        call TabGroupPrivate_Load(g:tabgroup_current_group_name)
        return v:false
    endif
endfunction
command! -nargs=1  TabGroupDelete call TabGroupDelete(<f-args>)
function! TabGroupDelete(group_name)
    if a:group_name == g:tabgroup_default_group_name
        echo 'Can not remove '.g:tabgroup_default_group_name.' group.'
        return v:false
    endif
    if a:group_name == g:tabgroup_current_group_name
        echom "Can not remove current group, please check to other group first."
        return v:false
    endif
    let session_path=TabGroupPrivate_GetPath(a:group_name)
    if ! empty(glob(session_path))
        call system('rm -r ' . session_path)
        echo 'Remove ' . a:group_name . ' group on '. session_path
    endif
    return v:true
endfunction
function! TabGroupTitle(title_name)
    let g:IDE_ENV_IDE_TITLE=a:title_name
    if version >= 802
        redrawtabline
    else
        redraw!
    endif
endfunc
"------------------------------------------------------
"" Import from ProjectManager.vim
"------------------------------------------------------
augroup ProjectManagerGroup
    autocmd!
    autocmd VimEnter * :silent! call ProjectManagerReload()
augroup END
let g:projectmanager_project_folder_name='.vimproject'
let g:projectmanager_project_config_name='proj.vim'
let g:projectmanager_project_markers=[g:projectmanager_project_folder_name, '.repo', '.git']
let g:projectmanager_current_project_root=''
function! ProjectManager_GetProjectRootPath()
    if get(g:, 'projectmanager_debug', 0)
        echom "ProjectManager_GetProjectRootPath: starting"
    endif
    let l:start_dir = getcwd()
    if get(g:, 'projectmanager_debug', 0)
        echom "ProjectManager_GetProjectRootPath: start_dir=" . l:start_dir
    endif
    let project_path = ""
    let l:project_markers = g:projectmanager_project_markers
    if get(g:, 'projectmanager_debug', 0)
        echom "ProjectManager_GetProjectRootPath: project_markers=" . string(l:project_markers)
    endif
    for marker in l:project_markers
        if get(g:, 'projectmanager_debug', 0)
            echom "ProjectManager_GetProjectRootPath: checking marker=" . marker
        endif
        let current_dir = l:start_dir
        while current_dir != '/' && !empty(current_dir)
            if get(g:, 'projectmanager_debug', 0)
                echom "ProjectManager_GetProjectRootPath: checking dir=" . current_dir . " for marker " . marker
            endif
            if isdirectory(current_dir . '/' . marker)
                let project_path = current_dir
                if get(g:, 'projectmanager_debug', 0)
                    echom "ProjectManager_GetProjectRootPath: found project_path=" . project_path
                endif
                break
            endif
            let current_dir = fnamemodify(current_dir, ':h') " Go up one directory
        endwhile
        if !empty(project_path)
            break " Found a marker, exit the for loop
        endif
    endfor
    if get(g:, 'projectmanager_debug', 0)
        echom "ProjectManager_GetProjectRootPath: returning project_path=" . project_path
    endif
    return project_path
endfunction
command! ProjectManagerInit call ProjectManagerInit()
function! ProjectManagerInit()
    let l:project_root = ProjectManager_GetProjectRootPath()
    if empty(l:project_root)
        echom "No project root found.". l:project_root
        return
    endif
    let l:project_config_dir = l:project_root . '/' . g:projectmanager_project_folder_name
    if isdirectory(l:project_config_dir)
        echom "Project config directory already exists: " . l:project_config_dir
        return
    else
        call mkdir(l:project_config_dir, "p")
    endif
    let l:project_config_file = l:project_config_dir . '/' . g:projectmanager_project_config_name
    if !filereadable(l:project_config_file)
        call writefile([], l:project_config_file)
    else
        echom "Project config file already exists: " . l:project_config_file
    endif
    echom "Init project on " . l:project_root
endfunc
command! ProjectManagerEditConfig call ProjectManagerEditConfig()
function! ProjectManagerEditConfig()
    let l:project_root = ProjectManager_GetProjectRootPath()
    let l:project_config_dir = l:project_root . '/' . g:projectmanager_project_folder_name
    let l:project_config_file = l:project_config_dir . '/' . g:projectmanager_project_config_name
    if !filereadable(l:project_config_file)
        echom "Project config file does not exist or is not readable: " . l:project_config_file
        return
    else
        execute 'edit ' . l:project_config_file
    endif
endfunc
command! ProjectManagerReload call ProjectManagerReload()
function! ProjectManagerReload()
    let l:project_root = ProjectManager_GetProjectRootPath()
    let l:project_config_dir = l:project_root . '/' . g:projectmanager_project_folder_name
    let l:project_config_file = l:project_config_dir . '/' . g:projectmanager_project_config_name
    if !filereadable(l:project_config_file)
        echo "Project config file does not exist or is not readable: " . l:project_config_file
        return
    else
        silent! exec 'source ' . l:project_config_file
    endif
endfunc
"------------------------------------------------------
"" Import from MultipleCursors.vim
"------------------------------------------------------
if exists("g:loaded_batch_replace")
    finish
endif
let g:loaded_batch_replace = 1
let g:batch_replace_select_key = '<C-n>'
let g:batch_replace_ignore_key = '<C-i>'
let g:batch_replace_finish_key = '<CR>' " New: Key to finish selection and perform replacement
let g:batch_replace_next_key_no_select = '<Leader>mn' " New: Key to go to next match without selecting
let g:batch_replace_prev_key_no_select = '<Leader>mp' " New: Key to go to previous match without selecting
let g:batch_replace_cancel_key = '<ESC>' " New: Key to cancel the current session
let g:batch_replace_debug = 0 " Set to 1 to enable debug messages, 0 to disable
let s:matches = []
let s:approved_matches = [] " Stores positions that the user agrees to replace
let s:approved_highlight_ids = [] " Stores highlight IDs for approved matches
let s:match_word = ''
let s:current_match_idx = -1
let s:current_match_highlight_id = -1 " ID for the single currently highlighted match
let s:active_session = 0 " Flag to indicate if a session is active
highlight default link BatchReplace Search
execute 'vnoremap <silent>' g:batch_replace_select_key ':call <SID>BatchReplaceHandler("select")<CR>'
execute 'nnoremap <silent>' g:batch_replace_select_key ':call <SID>BatchReplaceHandler("select")<CR>'
function! s:ClearState()
    if g:batch_replace_debug | echomsg "DEBUG: s:ClearState() called" | endif
    if s:current_match_highlight_id != -1
        try | call matchdelete(s:current_match_highlight_id) | catch | endtry
        let s:current_match_highlight_id = -1
    endif
    for l:id in s:approved_highlight_ids
        try | call matchdelete(l:id) | catch | endtry
    endfor
    let s:approved_highlight_ids = []
    call clearmatches('BatchReplace') " Clear any remaining highlights for this group
    let s:matches = []
    let s:approved_matches = []
    let s:match_word = ''
    let s:current_match_idx = -1
    let s:active_session = 0
    echohl None
    echo ""
endfunction
function! s:EnterSelectionMode()
    if g:batch_replace_debug | echomsg "DEBUG: s:EnterSelectionMode() called" | endif
    execute 'nnoremap <silent><buffer>' g:batch_replace_select_key ':call <SID>BatchReplaceHandler("select")<CR>'
    execute 'nnoremap <silent><buffer>' g:batch_replace_ignore_key ':call <SID>BatchReplaceHandler("skip")<CR>'
    execute 'nnoremap <silent><buffer>' g:batch_replace_finish_key ':call <SID>BatchReplaceHandler("finish")<CR>'
    execute 'nnoremap <silent><buffer>' g:batch_replace_next_key_no_select ':call <SID>BatchReplaceHandler("next_no_select")<CR>'
    execute 'nnoremap <silent><buffer>' g:batch_replace_prev_key_no_select ':call <SID>BatchReplaceHandler("prev_no_select")<CR>'
    execute 'nnoremap <silent><buffer>' g:batch_replace_cancel_key ':call <SID>BatchReplaceHandler("cancel")<CR>'
    execute 'vnoremap <silent><buffer>' g:batch_replace_select_key ':call <SID>BatchReplaceHandler("select")<CR>'
endfunction
function! s:ExitSelectionMode()
    if g:batch_replace_debug | echomsg "DEBUG: s:ExitSelectionMode() called" | endif
    silent! execute 'nunmap <buffer>' g:batch_replace_select_key
    silent! execute 'nunmap <buffer>' g:batch_replace_ignore_key
    silent! execute 'nunmap <buffer>' g:batch_replace_finish_key
    silent! execute 'nunmap <buffer>' g:batch_replace_next_key_no_select
    silent! execute 'nunmap <buffer>' g:batch_replace_prev_key_no_select
    silent! execute 'nunmap <buffer>' g:batch_replace_cancel_key
    silent! execute 'vunmap <buffer>' g:batch_replace_select_key
endfunction
function! s:GetSearchWord()
    if g:batch_replace_debug | echomsg "DEBUG: s:GetSearchWord() called" | endif
    let l:original_visual_mode = visualmode()
    if l:original_visual_mode != ''
        let l:old_reg = getreg('"')
        let l:old_reg_type = getregtype('"')
        normal! gvy
        let l:word = getreg('"')
        call setreg('"', l:old_reg, l:old_reg_type)
        if l:original_visual_mode ==# 'v'
            normal! gv
        elseif l:original_visual_mode ==# 'V'
            normal! gv
        else
            execute "normal! gv"
        endif
    else
        let l:word = expand('<cword>')
    endif
    if g:batch_replace_debug | echomsg "DEBUG: Original word: " . l:word | endif
    let l:escaped_word = escape(l:word, '.*[]^%$\/')
    if g:batch_replace_debug | echomsg "DEBUG: Escaped word: " . l:escaped_word | endif
    return l:escaped_word
endfunction
function! s:FindAllMatches(word)
    if g:batch_replace_debug | echomsg "DEBUG: s:FindAllMatches() called with word: " . a:word | endif
    if empty(a:word)
        if g:batch_replace_debug | echomsg "DEBUG: Word is empty, returning empty matches." | endif
        return []
    endif
    let l:all_matches = []
    let l:flags = '' " Start search without special flags, then use 'W' for subsequent searches
    let l:cursor_pos = getcurpos()
    call setpos('.', [0, 1, 1, 0]) " Start search from the beginning of the buffer
    let l:search_pattern = '\V\c' . a:word
    if g:batch_replace_debug | echomsg "DEBUG: Search pattern: " . l:search_pattern | endif
    while 1
        let l:match_pos = searchpos(l:search_pattern, l:flags)
        if g:batch_replace_debug | echomsg "DEBUG: Found match at: " . string(l:match_pos) | endif
        if l:match_pos == [0, 0]
            break
        endif
        call add(l:all_matches, l:match_pos)
        let l:flags = 'W' " Continue search from current position without wrapping
    endwhile
    call setpos('.', l:cursor_pos) " Restore original cursor position
    if g:batch_replace_debug | echomsg "DEBUG: Total matches found: " . len(l:all_matches) | endif
    return l:all_matches
endfunction
function! s:FindStartingMatchIndex(matches, cursor_pos)
    if g:batch_replace_debug | echomsg "DEBUG: s:FindStartingMatchIndex() called. Cursor: " . string(a:cursor_pos) | endif
    let l:cursor_line = a:cursor_pos[1]
    let l:cursor_col = a:cursor_pos[2]
    for l:i in range(len(a:matches))
        let l:match_line = a:matches[l:i][0]
        let l:match_col = a:matches[l:i][1]
        if l:match_line > l:cursor_line
            return l:i
        elseif l:match_line == l:cursor_line
            if l:match_col >= l:cursor_col || (l:match_col < l:cursor_col && l:cursor_col < (l:match_col + len(s:match_word)))
                return l:i
            endif
        endif
    endfor
    return 0
endfunction
function! s:HighlightNextMatch()
    if g:batch_replace_debug | echomsg "DEBUG: s:HighlightNextMatch() called. Current index: " . s:current_match_idx . ", Total matches: " . len(s:matches) | endif
    
        let s:current_match_idx += 1
        if s:current_match_idx >= len(s:matches)
            let s:current_match_idx = 0 " Wrap around to the first match
        endif
    
    let l:current_pos = s:matches[s:current_match_idx]
    if g:batch_replace_debug | echomsg "DEBUG: Highlighting match at position: " . string(l:current_pos) | endif
    call cursor(l:current_pos[0], l:current_pos[1])
    if s:current_match_highlight_id != -1
        call matchdelete(s:current_match_highlight_id)
    endif
    let l:len = len(s:match_word)
    let s:current_match_highlight_id = matchaddpos('BatchReplace', [[l:current_pos[0], l:current_pos[1], l:len]])
    echohl Question | echo "Replace this instance? (Select: " . g:batch_replace_select_key . " / Skip: " . g:batch_replace_ignore_key . " / Next: " . g:batch_replace_next_key_no_select . " / Prev: " . g:batch_replace_prev_key_no_select . " / Finish: " . g:batch_replace_finish_key . " / Cancel: " . g:batch_replace_cancel_key . ")" | echohl None
endfunction
function! s:HighlightPreviousMatch()
    if g:batch_replace_debug | echomsg "DEBUG: s:HighlightPreviousMatch() called. Current index: " . s:current_match_idx . ", Total matches: " . len(s:matches) | endif
    
        let s:current_match_idx -= 1
        if s:current_match_idx < 0
            let s:current_match_idx = len(s:matches) - 1 " Wrap around to the last match
        endif
    
    let l:current_pos = s:matches[s:current_match_idx]
    if g:batch_replace_debug | echomsg "DEBUG: Highlighting match at position: " . string(l:current_pos) | endif
    call cursor(l:current_pos[0], l:current_pos[1])
    if s:current_match_highlight_id != -1
        call matchdelete(s:current_match_highlight_id)
    endif
    let l:len = len(s:match_word)
    let s:current_match_highlight_id = matchaddpos('BatchReplace', [[l:current_pos[0], l:current_pos[1], l:len]])
    echohl Question | echo "Replace this instance? (Select: " . g:batch_replace_select_key . " / Skip: " . g:batch_replace_ignore_key . " / Next: " . g:batch_replace_next_key_no_select . " / Prev: " . g:batch_replace_prev_key_no_select . " / Finish: " . g:batch_replace_finish_key . " / Cancel: " . g:batch_replace_cancel_key . ")" | echohl None
endfunction
function! s:BatchReplaceHandler(action)
    if g:batch_replace_debug | echomsg "DEBUG: s:BatchReplaceHandler() called with action: " . a:action | endif
    if s:active_session == 0
        if g:batch_replace_debug | echomsg "DEBUG: Starting new session." | endif
        call s:ClearState()
        let s:match_word = s:GetSearchWord()
        if empty(s:match_word)
            echohl WarningMsg | echo "No word under cursor or selected." | echohl None
            if g:batch_replace_debug | echomsg "DEBUG: No word found, returning." | endif
            return
        endif
        let s:matches = s:FindAllMatches(s:match_word)
        if empty(s:matches)
            echohl WarningMsg | echo "No matches found for: " . s:match_word | echohl None
            if g:batch_replace_debug | echomsg "DEBUG: No matches found for '" . s:match_word . "', returning." | endif
            return
        endif
        let s:active_session = 1
        call s:EnterSelectionMode() " Enter the custom mode
        if g:batch_replace_debug | echomsg "DEBUG: Session activated. Found " . len(s:matches) . " matches." | endif
        let l:cursor_pos = getcurpos()
        let l:initial_cursor_match_idx = s:FindStartingMatchIndex(s:matches, l:cursor_pos)
        if l:initial_cursor_match_idx == 0
            let s:current_match_idx = len(s:matches) - 1 " Wrap around to the last match
        else
            let s:current_match_idx = l:initial_cursor_match_idx - 1
        endif
        call s:HighlightNextMatch()
    else
        if g:batch_replace_debug | echomsg "DEBUG: Continuing existing session." | endif
        if a:action == 'select'
            if g:batch_replace_debug | echomsg "DEBUG: Selected current match: " . string(s:matches[s:current_match_idx]) | endif
            call add(s:approved_matches, s:matches[s:current_match_idx])
            let l:pos_to_highlight = s:matches[s:current_match_idx]
            let l:len = len(s:match_word)
            let l:id = matchaddpos('BatchReplace', [[l:pos_to_highlight[0], l:pos_to_highlight[1], l:len]])
            call add(s:approved_highlight_ids, l:id)
            call s:HighlightNextMatch()
        elseif a:action == 'skip'
            if g:batch_replace_debug | echomsg "DEBUG: Skipped current match: " . string(s:matches[s:current_match_idx]) | endif
            call s:HighlightNextMatch()
        elseif a:action == 'finish'
            if g:batch_replace_debug | echomsg "DEBUG: User explicitly finished selection." | endif
            if s:current_match_idx != -1 && s:current_match_idx < len(s:matches)
                let l:current_match_pos = s:matches[s:current_match_idx]
                if index(s:approved_matches, l:current_match_pos) == -1
                    if g:batch_replace_debug | echomsg "DEBUG: Automatically selecting current match on finish: " . string(l:current_match_pos) | endif
                    call add(s:approved_matches, l:current_match_pos)
                    let l:len = len(s:match_word)
                    let l:id = matchaddpos('BatchReplace', [[l:current_match_pos[0], l:current_match_pos[1], l:len]])
                    call add(s:approved_highlight_ids, l:id)
                endif
            endif
            call s:PerformReplace()
            call s:ExitSelectionMode()
        elseif a:action == 'next_no_select'
            if g:batch_replace_debug | echomsg "DEBUG: Moving to next match without selection." | endif
            call s:HighlightNextMatch()
        elseif a:action == 'prev_no_select'
            if g:batch_replace_debug | echomsg "DEBUG: Moving to previous match without selection." | endif
            call s:HighlightPreviousMatch()
        elseif a:action == 'cancel'
            if g:batch_replace_debug | echomsg "DEBUG: User cancelled the session." | endif
            call s:ClearState()
            call s:ExitSelectionMode()
            echohl WarningMsg | echo "Batch replacement cancelled." | echohl None
        endif
    endif
endfunction
function! s:PerformReplace()
    if g:batch_replace_debug | echomsg "DEBUG: s:PerformReplace() called." | endif
    if empty(s:approved_matches)
        echohl WarningMsg | echo "No instances selected for replacement." | echohl None
        call s:ClearState()
        if g:batch_replace_debug | echomsg "DEBUG: No approved matches, returning." | endif
        return
    endif
    let l:replacement = input('Replace ' . len(s:approved_matches) . ' instance(s) with: ')
    if empty(l:replacement)
        echohl WarningMsg | echo "Replacement cancelled." | echohl None
        call s:ClearState()
        if g:batch_replace_debug | echomsg "DEBUG: Replacement cancelled by user." | endif
        return
    endif
    if g:batch_replace_debug | echomsg "DEBUG: Replacement word: " . l:replacement | endif
    let l:replaced_count = 0
    for l:pos in reverse(s:approved_matches)
        let l:lnum = l:pos[0]
        let l:col = l:pos[1]
        let l:line = getline(l:lnum)
        if g:batch_replace_debug | echomsg "DEBUG: Replacing at line " . l:lnum . ", col " . l:col . ", original line: " . l:line | endif
        let l:prefix = strpart(l:line, 0, l:col - 1)
        let l:suffix = strpart(l:line, l:col - 1 + len(s:match_word))
        call setline(l:lnum, l:prefix . l:replacement . l:suffix)
        let l:replaced_count += 1
        if g:batch_replace_debug | echomsg "DEBUG: Line after replacement: " . getline(l:lnum) | endif
    endfor
    call s:ClearState()
    echohl MoreMsg | echo " " . l:replaced_count . " instance(s) replaced." | echohl None
    if g:batch_replace_debug | echomsg "DEBUG: Replacement finished. " . l:replaced_count . " instances replaced." | endif
endfunction
"------------------------------------------------------
"" End of Importing.
"------------------------------------------------------
