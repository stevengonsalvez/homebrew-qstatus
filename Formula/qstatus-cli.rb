class QstatusCli < Formula
  desc "CLI dashboard for real-time Amazon Q Developer usage monitoring"
  homepage "https://github.com/stevengonsalvez/qstatus"
  url "https://github.com/stevengonsalvez/qstatus/releases/download/v1.0.0/qstatus-cli-macos.tar.gz"
  sha256 "a008295cbeff365d04177bcd4d07cd370c1961442fd405756c759888ab2c3b7f"
  version "1.0.0"
  license "MIT"

  def install
    bin.install "q-status" => "qstatus"
  end

  test do
    assert_match "Q Status CLI", shell_output("#{bin}/qstatus --help 2>&1", 1)
  end

  def caveats
    <<~EOS
      QStatus CLI has been installed as 'qstatus'.
      
      Usage:
        qstatus -i    # Interactive dashboard
        qstatus       # Quick status check
        qstatus --json # JSON output for scripts
      
      For the menubar app, install with:
        brew install --cask qstatus-menu
    EOS
  end
end