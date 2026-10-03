import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            LiveView()
                .tabItem { Label("Live View", systemImage: "video.fill") }
            PlaybackView()
                .tabItem { Label("Playback", systemImage: "clock.arrow.circlepath") }
            SettingsView()
                .tabItem { Label("Set", systemImage: "gearshape.fill") }
        }
    }
}
