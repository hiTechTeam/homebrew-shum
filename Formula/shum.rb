class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.26/shum-macos-arm64.tar.gz'
  version "0.1.26"
  sha256 "51fc41be0e8614e306fe3188e3394ab8b1e61ff74e7faee5d79080d41d8c9375"
  license "MIT"

  depends_on arch: :arm64
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
    assert_equal "shum 0.1.26", shell_output("#{bin}/shum --version").strip
  end
end
