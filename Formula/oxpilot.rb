class Oxpilot < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.1.0/oxpilot-aarch64-apple-darwin.tar.gz"
    sha256 "a8193793632ba2953375a3b1b51d6d0cdaba90b0d0651ebab58d94aa97cf23de"
  else
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.1.0/oxpilot-x86_64-apple-darwin.tar.gz"
    sha256 "a32ac9b2117c06bb74237dba9f439d5c18381551a9aa319d6674eb2f1de15c0d"
  end
  version "0.1.0"

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
