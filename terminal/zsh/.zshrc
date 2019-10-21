export DOTFILES_PATH=$HOME/dev/setup
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt autopushd

# Start zim
source ${ZIM_HOME}/init.zsh

# Removing the waiting dots from completion (...). Original: ~/.zim/modules/input/init.zsh
expand-or-complete-with-redisplay() {
  zle expand-or-complete
  zle redisplay
}

# Fuzzy Autocompletion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 3 numeric
zstyle ':completion:*' matcher-list 'm:{a-z}={  A-Z}' # match upper from lower case

source $DOTFILES_PATH/terminal/init.sh

fpath=(/${ZDOTDIR:-${DOTFILES_PATH}}/terminal/zsh/themes $fpath)

autoload -Uz promptinit && promptinit
prompt rafa

# iTerm tab name
precmd() {
  echo -ne "\e]1;$(short_pwd)\a"
}

source $DOTFILES_PATH/terminal/zsh/key-bindings.zsh
source $DOTFILES_PATH/terminal/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES_PATH/terminal/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load fnm a relacement of nvm
eval "`fnm env --multi`"

# Load autojump
source /usr/local/share/autojump/autojump.zsh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

