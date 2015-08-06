class Racer < Formula
  desc "Rust Code Completion utility"
  homepage "https://github.com/phildawes/racer"
  url "https://github.com/phildawes/racer/archive/v1.0.0.tar.gz"
  sha256 "78895296ed688eeccbaf7745235f0fc503407bfa718f53583a4dcc9e1246b7f5"

  depends_on "rust"

  def install
    system "cargo", "build", "--release"
    bin.install "/tmp/racer/target/release/racer"
  end

  test do
    system "false"
  end
end
