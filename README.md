# dotfiles

Personal Ghostty + Zsh (Powerlevel10k) setup, so it can be dropped onto a new machine quickly.

## Credits

The Ghostty configuration is adapted from [zazencodes/dotfiles](https://github.com/zazencodes/dotfiles) (`year/2026` branch). Big thanks to [zazencodes](https://github.com/zazencodes) for the original setup.

## Contents

- `ghostty/config` — Ghostty terminal config (theme, font, keybindings, cursor shaders)
- `ghostty/themes/dracula-plus-custom` — custom Ghostty color theme
- `ghostty/shaders/` — cursor shaders referenced by the config
- `zsh/.zshrc` — shell config (Powerlevel10k, syntax highlighting, aliases)
- `zsh/.p10k.zsh` — Powerlevel10k prompt configuration
- `claude/keybindings.json` — Claude Code keybindings (bonus, see below)

## Setup on a new machine

1. Install [Ghostty](https://ghostty.org), [oh-my-zsh](https://ohmyz.sh), and [Powerlevel10k](https://github.com/romkatv/powerlevel10k):
   ```sh
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
   ```

2. Symlink the configs:
   ```sh
   mkdir -p ~/.config/ghostty
   ln -sf "$(pwd)/ghostty/config" ~/.config/ghostty/config
   ln -sf "$(pwd)/ghostty/themes" ~/.config/ghostty/themes
   ln -sf "$(pwd)/ghostty/shaders" ~/.config/ghostty/shaders
   ln -sf "$(pwd)/zsh/.zshrc" ~/.zshrc
   ln -sf "$(pwd)/zsh/.p10k.zsh" ~/.p10k.zsh
   ```

3. Create machine-local secrets (never tracked in this repo):
   ```sh
   cat > ~/.config/cloudflare <<'EOF'
   export CLOUDFLARE_API_KEY="..."
   export CLOUDFLARE_ACCOUNT_ID="..."
   export CLOUDFLARE_GATEWAY_ID="default"
   EOF
   chmod 600 ~/.config/cloudflare
   ```
   `.zshrc` sources this file automatically if it exists — this keeps secrets out of git entirely.

4. Restart your shell and Ghostty.

## Bonus: Claude Code — Shift+Enter for newline

By default Claude Code's chat input doesn't insert a newline on `Shift+Enter`. This repo includes `claude/keybindings.json`, which binds `Shift+Enter` to `chat:newline`. To use it:

```sh
mkdir -p ~/.claude
ln -sf "$(pwd)/claude/keybindings.json" ~/.claude/keybindings.json
```

## Notes

- `.zshrc` also references a few machine-specific scripts/paths (`~/bin/obsidian-open-home.sh`, pyenv, bun, etc.) — adjust or remove lines that don't apply to the new machine.
- Font used: `DejaVuSansM Nerd Font Mono` — install a Nerd Font before using this config.
