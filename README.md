# Cyan Eclipse Homebrew Tap

Homebrew tap for the macOS applications of Cyan Eclipse Technologies LLC.

## Install

Tap once:

    brew tap cyan-eclipse-technologies-llc/cyan-eclipse

Then install any application:

    brew install --cask cyan-eclipse-obscura
    brew install --cask cyan-eclipse-quill

## Available casks

| Cask | Application | Version |
| --- | --- | --- |
| cyan-eclipse-obscura | Cyan Eclipse Obscura — mandate-gated remote access client | 0.1.0 |
| cyan-eclipse-quill | Cyan Eclipse Quill — free AI-native text editor | 0.1.0 |

Cyan Eclipse Muster joins this tap when its first macOS release artefact is
published.

## Unsigned applications — read before first launch

Our macOS applications are currently UNSIGNED and not notarized. Apple
Developer enrollment is paused, and until it resumes there is no signing
identity and no notarization for these builds.

What that means for you: macOS Gatekeeper will refuse the first launch. To
open an app the first time, right-click (Control-click) the app in
/Applications and choose Open, then confirm; or launch it once and allow it
under System Settings > Privacy & Security. Later launches open normally.

Every cask in this tap pins the exact SHA-256 checksum of the release
artefact it installs. Homebrew verifies the download against that checksum
before installing, so the bytes you run are verifiably the bytes we
published — the checksum is the integrity guarantee while the builds are
unsigned.

## License

The tap definitions in this repository are MIT-licensed (see LICENSE). The
applications they install are products of Cyan Eclipse Technologies LLC and
carry their own terms, shown in each product.
