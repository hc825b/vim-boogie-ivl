vim-boogie-ivl
==============

**vim-boogie-ivl** is a [Vim](<http://www.vim.org>) plugin for the
[Boogie Intermediate Verification Language (Boogie IVL)](https://github.com/boogie-org/boogie).
The syntax is largely based on [this Boogie syntax file for Vim](https://github.com/boogie-org/boogie/blob/master/Util/vim/syntax/boogie.vim).

Features
--------

-   `.bpl` file detection.
-   Syntax highlighting.


Installation
------------

You can use your favorite
[pathogen](<https://github.com/tpope/vim-pathogen>)-compatible plugin manager to
install *vim-boogie-ivl*.

If you're using [vim-plug](<https://github.com/junegunn/vim-plug>), for example,
follow the following steps:

1.  Edit your .vimrc and add a `Plug` declaration for **vim-boogie-ivl**.

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ vim
    call plug#begin()
    " ...
    Plug 'hc825b/vim-boogie-ivl', {'for': 'boogie'}
    " ...
    call plug#end()
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2.  Restart Vim

3.  `:PlugInstall` to install the plugin.


License
-------

**vim-boogie-ivl** is distributed under MIT license, the same license that Boogie uses.
See [LICENSE](LICENSE) for more details.
