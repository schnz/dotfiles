# Dotfiles

This repository contains my highly opiniated and personalized dot files. They are managed with [chezmoi](https://www.chezmoi.io/).

## Quickstart

The TLDR of everything below.

```shell
# Don't miss out on the sections below about the
# recommended system configuration and packages
chezmoi init https://github.com/schnz/dotfiles.git
chezmoi apply
# chezmoi-helper-* scripts require a new shell session with an updated the $PATH
chezmoi-helper-dconf apply
chezmoi-helper-code install-extensions
```

## Initial Checkout

To initialize chezmoi on a new system (not yet applying any changes), run the following command. This essentially clones the repository to `~/.local/share/chezmoi` and creates the `~/.config/chezmoi/chezmoi.toml` file. The config file is created from [this template](.chezmoi.toml.tmpl) which may require to answer a few interactive prompts during initialization. After initialization, the prompted values can be changed in the configuration file.

```shell
chezmoi init https://github.com/schnz/dotfiles.git
```

## Apply

To apply the dotfiles to the current system use any of the following commands and adapt them if necessary:

```shell
# Display a summary of files that are out-of-sync. The --init flag
# re-generates the config file from the template prior to the operation. This
# ensures (1) that the config file stays in sync with the latest upstream version
# and (2) that dynamic contents in the [data] section does not become stale.
chezmoi status --init

# Apply all dotfiles unconditionally. Prompt on conflicts.
chezmoi apply --init

# Apply only some dotfiles and ignore any potential conflicts. For instance,
# to udpate the node version manager run
chezmoi apply --init --force .local/share/nvm

# Perform a dry-run to see what changes would be made. Note that the --dry-run
# flag avoids that managed dot files are changed but it does not prevent state
# changes through side-effects. For instance, --init does persist changes to the
# config and chezmoi scripts (run_*) are executed! The --verbose flag causes
# chezmoi to print commands and show file changes as diffs.
chzemoi apply --init --dry-run --verbose

# Alternatively, simply use the diff command
chezmoi diff --init
```

## System Configuration

This repository manages user-specific configuration files that reside in the home directory. System-wide configuration typically reside in `/etc` and is not actively managed. The following configuration is highly recommended but not required.

- User login shell is `/bin/zsh` (set via `chsh -s /bin/zsh`)

**Note:** Bash-related skeleton files will be removed by chezmoi from the home directory when the zsh binary is detected.

## System Packages

In general, no implicit assumptions about system-wide installed packages are made. Instead, some of the config files in this repository are conditionally ignored and some are generated via [Go templates](https://pkg.go.dev/text/template). The usage of templates allows to conditionally apply config values when certain dependencies are met (e.g. when a certain font is installed). However, this approach implies that the user experience may suffer when missing certain packages. For minimal installations, consider to install at least the following Arch Linux packages.

**Note:** To support a wide variety of Linux distributions, package detection is based on simple file checks which may or may not be accurate for all Linux distributions. File checks were performed with a Arch Linux distribution in mind but should mostly work for other distributions as well. The `~/.config/chezmoi/chezmoi.toml` config file contains a list of detected packages.

### Highly Recommended Packages

- `grml-zsh-config`
- `zsh`
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`

### Encouraged Packages

- `alacritty`
- `noto-fonts`
- `papirus-icon-theme`
- `ttf-liberation-mono-nerd`
- `ttf-liberation`
- `xcursor-vanilla-dmz`

### Optional Packages

- `spotifyd`
- `tmux`
- `zsh-completions`

## Helper Scripts

Most applications can be configured solely through text-based configuration files. For those that can't, a set of scripts help to ease the management of these exceptions. The scripts are installed to `~/.local/bin` and are named `chezmoi-helper-<name>`.

### Synchronize GSettings

Most settings in GNOME are managed via [GSettings](https://docs.gtk.org/gio/class.Settings.html). The [`dconf`](https://help.gnome.org/admin/system-admin-guide/stable/dconf.html.en) utility can be used to directly manipulate the backend which is used to store user-specific setting overrides in a key-value store. `dconf` databases are persisted as binary files and hence cannot be managed by `chezmoi` directly. The script used in the following commands abstracts over `dconf` and helps to manage and sync GSetting overrides across systems.

```shell
# Apply custom overrides to a temporary db and diff it against the user db
chezmoi-helper-dconf diff

# Apply (all) overrides to the default user db
chezmoi-helper-dconf apply

# Alternatively, the overrides can be adapted manually, then diffed, and eventually be applied.
chezmoi-helper-dconf dump > keyfile.dump
chezmoi-helper-dconf diff keyfile.dump
chezmoi-helper-dconf apply keyfile.dump
```

### Visual Studio Code Extensions

Extensions in Visual Studio Code cannot be managed declaratively. They are usually installed explicitly through the UI but it is also possible to install and upgrade them programatically via the command line. The helper script used below abstracts over the Visual Studio Code CLI and helps to maintain a common subset of extensions across all systems.

**Note:** The config files managed by chezmoi unconditionally include the configuration for a variety of extensions independent on whether they are installed or not. If an extension is missing, the configuration is simply ignored by Visual Studio Code.

```shell
# Compare installed extensions against an opiniated set of hand-picked extensions.
chezmoi-helper-code list-missing-extensions

# Installs missing extensions.
chezmoi-helper-code install-missing-extensions
```
