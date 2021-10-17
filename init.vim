" File: init.vim
" Author: jus
" Description: nvim configuration for reverse engineering and developing
" Last Modified: October 17, 2021

fun Run_python_script()
    let py_script = expand('%:p')
    execute "!python " . py_script
endf

fun Run_python_script_debugger() "PUDB
    let py_script = expand('%:p')
    execute ":tabnew /tmp/terminal"
    execute ":term python -m pudb " . py_script
    normal a
endf

fun Load_python_config()
    nnoremap <silent><S-r> :call Run_python_script()<cr>
    nnoremap <silent><S-d> :call Run_python_script_debugger()<cr>

endf

fun Run_radare()
    let cpp_source_file_path = expand('%:p')
    execute ":tabnew /tmp/terminal"
    execute ":term r2 -e bin.cache=true " . cpp_source_file_path.".out"
    normal a
endf

fun Compile_run()
    let cpp_source_file_path = expand('%:p')
    execute ":silent execute '!g++ -o " . cpp_source_file_path . ".out " . "-g " . cpp_source_file_path."'"
    execute ":!".cpp_source_file_path.".out"
    normal a
endf

fun Compile_run_with_gdb()
    let cpp_source_file_path = expand('%:p')
    execute ":silent execute ':!g++ -o " . cpp_source_file_path . ".out " . "-g " . cpp_source_file_path."'"
    execute ":tabnew /tmp/terminal"
    execute ":term gdb --tui " . cpp_source_file_path.".out"
    normal a
endf

fun Load_cpp_config()
    nnoremap <silent><S-r> :call Compile_run()<cr>
    nnoremap <silent><S-d> :call Compile_run_with_gdb()<cr>
    "h stands for hack:
    nnoremap <silent><S-h> :call Run_radare()<cr>
endf

call plug#begin()


"Colorschemes
Plug 'lucasprag/simpleblack'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'challenger-deep-theme/vim'
Plug 'altercation/vim-colors-solarized'

"Always useful plugins
Plug 'preservim/nerdtree' |
        \ Plug 'preservim/nerdtree' |
        \ Plug 'ryanoasis/vim-devicons'
"Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-eunuch' "some useful command u missed very much, such as overwrite file as sudoer etc.

" LaTex support
Plug 'lervag/vimtex'

"snippets and snippets colletction
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'dense-analysis/ale' "linter plugin
Plug 'roxma/nvim-yarp' "its dependencies
Plug 'roxma/vim-hug-neovim-rpc' "dependencies too
Plug 'vim-airline/vim-airline' "bottom bar, default config
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'

" git integration
Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader = ","
let g:challenger_deep_termcolors = 256 " or 16

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:airline#extensions#tabline#enabled = 1


let g:airline#extensions#tabline#formatter = 'default'
map <silent><C-f> :NERDTreeToggle<CR>

"set termguicolors            " 24 bit color
colorscheme gruvbox

let g:ale_fix_on_save = 1
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
augroup python_cfg
    autocmd!
    autocmd BufRead,BufNewFile *.py,*.pyw|<buffer[=N]> call Load_python_config()
augroup END

augroup cpp_cfg
    autocmd!
    autocmd BufRead,BufNewFile *.cpp call Load_cpp_config()
augroup END


"quick edit config
nnoremap <leader>ec :split $MYVIMRC<cr>
"quick reload of config
nnoremap <leader>rc :source $MYVIMRC<cr>


echo "Config loaded, ready to work (=^.^=)"
