#!bash
#
# This sets up termux from nothing
# You need git and zsh to start this:
#
# pkg install git zsh
# git clone https://gitlab.com/matthewfranglen/dotfiles
# ln -s dotfiles .dotfiles

pkg update --yes
pkg install --yes \
    clang \
    curl \
    fftw \
    freetype \
    git \
    jq \
    libcrypt \
    libpng \
    libzmq \
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
LDFLAGS="-lm -lcompiler_rt" pip install jupyter
