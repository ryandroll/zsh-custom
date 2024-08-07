# Ensure HISTFILE is set
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

# Set history size and save size
HISTSIZE=100000
SAVEHIST=100000

# Define a function to filter the history file
function filter_history() {
  local histfile="$HOME/.zsh_history"
  local temp_hist=$(mktemp)
  local valid_hist=$(mktemp)

  # Copy the current history to a temporary file
  cp $histfile $temp_hist

  # Filter valid commands and aliases
  while IFS= read -r line; do
    local command=$(echo $line | sed 's/^[^;]*;//')
    if builtin command -v ${command%% *} > /dev/null 2>&1; then
      echo "$line" >> $valid_hist
    fi
  done < $temp_hist

  # Replace the original history file with the filtered valid history
  mv $valid_hist $histfile

  # Remove the temporary files
  rm $temp_hist
}

# Filter history on Zsh startup
filter_history

# Append history to the history file instead of overwriting it
setopt append_history

# Share history between all running Zsh sessions
setopt share_history

# Ignore commands that start with a space in the history
setopt hist_ignore_space

# Remove all but the last duplicate entry from the history list
setopt hist_ignore_all_dups

# Do not save duplicate entries in the history file
setopt hist_save_no_dups

# Do not enter duplicate entries in the history list
setopt hist_ignore_dups

# Do not display duplicates when searching for a history entry
setopt hist_find_no_dups

# Record the timestamp of each command in the history file
setopt extended_history

# Delete duplicate entries first when the history file size exceeds HISTSIZE
setopt hist_expire_dups_first

# Show the command with history expansion to the user before running it
setopt hist_verify

# Add commands to the history file in the order they are executed
setopt inc_append_history

# Reduce unnecessary blanks when storing commands in the history
setopt hist_reduce_blanks

# When completing, move the cursor to the end of the word
setopt always_to_end

# Hash everything before attempting completion
setopt hash_list_all

# Allow completion for aliases
# setopt completealiases

# Allow completion from within a word/phrase
setopt complete_in_word

# Disable spelling correction for commands
setopt nocorrect

# Complete as much as possible until it gets ambiguous
setopt list_ambiguous

# Do not list file types when completing
setopt nolisttypes

# List completions in a compact format
setopt listpacked

# Automatically display the completion menu
# setopt automenu

# Use emacs keybindings (use 'setopt vi' for vi keybindings)
# setopt emacs  # vi

# Recognize comments even in interactive shells
setopt interactivecomments
