class MlxTrainingRs < Formula
  version "0.2.1"
  on_macos do
    on_arm do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.1/mlx-training-rs-aarch64-apple-darwin.tar.xz"
      sha256 "74da882707a74b1e2af78fbb1b15d905403995c570a230b24aa8daba69e5730d"
    end
    on_intel do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.1/mlx-training-rs-x86_64-apple-darwin.tar.xz"
      sha256 "11607d11e4236248ccfd666c2a209cb4abe0fcc1458d457075fdfa9ab9f1829e"
    end
  end

  def install
    bin.install "mlxt"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
