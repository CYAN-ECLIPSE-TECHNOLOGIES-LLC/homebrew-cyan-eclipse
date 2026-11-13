# Cyan Eclipse Muster (Mac face) — the firm's tap cask of record.
# Artefact: CyanEclipseMuster.app.zip from the Muster Mac lane's first
# successful macOS CI build (IOS-products- run 43439258038, 2026-11-13:
# build + core suites + presented-session exercise green). 471,440
# bytes; sha256 pinned below, doubly attested (the build lane's own
# .sha256 sidecar and an independent recomputation).
# The product repository is private, so the byte-identical artefact is
# published on this tap repository's own releases for public download;
# the Muster lane's release of record on its own repository remains
# that lane's step, and this cask can be re-pointed at it later without
# a checksum change. This cask supersedes the 2026-11-09 definition of
# record, whose :no_check placeholder never published.
cask "cyan-eclipse-muster" do
  version "0.1.0"
  sha256 "d18ee8ae4eec26570633c35b16464da76f24547195ac478e25cf1d6e68fe217d"

  url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases/download/muster-v#{version}/CyanEclipseMuster.app.zip"
  name "Cyan Eclipse Muster"
  desc "AI-native calendar decisions with checkable records; on-device (unsigned build)"
  homepage "https://cetech.ai"

  depends_on macos: ">= :sonoma"

  app "CyanEclipseMuster.app"

  zap trash: [
    "~/Library/Application Support/CyanEclipseMuster",
    "~/Library/Preferences/ai.cetech.muster.plist",
  ]

  caveats <<~EOS
    This build is unsigned and not notarized. On first launch macOS
    Gatekeeper will refuse to open it: right-click the app in
    /Applications, choose Open, and confirm (or allow it under System
    Settings > Privacy & Security).
  EOS
end
