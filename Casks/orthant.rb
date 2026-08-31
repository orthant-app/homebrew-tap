cask "orthant" do
  version "1.0.1"
  sha256 "198dc27c7ace9cdd002194c00cc9bfc005f60b8260b1e1734f9a80b6b0d7174b"

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
