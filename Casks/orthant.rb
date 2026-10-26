cask "orthant" do
  version "1.1.0"
  sha256 "a020f9b8acc4dd6d878577b1f0ddc8a63fb105af2a63c1877a13030a75e0c58b"

  url "https://github.com/orthant-app/orthant/releases/download/v#{version}/Orthant-#{version}.dmg"
  name "Orthant"
  desc "Grid-based window manager driven by shortcuts or a drag-on-a-grid overlay"
  homepage "https://github.com/orthant-app/orthant"

  livecheck do
    url "https://updates.orthant.app/appcast.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.nil? }&.short_version
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "Orthant.app"

  uninstall quit: "app.orthant.orthant"

  zap script: {
        executable:   "/bin/sh",
        args:         ["-c",
                       "defaults delete app.orthant.orthant 2>/dev/null; " \
                       "/usr/bin/tccutil reset Accessibility app.orthant.orthant"],
        must_succeed: true,
      },
      trash:  [
        "~/Library/Caches/app.orthant.orthant",
        "~/Library/HTTPStorages/app.orthant.orthant",
        "~/Library/Preferences/app.orthant.orthant.plist",
        "~/Library/Saved Application State/app.orthant.orthant.savedState",
      ]
end
