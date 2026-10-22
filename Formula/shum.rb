class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.14/shum-macos-universal.tar.gz'
  version "0.1.14"
  sha256 "33b3f8d97035b5b235305eeb4d8de1b00bb9b1b53470d15ce4e9616bcd6d094a"
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
    assert_equal "shum 0.1.14", shell_output("#{bin}/shum --version").strip
  end
end
