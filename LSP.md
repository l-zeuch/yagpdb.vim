# yag-template-lsp for Neovim

> [!NOTE]
> Initially I wrote this guide for one user on the YAGPDB support server, but I figured others might find it useful as well.
> The idea is to go into some detail why we need to do certain things. If you're already familiar with Neovim, please feel
> free to ignore those :-)

An implementation of the Language Server Protocol for YAGPDB custom commands can be found at
<https://github.com/jo3-l/yag-template-lsp>.

Installing `yag-template-lsp` for Neovim is a little more involved than for VSCode, as you'll have to install the binary
yourself and also install some syntax definition for YAGPDB's custom command language.

## Prerequisites

Obviously, you need to have Neovim installed, as usual the latest stable release is recommended.

If you wish to compile `yag-template-lsp` from source, you'll need to have Git and the Rust toolchain installed as well.

Because `yag-template-lsp` itself does not provide a syntax definition that is understood by Neovim, you'll also need a
plugin that adds that functionality, if you want syntax highlighting. We'll use `l-zeuch/yagpdb.vim` for that.

## Installing the Server

You can either download a precompiled `yag-template-lsp` binary from the releases, or compile it from source. Either way
you'll need to place it in your `$PATH`, so that Neovim's LSP client can find it.

To install from source, clone the repository, change into `crates/yag-template-lsp` and build the binary.

```shellsession
$ git clone github.com/jo3-l/yag-template-lsp
$ cd yag-template-lsp/crates/yag-template-lsp
$ cargo install
--path .
```

This will place the binary in your cargo bin directory, which should be in your `$PATH` already.

## Configuring Neovim

### Filetype Detection

To get basic filetype detection working, we need to tell Neovim which file extensions correspond to the filetype we defined
in the LSP config. Without any plugins, we can just do this by adding an autocommand to our `init.lua`:

```lua
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
    pattern = {"*.yag", "*.yagcc"},
    command = "set filetype=yagpdbcc",
})
```

### Optional: Syntax Highlighting

If you wish to have syntax highlighting for YAGPDB command files as well, you can install
<https://github.com/l-zeuch/yagpdb.vim> using your favorite plugin manager. Because `yagpdb.vim` provides its own filetype
detection as well, you can omit the suggested autocommand above if you install the plugin.

Alternatively, if you prefer no highlighting, read on. (but keep the autocommand for filetype detection!)

### LSP Client Configuration

In your `init.lua`, let the LSP client know about the binary, the associated filetype and some basic configuration. If you
prefer using a plugin like `nvim-lspconfig`, you can adapt the configuration accordingly, in this example we'll just use the
built-in LSP client configuration functions.

For Windows, be aware that the binary will be named `yag-template-lsp-x86_64-pc-windows-msvc.exe` or similar, depending on
your toolchain, so you'll need to use that name for `cmd` instead.

```lua
-- baseline lsp configuration. make sure the cmd string matches the filename of the LSP binary!
vim.lsp.config('YAGPDB CC', {
    cmd = { 'yag-template-lsp' },
    filetypes = { 'yagpdbcc' },
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        vim.lsp.completion.enable(true, client.id, bufnr, {})
    end,
})
vim.lsp.enable('YAGPDB CC')
```

Because `yag-template-lsp` provides inlay hints for functions with three or more parameters, we'll enable `severity.HINT`
diagnostics for virtual text display as well. It is a good idea to let the client update in insert mode, but if you're
struggling with performance, you can disable that.

```lua
-- enumerate all severities for virtual text display. we want the inlay type hints too!
severities = {
    vim.diagnostic.severity.ERROR,
    vim.diagnostic.severity.WARN,
    vim.diagnostic.severity.INFO,
    vim.diagnostic.severity.HINT,
}

-- enable diagnostics for inlay hints and stuff
vim.diagnostic.config({
    virtual_text = {
        source = true,
        severity = severities,
    },
    update_in_insert = true, })
```

## Testing the Configuration

To verify that everything is working correctly, open a `.yag` or `.yagcc` file in Neovim, preferably one that already
contains some code. You should see syntax highlighting (if you installed the plugin) and inlay hints for functions with three
or more parameters, as well as diagnostics for any issues in the code.

We provided a sample of YAGPDB command code below that you can use to test your setup.

```
{{ sendMessage nil "hi" }}
{{ $x := parseArgs 1 "pain" (carg "int" "how much pain?") }}
{{}}
{{ $y := }}
```

You should see inlay hints for the `parseArgs` function parameters and diagnostics for the incomplete command at the end,
errors for the empty `{{}}` and the incomplete assignment to `$y`.

