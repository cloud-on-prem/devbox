SCM_THEME_PROMPT_DIRTY_SYMBOL=""
SCM_THEME_PROMPT_CLEAN_SYMBOL=""

SCM_THEME_PROMPT_PREFIX="${green}"
SCM_THEME_PROMPT_SUFFIX=""
SCM_THEME_PROMPT_DIRTY=" ${red}${SCM_THEME_PROMPT_DIRTY_SYMBOL} "
SCM_THEME_PROMPT_CLEAN=" ${white}${SCM_THEME_PROMPT_CLEAN_SYMBOL} "
LOGO="{{ logo }}"
LOGO_PREFIX="${orange}${LOGO}${reset_color} "
LAST_ARROW="→"
CURRENT_SCM_INFO_FILE="/usr/local/current_scm_info"

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
  (update_current_scm_info &) &> /dev/null
  PS1="${LOGO_PREFIX}${reset_color} ${cyan}\W${reset_color} ${LAST_ARROW} "
}

function update_current_scm_info {
  info=$(scm_prompt_info)

  {% if guest_machine %}
  echo "/usr/local/bin/gecho -e '$info' > ${CURRENT_SCM_INFO_FILE}" | hostrun
  {% else %}
  gecho -e $info > ${CURRENT_SCM_INFO_FILE}
  {% endif %}
}

PROMPT_COMMAND=prompt
