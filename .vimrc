" Indentation

filetype indent on " Load indent files based on the file type

set autoindent " Copies indentation automatically from last line

set expandtab " Insert spaces instead of tab

set shiftwidth=8 " For every level of indentation insert 8 spaces

set softtabstop=8 " With expandtab on softtabstop only adds the functionality of backspace treating the 8 spaces in an indentation as a single tab

set tabstop=8 " Tab (and not spaces as tabs) is 8 columns wide

" Wrapping long lines

set wrap linebreak "to wrap lines at the ending of words so that vim displays long single lines in multiple lines without changing the content of the file

" Remapping gj and gk keys to up and down arrow keys and j and k so that we can move up and down through visual lines just like in real lines

inoremap <down> <c-o>gj

inoremap <up> <c-o>gk

noremap <down> gj

noremap <up> gk

vnoremap <down> gj

vnoremap <up> gk

noremap j gj

noremap k gk

vnoremap j gj

vnoremap k gk

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

set cursorline " Highlights or underlines current line depending on chosen colorscheme

set hlsearch " Highlight search results

set incsearch " Search as characters are entered

" To turn off highlight in search after first enter

nnoremap <silent> <CR> :noh <CR>

set ignorecase " Search is case insensitive if no capital alphabets are used

set smartcase " If capital alphabets are used search is case sensitive

set relativenumber " Show relative line numbers. I tried absolute numebrs and this is far quicker to give commands

set number " With relativenumber on shows the absolute number for the current line

set ruler " Shows position of cursor in the bottom right of the screen

set shortmess+=aI " Disables intro and  enter to continue messages

set showbreak=... " Shows where lines have been wrapped

set showcmd " Shows when localleader is active

set showmatch " When cursor is on top of a parenthesis the matching one will be highlighted

syntax enable " Adds syntax highlighting

" Plugins

" Chosen plugin manager: vim-plug. git:https://github.com/junegunn/vim-plug/wiki/tutorial

" Plugins will be downloaded in the specified directory

call plug#begin('~/.vim/plugged')

" Use release branch (Recommend)

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()    

" Use tab and shift tab to navigate completion  list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm the currently selected confirmed completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" To close selection menu and then to insert a normal <cr>
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y><CR>" : "\<CR>"

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" For coc-yank from their git page
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

Plug 'honza/vim-snippets' " To have premade snippets for coc-snippet engine. git: https://github.com/honza/vim-snippets

Plug '~/.fzf' " To have fuzzy finding from inside vim directly allowing for me to open files more easily for editing. git: https://github.com/junegunn/fzf/blob/master/README-VIM.md

" To start fzf
nnoremap <silent> <c-t> :FZF<CR>

Plug 'christoomey/vim-system-copy' " To allow easy integration with wl-clipboard. git:https://github.com/christoomey/vim-system-copy

let g:system_copy_silent = 1 " Suppress system_copy message

let g:system_copy#copy_command='wl-copy -n' " Use wl-copy -n for copying

let g:system_copy#paste_command='wl-paste -n' " Use wl-paste -n for pasting

" List ends here. Plugins become visible to Vim after this call.

call plug#end()
