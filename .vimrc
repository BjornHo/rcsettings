
" be iMproved, required
set nocompatible		

" required
filetype off			

"show line numbers
set number	 
"line break at 80 characters
setlocal textwidth=80
"highlight search
set hlsearch
filetype indent plugin on
filetype plugin on
"Useful for C programming. Force vim to source .vimrc if present in project
"directory.
set exrc
set secure
"Used for ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"
"Needed for airline pluging
set laststatus=2
set ttimeoutlen=50


execute pathogen#infect()

"highlight syntax
syntax on

"settings for solarized
set background=dark
colorscheme solarized
set t_Co=256

"settings for LaTeX
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:Tex_ViewRule_pdf = 'thunar'
let g:LatexBox_latexmk_preview_continuously=1

"if it does not work, use command latexmk filename -pvc on a terminal and it
"will automatically compile.

"spell checks
"set spell spelllang=en_us
"set spell spelllang=nl

"NERD Tree shortcut
:command NT NERDTreeFocus

"Automatically open NERD Tree if no files where specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"save as root
command! -nargs=0 Wforce w !sudo tee % > /dev/null

"Recommended Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>
"Ctrl-w + e shall enable checking
"Ctrl-w + f shall disable checking 
noremap <F5> :w<CR> :silent !clear; make<CR> :!echo "--------------- Running ---------------"; echo; "./%<"<CR>

" Search for the ... arguments separated with whitespace (if no '!'),
" or with non-word characters (if '!' added to command).
" For example :S Hello World
function! SearchMultiLine(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR> 

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

"Ctrl + p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

