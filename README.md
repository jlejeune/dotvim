dotvim
======
This project is a Vim configuration Python dedicated.

Installation:

    git clone https://github.com/jlejeune/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc


Install packages:

    sudo aptitude install vim git pep8 exuberant-ctags python-pip
    sudo pip install flake8


Install Vim plugins:

    vim +BundleClean +BundleInstall! +qa
