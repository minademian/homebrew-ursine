class DiffCheck < Formula
  desc "Git-to-deployment diff analyzer"
  homepage "https://github.com/minademian/server-utilities"
  url "https://github.com/minademian/server-utilities/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "69d025885421b408ad84e9681c48e5d41a42ee36"
  license "MIT"

  def install
     system "bash", "install.sh", "diff-check"
  end

  test do
    system "#{bin}/diff-check", "--version"
  end
end
