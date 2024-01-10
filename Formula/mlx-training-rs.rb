class MlxTrainingRs < Formula
  version "0.2.3"
  on_macos do
    on_arm do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.3/mlx-training-rs-aarch64-apple-darwin.tar.xz"
      sha256 "fd2612ae9d82bc169d1b12c620a048a0c737bedf2c4be9f7291a7845f0457e64"
    end
    on_intel do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.3/mlx-training-rs-x86_64-apple-darwin.tar.xz"
      sha256 "ed5935025daa12bbe6670cc260d1ebbbe958f62dab31b6b5d1212e620033bda5"
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
