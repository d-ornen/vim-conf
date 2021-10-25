# dependencies:

simple plugins configuration for convenient university learning. python/js/c++ lintering/fixing. 
Few dependencies required:
* vim-plug preinstalled. Command to install for neovim:
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
* Those most probably available via your default distro package manager. `nodejs g++ radare2 rizin gdb clangd`
* pip-specific `pip install pudb`.

## install:
* `git clone https://github.com/d-ornen/vim-conf ~/.config/nvim/`
* `nvim`
* `:PlugInstall`
* relaunch editor, so plugins can start normally.

## custom-keys
* It depends on filetype you opened, so better read the conf file to get familiar with all the keys, but the main are.

 [normal mode]
* <[S]hift-[r]un> - Compile & run current file (if it is .cpp|.py|.rs file).
* <[S]hift-[c]ompile> - Compile current file (if it is .cpp|.rs file).
* <[S]hift-[d]ebug> - Open current file in gdb session (if it is .cpp|.rs file, if .py, open pudb).
* <[S]hift-[s]tatic analysis> - Open radare2 for current file(if it is .cpp|.rs file).
* <[S]hift-[l]ive analysis> - Open rizin in debug mode for current file (if it is .cpp|.rs file).
* <[C]trl-[f]iles> toggle NerdTree.
* <[A]lt-[> Go one tab left.
* <[A]lt-]> Go one tab right.
* [Leader key] is , in my init.nvim, feel free to set to one you prefer, just change mapleader variable value.
* [Leader key]rc - Reload config (some code completion breaks when this option being called, so it is just safer for your sanity to reload nvim as usual)
* [Leader key]ec - edit config.
* [Leader key]n - quick open file in new tab

 [Insert mode]
* <Tab\> - expand snippet, see honza/vim-snippets repo for detail info, multiple languages support.
* <Mod+space> - Trigger autocompletion for the item under cursor.
## Important notes
* Syntax higlighting depends per tab, same as shortcuts, so it is okay to open 2 tabs or split panes with python + cpp script, and launch apropriate shortcut for each file without any relaunches.
## I am always happy to improve my config, so feel free to send pull requests & issues.
