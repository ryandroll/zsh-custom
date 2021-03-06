### tweak powerlevel9k theme

## Prompt Variable
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
## VCS Variable
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
## Other Variable
POWERLEVEL9K_TIME_FORMAT="%D{%F %T}"
POWERLEVEL9K_STATUS_VERBOSE=false

## Customizing Prompt Segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status anaconda vi_mode)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{black} %h %f%k%F{white}%f "

## Reference
## https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config
## The best
## Semartin's Configuration:
## POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{black} \UE12E `date +%T` %f%k%F{white}%f "