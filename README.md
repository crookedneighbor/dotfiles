dotfiles
========

my dotfiles (heavilly influenced by [Braintree](https://www.braintreepayments.com/)'s dotfiles)

@TODO: Write instructions for setting up dotfiles on new computer

## Tasks to do Before Cloning this Repo

* Open System Preferences and turn off natural scrolling
* Install [1Password](https://1password.com/downloads/mac/)
* Install [Google Chrome](https://www.google.com/chrome/)
* Install [Discord](https://discord.com/)
* Install [ShiftIt](https://github.com/fikovnik/ShiftIt/releases)
* [Generate a new SSH Key for Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Setting Up Dotfiles

* Clone down this repo: `git clone git@github.com:crookedneighbor/dotfiles.git`
* Run `make` to install any other software needed and set up the dotfiles

## Vim

Install [vim-plug](https://github.com/junegunn/vim-plug#installation)

```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Load vim and run `:PlugInstall`
