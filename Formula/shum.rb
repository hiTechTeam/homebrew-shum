class Shum < Formula
  desc "Private messenger in your terminal"
  homepage "https://github.com/hiTechTeam/Shum-CLI"
  url 'https://github.com/hiTechTeam/homebrew-shum/releases/download/v0.1.5/shum-0.1.5-macos-arm64.tar.gz'
  version "0.1.5"
  sha256 "a194846937ea7612fd06d5ba6d6e3d3e388dd47aaafa6c957f7673d4e5625f31"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "shum"
  end

  test do
    assert_equal "shum 0.1.5", shell_output("#{bin}/shum --version").strip
  end
end
