# Cyan Eclipse Obscura (macOS client) — the firm's tap cask of record.
# Artefact: the ad-hoc signed, unnotarized build of record for v0.1.4
# (373,988 bytes, sha256 pinned below; round-3 QA cure cut 2026-11-14 —
# F-A computed session-end day label, F-B mandate check before the
# approve prompt; the bundle is codesign-sealed at packaging and
# verifies codesign --verify --deep --strict clean in CI run
# 43661971244; v0.1.0 shipped signed-but-unsealed and Gatekeeper
# classed it "damaged", cured from v0.1.1 on).
# The product repository is private, so the byte-identical artefact is
# published on this tap repository's own releases for public download.
# The release of record also exists on the product repository.
cask "cyan-eclipse-obscura" do
  version "0.1.4"
  sha256 "51c724d5576ca5733d1202ec517a18d894d91c1a4ff1d6749a651ca359817af5"

  url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases/download/obscura-v#{version}/CyanEclipse-Obscura-macOS-#{version}.zip"
  name "Cyan Eclipse Obscura"
  desc "Mandate-gated remote access client (ad-hoc signed, unnotarized build)"
  homepage "https://cetech.ai"

  livecheck do
    url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases"
    regex(/obscura[ -]v?(\d+(?:\.\d+)+)/i)
    strategy :github_releases
  end

  depends_on macos: ">= :ventura"

  app "Obscura.app"

  caveats <<~EOS
    This build is ad-hoc signed (its code seal verifies clean) but not
    notarized — there is no Apple Developer ID behind it yet. On first
    launch macOS Gatekeeper will refuse to open it: right-click the
    app in /Applications, choose Open, and confirm (or allow it under
    System Settings > Privacy & Security).

    Obscura is a mandate-gated client: installing it grants no access.
    It connects only under an owner-issued mandate to an Obscura policyd.
  EOS
end
