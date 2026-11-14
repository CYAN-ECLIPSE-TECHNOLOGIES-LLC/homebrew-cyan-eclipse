# Cyan Eclipse Muster (Mac face) — the firm's tap cask of record.
# Artefact: CyanEclipseMuster.app.zip, the Muster Mac lane's release of
# record (IOS-products- release muster-v0.1.3, 2026-11-14; the seal
# cure — the packaging workflow ad-hoc signs the whole bundle as its
# final step before zipping, so the artefact verifies codesign
# --deep --strict clean and sits in the unnotarized class). 490,503
# bytes; sha256 pinned below, measured on the runner and re-verified
# after download. Supersedes the muster-v0.1.2 pin (489,129 bytes,
# 17d90549…), which shipped signed-but-unsealed and Gatekeeper called
# "damaged"; v0.1.2 must not be distributed.
# The product repository is private, so the byte-identical artefact is
# mirrored on this tap repository's own releases for public download.
cask "cyan-eclipse-muster" do
  version "0.1.3"
  sha256 "99d11ce63719be8bec6450a1257a5e28026037eab6d91c31f4c0b1a8aa30221e"

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
