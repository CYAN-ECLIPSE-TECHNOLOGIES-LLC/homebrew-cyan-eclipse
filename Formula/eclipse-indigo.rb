# Cyan Eclipse Indigo — mail-governance MCP server (Microsoft 365 mail).
#
# Formula (command-line tool class), not a cask: Indigo's server is a
# Python stdio program with no macOS app bundle; the Indigo app itself
# is iOS. The source tarball is the eclipse-indigo-mcp v0.2.0 tag,
# mirrored onto this tap's releases because the product repo is
# private and its release assets are not anonymously downloadable
# (the same pattern as the Obscura cask in this tap).
class EclipseIndigo < Formula
  desc "Mail-governance MCP server: identity verdicts, inert drafts, token-gated sends"
  homepage "https://cetech.ai"
  url "https://github.com/CYAN-ECLIPSE-TECHNOLOGIES-LLC/homebrew-cyan-eclipse/releases/download/indigo-v0.2.0/eclipse-indigo-0.2.0.tar.gz"
  sha256 "83b6b5001e608aed000f29fa3395afb880bbb95f5b6c9eac5b7be16fa44cfd01"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "server.py", "policy.json", "tools-manifest.json", "fixtures"
    (bin/"eclipse-indigo").write <<~SH
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3" "#{libexec}/server.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      Indigo serves MCP over stdio. Point your MCP host at:
        eclipse-indigo
      It runs the hermetic fixture provider by default. The live
      Microsoft Graph provider fails closed until the mailbox owner's
      own Entra app registration exists and a launch token is supplied
      (ECLIPSE_INDIGO_PROVIDER=graph plus the graph config — see the
      runbook in the source). No credential is bundled.
    EOS
  end

  test do
    ENV["ECLIPSE_INDIGO_STATE"] = (testpath/"state.json").to_s
    input = <<~JSON
      {"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-03-26","capabilities":{},"clientInfo":{"name":"brew-test","version":"0"}}}
      {"jsonrpc":"2.0","method":"notifications/initialized"}
      {"jsonrpc":"2.0","id":2,"method":"tools/list"}
    JSON
    output = pipe_output(bin/"eclipse-indigo", input, 0)
    assert_match "mail_list_messages", output
    assert_match "mail_send_draft", output
  end
end
