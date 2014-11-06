"Настроим кол-во символов пробелов, которые будут заменять \t
set t_Co=256
set tabstop=2
set shiftwidth=2
set nocompatible
set smarttab
set et " — включим автозамену по умолчанию 

"set wrap  " — попросим Vim переносить длинные строки

"set ai " — включим автоотступы для новых строк
"set cin " — включим отступы в стиле Си

"Далее настроим поиск и подсветку результатов поиска и совпадения скобок
set showmatch 
set hlsearch
set incsearch
set ignorecase

"set lz " — ленивая перерисовка экрана при выполнении скриптов

"Показываем табы в начале строки точками
"set listchars=tab:..
"set list

"Порядок применения кодировок и формата файлов

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Взаимодействие и элементы интерфейса

" Я часто выделяю мышкой содержимое экрана в Putty, но перехват мышки в Vim мне иногда мешает. Отключаем функционал вне графического режима:
"if !has('gui_running')
"       set mouse= 
"endif

"Избавляемся от меню и тулбара:
set guioptions-=T 
set guioptions-=m 


" Пытаемся занять максимально большое пространство на экране. Как водится, по-разному на разных системах:
if has('gui')
  if has('win32')
    au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
  elseif has('gui_gtk2')
    au GUIEnter * :set lines=99999 columns=99999
  endif
endif

" Опять же, системы сборки для разных платформ могут быть переопределены:
set makeprg=make
compiler gcc

set backup
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/temp
colorscheme wombat256
function ModeChange()
  if getline(1) =~ "^#!"
    if getline(1) =~ "/bin/"
       silent !chmod a+x <afile>
    endif
  endif
endfunction


au BufWritePost * call ModeChange()

if has("autocmd")
   autocmd BufReadPost *
     \ if line("'\"") > 0 && line ("'\"") <= line("$") |
       \   exe "normal g'\"" |
         \ endif
         endif

imap <F6> <Esc>:set<Space>nu!<CR>
nmap <F6> :set<Space>nu!<CR>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
nmap <F10> :q!<cr>
vmap <F10> <esc>:q!<cr>i
imap <F10> <esc>:q!<cr>i
imap <F3> <Esc>:set<space>noautoindent<cr>i
imap <F4> <Esc>:set<space>autoindent<cr>i
"imap <F7><esc>:tabclose<CR>
"map <F7> :tabclose<cr>
"nmap <F7>:tabclose<cr>
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

filetype plugin on
filetype indent on


set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>
syntax on
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>
ino <c-e> <c-r>=TriggerSnippet()<cr>
snor <c-e> <esc>i<right><c-r>=TriggerSnippet()<cr>



set synmaxcol=256
syntax sync minlines=256
set nocursorcolumn
set nocursorline
