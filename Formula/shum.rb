class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-Core"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.2/shum-0.1.2-macos-arm64.tar.gz'
  version "0.1.2"
  sha256 "a24e31d1ae7555223d734bc6f0d3884ffc8ccedb83f4d9309694b2c612c930eb"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "shum"
  end

  test do
    assert_equal "shum 0.1.2", shell_output("#{bin}/shum --version").strip
  end
end
