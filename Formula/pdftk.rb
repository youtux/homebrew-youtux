class Pdftk < Formula
  desc "Simple tool for doing everyday things with PDF documents"
  homepage "http://www.pdflabs.com/tools/pdftk-server"
  url "https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.11-setup.pkg"
  sha256 "c33cf95151e477953cd57c1ea9c99ebdc29d75f4c9af0d5f947b385995750b0c"

  depends_on :macos => :el_capitan

  def install
    system "pax", "-rz", "-f", "pdftk.pkg/Payload"
    libexec.install "bin", "man", "lib"
    bin.install_symlink libexec/"bin/pdftk"
    man1.install Dir[libexec/"man/*"]
  end

  test do
    system "#{bin}/pdftk", "--version"
  end
end
