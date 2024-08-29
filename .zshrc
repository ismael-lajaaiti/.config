# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode auto

plugins=(
	dirhistory
	web-search
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias als="aerospace list-apps"
alias bigmem="ssh ilajaaiti@162.38.181.175"
alias cdh="cd ~"
alias cg="nvim ~/.gitconfig"
alias coz="nvim ~/.oh-my-zsh"
alias cv="cd ~/.config/nvim; nvim"
alias cz="nvim ~/.zshrc"
alias firefox="open -a /Applications/Firefox.app"
alias g="git"
alias jd="julia --project=docs/ docs/make.jl"
alias jp="julia --project=."
alias npd="npm run dev"
alias nv="nvim"
alias otp="open /tmp/plot.png"
alias q="exit"
alias ra="radian"
alias sd="cd \$(find * . -type d 2>/dev/null | fzf)"
alias sdh="cd ~ && cd \$(find * . -type d 2>/dev/null | fzf)"
alias skclust="ssh ismael@162.38.67.7"
alias sz="source ~/.zshrc"
alias ta="tmux a -t" # Attach tmux session.
alias tls="tmux list-session" # List tmux sessions.
alias tn="tmux new -s" # Create new tmux session.
alias wlg="watch -n 1 --color 'git lg --color'"
alias llt="ll --tree"

# Merge tool.
gerge() {
    if [[ -z $2 ]]; then
        revisions=blrm
    else
        revisions=$2
    fi
    git checkout --ours $1
    git mergetool $1
}
compdef _git gerge=git-checkout


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export DBUS_SESSION_BUS_ADDRESS='unix:path='$DBUS_LAUNCHD_SESSION_BUS_SOCKET

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls="eza --icons=always"
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_COMPLETION_TRIGGER='!!'
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --walker-skip .git,node_modules,target"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

tmuxkillf () {
    local sessions
    sessions="$(tmux ls|fzf --exit-0 --multi)"  || return $?
    local i
    for i in "${(f@)sessions}"
    do
        [[ $i =~ '([^:]*):.*' ]] && {
            echo "Killing $match[1]"
            tmux kill-session -t "$match[1]"
        }
    done
}
