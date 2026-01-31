class Kaban < Formula
  desc "Terminal Kanban for AI Code Agents"
  homepage "https://beshkenadze.github.io/kaban"
  url "https://github.com/kaban-board/kaban/releases/download/v0.3.4/kaban-darwin-arm64-0.3.4.tar.gz"
  sha256 "97a615bac30dda4cde18ee4935280665d39310083320ddeb92ebdf3a263d937c"
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
