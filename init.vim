let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
call plug#begin()
Plug 'frazrepo/vim-rainbow'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'dense-analysis/ale'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()
let g:rainbow_active = 1
map <C-f> :NERDTreeToggle<CR>

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['reorder-python-imports','autopep8','remove_trailing_lines', 'trim_whitespace'], 'cpp': ['clang-format','remove_trailing_lines', 'trim_whitespace'], 'javascript':['eslint','remove_trailing_lines', 'trim_whitespace'],}

let g:ale_fix_on_save = 1
colorscheme gruvbox
map <F2> :ALEFix<CR>
let g:deoplete#enable_at_startup = 1
set tabstop=4 shiftwidth=4 expandtab
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
