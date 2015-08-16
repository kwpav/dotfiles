# dotfiles
Now using [gnu stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

Create `~/dotfiles/`. Use stow to create some symlinks:

    cd dotfiles/
    stow bin/
    stow herbstluftwm/

etc...

# bin
`vimserver` is a quick and dirty script that creates a vimserver on the first run, and then if `vimserver` is called again, a new tab will open with the file. It is probably full of errors. 

For extra laziness:

`easygit "updates..."`


# vim
Used plugins...

First:

[pathogen](https://github.com/tpope/vim-pathogen):

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Then:
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [pydiction](https://github.com/rkulla/pydiction)

