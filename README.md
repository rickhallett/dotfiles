dot files
=========

[![pipeline status](https://gitlab.com/matthewfranglen/dotfiles/badges/master/pipeline.svg)](https://gitlab.com/matthewfranglen/dotfiles/commits/master)

This is my current set of dotfiles. It has been rewritten to be based heavily on https://github.com/holman/dotfiles


Installation
------------

    git clone https://gitlab.com/matthewfranglen/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    script/bootstrap
    script/install

This requires pip3 and neovim to be installed:

    sudo apt-get install python3-pip
    PIP_REQUIRE_VIRTUALENV= pip3 install neovim --user

Per Host Customization
----------------------

You can add host conditional changes with the `~/.localrc` file which will be sourced at the end.
You can add host specific plugins to `~/.local-plugins`.

Testing
-------

Yeah, it's that bad.

    docker build --tag dotfiles --no-cache .
    docker run --volume $PWD:/root/.dotfiles --rm -ti dotfiles

If successful, this will launch a zsh shell inside the docker container.
You can use this to check that all required commands are available.
