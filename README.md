dotvim
======
This project is a Vim configuration Python dedicated.

Installation:

    git clone https://github.com/jlejeune/dotvim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    # This symlink may be necessary to fix unknown Flake8() function
    ln -s ~/.vim/bundle/vim-flake8/ftplugin ~/.vim/bundle/vim-flake8/plugin


Install packages:

    sudo aptitude install vim git pep8 exuberant-ctags python-pip
    sudo pip install flake8


Install Vim plugins:

    vim +BundleClean +BundleInstall! +qa

