call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim'
Plug 'frazrepo/vim-rainbow' "add rainbow brackets, so u will never mess up with 'em
Plug 'mattn/emmet-vim' "html autocomplete. jus basic emmet, but complete key is <C-z+,>
Plug 'vim-airline/vim-airline' "bottom bar, default config
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-eunuch' "some useful command u missed very much, such as overwrite file as sudoer etc.
Plug 'scrooloose/nerdtree' "Default conf. Toggles on <C-f>
Plug 'dense-analysis/ale' "linter plugin
Plug 'roxma/nvim-yarp' "its dependencies
Plug 'roxma/vim-hug-neovim-rpc' "dependencies too
Plug  'jmcantrell/vim-virtualenv' "python virtual environments i vim
call plug#end()

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:user_emmet_install_global = 0

autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

let g:rainbow_active = 1
map <C-f> :NERDTreeToggle<CR>

let g:ale_fix_on_save = 1
colorscheme gruvbox
map <C-r> :s///g " you can select few lines and hit sequence to replace some text in selected area, in following format: :%s/original word/replacement/g
map <F2> :ALEFix<CR>
let g:deoplete#enable_at_startup = 1
set tabstop=2 shiftwidth=2 expandtab
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%code%] [%severity%]'
let g:ale_disable_lsp = 1 " ale and coc compability command, so all errors ale will highlight, coc is present cause we need some cool syntax completion
set number
map <silent> <C-k> <Plug>(ale_previous_wrap) " show us next waring/error in code
map <silent> <C-j> <Plug>(ale_next_wrap)
