# base on : amuse, robbyrussell
# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

PROMPT='${ret_status}%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)%{$fg_bold[red]%}%{$reset_color%}'

# Must use Powerline font, for \uE0A0 to render.
# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}✗ "
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
# ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
  fi
fi

