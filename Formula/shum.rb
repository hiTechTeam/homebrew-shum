class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.15/shum-macos-universal.tar.gz'
  version "0.1.15"
  sha256 "ca6c0b5acd72254640f99871cd6d5a9485f5ae8654f010b6f786ddf8757f9f96"
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
    assert_equal "shum 0.1.15", shell_output("#{bin}/shum --version").strip
  end
end
