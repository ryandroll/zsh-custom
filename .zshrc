### reference:
## https://github.com/pecigonzalo/dotFiles/blob/master/.zshrc
## https://github.com/jimmidyson/dotfiles/blob/master/.zshrc
## http://qiita.com/scalper/items/ed83c24f568cbf7f132b

### test for zsh loading time
# for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done

#################### Start of zplug setup ####################
### Check if zplug is installed and install all plugins first time
## The best way to install and don't delay loading to much
## Reinstall zplug by deleted ~/.zplug folder
[[ -d ~/.zplug ]] || {
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
    . ~/.zshrc && zplug install && zplug clear
}

## Load zplug
source ~/.zplug/init.zsh

## Add oh-my-zsh lib, should be load first
#zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", defer:0 # using total
zplug "lib/compfix", from:oh-my-zsh, defer:0
zplug "lib/clipboard", from:oh-my-zsh, defer:0
zplug "lib/directories", from:oh-my-zsh, defer:0
zplug "lib/grep", from:oh-my-zsh, defer:0
zplug "lib/key-bindings", from:oh-my-zsh, defer:0
zplug "lib/misc", from:oh-my-zsh, defer:0
zplug "lib/termsupport", from:oh-my-zsh, defer:0

## Add plugins: Aliases, completions
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/sublime", from:oh-my-zsh
#zplug "plugins/tmux", from:oh-my-zsh

## Add plugins: OS specific
zplug "plugins/osx", from:oh-my-zsh #, if:"which brew"
#zplug "plugins/archlinux", from:oh-my-zsh #, if:"which pacman"
#zplug "plugins/systemd", from:oh-my-zsh #, if:"which systemctl"
#zplug "plugins/ubuntu",   from:oh-my-zsh #, if:"which apt"

## Add plugins: System extension
zplug "zplug/zplug"
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # Should be loaded 2nd last and after compinit
zplug "zsh-users/zsh-history-substring-search", defer:3 # Should be loaded last
#zplug "supercrabtree/k"
#zplug "plugins/gnu-utils", from:oh-my-zsh
#zplug "b4b4r07/enhancd", use:init.sh
#zplug "mafredri/zsh-async", on:sindresorhus/pure
#zplug "sindresorhus/pure"
#zplug "zsh-users/zaw"

## Add theme, load first before tweaking
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, defer:0

# Customize settings
zplug "ryandroll/zsh-custom", use:history.zsh
zplug "ryandroll/zsh-custom", use:powerlevel9k-custom.zsh
zplug "ryandroll/zsh-custom", use:vi-mode.plugin.zsh, defer:1

### Install packages that have not been installed yet
## Don't routine check for faster loading
## Uncomment the next line next time if install any uninstalled plugins
#zplug check || zplug install

## Source plugins
zplug load

#################### End of zplug setup ####################
## Add commands to $PATH
