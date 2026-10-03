import SwiftUI

struct LiveView: View {
    @EnvironmentObject private var store: ConfigStore
    @State private var selectedLayout = 4

    private var channels: [Int] { Array(1...min(16, store.config.channelCount)) }
    private var columns: [GridItem] { Array(repeating: GridItem(.flexible(), spacing: 3), count: selectedLayout) }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 3) {
                    ForEach(channels, id: \.self) { channel in
                        CameraTile(channel: channel, config: store.config)
                            .aspectRatio(16.0 / 9.0, contentMode: .fit)
                    }
                }
                .padding(3)
            }
            .background(.black)
            .navigationTitle("Russell Viewer")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("1 × 1") { selectedLayout = 1 }
                        Button("2 × 2") { selectedLayout = 2 }
                        Button("3 × 3") { selectedLayout = 3 }
                        Button("4 × 4") { selectedLayout = 4 }
                    } label: {
                        Image(systemName: "square.grid.2x2")
                    }
                }
            }
        }
    }
}

struct CameraTile: View {
    let channel: Int
    let config: KestrelConfig

    var body: some View {
        ZStack(alignment: .topLeading) {
            if let url = config.rtspURL(channel: channel) {
                VLCPlayerView(url: url)
            } else {
                Color.black
            }
            Text("CAM \(channel)")
                .font(.caption2.weight(.semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(.black.opacity(0.7))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(4)
        }
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
