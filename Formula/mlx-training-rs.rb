class MlxTrainingRs < Formula
  version "0.2.5"
  on_macos do
    on_arm do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.5/mlx-training-rs-aarch64-apple-darwin.tar.xz"
      sha256 "dbc2053386ddef1ddeb70d3e3b8ef90fecc2c6ec8a8066c0895ffb2ad9c2a1c9"
    end
    on_intel do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.5/mlx-training-rs-x86_64-apple-darwin.tar.xz"
      sha256 "08ebf066636882a693e3b1f0388e4bae8df6612ad5b270348f1a062d504857a4"
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
