# Test File Directory

This directory contains all test files for this project.

## Running Tests

Tests are automatically run via CI/CD setup on GitHub actions, and can always be invoked via `make test` from the root of
this repository.

To target specifically Vim or Neovim, the `test-vim` and `test-nvim` target is called instead.

You'll need Vim and/or Neovim installed. The Makefile will automatically detect whether they're installed, and run the tests
in the respective environment.

## Adding New Tests

This project uses a framework to test its Vim Script: [vader.vim](https://github.com/junegunn/vader.vim). Before adding new
tests, it's definitely recommended to read its documentation.

When adding new tests, only one specific feature should be tested within one test file. This is to avoid hard-to-read,
hard-to-debug test files as well pipeline output. It furthermore makes it simpler to expand already existing tests.

Afterwards, make sure all tests are still passing via the targets described above.

### Sourcing Plugin Files

You'll need to source the Vim Script files in order to test them. However, there are a few things to keep in mind:

The CWD is set to the directory from which the `Vader` command is invoked. When you use the given Makefile (as you should),
this is set to `test/`, respective to the root of the repository. This means that relative paths only ever have one level of
nesting, at most.

This means that the following directive for a theoretical file in `test/syntax/` **will not work**:

```vim
Before:
  source ../../syntax/yagpdbcc.vim
```

Instead, you must do it this way:

```vim
Before:
  source: ../syntax/yagpdbcc.vim
```

With that in mind, you can infer how to invoke specific Vader files, however it's always recommended to run the full suite.

## Structure

* `vimrc` is the clean, neutral, and minimal environment provided to both Neovim and Vim. Please only *add* to it if it's
  necessary to test a certain feature (such as indentation).
* `autoload/` contains all tests relating to autoloaded functions. This one is a small exception to "one file per feature";
  it's quite nonsensical to have one file specific to only one function, thus it's one file per autoload group (e.g. `config`)
* `feature/` contains tests relating to features that aren't very complex and can be done in one single file.
* `syntax/` contains all files relating to the syntax matching of this plugin. Each individual file tests one specific aspect
  of the various syntax groups.

If your new feature is quite complex, feel free to create a new folder in order to test every aspect of it.
