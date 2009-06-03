syntax on

filetype on
filetype plugin on
filetype indent on
set completefunc=VjdeCompletionFun
set completeopt=menu,preview

runtime macros/matchit.vim

"set history=1000
"set hidden

colorscheme default             "desert256 inkpot gardener peaksea
set t_Co=256
set background=light

set nocompatible
set noerrorbells
set visualbell t_vb=

set nowrap                      "не разрывать строку
"set linebreak
set backspace=2                 "indent,eol,start
set whichwrap=b,s,h,l,<,>,~,[,]

set autoread

"set mouse=a
"set mousemodel=extend           "popup

set showmatch                   "подсвечивать парные скобки, кавычки
set matchpairs+=<:>             "(:),{:},[:],<:>

set nonumber                    "нумерация строк
set showcmd
set cmdheight=1                 "высота командной строки
set notitle                     "отображать имя файла
set laststatus=2
set ruler                       "показывать текущую позицию
set showtabline=2
set nomodeline

"set scrolljump=3
set scrolloff=3
set sidescroll=1
set sidescrolloff=5

set tabstop=4
set shiftwidth=4                "колличество пробелов при сдвиге блока
set expandtab                   "вставлять пробелы, а не табы
set softtabstop=4               "колличество пробелов в табе
set autoindent
set smartindent

set hlsearch                    "подсвечивать найденные фрагменты
set incsearch                   "при поиске перескакивать на найденный текст в процессе набора строки
set ignorecase                  "игнорировать прописные/строчные при поиске
set smartcase
set nowrapscan

set foldenable
set foldmethod=syntax           "indent

"set list listchars=eol:↵,tab:▹‧,trail:_,extends:▸,precedes:◂
set list listchars=tab:▹‧,trail:‧,extends:▸,precedes:◂

set wildmenu
"set wildcharm=<Tab>
"set wildmode=list:longest,full

set nobackup
set noswapfile
"set backup
"set backupdir=$HOME/.vim/backups
"set directory=$HOME/.vim/temp

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251


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


inoremap <silent> <c-u> <esc>u:set paste<cr>.:set nopaste<cr>gi


nmap <f2> :w<cr>
vmap <f2> <esc><f2>
imap <f2> <esc><f2>i


nmap <f10> :q<cr>
vmap <f10> <esc><f10>
imap <f10> <esc><f10>

nmap <s-f10> :wq<cr>
vmap <s-f10> <esc><s-f10>
imap <s-f10> <esc><s-f10>

nmap <c-f10> :q!<cr>
vmap <c-f10> <esc><c-f10>
imap <c-f10> <esc><c-f10>


nmap <c-t> :tabnew<cr>
imap <c-t> <esc><c-t>

"nmap <c-s-tab> :tabN<cr>
"imap <c-s-tab> <esc><c-s-tab>
nmap <s-left> :tabN<cr>
imap <s-left> <esc><s-left>

"nmap <c-tab> :tabn<cr>
"imap <c-tab> <esc><c-tab>
nmap <s-right> :tabn<cr>
imap <s-right> <esc><s-right>


menu Encoding.cp1251   :e ++enc=cp1251<cr>
menu Encoding.cp866    :e ++enc=cp866<cr>
menu Encoding.koi8-r   :e ++enc=koi8-r<cr>
menu Encoding.utf-8    :e ++enc=utf-8<cr>
nmap <s-f8> :emenu Encoding.<tab>
vmap <s-f8> <esc><s-f8>
imap <s-f8> <esc><s-f8>

"nmap <f8> :call ChangeEncoding()<cr>
nmap <f8> :echo &fileencoding<cr>
vmap <f8> <esc><s-f8>
imap <f8> <esc><s-f8>


function ChangeEncoding()
    if &fileencoding == 'cp1251'
        :e ++enc=utf-8
    else
        :e ++enc=cp1251
    endif
endfunction


function ModeChange()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction
au BufWritePost * call ModeChange()


imap {<cr> {<cr>}<esc>O
"imap {{{<cr> {{{<cr>}}}<esc>O
"imap { {}
"imap ( ()

imap <c-space> <c-x><c-u>
imap <c-m-space> <c-x><c-o>
imap <m-space> <c-n>


set nospell
set spelllang=ru,en

nmap <f7> :call SpellToggle()<cr>
vmap <f7> <esc><s-f7>
imap <f7> <esc><s-f7>

function SpellToggle()
    if &spell == 1
        :setlocal nospell
    else
        :setlocal spell
    endif
endfunction


"set fileformat=unix
