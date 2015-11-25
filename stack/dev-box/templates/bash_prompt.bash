SCM_THEME_PROMPT_PREFIX="${cyan}(${blue}"
SCM_THEME_PROMPT_SUFFIX="${cyan})"
SCM_THEME_PROMPT_DIRTY="${red}"
SCM_THEME_PROMPT_CLEAN="${green}●"
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
  PS1="${LOGO_PREFIX}$(scm_prompt_info)${reset_color} ${cyan}\W${reset_color} ${LAST_ARROW} "
}

PROMPT_COMMAND=prompt
