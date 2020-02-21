dotvim
======
This project is a Vim configuration Python dedicated.

Installation:

    git clone https://github.com/jlejeune/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Install python lib
    pip3 install --user black

Install packages:

    apt install vim git pep8 exuberant-ctags
    apt install python-flake8 flake8 python3-flake8 
    apt install pylint pylint3 
    apt install python-jedi python3-jedi
    apt install python-yapf python3-yapf yapf yapf3
    apt install python-autopep8


Install Vim plugins:

    vim +BundleClean +BundleInstall! +qa
