# Cyan Eclipse Quill (macOS) — the firm's tap cask of record.
# Artefacts: the unsigned, unnotarized DMGs of record for v0.1.0,
# served from the firm's public downloads (the same files the
# cetech.ai download links serve). sha256 values pinned per arch and
# verified against both the build artefacts and the served bytes.
cask "cyan-eclipse-quill" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "7f40fc5e7a1fe9a7ba7e006a1bb3073331caa6623a39bfb09c98257f49d1ee4d",
         intel: "57dadf844719e3a0190656a5bedec3c60353937f93fe10a087611d02e29963e0"

  url "https://pub-f66188d686c844b4a8499ca3b2a544cd.r2.dev/downloads/quill/#{version}/cyan-eclipse-quill-v#{version}-mac-#{arch}.dmg"
  name "Cyan Eclipse Quill"
  desc "Free AI-native text editor (unsigned, unnotarized build)"
  homepage "https://cetech.ai"

  livecheck do
    skip "Version is pinned to the firm's published downloads; new versions are cut deliberately"
  end

  depends_on macos: ">= :big_sur"

  app "CyanEclipseQuill.app"

  caveats <<~EOS
    This build is unsigned and not notarized. On first launch macOS
    Gatekeeper will refuse to open it: right-click the app in
    /Applications, choose Open, and confirm (or allow it under System
    Settings > Privacy & Security).
  EOS
end
