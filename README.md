# dependencies:

simple plugins configuration for convenient university learning. python/js/c++ lintering/fixing. 
Few dependencies required:
* vim-plug preinstalled. Command to install for neovim: `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
* `sudo pip install flake8` (for python lint)
* `sudo pacman -S npm` (this and next 2 lines are for js lint)
* `npm init`
* `sudo pacman -S eslint`
* for c++ error highlight `cc` linter is used, but it was preinstalled for my system

## install:
* `git clone https://github.com/d-ornen/vim-conf ~/.config/nvim/`
* `nvim`
* `:PlugInstall`
* relauch vim, so plugins can start normally

## custom-keys
