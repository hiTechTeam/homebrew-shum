class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.7-r2/shum-macos-universal.tar.gz'
  version "0.1.7"
  sha256 "3cbcda7e93f0a5d1009d7e36da1098771f6771ce9b0ae5dbe0e2ab693933bc64"
  license "MIT"
  revision 2

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
