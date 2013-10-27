runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on

filetype on
filetype plugin on
filetype indent on

set nocompatible

set history=1000

colorscheme default             "desert256 inkpot gardener peaksea
set t_Co=256
set background=light

set noerrorbells
set novisualbell

set nowrap
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,~,[,]

set autoread

set showmatch                   "подсвечивать парные скобки, кавычки
set matchpairs+=<:>             "(:),{:},[:],<:>

set nonumber                    "нумерация строк
set showcmd
set cmdheight=1                 "высота командной строки
set notitle                     "отображать имя файла
set showtabline=2
set nomodeline

set laststatus=2                "always
"set statusline=%!EvaluateStatusLine()
"set ruler                       "показывать текущую позицию

"function EvaluateStatusLine()
    "let status = '%<%F %h%m%r[%{&filetype}][%{&fileencoding}][%{&fileformat}]%=%l/%L,%c%V 0x%B,%b %{&encoding}'
    "return status
"endfunction

set scrolloff=3
set sidescroll=1
set sidescrolloff=5

set tabstop=4
set shiftwidth=4                "колличество пробелов при сдвиге блока
set softtabstop=4               "колличество пробелов в табе
set expandtab                   "вставлять пробелы, а не табы

set autoindent
set smartindent

set hlsearch                    "подсвечивать найденные фрагменты
set incsearch                   "при поиске перескакивать на найденный текст в процессе набора строки
set ignorecase                  "игнорировать прописные/строчные при поиске
set smartcase
set nowrapscan

set foldenable
"set foldmethod=syntax           "indent
"set foldclose=all

set list listchars=tab:▹‧,trail:‧,extends:▸,precedes:◂

set wildmenu

set nobackup
set noswapfile

set encoding=utf-8 nobomb
set termencoding=utf-8
set fileencodings=utf-8,cp1251

set gdefault                    "always global regex

let mapleader=","
let g:mapleader=","

nmap ; :

nmap <leader>p :set invpaste<cr>

nmap <c-t> :tabnew<cr>
imap <c-t> <esc><c-t>
nmap <s-left> gT
imap <s-left> <esc><s-left>
nmap <s-right> gt
imap <s-right> <esc><s-right>

vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>

"inoremap <silent> <c-u> <esc>u:set paste<cr>.:set nopaste<cr>gi

let g:airline_theme='wombat'
let g:airline#extensions#tagbar#enabled = 1

"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"set background=dark
"colorscheme solarized


autocmd! BufWritePost .vimrc source ~/.vimrc

autocmd! BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe ("norm '\"") | else | exe "norm $" | endif | endif

autocmd! FileType Makefile set noexpandtab

autocmd! BufWritePost * call ModeChange()

if &binary
augroup Binary
    autocmd!
    autocmd BufReadPre * let &bin=1
    autocmd BufReadPost * if &bin | %!xxd -c 32
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &bin | %!xxd -r -c 32
    autocmd BufWritePre * endif
    autocmd BufWritePost * if &bin | %!xxd -c 32
    autocmd BufWritePost * set nomod | endif
augroup END
endif

function! ModeChange()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"function! EvaluateStatusLine()
    "let status = '%<%F %h%m%r[%{&filetype}][%{&fileencoding}][%{&fileformat}]%=%l/%L,%c%V 0x%B,%b %{&encoding}'
    "return status
"endfunction


map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
