class NumbersCli < Formula
  desc "OfficeCli-style command line for Apple Numbers spreadsheets"
  homepage "https://github.com/indiebrain/numbers-cli"
  url "https://github.com/indiebrain/numbers-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1cf4ac76b8d07ed18c8fe1cbf78aedea9907a59e952a03d6c8b172c295f8cb5c"
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

  test do
    system bin/"nmbr", "create", "#{testpath}/t.numbers"
    assert_match "\"ok\": true", shell_output("#{bin}/nmbr doctor")
  end
end
