class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.21/shum-macos-arm64.tar.gz'
  version "0.1.21"
  sha256 "41044802c2c469d9232139eebe78aadf33b8f46cfd7776e5759741e28a556a9e"
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
    assert_equal "shum 0.1.21", shell_output("#{bin}/shum --version").strip
  end
end
