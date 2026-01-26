class Kaban < Formula
  desc "Terminal Kanban for AI Code Agents"
  homepage "https://beshkenadze.github.io/kaban"
  url "https://github.com/kaban-board/kaban/releases/download/v0.3.0/kaban-board-cli-0.3.0.tgz"
  sha256 "b21ea2a6f823afdfa6bcd896d6aa0b8d285d6aa95984ac1f004943d1b6b2fc64"
  license "MIT"

  depends_on "node"
  depends_on "bun"

  def install
    system "npm", "install", *std_npm_args
    system "npm", "install", "@kaban-board/tui", *std_npm_args

    tui_pkg = "#{libexec}/lib/node_modules/@kaban-board/tui"
    tui_entry = "#{tui_pkg}/dist/index.js"
    tui_bin = "#{libexec}/bin/kaban-tui"

    unless File.exist?(tui_entry)
      odie "kaban-tui entry not found: #{tui_entry}"
    end

    system "bun", "build", "--compile", "--minify", tui_entry,
      "--outfile", tui_bin,
      "--external", "@libsql/client",
      "--define", "process.env.KABAN_NO_LIBSQL='true'"

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Terminal Kanban", shell_output("#{bin}/kaban --help")
  end
end
