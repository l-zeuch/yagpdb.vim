# YAGPDB Custom Commands Vim plugin

Syntax highlighting for [YAGPDB](https://yagpdb.xyz) custom commands in (N)Vim.

## Installing

Use your favorite plugin manager to install this plugin. [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen), [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim), [junegunn/vim-plug](https://github.com/junegunn/vim-plug), and [Shougo/dein.vim](https://github.com/Shougo/dein.vim) are some of the more popular ones. A lengthy discussion of these and other managers can be found on [vi.stackexchange.com](https://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-plugin-managers). Basic instructions are provided below, but please **be sure to read, understand, and follow all the safety rules that come with your ~~power tools~~ plugin manager.**

If you have no favorite, or want to manage your plugins without 3rd-party dependencies, consider using Vim 8+ packages, as described in Greg Hurrell's excellent Youtube video: [Vim screencast #75: Plugin managers](https://www.youtube.com/watch?v=X2_R3uxDN6g).

<details>
<summary>Pathogen</summary>
Pathogen is more of a runtime path manager than a plugin manager. You must clone the plugins' repositories yourself to a specific location, and Pathogen makes sure they are available in Vim.


1. In the terminal,
    ```bash
    git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
    ```
1. In your `vimrc`,
    ```vim
    call pathogen#infect()
    syntax on
    filetype plugin indent on
    ```
1. Restart Vim, and run `:helptags ~/.vim/bundle/nerdtree/doc/` or `:Helptags`.
</details>

<details>
  <summary>Vundle</summary>

1. Install Vundle, according to its instructions.
1. Add the following text to your `vimrc`.
    ```vim
    call vundle#begin()
      Plugin 'preservim/nerdtree'
    call vundle#end()
    ```
1. Restart Vim, and run the `:PluginInstall` statement to install your plugins.
</details>

<details>
  <summary>Vim-Plug</summary>

1. Install Vim-Plug, according to its instructions.
1. Add the following text to your `vimrc`.
```vim
call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()
```
1. Restart Vim, and run the `:PlugInstall` statement to install your plugins.
</details>

<details>
  <summary>Dein</summary>

1. Install Dein, according to its instructions.
1. Add the following text to your `vimrc`.
    ```vim
    call dein#begin()
      call dein#add('preservim/nerdtree')
    call dein#end()
    ```
1. Restart Vim, and run the `:call dein#install()` statement to install your plugins.
</details>

<details>
<summary>Vim 8+ packages</summary>

If you are using Vim version 8 or higher you can use its built-in package management; see `:help packages` for more information. Just run these commands in your terminal:

```bash
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```
</details>

## Other Contributions

Some of the regex in this plugin was developed by [@DZ-TM](https://github.com/DZ-TM). If you like it, feel free to give him cookies as a reward.

## License

This project is licensed under the terms of the GPL-2.0.
