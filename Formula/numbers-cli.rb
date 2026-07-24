class NumbersCli < Formula
  desc "OfficeCli-style command line for Apple Numbers spreadsheets"
  homepage "https://github.com/indiebrain/numbers-cli"
  url "https://github.com/indiebrain/numbers-cli/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "44dbcd411ea48b7cb25df40143855a220bc7eb62a0f86355acafafcf39eb6a28"
  license "LGPL-3.0-or-later"

  depends_on "python@3.13"

  # The Model Context Protocol server is an optional extra with a large
  # dependency tree, so this formula installs the core command line only. Enable
  # the server with: pip install 'numbers-cli[mcp] @ git+https://github.com/indiebrain/numbers-cli'
  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--disable-pip-version-check", buildpath.to_s
    bin.install_symlink libexec/"bin/nmbr"
  end

  def caveats
    <<~EOS
      To use numbers-cli with Claude Code, install the bundled skill:
        nmbr skill install

      The Model Context Protocol server is an optional extra:
        pipx install 'numbers-cli[mcp] @ git+https://github.com/indiebrain/numbers-cli'
    EOS
  end

  test do
    system bin/"nmbr", "create", "#{testpath}/t.numbers"
    assert_match "\"ok\": true", shell_output("#{bin}/nmbr doctor")
  end
end
