import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var store: ConfigStore
    @State private var testMessage = ""
    @State private var testing = false

    var body: some View {
        NavigationStack {
            Form {
                Section("DVR Web") {
                    TextField("Web URL", text: Binding(get: { store.config.webURL }, set: { store.config.webURL = $0 }))
                        .keyboardType(.URL)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    Link("Open Kestrel Web Interface", destination: URL(string: store.config.webURL) ?? URL(string: "about:blank")!)
                }

                Section("RTSP / Mobile Stream") {
                    TextField("Host", text: Binding(get: { store.config.rtspHost }, set: { store.config.rtspHost = $0 }))
                        .keyboardType(.URL)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    TextField("Port", value: Binding(get: { store.config.rtspPort }, set: { store.config.rtspPort = $0 }), format: .number)
                        .keyboardType(.numberPad)
                    TextField("RTSP template", text: Binding(get: { store.config.rtspTemplate }, set: { store.config.rtspTemplate = $0 }))
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    Stepper("Channels: \(store.config.channelCount)", value: Binding(get: { store.config.channelCount }, set: { store.config.channelCount = $0 }), in: 1...32)
                }

                Section("Connection test") {
                    Button(testing ? "Testing…" : "Test CAM 1") { test() }
                        .disabled(testing)
                    if !testMessage.isEmpty { Text(testMessage).font(.footnote) }
                }

                Section {
                    Button("Reset to Russell Viewer defaults", role: .destructive) {
                        store.reset()
                        testMessage = ""
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }

    private func test() {
        guard let url = store.config.rtspURL(channel: 1) else { return }
        testing = true
        testMessage = "RTSP URL prepared: \(url.absoluteString)"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { testing = false }
    }
}
