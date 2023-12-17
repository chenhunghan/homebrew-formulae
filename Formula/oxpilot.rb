class Oxpilot < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.3.1/oxpilot-aarch64-apple-darwin.tar.gz"
    sha256 "fe814aaf587a32b3a2a36d74260f532b4cf89146379ddd4d29ace7637dcb52a4"
  else
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.3.1/oxpilot-x86_64-apple-darwin.tar.gz"
    sha256 "95997549fa8d40fefa6a850aa5ef24c47fd98b57c156eb7f56f227d806ae0c28"
  end
  version "0.3.1"

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
