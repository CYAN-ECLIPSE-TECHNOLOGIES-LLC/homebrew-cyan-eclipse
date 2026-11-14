# Cyan Eclipse Muster (Mac face) — the firm's tap cask of record.
# Artefact: CyanEclipseMuster.app.zip, the Muster Mac lane's release of
# record (IOS-products- release muster-v0.1.2, 2026-11-14; QA-patterns
# remainders re-cut — Info.plist version agrees with the release version
# and the P6 integrity banner ships in the artefact). 489,129 bytes;
# sha256 pinned below, doubly attested (the release record's asset
# digest and an independent recomputation against the downloaded asset).
# Supersedes the muster-v0.1.0 pin (471,440 bytes, 353a959a…). The
# v0.1.0 install proof (tap run 43530804836) covers only the 0.1.0 byte
# set; the 0.1.2 pin carries its own targeted re-proof.
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
  version "0.1.2"
  sha256 "17d90549940d736cf44bc7b8fdde14d4d108177eca077ea232e905f3a7a8e9e5"

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
