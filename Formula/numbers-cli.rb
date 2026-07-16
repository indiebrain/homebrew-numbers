class NumbersCli < Formula
  desc "OfficeCli-style command line for Apple Numbers spreadsheets"
  homepage "https://github.com/indiebrain/numbers-cli"
  url "https://github.com/indiebrain/numbers-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7cca70d6ba296178d49dfd3c50efa130adcbe94db3bd0715858e607cd738fa57"
  license "Apache-2.0"

  depends_on "python@3.13"

  # The Model Context Protocol server is an optional extra with a large
  # dependency tree, so this formula installs the core command line only. Enable
  # the server with: pip install 'numbers-cli[mcp] @ git+https://github.com/indiebrain/numbers-cli'
  def install
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--disable-pip-version-check", buildpath.to_s
    bin.install_symlink libexec/"bin/nmbr"
  end

  test do
    system bin/"nmbr", "create", "#{testpath}/t.numbers"
    assert_match "\"ok\": true", shell_output("#{bin}/nmbr doctor")
  end
end
