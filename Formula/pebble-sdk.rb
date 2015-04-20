class PebbleSdk < Formula
  homepage "https://developer.getpebble.com/"
  url "http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-3.0-dp8.tar.gz"
  version "3.0-dp8"
  sha256 "6d3644bec91f0f9af0adbdbee5ce595d1772e47d2b6e52b45cbc45ea75048cce"
  revision 2

  option "without-gevent-fix", "Don't use proposed gevent fix (https won't work)"

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
    sha256 "d56979d4dffae6dc4d9c840629b9a8092ac41ea75f55052d70943edf7e01979d"
  end

  resource "backports.ssl_match_hostname" do
    url "https://pypi.python.org/packages/source/b/backports.ssl_match_hostname/backports.ssl_match_hostname-3.4.0.2.tar.gz"
    sha256 "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
  end

  resource "freetype-py" do
    url "https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz"
    sha256 "1fc67817d5fb9f1329a1a431850a46f01f250a1d6380e4bcecdb54266023e99a"
  end

  resource "cython" do
    url "https://pypi.python.org/packages/source/C/Cython/cython-0.22.tar.gz"
    sha256 "14307e7a69af9a0d0e0024d446af7e51cc0e3e4d0dfb10d36ba837e5e5844015"
  end

  resource "gevent" do
    url "https://pypi.python.org/packages/source/g/gevent/gevent-1.0.1.tar.gz"
    sha256 "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
  end

  resource "gevent-fix" do
    url "https://github.com/NextThought/gevent/archive/3622c07d70ff5a70b3539d2d0b3046ec05dfdea0.zip"
    sha256 "dac8a802ef183fe48b2353ec52094484e0bb490ce6ec11bd2302cf50ac66ed30"
  end

  resource "gevent-websocket" do
    url "https://pypi.python.org/packages/source/g/gevent-websocket/gevent-websocket-0.9.3.tar.gz"
    sha256 "6475220340f9f8895a0f51bd2b9df3511bc7765dc055f49e997584bdaee3381f"
  end

  resource "greenlet" do
    url "https://pypi.python.org/packages/source/g/greenlet/greenlet-0.4.5.zip"
    sha256 "b990f00f120c4cfb6672eec2acd32210990a2c7b70b815c034d1d8cbf08e2dbe"
  end

  resource "httplib2" do
    url "https://pypi.python.org/packages/source/h/httplib2/httplib2-0.9.tar.gz"
    sha256 "39ea8c6a6d9f595c177a16134fc49a990ad8d382758cbf469c8659662f2f51ab"
  end

  resource "oauth2client" do
    url "https://pypi.python.org/packages/source/o/oauth2client/oauth2client-1.3.tar.gz"
    sha256 "668ffe5a9a6df1f5fca50a851da9ce97286dc10f190b05e84763a8cd9716141b"
  end

  resource "peewee" do
    url "https://pypi.python.org/packages/source/p/peewee/peewee-2.4.7.tar.gz"
    sha256 "8ad1c4fb202332a969da83a0af712bca96ed6e2a70ca1523ab3d2a2234ed47bd"
  end

  resource "pyasn1" do
    url "https://pypi.python.org/packages/source/p/pyasn1/pyasn1-0.1.7.tar.gz"
    sha256 "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7ad8f98b25c101eab"
  end

  resource "pyasn1-modules" do
    url "https://pypi.python.org/packages/source/p/pyasn1-modules/pyasn1-modules-0.0.5.tar.gz"
    sha256 "be65f00ed28e30756f1ef39377cb382480a2368699179d646a84d79fe9349941"
  end

  resource "pygeoip" do
    url "https://pypi.python.org/packages/source/p/pygeoip/pygeoip-0.3.2.tar.gz"
    sha256 "f22c4e00ddf1213e0fae36dc60b46ee7c25a6339941ec1a975539014c1f9a96d"
  end

  resource "pypng" do
    url "https://pypi.python.org/packages/source/p/pypng/pypng-0.0.17.tar.gz"
    sha256 "2dfa74ac28a4c41ae61e62d243410548c7c174bd990528d30270324f15211544"
  end

  resource "pyserial" do
    url "https://pypi.python.org/packages/source/p/pyserial/pyserial-2.7.tar.gz"
    sha256 "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
  end

  resource "python-dateutil" do
    url "https://pypi.python.org/packages/source/p/python-dateutil/python-dateutil-2.4.1.tar.bz2"
    sha256 "a9f62b12e28f11c732ad8e255721a9c7ab905f9479759491bc1f1e91de548d0f"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.5.0.tar.gz"
    sha256 "d2daef4919fc87262b8b3cb5a9d214cac8ce1e50950f8423bbc1d31c2e63d38e"
  end

  resource "rsa" do
    url "https://pypi.python.org/packages/source/r/rsa/rsa-3.1.4.tar.gz"
    sha256 "e2b0b05936c276b1edd2e1525553233b666df9e29b5c3ba223eed738277c82a0"
  end

  resource "sh" do
    url "https://pypi.python.org/packages/source/s/sh/sh-1.09.tar.gz"
    sha256 "f3d174e2ad25c39f28935bae672be51aa083063d3122405ceeb2a3e7a8239d45"
  end

  resource "six" do
    url "https://pypi.python.org/packages/source/s/six/six-1.8.0.tar.gz"
    sha256 "047bbbba41bac37c444c75ddfdf0573dd6e2f1fbd824e6247bb26fa7d8fa3830"
  end

  resource "Twisted" do
    url "https://pypi.python.org/packages/source/T/Twisted/Twisted-12.0.0.tar.bz2"
    sha256 "e5561c9714583fd052ea9e0b10331609a719b3878f9d2593e4c57eab0ba0effd"
  end

  resource "websocket-client" do
    url "https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.22.0.tar.gz"
    sha256 "83a173ea32ef4209a1933b3e0f5bfafe533b909073ff8d657f044b5792b8c7b5"
  end

  resource "wsgiref" do
    url "https://pypi.python.org/packages/source/w/wsgiref/wsgiref-0.1.2.zip"
    sha256 "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79"
  end

  resource "zope.interface" do
    url "https://pypi.python.org/packages/source/z/zope.interface/zope.interface-4.1.2.tar.gz"
    sha256 "441fefcac1fbac57c55239452557d3598571ab82395198b2565a29d45d1232f6"
  end

  resource "pebble-arm-toolchain" do
    url "http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-macos-universal-static.tar.gz"
    sha256 "49a1ddaed13d44b928a7148fa344f9362d6ae6823496fb5077ea451230222c4b"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/".env/lib/python2.7/site-packages"

    venv_args = Language::Python.setup_install_args(libexec/".env")

    if build.with? "gevent-fix"
      old_path = ENV["PATH"]

      ENV.prepend_create_path "PATH", libexec/".env/bin"

      resource("cython").stage { system "python", *venv_args }
      resource("gevent-fix").stage { system "python", *venv_args }

      ENV["PATH"] = old_path
    else
      resource("gevent").stage do
        system "python", *venv_args
      end
    end

    %w[zope.interface Twisted autobahn backports.ssl_match_hostname freetype-py
       greenlet gevent-websocket httplib2 oauth2client peewee pyasn1 pyasn1-modules
       pygeoip pypng pyserial python-dateutil requests rsa sh six websocket-client wsgiref].each do |r|
      resource(r).stage do
        system "python", *venv_args
      end
    end

    resource("pebble-arm-toolchain").stage libexec/"arm-cs-tools"

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

