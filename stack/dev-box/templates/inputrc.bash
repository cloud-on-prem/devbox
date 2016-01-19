# Use Vi, not Emacs, style editing
set editing-mode vi

# Show all completions as soon as I press tab, even if there's more than one
set show-all-if-ambiguous on
# Ignore case
set completion-ignore-case on
# on menu-complete, first display the common prefix, then cycle through the
# options when hitting TAB
menu-complete-display-prefix on

###########################################################
# Keymaps for when we're in command mode (e.g., after hitting ESC)
set keymap vi-command

# Insert the arguments from the last command
"p": "i !!*\r"

###########################################################
# Keymaps for when we're in insert (i.e., typing stuff in) mode
set keymap vi-insert

# jj to escape
"jj": "\e"

# Pressing tab will list all completions & select the first one. Pressing it
# again will cycle through available completions.
TAB: menu-complete
# Shift-TAB cycles completions backward
"\e[Z": menu-complete-backward

# Needed because binding 'p' in command mode above wipes its insert mode
# function, too. This fixes that, and will insert 'p' when you type 'p'.
"p": self-insert<Paste>
