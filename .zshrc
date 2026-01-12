# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH

# Path to your Oh My Zsh installation.
#export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="agnoster" # (this is one of the fancy ones)
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster

export EDITOR="vim"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
#plugins=(git)

#source $ZSH/oh-my-zsh.sh
source $HOME/.alias

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=ko_KR.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ezaurum/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ezaurum/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ezaurum/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ezaurum/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(ssh-agent -s)"

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/ezaurum/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# npm path
export PATH=~/.npm-global/bin:$PATH

# mise
eval "$(mise activate zsh)"

# 1. 히스토리 파일에 시간 정보를 함께 저장 (이게 없으면 시간 기록이 안 됨)

# 1. 히스토리 저장 위치 설정 (이게 없으면 저장이 안 됨)
export HISTFILE=~/.zsh_history

# 2. 저장할 명령어 개수 (넉넉하게 1만 줄 이상 추천)
export HISTSIZE=10000
export SAVEHIST=10000

# 3. 필수 옵션들
setopt APPEND_HISTORY      # 덮어쓰지 않고 파일 끝에 추가함 (필수)
setopt SHARE_HISTORY       # 여러 터미널 탭 간에 히스토리 실시간 공유
setopt INC_APPEND_HISTORY  # 명령어를 칠 때마다 즉시 저장 (비정상 종료 시에도 기록 보존)
setopt EXTENDED_HISTORY # Add timestamp

# --- History 설정 끝 ---
alias history='fc -ld'

# =======================================================
# [Zsh Key Bindings & Vi Mode 통합 설정]
# =======================================================

# 1. Vi 모드 활성화 및 딜레이 제거
bindkey -v
export KEYTIMEOUT=1

# 2. Arch Linux 플러그인 & FZF 로드 (설치 경로 확인 필수)
# (경로가 없으면 에러가 날 수 있으니 설치 여부 확인 필요)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# =======================================================
# [키 매핑] - Vi 입력 모드(viins)에서도 작동하도록 설정
# =======================================================

# --- A. 삭제 키 (Backspace & Delete) ---
# 백스페이스: 커서 앞 글자 삭제
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
# Delete 키: 커서 뒤 글자 삭제 (대문자 변환 문제 해결)
bindkey -M viins '^[[3~' delete-char
bindkey -M vicmd '^[[3~' delete-char

# --- B. 커서 이동 (Ctrl + 화살표, Home, End) ---
# Ctrl + 오른쪽 화살표: 단어 단위 앞으로
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# Ctrl + 왼쪽 화살표: 단어 단위 뒤로
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

# Home / End 키 (줄의 시작과 끝으로)
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line
bindkey -M vicmd '^[[H' beginning-of-line
bindkey -M vicmd '^[[F' end-of-line

# --- C. 히스토리 검색 (화살표 위/아래) ---
# 명령어 일부 입력 후 위/아래 키 누르면 해당 명령어로 시작하는 기록 검색
# (zsh-history-substring-search 플러그인 필요)
bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# --- D. FZF 검색 (Ctrl + R, Ctrl + T) ---
# FZF 스크립트가 로드되면 보통 자동 설정되지만, 확실하게 하기 위해 명시
bindkey -M viins '^R' fzf-history-widget
bindkey -M viins '^T' fzf-file-widget

# --- E. 고급 기능 (Edit Command Line) ---
# Normal 모드에서 'v' 누르면 현재 명령어를 Vim 에디터에서 편집
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# fzf 기본 옵션 설정 (레이아웃 + 미리보기 창)
export FZF_DEFAULT_OPTS="
--layout=reverse
--border
--height=40%
--preview 'cat {}'
--preview-window='right:60%:wrap'
"

# starship 설정
eval "$(starship init zsh)"

# User configuration
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
