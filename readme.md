Create symbolic links for zsh config files

```sh
ln -sf "${DOTFILES}/shell/zlogin" "${HOME}/.zlogin"
ln -sf "${DOTFILES}/shell/zlogout" "${HOME}/.zlogout"
ln -sf "${DOTFILES}/shell/zprofile" "${HOME}/.zprofile"
ln -sf "${DOTFILES}/shell/zshenv" "${HOME}/.zshenv"
ln -sf "${DOTFILES}/shell/zshrc" "${HOME}/.zshrc"
```

Create symbolic links for dotfiles/config files

```sh
ln -sf "${DOTFILES}/config/git/gitconfig" "${HOME}/.gitconfig"
ln -sf "${DOTFILES}/config/git/gitignore" "${HOME}/.gitignore"
ln -sf "${DOTFILES}/config/vim/vimrc" "${HOME}/.vimrc"

ln -sf "${DOTFILES}/config/alacritty/alacritty.toml" "${HOME}/.config/alacritty/alacritty.toml"
ln -sf "${DOTFILES}/config/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
ln -sf "${DOTFILES}/config/ranger/rc.conf" "${HOME}/.config/ranger/rc.conf"
ln -sf "${DOTFILES}/config/skhd/skhdrc" "${HOME}/.config/skhd/skhdrc"
ln -sf "${DOTFILES}/config/wezterm/wezterm.lua" "${HOME}/.config/wezterm/wezterm.lua"
ln -sf "${DOTFILES}/config/yabai/yabairc" "${HOME}/.config/yabai/yabairc"
```

Create a .gitsecret file and add a signing key

```sh
echo '[user]\n  signingkey = ' > .gitsecret
```

Create a .hushlogin file to prevent the MOTD from being displayed

```sh
echo '' > .hushlogin
```
