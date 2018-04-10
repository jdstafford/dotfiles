set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'grassdog/tagman.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'jsx', 'vue'] }
Plugin 'jreybert/vimagit'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'moll/vim-node'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'elmcast/elm-vim'
Plugin 'vim-syntastic/syntastic'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

call pathogen#infect()

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

set backspace=2
set noswapfile
set clipboard=unnamed

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage in visual mode
set nu			" number lines
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set cindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

set vb t_vb=
set t_Co=256
set showbreak=...
set wrap linebreak nolist
set lbr
colorscheme spacegray
set hlsearch  "Turn on highlighting of search phrase

" gvim settings
set guioptions-=T
set guioptions+=c

:match Ignore /\r$/

" remove highlight
:map j <Down>:nohlsearch<CR>
:map k <Up>:nohlsearch<CR>
:map h <Left>:nohlsearch<CR>
:map l <Right>:nohlsearch<CR>

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR>

nmap <silent> <C-tab> <Esc>:bn<CR>
nmap <silent> <S-C-tab> <Esc>:bp<CR>

"statusline setup
set statusline=%f       "tail of the filename

let g:syntastic_enable_signs=1

"Git
set statusline+=%{fugitive#statusline()}

set dictionary+=/usr/share/dict/words

set nopaste

filetype plugin on

map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>

if bufwinnr(1)
  map - <C-W><C-W>
  map + <S-C-W><S-C-W>
endif

" auto switch to folder where editing file
" autocmd BufEnter * cd %:p:h
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType ruby set omnifunc=rubycomplete#CompleteTags

" PHP specific goodies

" run file with PHP CLI
"autocmd FileType php noremap <C-F11> :!/usr/local/bin/php %<CR>

" PHP parser check
autocmd FileType php noremap <C-l> :!/usr/local/bin/php -l %<CR>

" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay

autocmd FileType php let php_sql_query=1

" does exactly that. highlights html inside of php strings

autocmd FileType php let php_htmlInStrings=1

" discourages use of short tags. c'mon its deprecated remember

"autocmd FileType php let php_noShortTags=1

" set 'make' command when editing php files

set makeprg=php\ -l\ %

set errorformat=%m\ in\ %f\ on\ line\ %l

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!yarn.lock" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" prettier
let g:prettier#quickfix_enabled = 0

let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.css,*.scss,*.less,*.vue,*.jsx PrettierAsync

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

nmap ; :Buffers<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

let mapleader = ",,"

map <Leader>f :Files<CR>
map <Leader>r :Find<CR>
map <Leader>b :Buffers<CR>
map <Leader>t :Tags<CR>
