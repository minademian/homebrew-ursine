class ServerAudit < Formula
  desc "Secure server auditing tool"
  homepage "https://github.com/minademian/server-utilities"
  url "https://github.com/minademian/server-utilities/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "69d025885421b408ad84e9681c48e5d41a42ee36"
  license "MIT"

  def install
     system "bash", "install.sh", "server-audit"
  end

  test do
    system "#{bin}/server-audit", "--version"
  end
end
