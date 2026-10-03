import SwiftUI

struct PlaybackView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 42))
                Text("DVR Playback")
                    .font(.title2.bold())
                Text("The iPhone app will use the Kestrel DVR HDD archive here. The old ActiveX playback cannot run directly on iOS, so this screen is reserved for the native DVR playback protocol.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
            }
            .navigationTitle("Playback")
        }
    }
}
