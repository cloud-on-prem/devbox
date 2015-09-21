SCM_THEME_PROMPT_PREFIX="${cyan}(${blue}"
SCM_THEME_PROMPT_SUFFIX="${cyan})"
SCM_THEME_PROMPT_DIRTY="${red}"
SCM_THEME_PROMPT_CLEAN="${green}●"
LOGO="{{ logo }}"
LOGO_PREFIX="${orange}${LOGO}${reset_color} "

prompt() {
  PS1="${LOGO_PREFIX}$(scm_prompt_info)${reset_color} ${cyan}\W${reset_color} ${green}→${reset_color} "
}

PROMPT_COMMAND=prompt
