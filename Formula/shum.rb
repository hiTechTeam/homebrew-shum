class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-Core"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.4/shum-0.1.4-macos-arm64.tar.gz'
  version "0.1.4"
  sha256 "b6648e1154b2369c6523a5f2759023e34eceeec622c3100f02956a7978b061f9"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "shum"
  end

  test do
    assert_equal "shum 0.1.4", shell_output("#{bin}/shum --version").strip
  end
end
