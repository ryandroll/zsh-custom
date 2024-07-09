# OS bundles
if [[ $OSTYPE == darwin* ]]; then
    if (( $+commands[brew] )); then
        alias bu='brew update; brew upgrade; brew cleanup'
        alias bcu='brew cu --all --yes --cleanup'
        alias bua='bu; bcu'
    fi
elif [[ $OSTYPE == linux* ]]; then
    if (( $+commands[apt-get] )); then
        alias agua='aguu -y && agar -y && aga -y'
        alias kclean+='sudo aptitude remove -P "?and(~i~nlinux-(ima|hea),\
                            ?not(?or(~n`uname -r | cut -d'\''-'\'' -f-2`,\
                            ~nlinux-generic,\
                            ~n(linux-(virtual|headers-virtual|headers-generic|image-virtual|image-generic|image-`dpkg --print-architecture`)))))"'
    fi
fi

# Upgrade
alias upgrade_zinit='zinit self-update && zinit update -a -p && zinit compinit'

# Mamba and Micromamba
if (( $+commands[micromamba] )); then
    alias mamba=micromamba
    alias conda=micromamba
fi
(( $+commands[mamba] )) && alias conda=mamba
