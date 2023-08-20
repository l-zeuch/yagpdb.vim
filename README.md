# YAGPDB Custom Commands Vim plugin

Syntax highlighting for [YAGPDB](https://yagpdb.xyz) custom commands in (N)Vim.

[![CI](https://github.com/l-zeuch/yagpdb.vim/actions/workflows/ci.yml/badge.svg)](https://github.com/l-zeuch/yagpdb.vim/actions/workflows/ci.yml)

## Installing

### Manually

To install without any external plugin-manager dependencies, simply download the `Makefile` and run `make install`. For a
different destination, invoke `make` with `DESTDIR=/path/to/destination`.

```shell
wget https://raw.githubusercontent.com/l-zeuch/yagpdb.vim/master/Makefile && make install
```

> **Note**
> If you wish to install this for your Vim, but also have Neovim installed, make sure to invoke the `install-vim` target
> instead.

See also as Greg Hurrell's excellent Youtube video: [Vim screencast #75: Plugin managers](https://www.youtube.com/watch?v=X2_R3uxDN6g).

### With a Plugin Manager

> **Note**
> Installing with a plugin manager is recommended for Windows installations.

Use your favorite plugin manager to install this plugin. [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen),
[VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim), [junegunn/vim-plug](https://github.com/junegunn/vim-plug),
and [Shougo/dein.vim](https://github.com/Shougo/dein.vim) are some of the more popular ones.
A lengthy discussion of these and other managers can be found on
[vi.stackexchange.com](https://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-plugin-managers).
Basic instructions are provided below, but please **be sure to read, understand, and follow all the safety rules that
come with your ~~power tools~~ plugin manager.**

<details>
<summary>Pathogen</summary>
Pathogen is more of a runtime path manager than a plugin manager. You must clone the plugins' repositories yourself to
a specific location, and Pathogen makes sure they are available in Vim.

1. In the terminal,

    ```bash
    git clone https://github.com/l-zeuch/yagpdb.vim.git ~/.vim/bundle/yagpdb.vim
    ```

1. In your `vimrc`,

    ```vim
    call pathogen#infect()
    syntax on
    filetype plugin indent on
    ```

</details>

<details>
  <summary>Vundle</summary>

1. Install Vundle, according to its instructions.
1. Add the following text to your `vimrc`.

    ```vim
    call vundle#begin()
      Plugin 'l-zeuch/yagpdb.vim'
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
      Plug 'l-zeuch/yagpdb.vim'
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
      call dein#add('l-zeuch/yagpdb.vim')
    call dein#end()
    ```

1. Restart Vim, and run the `:call dein#install()` statement to install your plugins.

</details>

## Configuration

### Clipboard

If you prefer to insert text on a middle click with your mouse instead of <kbd>Ctrl + V</kbd>, change the register
used as follows:

```vim
let g:yagpdbcc_use_primary = 1
```

### Code Completion (Neovim >0.5 ONLY)

We provide bundled sources for code-completion to be used with [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
Follow the installation instructions there and enable the source as follows:

```lua
sources = cmp.config.sources({
    ...
    { name = 'yagpdb-cc' },
    ...
})
```
### Supported File Extensions

We support the following list of file extensions:

- `*.yag`
- `*.yagcc`
- `*.tmpl` <sup>1)</sup>
- `*.go.tmpl` <sup>1)</sup>

<sup>1)</sup> These extensions are not detected by default, as they are already used by Go. Please see below for instructions on how to
enable them.

### Overriding Filetypes

Sometimes, you may wish to use a file extension already in use by another language, such as `*.gotmpl`. Enable also
detecting those extension as follows, if needed:

```vim
let g:yagpdbcc_override_ft = 1
```

### Snippet Engines

We provide snippets for two distinct engines: [UltiSnips](https://github.com/SirVer/ultisnips),
and [Neosnippet](https://github.com/Shougo/neosnippet.vim).

Select which one to use by setting the `g:yagpdbcc_snippet_engine` variable to either `ultisnips`, or `neosnippet`,
like so:

```vim
let g:yagpdbcc_snippet_engine = "ultisnips"
```

## Contributing

If you spot an error, or want to contribute new features, feel free open a pull request!
Please refer to [CONTRIBUTING](.github/CONTRIBUTING.md) for our guidelines on how to contribute.

### Other Contributions

Some of the regex in this plugin was developed by [@DZ-TM](https://github.com/DZ-TM).
If you like it, feel free to give him cookies as a reward.

## Legal Mumbo Jumbo

### Disclaimer

1) The YAGPDB developers, staff, and/or suport are not responsible for any difficulties caused by this plugin.

2) This plugin is provided as-is, without the intention to cause offense of any kind.

3) YAGPDB is a service provided by [botlabs](https://botlabs.gg) and is in no way associated with this plugin.

4) The developers of this plugin have been granted permission to use the brand name YAGPDB in this plugin.
Please view the [permission](doc/permission.txt) file for details.

### License

This project is licensed under the terms of the GNU General Public License, version 2.0 (SPDX-Identifier GPL-2.0).
Please refer to the [LICENSE](LICENSE.md) file for more details.
