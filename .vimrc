syntax on

set t_Co=256
set bg=light
colorscheme default     "desert256 inkpot gardener peaksea

set ai                  "autoindent
set lbr                 "linebreak
set sc                  "showcmd
set nocp                "compatible
set bs=2                "backspace=indent,eol,start

set expandtab           "вставлять пробелы, а не табы
set ts=4                "tabstop
set softtabstop=4       "колличество пробелов в табе
set shiftwidth=4        "колличество пробелов при сдвиге блока

set hlsearch            "подсвечивать найденные фрагменты
set ignorecase          "игнорировать прописные/строчные при поиске
set incsearch           "при поиске перескакивать на найденный текст в процессе набора строки

set nowrap              "не разрывать строку
set showmatch           "подсвечивать парные скобки, кавычки
set ruler               "показывать текущую позицию
set nonumber            "нумерация строк

set scrolloff=3
set title               "отображать имя файла
set ch=2                "высота командной строки
set sidescroll=5
set smartindent
set foldenable 
set foldmethod=indent   "syntax
set laststatus=2
set vb t_vb=

"set list listchars=eol:↵,tab:▹‧,trail:_,extends:▸,precedes:◂
set list listchars=tab:▹‧,trail:‧,extends:▸,precedes:◂

set wildmenu
set wcm=<Tab>                                   "wildcharm
set wildmode=list:longest

set nobackup
"set backup
"set backupdir=$HOME/.vim/backups
"set directory=$HOME/.vim/temp

inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

function ModeChange()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
            silent !chmod a+x <afile>
        endif
      endif
endfunction
au BufWritePost * call ModeChange()

map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
menu Encoding.CP1251   :e ++enc=cp1251<cr>
menu Encoding.CP866    :e ++enc=cp866<cr>
menu Encoding.KOI8-U   :e ++enc=koi8-u<cr>
menu Encoding.UTF-8    :e ++enc=utf-8<cr>
map <F8> :emenu Encoding.<tab>

nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

nmap <F10> :q!<cr>
vmap <F10> <esc>:q!<cr>i
imap <F10> <esc>:q!<cr>i

echo "\n\nВдруг из маминой из спальни ололо пыщь-пыщь реальни!!!!!!111111\n\n"
