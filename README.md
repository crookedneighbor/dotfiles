dotfiles
========

my dotfiles (heavilly influenced by [Braintree](https://www.braintreepayments.com/)'s dotfiles)

## Tasks to do Before Cloning this Repo

* Open System Preferences and turn off natural scrolling
* Install [1Password](https://1password.com/downloads/mac/)
* [Generate a new SSH Key for Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* Install [homebrew](https://brew.sh) `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* When done, run: `eval "$(/opt/homebrew/bin/brew shellenv)"`

## Setting Up Dotfiles

* Clone down this repo: `git clone git@github.com:crookedneighbor/dotfiles.git`
* Enter the dotfiles directory and Run `make` to install any other software needed and set up the dotfiles
  * CLI Installs:
    * [git](https://github.com/git/git) - It's git!
    * [nvm](https://github.com/nvm-sh/nvm) - Node environment manager
    * [rbenv](https://github.com/rbenv/rbenv) - Ruby environment manager
    * [tig](https://github.com/jonas/tig) - Text-mode interface for Git
    * [tmux](https://github.com/tmux/tmux) - A terminal multiplexer
    * Various Zsh plugins
  * App Installs:
    * [Google Chrome](https://www.google.com/chrome/)
    * [Discord](https://discord.com/)
    * [Docker](https://docker.com/)
    * [ShiftIt](https://github.com/fikovnik/ShiftIt/releases)
    * [Skitch](https://skitch.com/)
    * [Spotify](https://spotify.com/)
    * [Steam](https://store.steampowered.com)
    * [iTerm 2](https://iterm2.com/)
* Open iTerm and run `vim` to complete the vim setup. You'll see an error about the color scheme `onedark` being missing, but don't worry, it's in the process of being installed.

## Additional Tasks when running on a work computer

* create a `~/.gitconfig_local` file with the name/email for your workplace so that default commits from your work computer use your work email instead of your personal email:

```
[user]
  name = Blade Barringer
  email = blade@your-workplace.com
```
