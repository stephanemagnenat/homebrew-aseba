require "formula"

class Enki < Formula
  homepage "http://home.gna.org/enki"
  url "https://github.com/enki-community/enki/archive/2.0-pre.20170315.tar.gz"
  sha256 "ad9fc6e6388d1d89c96588b7010992b27da83bc2c61069d730e99f1b7c1b86d5"

  depends_on "cmake" => :build
  depends_on "qt"
  depends_on "sdl"
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
