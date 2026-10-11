class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.11/shum-macos-universal.tar.gz'
  version "0.1.11"
  sha256 "f6b0bd3a6790bcb4dbdbfdd7962bc35453d1fe7418ed4c1e2d1fec2da7b14d98"
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
    assert_equal "shum 0.1.11", shell_output("#{bin}/shum --version").strip
  end
end
