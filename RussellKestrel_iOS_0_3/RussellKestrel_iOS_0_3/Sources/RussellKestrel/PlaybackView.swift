import SwiftUI
import WebKit

struct PlaybackView: View {
    @EnvironmentObject private var store: ConfigStore

    var body: some View {
        NavigationStack {
            VStack(spacing: 14) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 40))
                Text("DVR Playback")
                    .font(.title2.bold())
                Text("The native HDD playback protocol is kept separate from the Windows ActiveX viewer. The Kestrel Web interface can be opened below while native archive protocol work continues.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                if let url = URL(string: store.config.webURL) {
                    NavigationLink("Open Kestrel Web Playback") {
                        KestrelWebView(url: url)
                            .ignoresSafeArea(edges: .bottom)
                            .navigationTitle("Kestrel Web")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Playback")
        }
    }
}

struct KestrelWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        let view = WKWebView(frame: .zero, configuration: configuration)
        view.load(URLRequest(url: url))
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
