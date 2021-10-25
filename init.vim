" Filc init.vim
" Author: jus
" Description: nvim configuration for reverse engineering and developing
" Last Modified: October 17, 2021

"Runs before all language-specific configs, so it acts as a template, and a
"way to add language-independent commands.
fun General_confg()
    "quick edit config
    nnoremap <leader>ec :split $MYVIMRC<cr>
    "quick reload of config
    nnoremap <leader>rc :source $MYVIMRC<cr>
    "open new tab
    nnoremap <leader>n :tabnew ./
    nnoremap <A-]> gt
    nnoremap <A-[> gT
    "trigger autocomplete:
    inoremap <silent><expr> <c-space> coc#refresh()

    "compile code
    nnoremap <silent><S-c> :call Compile()<cr>
    "Run code
    nnoremap <silent><S-r> :call Run()<cr>
    nnoremap <silent><S-d> :call Run_with_gdb()<cr>
    "s stands for static analysis (i prefer r2 for that):
    nnoremap <silent><S-s> :call Run_radare()<cr>
    "l stands for live analysis:
    nnoremap <silent><S-l> :call Run_rizin()<cr>
endf


fun Run_python_script_debugger() "PUDB
    let py_script = expand('%:p')
    execute ":tabnew /tmp/terminal"
    execute ":term python -m pudb " . py_script
    normal a
endf

fun Run_radare()
    let original_file_path = expand('%:p')
    let extention = expand('%:e')
    if extention == 'cpp'
        execute ":tabnew /tmp/terminal"
        execute ":term r2 " . original_file_path.".out"
        normal a
    elseif extention == 'rs'
        execute ":tabnew /tmp/terminal"
        "asuming that we are in the project head dir (With carg.toml file)
        execute ":term r2 " . "./target/debug/rust"
        normal a
    else
        echo "No radare2 behavior specified for file with .".extention." extention"
    endif
endf

fun Run_rizin()
    let original_file_path = expand('%:p')
    let extention = expand('%:e')
    if extention == 'cpp'
        execute ":tabnew /tmp/terminal"
        execute ":term rizin -d -e bin.cache=true " . original_file_path.".out"
        normal a
    elseif extention == 'rs'
        execute ":tabnew /tmp/terminal"
        "asuming that we are in the project head dir (With carg.toml file)
        execute ":term rizin -d -e bin.cache=true " . "./target/debug/rust"
        normal a
    else
        echo "No rizin behavior specified for file with .".extention." extention"
    endif
endf

fun Compile()
    let original_file_path = expand('%:p')
    let extention = expand('%:e')
    
    if extention == 'cpp'
        let cpp_source_file_path = expand('%:p')
        execute ":!g++ -o " . original_file_path . ".out " . "-g " . cpp_source_file_path
    elseif extention == 'rs'
        execute ":!cargo build"
    endif

    normal a
endf

fun Run()
    let original_file_path = expand('%:p')
    let extention = expand('%:e')
    
    if extention == 'py'
        execute ":tabnew /tmp/terminal"
        execute ":term python " . original_file_path
    elseif extention == 'cpp'
        execute ":tabnew /tmp/terminal"
        execute ":term " . original_file_path.".out"
    elseif extention == 'rs'
        execute ":tabnew /tmp/terminal"
        execute ":term cargo run"
    else
        echo "no run behavior specified for .".extention." files"
    endif

    normal a
endf

fun Run_with_gdb()
    let original_file_path = expand('%:p')
    let extention = expand('%:e')
    
    if extention == 'py'
        execute ":tabnew /tmp/terminal"
        execute ":term python -m pudb " . original_file_path
        normal a
    elseif extention == 'cpp'
        execute ":tabnew /tmp/terminal"
        execute ":term gdb --tui -q " . original_file_path.".out"
        normal a
    elseif extention == 'rs'
        execute ":tabnew /tmp/terminal"
        execute ":term gdb --tui -q " . "./target/debug/rust"
        normal a
    else
        echo "No gdb behavior specified for .".extention." files (T_T)"
    endif
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


let g:airline#extensions#tabline#enabled = 1


let g:airline#extensions#tabline#formatter = 'default'
map <silent><C-f> :NERDTreeToggle<CR>

"set termguicolors            " 24 bit color
colorscheme simpleblack

let g:deoplete#enable_at_startup = 1
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

augroup load_cfg
    autocmd!
    autocmd BufEnter,BufRead,BufNewFile * call General_confg()
augroup END

let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-git', 'coc-clangd', 'coc-jedi', 'coc-pydocstring', 'coc-rls', 'coc-texlab']
echo "Config loaded, ready to work (=^.^=)"
