class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-Core"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.3/shum-0.1.3-macos-arm64.tar.gz'
  version "0.1.3"
  sha256 "ebe50d318b5ce629ce5a987b04a3ce01b0f00864fcd61b0701fb6b4606af43b6"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "shum"
  end

  test do
    assert_equal "shum 0.1.3", shell_output("#{bin}/shum --version").strip
  end
end
