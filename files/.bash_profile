if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$ "
fi
