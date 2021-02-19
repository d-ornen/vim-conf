# dependencies:

simple plugins configuration for convenient university learning. python/js/c++ lintering/fixing. 
Few dependencies required:
* vim-plug preinstalled. Command to install for neovim:
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
* `sudo pacman -S eslint npm nodejs`
* `sudo pip install jedi flake8  autoimport isort jedi-language-server`
* `npm init`

* for c++ error highlight you will need g++ as dependency, but it's obvious

## install:
* `git clone https://github.com/d-ornen/vim-conf ~/.config/nvim/`
* `nvim`
* `:PlugInstall`
* `:CocInstall coc-python`
* relaunch vim, so plugins can start normally

## custom-keys
* C-r - replacement command
* F2 - run syntax fixer (strip blank spaces, etc)
* C-f toggle NerdTree
* C-z - remapped emmet leader key
* C-k show previous ale warning
* C-j show nex ale warning
