SCM_THEME_PROMPT_DIRTY_SYMBOL=""
SCM_THEME_PROMPT_CLEAN_SYMBOL=""

SCM_THEME_PROMPT_PREFIX="${cyan}(${blue}"
SCM_THEME_PROMPT_SUFFIX="${cyan})"
SCM_THEME_PROMPT_DIRTY=" ${red}${SCM_THEME_PROMPT_DIRTY_SYMBOL} "
SCM_THEME_PROMPT_CLEAN=" ${green}${SCM_THEME_PROMPT_CLEAN_SYMBOL} "
LOGO="{{ logo }}"
LOGO_PREFIX="${orange}${LOGO}${reset_color} "
LAST_ARROW="→"

exit_status() {
  local EXIT="$?"
  if [ $EXIT != 0 ]; then
    LAST_ARROW="${red}→${reset_color}"
  else
    LAST_ARROW="${green}→${reset_color}"
  fi
}

prompt() {
  exit_status

  if ! { [ -n "$TMUX" ]; } then
    PS1="${LOGO_PREFIX}$(scm_prompt_info)${reset_color} ${cyan}\W${reset_color} ${LAST_ARROW} "
  else
    (update_tmux &) &> /dev/null
    PS1="${LOGO_PREFIX}${reset_color} ${cyan}\W${reset_color} ${LAST_ARROW} "
  fi
}

update_tmux(){
  # TMUX has a special prompt
  SCM_THEME_PROMPT_PREFIX=""
  SCM_THEME_PROMPT_SUFFIX=""
  SCM_THEME_PROMPT_DIRTY=" ${SCM_THEME_PROMPT_DIRTY_SYMBOL} "
  SCM_THEME_PROMPT_CLEAN=" ${SCM_THEME_PROMPT_CLEAN_SYMBOL} "
  tmux set-option -gq "@scm_info" "$(scm_prompt_info)"
  tmux refresh-client -S
}

PROMPT_COMMAND=prompt
