class PebbleSdk < Formula
  homepage "https://developer.getpebble.com/"
  url "http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-3.0-dp3.tar.gz"
  version "3.0-dp3"
  sha256 "3794e6aa573851151598a39c674c53a35c814c7ffa862b1a1efdfb0aa770990e"

  depends_on :macos => :mountain_lion
  depends_on "freetype" => :recommended
  depends_on "mpfr" => :build
  depends_on "gmp" => :build
  depends_on "libmpc" => :build
  depends_on "libelf" => :build
  depends_on "texinfo" => :build

  depends_on "boost-python"
  depends_on "glib"
  depends_on "pixman"

  # List of resources can be obtained from requirements.txt
  resource "autobahn" do
    url "https://pypi.python.org/packages/source/a/autobahn/autobahn-0.5.14.zip"
    sha1 "475ba5f281bdcc50858c6920c034a1a067b2ce2a"
  end

  resource "backports.ssl_match_hostname" do
    url "https://pypi.python.org/packages/source/b/backports.ssl_match_hostname/backports.ssl_match_hostname-3.4.0.2.tar.gz"
    sha1 "da4e41f3b110279d2382df47ac1e4f10c63cf954"
  end

  resource "freetype-py" do
    url "https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz"
    sha1 "3830e45ff9e9a96f1e209d786cbd5492f168127a"
  end

  resource "gevent" do
    url "https://pypi.python.org/packages/source/g/gevent/gevent-1.0.1.tar.gz"
    sha1 "2cc1b6e1fa29b30ea881fa6a195e57faaf089ae8"
  end

  resource "gevent-websocket" do
    url "https://pypi.python.org/packages/source/g/gevent-websocket/gevent-websocket-0.9.3.tar.gz"
    sha1 "06da7a53cb3844a4094ce9279cfd6f70bde12172"
  end

  resource "greenlet" do
    url "https://pypi.python.org/packages/source/g/greenlet/greenlet-0.4.5.zip"
    sha1 "97f18d651595bd30243ad2f4702764791e57fa6e"
  end

  resource "pygeoip" do
    url "https://pypi.python.org/packages/source/p/pygeoip/pygeoip-0.3.2.tar.gz"
    sha1 "608365dc820b54ac44d368e6e33766444e0a5098"
  end

  resource "pypng" do
    url "https://pypi.python.org/packages/source/p/pypng/pypng-0.0.17.tar.gz"
    sha1 "3821c58be15e833fc183dd361df02dece32ba180"
  end

  resource "pyserial" do
    url "https://pypi.python.org/packages/source/p/pyserial/pyserial-2.7.tar.gz"
    sha1 "f15694b1bea9e4369c1931dc5cf09e37e5c562cf"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.5.0.tar.gz"
    sha1 "d60dfaaa0b4b62a6646fcb6c3954ea369317ca9f"
  end

  resource "sh" do
    url "https://pypi.python.org/packages/source/s/sh/sh-1.09.tar.gz"
    sha1 "995c3cd38ddc065088f5fa991206665ec899e938"
  end

  resource "six" do
    url "https://pypi.python.org/packages/source/s/six/six-1.8.0.tar.gz"
    sha1 "aa3b0659cbc85c6c7a91efc51f2d1007040070cd"
  end

  resource "Twisted" do
    url "https://pypi.python.org/packages/source/T/Twisted/Twisted-12.0.0.tar.bz2"
    sha1 "64b7f7fdeefbd4dd8e6bdffb12d9095106ee3d5d"
  end

  resource "websocket-client" do
    url "https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.22.0.tar.gz"
    sha1 "f6d42683cf58b3a40b47ff0c78afca980df05abd"
  end

  resource "zope.interface" do
    url "https://pypi.python.org/packages/source/z/zope.interface/zope.interface-4.1.2.tar.gz"
    sha1 "6d940ecd621df0437ee9deb17d03ba105c13f07f"
  end

  resource "pebble-arm-toolchain" do
    url "https://github.com/pebble/arm-eabi-toolchain/archive/v2.0.tar.gz"
    sha1 "7085c6ef371213e3e766a1cbd7e6e1951ccf1d87"
  end

  def install
    %w[zope.interface Twisted autobahn backports.ssl_match_hostname freetype-py
       greenlet gevent gevent-websocket pygeoip pypng pyserial requests sh six
       websocket-client].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/".env")
      end
    end

    resource("pebble-arm-toolchain").stage do
      system "make", "PREFIX=#{libexec}/arm-cs-tools", "install-cross"
    end

    doc.install %w[Documentation Examples README.txt]
    libexec.install %w[Pebble tools bin requirements.txt version.txt]
    bin.write_exec_script(libexec/"bin/pebble")
  end

  test do
    system bin/"pebble", "new-project", "test"
    cd "test" do
      # We have to remove the default /usr/local/include from the CPATH
      # because the toolchain has -Werror=poison-system-directories set
      ENV["CPATH"] = ""
      system bin/"pebble", "build"
    end
  end

  def caveats; <<-EOS.undent
    Documentation and examples can be found in
      #{HOMEBREW_PREFIX}/share/doc/pebble-sdk
    EOS
  end
end

