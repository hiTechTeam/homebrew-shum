class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.7-r1/shum-macos-universal.tar.gz'
  version "0.1.7"
  sha256 "dde3ee0e637e0ebadb9d6259e6aed5eae50f303511073b9fe3d85f1117802207"
  license "MIT"
  revision 1

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
    assert_equal "shum 0.1.7", shell_output("#{bin}/shum --version").strip
  end
end
