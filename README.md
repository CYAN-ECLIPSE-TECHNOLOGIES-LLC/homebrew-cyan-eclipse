# Cyan Eclipse Homebrew Tap

The Homebrew tap of Cyan Eclipse Technologies LLC. It carries both kinds
of Homebrew package:

- Casks for our Mac applications (Obscura, Quill, Muster).
- Formulas for our command-line servers — the first is Cyan Eclipse
  Indigo (see below).

## Install

Tap once:

    brew tap cyan-eclipse-technologies-llc/cyan-eclipse

Then install what you need.

## Mac applications (casks)

    brew install --cask cyan-eclipse-obscura
    brew install --cask cyan-eclipse-quill
    brew install --cask cyan-eclipse-muster

| Cask | Application | Version |
| --- | --- | --- |
| cyan-eclipse-obscura | Cyan Eclipse Obscura — mandate-gated remote access client | 0.1.0 |
| cyan-eclipse-quill | Cyan Eclipse Quill — free AI-native text editor | 0.1.0 |
| cyan-eclipse-muster | Cyan Eclipse Muster — AI-native calendar decisions, on-device | 0.1.0 |

## Command-line servers (formulas)

Formulas install without the --cask flag:

    brew install eclipse-indigo

The first formula in this tap is eclipse-indigo: the Cyan Eclipse Indigo
MCP server (v0.2.0), a command-line build pinned to its release artefact
by checksum like everything else here. More of the firm's command-line
servers follow the same route.

## Unsigned builds — read before first launch

Our macOS application builds are currently UNSIGNED and not notarized.
Apple Developer enrollment is paused, and until it resumes there is no
signing identity and no notarization for these builds. The formula
artefacts are likewise unsigned builds.

What that means for you: macOS Gatekeeper will refuse an app's first
launch. To open an app the first time, right-click (Control-click) the
app in /Applications and choose Open, then confirm; or launch it once
and allow it under System Settings > Privacy & Security. Later launches
open normally.

Every cask and formula in this tap pins the exact SHA-256 checksum of
the release artefact it installs. Homebrew verifies the download against
that checksum before installing, so the bytes you run are verifiably the
bytes we published — the checksum is the integrity guarantee while the
builds are unsigned.

## License

The tap definitions in this repository are MIT-licensed (see LICENSE).
The applications and servers they install are products of Cyan Eclipse
Technologies LLC and carry their own terms, shown in each product.
