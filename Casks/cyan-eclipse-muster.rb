# Cyan Eclipse Muster (Mac face) — the firm's tap cask of record.
# Artefact: CyanEclipseMuster.app.zip, the Muster Mac lane's release of
# record (IOS-products- release muster-v0.1.4, 2026-11-20; the splash
# release — the Mac face implements the Cyan Eclipse standard splash,
# MUS-SPLASH-001 / OPS-181, with the splash-presence gate in the build
# path. The packaging workflow ad-hoc signs the whole bundle as its
# final step before zipping, so the artefact verifies codesign
# --deep --strict clean and sits in the unnotarized class). 924,733
# bytes; sha256 pinned below, measured on the runner and re-verified
# after download. Supersedes the muster-v0.1.3 pin (490,503 bytes,
# 99d11ce6…). The muster-v0.1.2 pin (489,129 bytes, 17d90549…)
# shipped signed-but-unsealed and Gatekeeper called it "damaged";
# v0.1.2 must not be distributed.
# The product repository is private, so the byte-identical artefact is
# mirrored on this tap repository's own releases for public download.
cask "cyan-eclipse-muster" do
  version "0.1.4"
  sha256 "a80b0dce03a43d91d18c4fce98be0d2af94cd5eb7a069367058d5682bc7f6973"

  url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases/download/muster-v#{version}/CyanEclipseMuster.app.zip"
  name "Cyan Eclipse Muster"
  desc "AI-native calendar decisions with checkable records; on-device (ad-hoc signed build)"
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
    This build is ad-hoc signed and not notarized. On first launch
    macOS Gatekeeper will stop it once: right-click the app in
    /Applications, choose Open, and confirm (or allow it under System
    Settings > Privacy & Security). After that first launch it opens
    normally.
  EOS
end
