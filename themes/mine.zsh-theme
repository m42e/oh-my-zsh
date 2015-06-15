ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Set the colors to your liking
local vi_normal_marker="[%{$fg[green]%}%BN%b%{$reset_color%}]"
local vi_insert_marker="[%{$fg[cyan]%}%BI%b%{$reset_color%}]"
local vi_unknown_marker="[%{$fg[red]%}%BU%b%{$reset_color%}]"
local vi_mode="$vi_insert_marker"
vi_mode_indicator () {
   case ${KEYMAP} in
      (vicmd)      echo $vi_normal_marker ;;
   (main|viins) echo $vi_insert_marker ;;
   (*)          echo $vi_unknown_marker ;;
   esac
}
# Reset mode-marker and prompt whenever the keymap changes
function zle-line-init zle-keymap-select {
   vi_mode="$(vi_mode_indicator)"
   zle reset-prompt
}


PROMPT='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%})
%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info)
%_$ '

RPROMPT='${vi_mode}%{$fg[green]%}[%*]%{$reset_color%}'
