# Updating to the latest release

To update yabai to the latest version, simply upgrade it with the yabai installer script or Homebrew
(depending on the original installation method) and reconfigure the scripting addition again:

Upgrade yabai with homebrew (remove old service file because homebrew changes binary path)

```bash
yabai --uninstall-service

brew upgrade yabai
```

Start yabai

```bash
yabai --start-service
```

---

# Updating to latest HEAD

To upgrade yabai to the latest version from HEAD, simply reinstall it with Homebrew, codesign it, and reconfigure the scripting addition again:

- set codesigning certificate name here (default: yabai-cert)

```bash
export YABAI_CERT=
```

- stop yabai

```bash
yabai --stop-service
```

- reinstall yabai (remove old service file because homebrew changes binary path)

```bash
yabai --uninstall-service
brew reinstall koekeishiya/formulae/yabai
codesign -fs "${YABAI_CERT:-yabai-cert}" "$(brew --prefix yabai)/bin/yabai"
```

- finally, start yabai

```bash
yabai --start-service
```

# Configure scripting addition

Yabai uses the macOS Mach APIs to inject code into Dock.app; this requires elevated (root) privileges.
You can configure your user to execute yabai --load-sa as the root user without having to enter a password.
To do this, we add a new configuration entry that is loaded by /etc/sudoers.

- Create a new file for writing - visudo uses the vim editor by default.

```bash
sudo visudo -f /private/etc/sudoers.d/yabai
```

- Input the line below into the file you are editing.

  - Replace <yabai> with the path to the yabai binary (output of: `which yabai`).
  - Replace <user> with your username (output of: `whoami`).
  - Replace <hash> with the sha256 hash of the yabai binary (output of: `shasum -a 256 $(which yabai)`).

- This hash must be updated manually after upgrading yabai.

```bash
<user> ALL=(root) NOPASSWD: sha256:<hash> <yabai> --load-sa
```

- If you know what you are doing, the following one-liner can be used to update the sudoers file correctly:

```bash
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
```

- for this to work you must configure sudo such that
  it will be able to run the command without password

```bash
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

sudo yabai --load-sa
```

---

# Debug output and error reporting

In the case that something is not working as you're expecting, please make sure to take a look in the output
and error log. To enable debug output make sure that your configuration file contains yabai -m config debug_output on or that yabai is launched with the --verbose flag. If you are running yabai as a service, the output and error log can be viewed as follows:

- view the last lines of the error log

```bash
tail -f /tmp/yabai\_$USER.err.log
```

- view the last lines of the debug log

```bash
tail -f /tmp/yabai\_$USER.out.log
```

---

View on github [github.com/koekeishiya/yabai](https://github.com/koekeishiya/yabai)
