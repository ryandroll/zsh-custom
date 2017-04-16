## Modifed by oh-my-zsh/plugins/vi-mode for working with powerlevel9k

# Updates editor information when the keymap changes.
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
      printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
      printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-keymap-select() {
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line


bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# allow 'jj' to escape
bindkey -M viins 'jj' vi-cmd-mode
