class OctobuildAT140 < Formula
  desc "Compiler cache for Unreal Engine"
  homepage "https://github.com/octobuild/octobuild"
  url "https://github.com/octobuild/octobuild/archive/refs/tags/1.4.0.tar.gz"
  sha256 "559fa141ccc7d8b23f4bf063928c7abed24af78c9e87f1d0e240fe120021c2af"
  license "MIT"
  head "https://github.com/octobuild/octobuild.git", branch: "master"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output bin/"xgConsole"
    assert_match "Current configuration", output
    assert_match "cache_limit_mb", output
  end
end
