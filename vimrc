" .vimrc

" Creditos: 
" http://aurelio.net
"
"

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()
runtime vundle.vim

" vundle.vim
" Plugin 'gmarik/vundle' " Plugin manager.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



syntax on
set mouse=
set showmatch
set nowrap
set nu
set backspace=indent,eol,start
set ts=4
set sw=4
set et
set statusline=%F%m%r%h%w\ [Formato=%{&ff}]\ [Tipo=%Y]\ [Ascii=\%03.3b]\ [Hex=\%02.2B]\ [Coluna\ atual=%04v]\ [Linha\ atual=%04l]\ [%p%%]\ [Tamanho=%L\ linhas] 
set laststatus=2
set nobackup
set completeopt=menu
set autoread

set shiftwidth=4 tabstop=4 expandtab
set dir=~/.vim/tmp backupdir=~/.vim/tmp
set ignorecase smartcase shiftround smartindent
"set t_Co=256
set autochdir


"
" appearance options
"
set bg=dark
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:molokai_original = 1

let g:airline_left_sep='['
let g:airline_right_sep=']'
let g:airline_linecolumn_prefix = '§'
let g:airline_paste_symbol = 'Þ'
let g:airline_readonly_symbol = 'Ʀ'
let g:airline_theme='molokai'
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0

"colorscheme molokai




" sempre utf-8!
set fileencoding=utf-8

let g:explVertical=1
let g:explWinSize=35
let g:explSplitLeft=1
let g:explSplitBelow=1
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'
let g:explDetailedHelp=0

" python
let python_highlight_numbers=1
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_space_errors=1
autocmd FileType python filetype indent on

" C, js
autocmd FileType c,cpp,javascript setlocal cindent
"autocmd FileType c,cpp,javascript setlocal ts=2
"autocmd FileType c,cpp,javascript setlocal sw=2
"autocmd FileType html setlocal tw=2

" tab config
:nmap <C-T> :tabnew 
:nmap <tab> :tabnext<cr>
:nmap <S-tab> :tabprevious<cr>
":nmap <C-PageUp> :tabprevious<cr>

" adicao de tipos do zopao
autocmd BufNewFile,BufRead *.zcml         setf xml
autocmd BufNewFile,BufRead *.pt,*.[cj]pt, setf xhtml
autocmd BufNewFile,BufRead *.css.dtml     setf css
autocmd BufNewFile,BufRead *.js.dtml      setf javascript
autocmd BufNewFile,BufRead *.metadata     setf dosini

" tab para o make e ChangeLog
"autocmd FileType changelog set textwidth=79
autocmd FileType changelog set noet
autocmd FileType make set noet

" Salvar a posicao do cursor em arquivos recem editados
autocmd BufRead *,.* :normal '"

" mostra a side bar com um file explorer
" ah esquerda do vim
function! ShowSideBar()
    " pra alterar o tema descomente a linha abaixo
    " colorscheme elflord 
    vertical split
    vertical resize 22
    set nonu
    :Explore
endfun

set dictionary+=/usr/share/dict/words
set complete=.,w,k


function AutoCompletar(direcao)
   let posicao = col(".") - 1
    if ! posicao || getline(".")[posicao - 1] !~ '\k'
      return "\<Tab>"
   elseif a:direcao == "avancar"
      return "\<C-n>"
   else
      return "\<C-p>"
   endif
endfunction 

inoremap <Tab> <C-R>=AutoCompletar("avancar")<CR>
inoremap <S-Tab> <C-R>=AutoCompletar("voltar")<CR>

