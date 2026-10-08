class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-Core"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.1/shum-0.1.1-macos-arm64.tar.gz'
  version "0.1.1"
  sha256 "c1cfa563ba728105fc632faaddd67406855e3d800fb27ea6fc20c7619c79ee0f"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "shum"
  end

  test do
    assert_equal "shum 0.1.1", shell_output("#{bin}/shum --version").strip
  end
end
