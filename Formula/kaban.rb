class Kaban < Formula
  desc "Terminal Kanban for AI Code Agents"
  homepage "https://beshkenadze.github.io/kaban"
  url "https://github.com/kaban-board/kaban/releases/download/v0.3.0/kaban-darwin-arm64-0.3.0.tar.gz"
  sha256 "96e831dbc082d50c163297f0a92ca6193ba2cc5a907acfbdd8ea0477344910dd"
  license "MIT"

  depends_on arch: :arm64

  def install
    bin.install "kaban"
    bin.install "kaban-hook"
    bin.install "kaban-tui"
  end

  test do
    assert_match "Terminal Kanban", shell_output("#{bin}/kaban --help")
  end
end
