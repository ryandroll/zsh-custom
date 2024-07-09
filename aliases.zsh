# Upgrade
alias upgrade_zinit='zinit self-update && zinit update -a -p && zinit compinit'

# Mamba and Micromamba
if (( $+commands[micromamba] )); then
    alias mamba=micromamba
    alias conda=micromamba
fi
(( $+commands[mamba] )) && alias conda=mamba
