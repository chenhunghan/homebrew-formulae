class MlxTrainingRs < Formula
  version "0.2.4"
  on_macos do
    on_arm do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.4/mlx-training-rs-aarch64-apple-darwin.tar.xz"
      sha256 "c212aca50eea57ab6693d4a690dba794d4b942e391c28ce371a3dc712ff5b4dd"
    end
    on_intel do
      url "https://github.com/chenhunghan/mlx-training-rs/releases/download/v0.2.4/mlx-training-rs-x86_64-apple-darwin.tar.xz"
      sha256 "ac31f9fee88bceaf0a9ece9c5320fd89eeae0ab52cb064326b7ea34e7c4798d1"
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
