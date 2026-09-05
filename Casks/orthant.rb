cask "orthant" do
  version "1.0.2"
  sha256 "c4f25c0fc8d920cfe8585d585d1b32312f2a03561addf2c78ab9a34b77aa1dbb"

  url "https://github.com/orthant-app/orthant/releases/download/v#{version}/Orthant-#{version}.dmg",
      verified: "github.com/orthant-app/orthant/"
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
