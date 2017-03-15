require "formula"

class Aseba < Formula
  homepage "http://aseba.wikidot.com"
  url "https://github.com/aseba-community/aseba/archive/1.5.5.tar.gz"
  sha256 "ec2f417a96de9deecefcf6ceb61b4227bea14546a79de02dc42e8be9e7aa630a"
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
