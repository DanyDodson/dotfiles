
```sh
setopt EXTENDED_GLOB
for rcfile in "${DOTFILES:-$HOME}"/.dotfiles/shell/^README.md(.N); do
  ln -s "$rcfile" "${DOTFILES:-$HOME}/.${rcfile:t}"
done
```

```sh
cp ~/.dotfiles/gitsecret ~/.gitsecret
```

# create symbolic links for dotfiles/config files

