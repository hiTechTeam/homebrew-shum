class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.18/shum-macos-universal.tar.gz'
  version "0.1.18"
  sha256 "5818c19e71e8b7d33607cd33678afb7f03b811e1c6d2311db66085fabdb88800"
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
    assert_equal "shum 0.1.18", shell_output("#{bin}/shum --version").strip
  end
end
