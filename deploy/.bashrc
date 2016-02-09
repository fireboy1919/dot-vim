export HISTCONTROL=ignoredups:erasedups:ignorespace
shopt -s histappend
set -o vi
export EDITOR=vim
alias lsc="ls -lC"
alias ber='bundle exec rake'
alias be='bundle exec'
export HISTSIZE=1000000                   # big big history
export HISTFILESIZE=1000000               # big big history
PS1='\[\e[0;35m\]\u\[\e[m\]:\[\e[0;36m\]\w\[\e[m\]\[\e[0;33m\]>\[\e[m\]\[\e[0;0m\]'
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}"

# tmux-resurrect-ng prompt_runner for auto save/restore
if [[ -n "$TMUX" ]]; then
  source "$HOME/.tmux/plugins/tmux-resurrect-ng/scripts/prompt_runner.sh"
  export PROMPT_COMMAND="tmxr_runner${PROMPT_COMMAND:+; }${PROMPT_COMMAND}"
fi
