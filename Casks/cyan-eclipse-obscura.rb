# Cyan Eclipse Obscura (macOS client) — the firm's tap cask of record.
# Artefact: the unsigned, unnotarized build of record for v0.1.0
# (325,858 bytes, sha256 pinned below; build record 2026-11-13).
# The product repository is private, so the byte-identical artefact is
# published on this tap repository's own releases for public download.
# The release of record also exists on the product repository.
cask "cyan-eclipse-obscura" do
  version "0.1.0"
  sha256 "89d459e1d183cf7cc115485c4b5cebc1400bdce8e4bb0f452f79eb92a456beea"

  url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases/download/obscura-v#{version}/CyanEclipse-Obscura-macOS-#{version}-UNSIGNED.zip"
  name "Cyan Eclipse Obscura"
  desc "Mandate-gated remote access client (unsigned, unnotarized build)"
  homepage "https://cetech.ai"

  depends_on macos: ">= :ventura"

  app "Obscura.app"

  caveats <<~EOS
    This build is unsigned and not notarized. On first launch macOS
    Gatekeeper will refuse to open it: right-click the app in
    /Applications, choose Open, and confirm (or allow it under System
    Settings > Privacy & Security).

    Obscura is a mandate-gated client: installing it grants no access.
    It connects only under an owner-issued mandate to an Obscura policyd.
  EOS
end
