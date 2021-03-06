class Feedgnuplot < Formula
  desc "Tool to plot realtime and stored data from the command-line"
  homepage "https://github.com/dkogan/feedgnuplot"
  url "https://github.com/dkogan/feedgnuplot/archive/v1.48.tar.gz"
  sha256 "6befa4d75abe5de263d2e49091707af81bd987fe1587b9acb1ae945b8d494a7c"

  bottle do
    cellar :any_skip_relocation
    sha256 "2e4b5415f0c98796879cc86987f31fe2476e30cd679ada8e9eaad4a4fdb9cb0a" => :high_sierra
    sha256 "3f574261baac2c21abc9cc79cd86767bc7399556dc2a51befb4993928f1975b2" => :sierra
    sha256 "a062e67738fdd684e24bd0be7744ea844fa57dbe455e83e6c90ae9da0603ffac" => :el_capitan
  end

  depends_on "gnuplot"

  def install
    system "perl", "Makefile.PL", "prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    pipe_output("#{bin}/feedgnuplot --terminal 'dumb 80,20' --exit", "seq 5", 0)
  end
end
