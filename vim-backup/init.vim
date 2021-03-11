" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'

"This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.,
Plug 'Raimondi/delimitMate'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'MattesGroeger/vim-bookmarks'

"Solid syntax and indentation
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark', {'branch': 'stable'}
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'inkarkat/vim-ShowTrailingWhitespace'
Plug 'mhinz/vim-startify'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"List ends here. Plugins become visible to Vim after this call.
call plug#end()

inoremap jk <c-c>
let mapleader = " "
syntax on
filetype plugin on
set nocompatible
set number relativenumber
set wildmenu
set hls
set incsearch
set hidden
set nu
set noswapfile
set showmatch
set t_Co=256
set mouse=""
set completeopt=preview,menu


"move behind ' " ] } > ) and insert
nnoremap <Leader>p /[\'"\])}>]<CR>:noh<CR>a

"window operations
nnoremap <Leader>wc <c-w>c
nnoremap <Leader>v <c-w>v<c-w>l
nnoremap <Leader>s <c-w>s<c-w>j
nnoremap <c-b>o <nop>
nnoremap <C-w>o <Nop>


nnoremap <F3> :cprev<CR>zz
nnoremap <F4> :cnext<CR>zz
nmap <C-t> :colder<CR>:cc<CR>

"page up-donw
nnoremap <M-e> <C-e>
nnoremap <M-y> <C-y>

"tab
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>u :tabp<cr>
nnoremap <leader>i :tabn<cr>
nnoremap <leader>y :tabclose<cr>

"buffer
nnoremap <leader>, :bp<cr>
nnoremap <leader>. :bn<cr>
nnoremap <Leader>d :bd!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"buffer explore
nnoremap  <Leader>b :BufExplorer<CR>

let g:bufExplorerDefaultHelp=1       " Show default help.
let g:bufExplorerDetailedHelp=1      " Show detailed help.
let g:bufExplorerDisableDefaultKeyMapping=1    " Disable mapping.

""""""""""""""""""""""""""""""""""""""""""""""""""
"airline
let g:airline#extensions#tabline#enabled = 1

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', 'W:%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Shebang
	autocmd BufNewFile *.py  :execute "normal! i#!/usr/bin/env python3\<cr>#-*- coding: utf-8 -*-\<cr>\<cr>"
	autocmd BufNewFile *.sh  :execute "normal! i#!/bin/bash\<cr>"
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree https://github.com/scrooloose/nerdtree
map <M-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"end NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Now you can just press <Leader><number> and be taken to the window number you want
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

let python_highlight_all = 1

colorscheme gruvbox

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}


"filetype indent off
"https://tedlogan.com/techblog3.html
autocmd FileType python exec 'set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab'
autocmd FileType c exec 'set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab'
setl noai nocin nosi inde=
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"some times backspace does not work
set backspace=2

nnoremap <F12> :terminal<cr>A
set shell=zsh
"just close terminal
"tnoremap <ESC> <c-w><c-c>
"switch to other window
"do not tmap <esc> <c-w>:Bwipeout!<cr>
"tmap <esc><esc> <c-w>:bp\|bd! #<cr>
tnoremap <ESC> <c-\><c-n>
nnoremap <F9> <c-w>w
tmap <F9> <c-\><c-n><c-w>

"run current file
nnoremap <leader><F5> :!%:p<cr>
nnoremap <leader><leader><F5> :'<,'>w !
nnoremap <leader><F6> :!gedit %:p<cr>

nnoremap <leader>j <c-w>w
nnoremap <leader>l :w<cr>

nnoremap <up> <c-y>
nnoremap <down> <c-e>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

nnoremap <leader>- :cclose<cr>
nnoremap <leader>= :copen<cr>


if has("cscope")
	set csto=0
	set cst
	set nocsverb
	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

nnoremap <leader><leader>g :cs f g 
nnoremap <leader><leader>s :cs f s 
nnoremap <leader><leader>t :cs f t 
nnoremap <leader><leader>f :cs f f 
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader><leader>vg :vimgrep  /<C-R>=expand("<cword>")<CR>/j %<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fzf vim

nnoremap <c-p> :Files<cr>
nnoremap <M-t> :BTags<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"book mark plugin
let g:bookmark_sign = '✪'
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_no_default_key_mappings = 1
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mj <Plug>BookmarkNext
nmap <Leader>mk <Plug>BookmarkPrev

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tagbar
nnoremap <M-b> :TagbarToggle<cr>
let g:tagbar_autoclose = 1

""""""""""""
"vim-auto-popmenu
"enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, '*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

""""""""""""
"inkarkat/vim-mark
let g:mw_no_mappings = 1
nmap <Leader><Leader>n <Plug>MarkClear
nmap <Leader><Leader>m <Plug>MarkSet
nmap <Leader><Leader>M <Plug>MarkToggle
