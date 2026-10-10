class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.8-r1/shum-macos-universal.tar.gz'
  version "0.1.8"
  sha256 "6251ad720b3a5bb12b27f650f65c625821fdf0f9c4bccf68168b6a30e6ca0dd8"
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
    assert_equal "shum 0.1.8", shell_output("#{bin}/shum --version").strip
  end
end
