alias c='clear'
alias refresh='source ~/.bashrc'
alias restartnet="sudo nohup sh -c 'invoke-rc.d networking stop; date; echo sleeping; sleep 2; echo waking; date; invoke-rc.d networking start'"
alias push=pushover

alias lss='ls -lAh'

alias v='nvim'

alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant ssh'
alias vr='vagrant resume'
alias vsp='vagrant suspend'

alias tma='tmux a -t '
alias tmk='tmux kill-session -t '
alias tmls='tmux ls'

alias gfr="git fetch && git rebase"
alias grb='git branch --merged master | grep -v "\* master" | xargs -n 0 git branch -d'
alias gti='git'
alias gset='git push --set-upstream origin `git symbolic-ref --short -q HEAD`'
alias gpush='git push'
alias groom='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias bx='bundle exec'
alias fs='foreman start'

alias wk='cd {{ workspace_dir }}'
alias play='cd {{ workspace_dir }}/play'
