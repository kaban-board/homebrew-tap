class Kaban < Formula
  desc "Terminal Kanban for AI Code Agents"
  homepage "https://beshkenadze.github.io/kaban"
  url "https://registry.npmjs.org/@kaban-board/cli/-/cli-0.1.2.tgz"
  sha256 "014b0e6f9b7d18930edfdf80e6f0200ebcf3001e79997a25d5bf597e79c10cc0"
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
