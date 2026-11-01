class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.27/shum-macos-arm64.tar.gz'
  version "0.1.27"
  sha256 "6cfa3482142aa64d4539144573622ea497060eac293764a88d1704020f154dbe"
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
    assert_equal "shum 0.1.27", shell_output("#{bin}/shum --version").strip
  end
end
