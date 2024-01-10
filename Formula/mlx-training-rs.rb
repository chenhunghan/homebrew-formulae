class MlxTrainingRs < Formula
  version "0.2.2"
  on_macos do
    on_arm do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.2/mlx-training-rs-aarch64-apple-darwin.tar.xz"
      sha256 "36701549e98fa489119bd9ef5b6d8529ee226ddebe1d9ecefff61378eb90e483"
    end
    on_intel do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.2/mlx-training-rs-x86_64-apple-darwin.tar.xz"
      sha256 "bf3473f177e9d93e6affd837e5727546f6713fe7c90ebf5629e776e2b167905f"
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
