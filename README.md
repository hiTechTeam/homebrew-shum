# Shum Homebrew Tap

English · [Русский](README.ru.md)

Homebrew formula and binary releases for [Shum CLI](https://github.com/hiTechTeam/Shum-CLI).

## Install and update

**0.1.7 preview, macOS 15+, Apple Silicon and Intel.**

```sh
brew install hitechteam/shum/shum
shum
```

The first launch creates a profile. Update with:

```sh
brew update
brew upgrade shum
```

The formula checks SHA-256 and installs Shum.app. The service uses the stable `opt/shum` path. The next CLI command replaces an outdated service and preserves the profile and outgoing queue.

[Release files](https://github.com/hiTechTeam/homebrew-shum/releases/tag/v0.1.7) include a universal archive, checksums, installer and signature metadata. The app is self-signed, not Developer ID or notarized; the pkg container is unsigned. Intel was tested through Rosetta only. Gatekeeper on a clean account and Bluetooth permission persistence across certificate-signed releases remain unverified.

## Without Homebrew

Use the same command to install or update:

```sh
curl -fsSL https://raw.githubusercontent.com/hiTechTeam/Shum-CLI/main/install.sh | sh
```

Installs under `~/.local/share/shum` and `~/.local/bin`, checks checksum and signature, and prints a PATH hint if needed. Shell files stay unchanged. Installation alongside Homebrew is refused.

## Uninstall

```sh
shum daemon --uninstall
brew uninstall shum
```

For the script installation:

```sh
curl -fsSL https://raw.githubusercontent.com/hiTechTeam/Shum-CLI/main/install.sh | sh -s -- --uninstall
```

Services and LaunchAgents are removed. Profiles, keys and messages stay in `~/Library/Application Support/org.Shum.Shum` or your `--data-dir`; profile keys may also be in Keychain. To erase profiles, keys and history, run `shum daemon --uninstall --purge` before `brew uninstall shum` and confirm with `DELETE`. This includes profile keys in Keychain. Without `--data-dir`, it also covers Shum roots registered in LaunchAgents. Unrelated files are preserved.

If the formula is already gone, unload and delete each existing Shum plist:

```sh
launchctl bootout "gui/$(id -u)" "$HOME/Library/LaunchAgents/org.shum.cli.<profile-id>.plist"
rm "$HOME/Library/LaunchAgents/org.shum.cli.<profile-id>.plist"
```

Replace the placeholder with the ID in the filename. `KeepAlive=false` prevents a restart loop when the executable is missing.

Windows and Linux packages are in development. See [CLI documentation](https://github.com/hiTechTeam/Shum-CLI) and [release checks](https://github.com/hiTechTeam/Shum-CLI/blob/main/docs/release-verification-0.1.7.md).

## License

[MIT](LICENSE). Automatic CI is disabled.
