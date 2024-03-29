export ZSH=$HOME/.oh-my-zsh



alias nvim-latex="NVIM_APPNAME=latexVim nvim"
# alias nvim-kick="NVIM_APPNAME=kickstart nvim"
# alias nvim-chad="NVIM_APPNAME=NvChad nvim"
# alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "lvim" "latexVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
 DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         zsh-autosuggestions
         zsh-syntax-highlighting
     )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# wal -R
alias vimrc="vim /home/naruto/my_shit/dotfiles/vim/.vimrc"
alias python="ipython"
alias ls="lsd"
# alias a="cd $(find ~/my_shit -type d | fzf -e --tac --reverse --info=inline --border=sharp --color=border:yellow)"
alias v="bash vim"
alias neofetch="fastfetch"
alias asd="~/.local/bin/tmux-sessionizer"
alias sdf="~/.local/bin/tmux-windowizer"
alias vim="lvim"
alias ll="tree -L 1 ."
alias nvimrc="cd /home/naruto/my_shit/dotfiles/nvim; nvim nvimrc;cd"
alias cdd="cd /home/data2"
# alias thura="xdg-open"
alias t="tmux"
alias dietmux="tmux kill-server"
alias h="htop"
alias cheat="/home/naruto/./cht.sh"zsh
alias pss="paru -Ss"
alias pi="paru -Si"
alias killnaruto="pkill -9 -u naruto"
alias wydnaruto="pgrep -lu naruto"
alias pb="~/.config/polybar/colorblocks/launch.sh"
alias glb="git log --graph --oneline --decorate --all"
alias cnf="cd /home/naruto/my_shit/dotfiles;lvim;"
export EDITOR=lvim;
bindkey '   ' autosuggest-accept
bindkey '^ ' autosuggest-accept
alias :q="exit"
alias lvim="/home/naruto/.local/bin/lvim"
alias Va="exit"
alias gamemodeready="killall picom; killall polybar; killall dunst; killall python3; killall bash; killall sleep;systemctl --user start gamemoded; xrandr --output eDP-1 --off;killall kitty; exec steam"
alias sql="systemctl start docker; docker start suspicious_pike; docker exec -it suspicious_pike bash"
alias javarun="/home/naruto/.sdkman/candidates/java/17.0.2-tem/bin/java -javaagent:/usr/share/idea/lib/idea_rt.jar=40875:/usr/share/idea/bin -Dfile.encoding=UTF-8 -classpath"
alias k="xset r rate 175 65; setxkbmap -layout custom" 
alias tor="cd /home/naruto/snap/tor-browser_en-US; ./start-tor-browser.desktop"
alias i2p="/home/naruto/i2p/i2prouter start"
alias ttyfont="cd /usr/share/kbd/consolefonts;setfont LatGrkCyr-12x22.psfu.gz;cd"
eval "$(starship init zsh)"
thura() {
    xdg-open "$1" &
}
so() {
  surfraw -browser=firefox youtube "$1" &
}
bash /home/naruto/my_shit/dotfiles/script.sh



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# /home/naruto/./art.sh
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
