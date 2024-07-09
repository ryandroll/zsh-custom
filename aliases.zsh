# conda and miniconda
if (( $+commands[micromamba] )); then
    alias mamba=micromamba
    alias conda=micromamba
fi
(( $+commands[mamba] )) && alias conda=mamba
