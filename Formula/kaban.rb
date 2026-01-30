class Kaban < Formula
  desc "Terminal Kanban for AI Code Agents"
  homepage "https://beshkenadze.github.io/kaban"
  url "https://github.com/kaban-board/kaban/releases/download/v0.3.3/kaban-darwin-arm64-0.3.3.tar.gz"
  sha256 "e60aee6e383fca8aa473d41fbfa0bee029604174026d9e1c423ca69ead5c63e9"
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
