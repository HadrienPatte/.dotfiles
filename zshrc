# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
export PATH="${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:${PATH}"

if [[ "$OSTYPE" =~ "darwin" ]]; then

  case $(uname -p) in
    "arm")
      export HOMEBREW_DIR="/opt/homebrew"
    ;;

    "i386")
      export HOMEBREW_DIR="/usr/local"
    ;;
  esac

  if [ -x "$(command -v ${HOMEBREW_DIR}/bin/brew)" ]; then
    export FPATH="${HOMEBREW_DIR}/share/zsh/site-functions:${FPATH}"

    export PATH="${HOMEBREW_DIR}/bin:${PATH}"
    export PATH="${HOMEBREW_DIR}/sbin:${PATH}"

    # Force certain more-secure behaviors from homebrew
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha

  fi
fi

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
DISABLE_UPDATE_PROMPT="true"

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
HIST_STAMPS="yyyy-mm-dd"

HISTSIZE=10000000
SAVEHIST=$HISTSIZE

setopt inc_append_history
setopt share_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-auto-fetch
  colored-man-pages
  command-not-found
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if (( $+commands[lvim] )); then
  export VISUAL=lvim
  export EDITOR=$VISUAL
fi

if (( $+commands[aws] )); then
  plugins+=(aws)
fi

if (( $+commands[az] )); then
  plugins+=(azure)
fi

if (( $+commands[gcloud] )); then
  plugins+=(gcloud)
fi

if (( $+commands[direnv] )); then
  plugins+=(direnv)
fi

if (( $+commands[fzf] )); then
  plugins+=(fzf)
fi

if (( $+commands[zoxide] )); then
  ZOXIDE_CMD_OVERRIDE=j
  plugins+=(zoxide)
fi

if [[ "$OSTYPE" =~ "darwin" ]]; then
  # make sure to install the following packages:
  # brew install coreutils findutils gnu-sed gnu-tar make grep
  plugins+=(gnu-utils)
fi

source "${ZSH}/oh-my-zsh.sh"

if (( $+commands[tfenv] || $+commands[terraform] )); then
  complete -o nospace -C ${HOMEBREW_DIR}/bin/terraform terraform
fi

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

export GOPATH="${HOME}/go"

# Add binaries that are go install-ed to PATH
export PATH="${GOPATH}/bin:${PATH}"


# The following ensure a separate kube config per active shell
# TMPDIR is not always defined on Linux
TMPDIR="${TMPDIR:-/tmp}"

# Contexts stored in ~/.kube/config serve as a template
if [ ! -e ~/.kube/config ]; then
    mkdir ~/.kube
    touch ~/.kube/config
fi

# Don't touch existing config in case we're re-sourcing
if [ -z "${KUBECONFIG}" ]; then
    export KUBECONFIG="$(mktemp ${TMPDIR}/.kube.XXXXXXXXX)"
    cat ~/.kube/config >>${KUBECONFIG}
fi

kubeconfig-zshexit-hook() {
    if [[ "${KUBECONFIG}" != $HOME/.kube/kind-config-kind && ! "${KUBECONFIG}" =~ "${HOME}/protected/.*" ]]; then
        rm -f ${KUBECONFIG}
    fi
}
zshexit_functions+=(kubeconfig-zshexit-hook)

alias kl-unset='truncate -s 0 ${KUBECONFIG} && cat ~/.kube/config >> ${KUBECONFIG}'

kubectl() {
  local has_yaml=0 has_json=0 has_sort_by=0 is_get=0
  local args=("$@")
  local i next

  for i in "${args[@]}"; do
    case "$i" in
      get) is_get=1 ;;
      --sort-by|--sort-by=*) has_sort_by=1 ;;
      -oyaml|--output=yaml) has_yaml=1 ;;
      -ojson|--output=json) has_json=1 ;;
    esac
  done

  if [[ $has_yaml -eq 0 && $has_json -eq 0 ]]; then
    for ((i=0; i < ${#args[@]}; i++)); do
      if [[ "${args[$i]}" == "-o" || "${args[$i]}" == "--output" ]]; then
        next=$((i + 1))
        case "${args[$next]}" in
          yaml) has_yaml=1 ;;
          json) has_json=1 ;;
        esac
      fi
    done
  fi

  if [[ $is_get -eq 1 && $has_sort_by -eq 0 ]]; then
    args+=(--sort-by=.metadata.creationTimestamp)
  fi

  if [[ $has_yaml -eq 1 ]] && [[ -t 1 ]]; then
    command kubectl "${args[@]}" | bat --language=yaml --style=plain
  elif [[ $has_json -eq 1 ]] && [[ -t 1 ]]; then
    command kubectl "${args[@]}" | jq
  else
    command kubectl "${args[@]}"
  fi
}

