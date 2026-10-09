class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.6/shum-macos-universal.tar.gz'
  version "0.1.6"
  sha256 "4e583e9a138ac81120339ca27d95d7ad9ae0c55749cb204b6e89ff63a67776c8"
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
    assert_equal "shum 0.1.6", shell_output("#{bin}/shum --version").strip
  end
end
