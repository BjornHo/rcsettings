
" be iMproved, required
set nocompatible		

" required
filetype off			

"show line numbers
set number	 
"line break at 80 characters
setlocal textwidth=80
filetype indent plugin on
filetype plugin on

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


