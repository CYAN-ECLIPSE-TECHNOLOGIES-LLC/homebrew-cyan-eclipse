# Cyan Eclipse Muster (Mac face) — the firm's tap cask of record.
# Artefact: CyanEclipseMuster.app.zip, the Muster Mac lane's release of
# record (IOS-products- release muster-v0.1.0 at ec73ca3; build run
# 43449376149, 2026-11-13). 471,440 bytes; sha256 pinned below, doubly
# attested (the build lane's own .sha256 sidecar and an independent
# recomputation against the release asset).
# The product repository is private, so the byte-identical artefact is
# mirrored on this tap repository's own releases for public download.
# RECONCILED 2026-11-13: this cask originally pinned the first green
# build's byte set (sha256 d18ee8ae…, run 43439258038); a later
# swift-format cure legitimately changed the binary before the release
# of record was cut, so two byte sets briefly wore version 0.1.0. The
# release of record is canonical; the mirror asset was replaced and
# this pin re-pointed to it — one byte set wears 0.1.0. This cask
# supersedes the 2026-11-09 definition of record, whose :no_check
# placeholder never published.
cask "cyan-eclipse-muster" do
  version "0.1.0"
  sha256 "353a959a82f6eb2763ed91ba8d6d27f6ea325058765d4291b03e0ad2c42ea7c9"

  url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases/download/muster-v#{version}/CyanEclipseMuster.app.zip"
  name "Cyan Eclipse Muster"
  desc "AI-native calendar decisions with checkable records; on-device (unsigned build)"
  homepage "https://cetech.ai"

  livecheck do
    url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases"
    regex(/muster[ -]v?(\d+(?:\.\d+)+)/i)
    strategy :github_releases
  end

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
