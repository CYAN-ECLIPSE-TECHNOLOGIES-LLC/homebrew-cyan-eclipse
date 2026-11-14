# Cyan Eclipse Quill (macOS) — the firm's tap cask of record.
# Artefacts: the ad-hoc-signed, unnotarized DMGs of record for v0.1.2,
# served from the firm's public downloads (the same files the
# cetech.ai download links serve). sha256 values pinned per arch and
# verified against both the build artefacts and the served bytes.
# v0.1.2 is the signature cure: the bundle is sealed (ad-hoc) and
# verifies codesign --verify --deep --strict clean; v0.1.1 shipped
# unsealed and Gatekeeper called it "damaged".
cask "cyan-eclipse-quill" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "e3b4aa8155b08d768584a98c2acdc15bd3b2abb6ef7229e534cac78c47ba75c2",
         intel: "d332d14efa18cdcf7351b8b0d30407302629ef532d0c410983c3813b9c30c591"

  url "https://pub-f66188d686c844b4a8499ca3b2a544cd.r2.dev/downloads/quill/#{version}/cyan-eclipse-quill-v#{version}-mac-#{arch}.dmg"
  name "Cyan Eclipse Quill"
  desc "Free AI-native text editor (ad-hoc signed, unnotarized build)"
  homepage "https://cetech.ai"

  livecheck do
    skip "Version is pinned to the firm's published downloads; new versions are cut deliberately"
  end

  depends_on macos: ">= :big_sur"

  app "CyanEclipseQuill.app"

  caveats <<~EOS
    This build is ad-hoc signed (a valid seal) but not Developer ID
    signed and not notarized. On first launch macOS Gatekeeper will
    refuse to open it: right-click the app in /Applications, choose
    Open, and confirm (or allow it under System Settings > Privacy
    & Security).
  EOS
end
