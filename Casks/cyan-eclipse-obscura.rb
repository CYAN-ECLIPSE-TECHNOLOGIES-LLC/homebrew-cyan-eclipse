# Cyan Eclipse Obscura (macOS client) — the firm's tap cask of record.
# Artefact: the ad-hoc signed, unnotarized build of record for v0.1.3
# (372,486 bytes, sha256 pinned below; round-2 QA cure + H3 failure-boundary re-cut 2026-11-14 —
# the bundle is codesign-sealed at packaging and verifies
# codesign --verify --deep --strict clean in CI run 43654244976;
# v0.1.0 shipped signed-but-unsealed and Gatekeeper classed it
# "damaged", cured from v0.1.1 on).
# The product repository is private, so the byte-identical artefact is
# published on this tap repository's own releases for public download.
# The release of record also exists on the product repository.
cask "cyan-eclipse-obscura" do
  version "0.1.3"
  sha256 "fc189fd62094c0cfd77edbc3b02723d69a7ceced81bae72a69b43ae437f24769"

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
