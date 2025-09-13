cask "qstatus-menu" do
  version "1.0.0"
  sha256 "55a92b3ba28042bdbd0b7dc79405931ef44bee19ed35464bfcdd57413a45824a"

  url "https://github.com/stevengonsalvez/qstatus/releases/download/v#{version}/QStatus.dmg"
  name "QStatus Menu"
  desc "Native macOS menubar app for Amazon Q Developer usage monitoring"
  homepage "https://github.com/stevengonsalvez/qstatus"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "QStatus.app", target: "Q Status.app"

  postflight do
    # Remove quarantine attribute to prevent Gatekeeper issues
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Q Status.app"],
                   sudo: false
  end

  uninstall quit: "com.qlips.qstatus"

  zap trash: [
    "~/Library/Preferences/com.qlips.qstatus.plist",
    "~/Library/Application Support/QStatus",
  ]
end