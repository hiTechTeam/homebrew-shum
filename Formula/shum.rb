class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.28/shum-macos-arm64.tar.gz'
  version "0.1.28"
  sha256 "2465c51a2022937b607185b5eb5795c11544a061c30ae78bff34c9b991ce7144"
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
    assert_equal "shum 0.1.28", shell_output("#{bin}/shum --version").strip
  end
end
