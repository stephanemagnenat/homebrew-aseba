require "formula"

class Enki < Formula
  homepage "http://home.gna.org/enki"
  url "https://github.com/enki-community/enki/archive/2.0-pre.20170315.tar.gz"
  sha256 "0872c2b58bd9aa13734887a0433c1c343962e84d88ab1928b5f3ed7e87b1dbe1"

  depends_on "cmake" => :build
  depends_on "cartr/qt4/qt"
  depends_on "sdl2"
  depends_on :python => :optional
  depends_on "boost" => "with-python"

  def install
    system "cmake", ".", "-DPYTHON_CUSTOM_TARGET=#{prefix}/lib/python2.7/site-packages", *std_cmake_args
    system "make", "install"
    (share+"test").install "examples/enkiTest"
  end

  test do
    system "#{share}/test/enkiTest"
  end
end
