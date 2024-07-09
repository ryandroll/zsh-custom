### References:
# https://github.com/seagle0128/dotfiles/blob/master/.zshrc

### Setup shell commands
# Zoxide as z
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
    
    # _ZO_FZF_OPTS: Options for customizing fzf's behavior in zoxide
    export _ZO_FZF_OPTS="--scheme=path --tiebreak=end,chunk,index --bind=ctrl-z:ignore,btab:up,tab:down --cycle --keep-right --border=sharp --height=50% --min-height 10 --info=inline --layout=reverse --tabstop=1 --exit-0 --select-1 --preview '(eza --tree --icons --level 3 --color=always --group-directories-first {2} || tree -NC {2} || ls --color=always --group-directories-first {2}) 2>/dev/null | head -200'"
fi

# FZF: fuzzy finderls
if (( $+commands[fzf] )); then
    if [[ $OSTYPE == darwin* ]]; then
        FZF="/usr/local/opt/fzf/shell/"
    elif (( $+commands[apt-get] )); then
        FZF="/usr/share/doc/fzf/examples/"
    else
        FZF="/usr/share/fzf/"
    fi

    if [[ -f "$FZF/completion.zsh" ]]; then
        source "$FZF/completion.zsh"
    fi

    if [[ -f "$FZF/key-bindings.zsh" ]]; then
        source "$FZF/key-bindings.zsh"
    fi

    # FZF_DEFAULT_COMMAND: Default command to generate the list for fzf to filter
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git || git ls-tree -r --name-only HEAD || rg --files --hidden --follow --glob '!.git' || find ."
    
    # FZF_CTRL_T_COMMAND: Command to be used by fzf when invoked with Ctrl+T
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    
    # FZF_DEFAULT_OPTS: General options to customize fzf's behavior
    export FZF_DEFAULT_OPTS='--height 50% --min-height 10 --reverse'
    
    # FZF_CTRL_T_OPTS: Options for fzf when invoked with Ctrl+T
    export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || cat {} || tree -NC {}) 2>/dev/null | head -200'"
    
    # FZF_CTRL_R_OPTS: Options for fzf when invoked with Ctrl+R (reverse search)
    export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --exact"
    
    # FZF_ALT_C_OPTS: Options for fzf when invoked with Alt+C (cd into the selected directory)
    export FZF_ALT_C_OPTS="--preview '(eza --tree --icons --level 3 --color=always --group-directories-first {} || tree -NC {} || ls --color=always --group-directories-first {}) 2>/dev/null | head -200'"
fi

# Micromamba 
if (( $+commands[micromamba] )); then
    # Set environment variables for micromamba
    export MAMBA_EXE='/usr/bin/micromamba'
    export MAMBA_ROOT_PREFIX='/opt/micromamba'

    # Setup micromamba shell integration
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias micromamba="$MAMBA_EXE"  # Fallback to alias if setup fails
    fi
    unset __mamba_setup
fi

### End of Unix commands settings
