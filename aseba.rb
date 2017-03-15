require "formula"

class Aseba < Formula
  homepage "http://aseba.wikidot.com"
  url "https://github.com/aseba-community/aseba.git",
    :using => :git,
    :tag => "1.5.5"
  head "https://github.com/aseba-community/aseba.git"

  head do
    depends_on "protobuf"
  end
  
  depends_on "cmake" => :build
  depends_on "cartr/qt4/qt"
  depends_on "cartr/qt4/qwt-qt4"
  depends_on "dashel"
  depends_on "enki"
  depends_on "d-bus" => :recommended

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/asebacmd"
  end
end
