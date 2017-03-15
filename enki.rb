require "formula"

class Enki < Formula
  homepage "http://home.gna.org/enki"
  url "https://github.com/enki-community/enki/archive/2.0-pre.20170315.tar.gz"
  sha256 "f4d25604e754a80d2341e92d6d0e5e33479a66e6285a978c05252fc1b96c8025"

  depends_on "cmake" => :build
  depends_on "cartr/qt4/qt"
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
