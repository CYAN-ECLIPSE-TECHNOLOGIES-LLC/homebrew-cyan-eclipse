# Cyan Eclipse Quill (macOS) — the firm's tap cask of record.
# Artefacts: the ad-hoc-signed, unnotarized DMGs of record for v0.1.3,
# served from the firm's public downloads (the same files the
# cetech.ai download links serve). sha256 values pinned per arch and
# verified against both the build artefacts and the served bytes.
# v0.1.2 is the signature cure: the bundle is sealed (ad-hoc) and
# verifies codesign --verify --deep --strict clean; v0.1.1 shipped
# unsealed and Gatekeeper called it "damaged". v0.1.3 cures the
# packaged splash screen, which never loaded in packaged builds
# (its brand path resolved outside the bundle).
cask "cyan-eclipse-quill" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "441722d62e029fa2e033110007749c8abfce859737e1c47435bb5f9271f5f8d7",
         intel: "2a2e8dbabba515f3b90ccc75fea7b61d725098c39f46dd74f83410b90e1bc4f6"

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
