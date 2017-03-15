require "formula"

class Dashel < Formula
  homepage "https://github.com/aseba-community/dashel"
  url "https://github.com/aseba-community/dashel/archive/1.3.0.tar.gz"
  sha256 "28d8c493f023ad26a60ff6ce5566773fae64c468d31302b516db1f9f928982a8"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    (share+"test").install "portlist"
  end

  test do
    system "#{share}/test/portlist"
  end
end
