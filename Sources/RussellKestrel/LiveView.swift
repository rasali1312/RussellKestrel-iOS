import SwiftUI

struct LiveView: View {
    private let channels = Array(1...16)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4)], spacing: 4) {
                    ForEach(channels, id: \.self) { channel in
                        CameraTile(channel: channel)
                            .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    }
                }
                .padding(4)
            }
            .navigationTitle("Live View")
        }
    }
}

struct CameraTile: View {
    let channel: Int

    var body: some View {
        ZStack(alignment: .topLeading) {
            if channel <= 5, let url = KestrelConfig.rtspURL(channel: channel) {
                VLCPlayerView(url: url)
            } else {
                Color.black
            }
            Text("CAM \(channel)")
                .font(.caption2.weight(.semibold))
                .padding(.horizontal, 5)
                .padding(.vertical, 3)
                .background(.black.opacity(0.65))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(4)
        }
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}
