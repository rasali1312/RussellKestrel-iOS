import SwiftUI
import SafariServices

struct SettingsView: View {
    @State private var showWeb = false

    var body: some View {
        NavigationStack {
            List {
                Section("Kestrel") {
                    LabeledContent("DVR", value: "OYN-X Kestrel")
                    LabeledContent("Channels", value: "5 active / 16 ready")
                }
                Section("Web interface") {
                    Button("Open Kestrel Web Interface") { showWeb = true }
                }
            }
            .navigationTitle("Set")
            .sheet(isPresented: $showWeb) {
                SafariView(url: KestrelConfig.webURL)
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: Context) -> SFSafariViewController { SFSafariViewController(url: url) }
    func updateUIViewController(_ controller: SFSafariViewController, context: Context) {}
}
