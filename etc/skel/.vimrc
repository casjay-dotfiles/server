"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Check plugins and install if needed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(expand('~/.vim/bundle/Vundle.vim/.gitignore'))
    echo "Downloading Vundle to manage plugins..."
    silent !git clone -q "https://github.com/VundleVim/Vundle.vim.git" ~/.vim/bundle/Vundle.vim
    silent !vim +PluginInstall +qall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-rooter'
Plugin 'ap/vim-css-color'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'chazy/dirsettings'
Plugin 'Chiel92/vim-autoformat'
Plugin 'chriskempson/base16-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jreybert/vimagit'
Plugin 'klen/python-mode'
Plugin 'Konfekt/vim-scratchpad'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'morhetz/gruvbox'
Plugin 'plasticboy/vim-markdown'
Plugin 'powerline/powerline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'sheerun/vim-polyglot'
Plugin 'sirver/ultisnips'
Plugin 'SpaceVim/SpaceVim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-python/python-syntax'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'wsdjeg/vim-todo'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'metakirby5/codi.vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=bash
set nocompatible
filetype off
filetype plugin indent on
set title
set smarttab
set backspace=indent,eol,start
set matchpairs+=<:>
set hlsearch
set autoread
set showcmd
set expandtab
set number
set relativenumber
set t_Co=16
set scrolloff=8
set tabstop=4
set encoding=UTF-8
set shiftwidth=4
set textwidth=140
set colorcolumn=+3
set ruler
set cursorline
set path+=**
set wildmenu
set wildmode=list:full
set incsearch
set nobackup
set noswapfile
set autoread
set confirm
set autoindent
set smartindent
set nofoldenable
set nocopyindent
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
" let g:colors_name = 'hashpunk-lapis'
" hi LineNr ctermfg=242
" hi CursorLineNr ctermfg=242

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
let g:minimap_highlight='visual'
let g:python_highlight_all = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap ESC to ii
:imap ii <Esc>

"Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Specify File Types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Bufread,BufNewFile *.md set filetype=markdown
autocmd FileType vimwiki set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

autocmd FileType vim,tex,xml let b:autoformat_autoindent=0
let blacklist = ['xml', 'conf']
"autocmd BufWritePre * if index(blacklist, &ft) < 0 | :Autoformat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:powerline_pycmd="py"
set laststatus=2
set t_Co=256
let g:rehash256 = 1
let g:airline_theme='violet'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#close_symbol = 'x'
let g:airline_extensions = ['tabline']
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%2l%#__restore__#%#__accent_bold#/%L%#__restore__# :%3v'
let g:airline_section_b = ''
let g:airline_section_c = '%<%f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%3*%y%*                "file type
set statusline +=%3*%=%*
set statusline +=%1*\ %<%F\ %*            "full path
set statusline +=%3*%m%*                "modified flag
set statusline +=%3*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startupify configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_enable_special = 0
let g:startify_files_number = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_synchronize_view = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify Python Version 2 or 3
"let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ensure files are read as what I want:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> "+y
map <C-p> "+P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => When shortcut files are updated, renew bash and vifm configs with new material:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disables automatic commenting on newline:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Run xrdb whenever Xdefaults or Xresources are updated.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_follow_anchor = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-MULTIPLE-CURSORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => go to last known place
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => remove whitespaces on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

let noStripWhiteSpaceTypes = ['markdown']
autocmd BufWritePre * if index(noStripWhiteSpaceTypes, &ft) < 0 | call StripTrailingWhitespace() | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-scratchpad
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:scratchpad_path = '$HOME/.cache/scratchpads'
let g:scratchpad_ftype = 'txt'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Note Taking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let g:notes_directories = ['~/.local/share/vimwiki/notes']
:let g:notes_suffix = '.md'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save as root
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => if vimrc.local then lets source that
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.local/.configs/vimrc.local"))
     source ~/.local/.configs/vimrc.local
endif

