if has('win64')
  let g:python_host_prog = 'c:\Python27\python.exe'
  let g:python3_host_prog = 'c:\Python38\python.exe'
endif

" ****** Important ******
set nocompatible




" ****** multi-byte characters ******
set encoding=utf-8
set emoji




" ****** command line editing ******
set history=1000
set wildmenu
set wildignorecase
set wildignore+=node_modules/**




" ****** editing text ******
set backspace=indent,eol,start

set undodir=~/vimundo
" set colorcolumn=80



" ****** messages and info ******
set noshowcmd
set shortmess+=I
set noshowmode
set noruler
set noerrorbells
set visualbell
set confirm " Display a confirmation dialog when closing an unsaved file




" ****** reading and writing files ******
set autoread
set nowb
set backupdir==~/vimbackup//




" ****** multiple windows ******
set hidden
set noequalalways	" make all windows the same size when adding/removing windows
set laststatus=2




" ****** displaying text ******
set number
set relativenumber
set nowrap
set linebreak
set scrolloff=3 " The number of screen lines to keep above and below the cursor
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor
" if has("win32") || has("win64")
"   set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
" endif




" ****** syntax, highlighting and spelling ******
syntax enable
set nospell
set spelllang=en
set background=dark
set t_Co=256
set nocursorline
filetype plugin indent on
filetype indent on
set hlsearch
set termguicolors
" set term=screen-256color




" ****** terminal ******
set title




" ****** using the mouse ******
set mouse=a




" ****** gui ******
set guifont=SFMono\ Nerd\ Font:h14
set guioptions+=! " execute commands inside vim terminal emulator
set guioptions-=a " set selection to system clipboard but not in * register
set guioptions+=P " set selection to system clipboard in + register instead
set guioptions+=c " use console dialog for simple choices
set guioptions+=e " show tab pages in gui
set guioptions-=t " no option to detach system menu
set guioptions-=T " no toolbar
set guioptions-=r " right hand scrollbar not always present
set guioptions-=R " right hand scrollbar not present when there is a vsplit
set guioptions-=l " left hand scrollbar not always present
set guioptions-=L " left hand scrollbar not present when there is a vsplit
set guioptions-=b " no bottom scrollbar
set guioptions-=m " no menubar
set splitright




" ****** Insert mode ******
inoremap <c-J> <esc>
inoremap jk <esc>
inoremap kj <esc>
inoremap <c-\> <esc>:CocCommand terminal.Toggle<cr>


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" ****** Command mode ******
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let maplocalleader="\<Space>"
cnoremap <c-j> <up>
cnoremap <c-k> <down>
" ****** Normal mode ******
nnoremap ; :
nnoremap <leader>. :CocAction<cr>
nnoremap <leader>p :CocCommand<cr>
nnoremap <leader>l :CocList lines<cr>
nnoremap <leader>cc :CocList colors<cr>
nnoremap <leader>P :CocList vimcommands<cr>
nnoremap <c-p> :CocList files<cr>
nnoremap <c-m> :CocList mru<cr>
nnoremap <leader>f :CocList grep<cr>
nnoremap <c-n> :CocCommand explorer <cr>
nnoremap <leader>= :Goyo<cr>
nnoremap <leader>+ :Limelight!!<cr>
nnoremap <leader>o :CocList outline<cr>
nnoremap <leader>r :CocListResume<cr>
nnoremap <leader>d gg=Gg;
nnoremap <leader>tc :CocCommand todolist.create<cr>
nnoremap <leader>tl :CocList todolist<cr>
nnoremap <leader>tt :CocCommand terminal.Toggle<cr>
nnoremap <c-\> :CocCommand terminal.Toggle<cr>
nnoremap <leader>cm :CocList marketplace<cr>
nnoremap <leader>j :CocNext<cr>
nnoremap <leader>k :CocPrev<cr>

" go to previous next error
nnoremap <down> :cnext<cr>

" go to previous error
nnoremap <up> :cprev<cr>

" go to first error
nnoremap <left> :cfirst<cr>

" go to last error
nnoremap <right> :clast<cr>




" ****** Terminal mode *******
tnoremap <c-j> <c-\><c-n>
tnoremap <c-\> <c-\><c-n>:CocCommand terminal.Toggle<cr>




" ****** File explorer ******
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 30
let g:netrw_banner = 0




" ****** the swap file ******
set directory=$HOME/vimswp//





" ****** tabs and indenting ******
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab





" ****** moving around, searching and patterns ******
set incsearch " show match for partly typed search command
set magic	" change the way backslashes are used in search patterns
set ignorecase
set smartcase
set path+=**


if !exists('g:vscode')

  " ****** Plugins ******
  call plug#begin('~/dot-files/vim-pure/plugged')

  Plug 'kana/vim-textobj-user'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'w0rp/ale'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/goyo.vim'
  Plug 'arrufat/vala.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ledger/vim-ledger'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'yuezk/vim-js'
  Plug 'marcopaganini/mojave-vim-theme'
  Plug 'marcopaganini/termschool-vim-theme'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'freitass/todo.txt-vim'


  call plug#end()




  " ****** ALE ******
  let g:ale_linters = {
        \ 'typescript': [],
        \ 'javascript': ['eslint'],
        \ 'c': [],
        \ 'cpp': []
        \}

  " Set this. Airline will handle the rest.
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
  let g:airline_powerline_fonts = 1




  " ****** airline ******
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_theme='challenger_deep'



  " ****** colorscheme ******
  silent! colorscheme challenger_deep
  hi Normal guibg=NONE ctermbg=NONE

  " ****** javascript *******
  let g:javascript_plugin_jsdoc = 1

  " ****** vuejs ******
  augroup VueJsFiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.vue call MySetVueOptions()
  augroup END
  function MySetVueOptions()
    set filetype=vue
    set syntax=html
  endfunction

  " ******** OmniSharp **********
  let g:OmniSharp_server_stdio = 0
  let g:OmniSharp_highlight_types = 3
  let g:OmniSharp_timeout = 10
  augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <buffer> <Leader>. :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <buffer> <Leader>nm :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>
  augroup END

  augroup clangd_commands
    autocmd!

    autocmd CursorHold *.cpp CocCommand clangd.symbolInfo
    autocmd CursorHold *.c CocCommand clangd.symbolInfo
    autocmd CursorHold *.h CocCommand clangd.symbolInfo
    autocmd CursorHold *.hpp CocCommand clangd.symbolInfo

    autocmd FileType cpp nnoremap <buffer> <leader>h  :CocCommand clangd.switchSourceHeader<CR>
    autocmd FileType cpp nnoremap <buffer> <leader>d  :!clang-format -style=file -i %<cr>



  augroup END

  command! -nargs=* T split | terminal <args>
  command! -nargs=* VT vsplit | terminal <args>
  let g:neovide_cursor_animation_length=0.1
  let g:neovide_cursor_trail_length=0.8
  let g:neovide_cursor_antialiasing=v:false
  let g:neovide_cursor_vfx_mode="wireframe"

endif "not in vscode

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
