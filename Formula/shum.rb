class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.25/shum-macos-arm64.tar.gz'
  version "0.1.25"
  sha256 "8b8011cc29b5f5a1aa9193382fda5bccb8d4ca1a7847c662b479b11369c78040"
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
    assert_equal "shum 0.1.25", shell_output("#{bin}/shum --version").strip
  end
end
