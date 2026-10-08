class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-Core"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.0/shum-0.1.0-macos-arm64.tar.gz'
  version "0.1.0"
  sha256 "7f597573cf81c41e12a8475bda6fd9c5975f08a7311f47d9e3fe3977cfabe938"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "shum"
  end

  test do
    assert_equal "shum 0.1.0", shell_output("#{bin}/shum --version").strip
  end
end
