# Cyan Eclipse Quill (macOS) — the firm's tap cask of record.
# Artefacts: the unsigned, unnotarized DMGs of record for v0.1.1,
# served from the firm's public downloads (the same files the
# cetech.ai download links serve). sha256 values pinned per arch and
# verified against both the build artefacts and the served bytes.
cask "cyan-eclipse-quill" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "bf54f0f59bcbedb2cc3639c768076294956b8f8ae889d6407b211176c19f86ae",
         intel: "78dbad40c1b0e0eb56698c8e5fece796207e6ad23a67cb4192d56aa8715d98e6"

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
