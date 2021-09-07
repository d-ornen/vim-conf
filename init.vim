call plug#begin()

Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        \ Plug 'ryanoasis/vim-devicons'
Plug 'lucasprag/simpleblack'
Plug 'frazrepo/vim-rainbow' "add rainbow brackets, so u will never mess up with 'em
Plug 'mattn/emmet-vim' "html autocomplete. jus basic emmet
Plug 'tpope/vim-eunuch' "some useful command u missed very much, such as overwrite file as sudoer etc.
Plug 'scrooloose/nerdtree' "Default conf. Toggles on <C-f>
Plug 'dense-analysis/ale' "linter plugin
Plug 'roxma/nvim-yarp' "its dependencies
Plug 'roxma/vim-hug-neovim-rpc' "dependencies too
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline' "bottom bar, default config
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'tomasr/molokai'
call plug#end()



inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:user_emmet_install_global = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''


autocmd FileType html,css EmmetInstall
let g:airline#extensions#tabline#formatter = 'default'
let g:rainbow_active = 1
map <C-f> :NERDTreeToggle<CR>

"set termguicolors            " 24 bit color
colorscheme molokai

let g:ale_fix_on_save = 1
map <C-p> :s///g
map <silent> <C-s> :w <CR>
map <F2> :ALEFix<CR>
let g:deoplete#enable_at_startup = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%code%] [%severity%]'
let g:ale_disable_lsp = 1 " ale and coc compability command, so all errors ale will highlight, coc is present cause we need some cool syntax completion
set number

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }



map <silent> <C-k> <Plug>(ale_previous_wrap) " show us next waring/error in code
map <silent> <C-j> <Plug>(ale_next_wrap)

let g:airline_right_sep = ''
let g:airline_left_sep = ''

"space indentation rules
set shiftwidth=4
set tabstop=4
set expandtab


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-]>"
let g:UltiSnipsJumpBackwardTrigger="<c-[>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
