# Task 5.1 of release-distribution: Formula/pbxedit.rb in the tap
# (tap: simplekube-ro/homebrew-tap). Fill the <...> values on the
# first release; the release workflow rewrites `url` and `sha256` from then
# on. The version is derived from the url (an explicit `version` line is a
# `brew audit` warning). `license` waits on task 1.2.

class Pbxedit < Formula
  desc "Manage file membership in an Xcode project.pbxproj"
  homepage "https://github.com/simplekube-ro/pbxedit"
  url "https://github.com/simplekube-ro/pbxedit/releases/download/v1.3.0/pbxedit-1.3.0-macos-universal.tar.gz"
  sha256 "6105f6218b7463e007416a0aeefcb362c4c7d5033c3c470aa6791c2a638034ad"
  license "MIT"

  depends_on :macos

  on_macos do
    depends_on macos: :ventura
  end

  def install
    bin.install "pbxedit"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pbxedit --version").strip
  end
end
