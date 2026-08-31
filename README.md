# Orthant Homebrew tap

The Homebrew tap for [**Orthant**](https://github.com/orthant-app/orthant) — a grid-based window
manager for macOS. It snaps the frontmost window to a screen region with a keyboard shortcut, or
by dragging on a grid overlay.

## Install

```sh
brew install --cask orthant-app/tap/orthant
```

Orthant needs **Accessibility** permission to move other applications' windows — macOS will ask
the first time you use it. It runs in the menu bar and has no Dock icon.

## Uninstall

```sh
brew uninstall --zap orthant
```

`--zap` is the complete removal: it also clears Orthant's preferences, caches and saved state, and
revokes its Accessibility grant. A plain `brew uninstall` leaves those behind.

## Updates

Orthant updates itself through [Sparkle](https://sparkle-project.org), so the cask is marked
`auto_updates true`. `brew upgrade` will not fight it. The update feed is
<https://updates.orthant.app/appcast.xml>.

## About this repository

`Casks/orthant.rb` is generated and pushed by Orthant's release workflow whenever a stable version
is tagged — it is not edited by hand. Issues and pull requests belong on the
[main repository](https://github.com/orthant-app/orthant).

Released binaries are signed with an Apple Developer ID and notarized by Apple.
