# Powerlevel10k instant prompt (must stay at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=~/.pyenv/shims:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/homebrew/bin:/opt/homebrew/bin


# Added for pip
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"

# add python alias to call python3
alias python=python3eval "$(pyenv init -)"
eval "$(pyenv init -)"

alias term1nal='ssh term1nal'

. "$HOME/.local/bin/env"


# Obsidian vault aliases
alias obsidian-open="~/bin/obsidian-open-home.sh"
alias obsidian-close="~/bin/obsidian-close-home.sh"
alias claude-memory-open="~/bin/obsidian-open-home.sh"
alias claude-memory-close="~/bin/claude-close-home.sh"
export PATH="$HOME/bin:$PATH"

# GitHub CLI accounts
# gh  -> professional account (davidmuleropino)
# gh2 -> personal account (damupi)
export GH_CONFIG_DIR="$HOME/.config/gh-david"
alias gh2='GH_CONFIG_DIR="$HOME/.config/gh-damupi" /opt/homebrew/bin/gh'

# bun completions
[ -s "/Users/damupi/.bun/_bun" ] && source "/Users/damupi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# clawmem
export CLAWMEM_EMBED_URL=http://localhost:11434
export CLAWMEM_EMBED_MODEL=nomic-embed-text
export CLAWMEM_NO_LOCAL_MODELS=true

# Cloudflare secrets (kept out of dotfiles, see ~/.config/cloudflare)
[[ -f ~/.config/cloudflare ]] && source ~/.config/cloudflare


# Load OPENROUTER_API_KEY from the .env file of the extension (project-level env)
if [ -f "$(pwd)/.env" ]; then
  export $(cat .env | xargs)
fi
# Also check pi-freerouter directory explicitly
if [ -f "$HOME/.pi/agent/npm/node_modules/pi-freerouter/.env" ]; then
  export $(cat "$HOME/.pi/agent/npm/node_modules/pi-freerouter/.env" | xargs)
fi

# Also check pi-open-nvidia directory explicitly
if [ -f "$HOME/.pi/agent/extensions/pi-open-nvidia/.env" ]; then
  export $(cat "$HOME/.pi/agent/extensions/pi-open-nvidia/.env" | xargs)
fi

# Powerlevel10k (standalone, no full oh-my-zsh framework)
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# zsh-syntax-highlighting (installed with brew)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
