" init
set autoindent
set clipboard=unnamed
set cmdheight=2
set fenc=utf-8
set diffopt=internal,filler,algorithm:histogram,indent-heuristic
set encoding=utf-8
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set hidden
set hls
set ignorecase
set inccommand=split
set list
set listchars=tab:\▸\ ,eol:↲
set nobackup
set nowritebackup
set number
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartcase
set splitright
set tabstop=2
set updatetime=250
set whichwrap+=h,l
set wrapscan

" emacs keybind
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>

" other custom keybind
nnoremap ; :

" dein settings
if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#end()
	call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif

" node settings
let g:node_host_prog = "/Users/t-yoneya/.anyenv/envs/nodenv/versions/16.0.0/lib/node_modules/neovim/bin/cli.js"
"" tsxを開いた時のsyntax ruleを上書く
au BufNewFile,BufRead *.tsx setf typescript.tsx
"" 暫定対応
au BufNewFile,BufRead let b:coc_root_patterns = ['.env']

" python settings
let g:python3_dir = '~/.anyenv/envs/pyenv/shims/'
let g:python3_host_prog= g:python3_dir . 'python'

" plugin dependencies

"" # ayu
""" 背景透過用の設定
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
let ayucolor="dark"
colorscheme ayu

"" # coc-nvim
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
let g:coc_node_path = "/Users/t-yoneya/.anyenv/envs/nodenv/shims/node"
let g:coc_global_extensions = [
\   'coc-lists'
\   , 'coc-tsserver'
\   , 'coc-json'
\   , 'coc-css'
\   , 'coc-tabnine'
\   , 'coc-explorer'
\   , 'coc-highlight'
\   , 'coc-eslint'
\   , 'coc-prettier'
\   , 'coc-graphql'
\   ]

command! -nargs=0 Tsformat :call CocAction('format')

""" coc-list
nmap <silent> <space><space> :<C-u>CocList<cr>
""" Hover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
""" Difinition
nmap <silent> <space>j <Plug>(coc-definition)
""" explorer
let g:coc_explorer_global_presets = {
\   'pwd': {
\     'root-uri': getcwd(),
\   },
\ }

nmap <silent> <space>e :<C-u>CocCommand explorer --preset pwd<cr>

filetype plugin indent on
syntax enable

"" preview-uml.vim
let g:preview_uml_url='http://localhost:8888'

"" preview-markdown.vim
let g:preview_markdown_vertical = 1

"" 背景透過 - colorschemeに依存しているため、ここで実行
hi! Normal ctermbg=NONE guibg=NONE
hi! SpecialKey ctermbg=NONE guibg=NONE
hi! EndOgBuffer ctermbg=NONE guibg=NONE
hi! Statusline ctermbg=NONE guibg=NONE
hi! StatuslineNC ctermbg=NONE guibg=NONE
hi! SignColumn ctermbg=NONE guibg=NONE
