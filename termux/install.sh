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
    libiconv \
    libpng \
    libxml2 \
    libxslt \
    libzmq \
    llvm \
    make \
    pkg-config \
    python \
    rsync \
    rust \
    vim \
    wget \
    which \
    zsh

chsh -s zsh

# need pandas, scipy, matplotlib to do stuff in jupyter
wget https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh
# pkg install --yes \
#     python-scipy \
#     python-numpy \
#     matplotlib
pkg install python-numpy

# this requires rust to compile maturin, can fail with a timeout
export MATHLIB="m"
export LDFLAGS="-lpython3.11"
pip install pandas numpy scipy matplotlib
pip install jupyter

termux-setup-storage
