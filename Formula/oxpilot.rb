class Oxpilot < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.3.0/oxpilot-aarch64-apple-darwin.tar.gz"
    sha256 "716fd7d6d1a16858996c1301dc168448a6632b949c79c8a6cab6b531d8484fe0"
  else
    url "https://github.com/chenhunghan/oxpilot/releases/download/v0.3.0/oxpilot-x86_64-apple-darwin.tar.gz"
    sha256 "37561e151fecbc7a7b8b8e0bfa7aef33a063e4b17340de9eaf74d0ccfd66acae"
  end
  version "0.3.0"

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
