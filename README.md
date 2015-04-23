# dotfiles
managed with [gnu stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

Cloning reates `~/dotfiles/`. Use stow to create some symlinks:

    cd dotfiles/
    stow bin/
    stow herbstluftwm/


etc...

# vim
Install [pathogen](https://github.com/tpope/vim-pathogen):

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Install [nerdtree](https://github.com/scrooloose/nerdtree):

    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/nerdtree.git

   
# bin
For extra laziness:

`easygit "updates..."`
