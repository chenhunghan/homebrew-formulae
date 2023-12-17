class Oxpilot < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.2.0/oxpilot-aarch64-apple-darwin.tar.gz"
    sha256 "5e51586c1cd9bdf6c572ac31d5e8d8aae85af287968992e72bd14b6e43b06823"
  else
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.2.0/oxpilot-x86_64-apple-darwin.tar.gz"
    sha256 "3788dfbc6f7c5e7905730ceef853f21ca9d644d98752e84fb1ebef66e272d143"
  end
  version "0.2.0"

  def install
    bin.install "ox"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
