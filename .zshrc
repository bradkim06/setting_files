#Path to your oh-my-zsh installation.
ZSH_THEME="agnoster"

# source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:/usr/bin$PATH
export EDITOR=/usr/local/bin/nvim
export ZSH="/home/bradkim06/.oh-my-zsh"
# export PATH="/usr/local/anaconda3/bin:$PATH"
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"
# export PYTHONSTARTUP="$(python -m jedi repl)"
# export ZSH="/Users/bradkim06/.oh-my-zsh"

alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias cat="bat"
alias ll="tree -C -L 1 --dirsfirst"

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
# export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C -L 2 --dirsfirst {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always --line-range :500 {} || tree -C -L 1 --sort=name --dirsfirst {} ) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview '(tree -d -C -L 2 --sort=name --dirsfirst {} ) | head -200'"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf
    fasd
)

prompt_context() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
    fi

  # Custom (Random emoji)
  emojis=("⚡️" "🔥" "🇰" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🚦" "🌙")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment black default "김준수 ${emojis[$RAND_EMOJI_N]} "
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


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


# function fzfd()
# {
#     cd $(fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf\
#         --header 'Search In Directory'\
#         --border\
#         --height 80%\
#         --header 'Search Directory'\
#         --preview-window=right:50%
#         --preview 'lsd --color=always --tree --depth=2  {} | head -200 2>/dev/null'\)
# }

# function fzff()
# {
#     vi $(fzf\
#         --header 'Find File With Preview'\
#         --border\
#         --height 80%\
#         --preview-window=right:50%\
#         --preview "bat --theme='OneHalfDark' --color=always --style=numbers --line-range :500 --color=always {}")
# }
