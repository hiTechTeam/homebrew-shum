class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.17/shum-macos-universal.tar.gz'
  version "0.1.17"
  sha256 "3c6ba079807a257d6023cfc8c0782bdc579ff7a9814d1d0d0ba5fdd51607370f"
  license "MIT"

  depends_on macos: :sequoia

  def install
    app = buildpath/"Shum.app"
    app = buildpath unless app.directory?
    (prefix/"Shum.app").install app/"Contents"
    bin.install_symlink prefix/"Shum.app/Contents/MacOS/shum"
  end

  def caveats
    "Перед удалением: shum daemon --uninstall"
  end

  test do
    assert_equal "shum 0.1.17", shell_output("#{bin}/shum --version").strip
  end
end
