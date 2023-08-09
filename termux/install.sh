#!bash
#
# This sets up termux from nothing
# You need git and zsh to start this:
#
# pkg install git zsh
# git clone https://gitlab.com/matthewfranglen/dotfiles
# ln -s dotfiles .dotfiles
#
# If there are problems then the subreddit seems like a good place:
# https://old.reddit.com/r/termux

pkg update --yes
pkg install --yes \
    binutils-is-llvm \
    clang \
    curl \
    fftw \
    freetype \
    git \
    jq \
    libandroid-execinfo \
    libcrypt \
    libffi \
    libpng \
    libzmq \
    llvm \
    make \
    pkg-config \
    python \
    rsync \
    rust \
    wget \
    which \
    zsh

chsh -s zsh

wget https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh
pkg install scipy numpy

# this requires rust to compile maturin, can fail with a timeout
pip install jupyter
