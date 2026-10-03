import Foundation

struct KestrelConfig: Codable, Equatable {
    var webURL = "http://82.45.245.21:8081"
    var rtspHost = "82.45.245.21"
    var rtspPort = 8554
    var rtspTemplate = "rtsp://{host}:{port}/mode=real&idc=1&ids={channel}"
    var channelCount = 16

    static let `default` = KestrelConfig()

    func rtspURL(channel: Int) -> URL? {
        guard (1...channelCount).contains(channel) else { return nil }
        let value = rtspTemplate
            .replacingOccurrences(of: "{host}", with: rtspHost)
            .replacingOccurrences(of: "{port}", with: String(rtspPort))
            .replacingOccurrences(of: "{channel}", with: String(channel))
        return URL(string: value)
    }
}

@MainActor
final class ConfigStore: ObservableObject {
    @Published var config: KestrelConfig {
        didSet { save() }
    }

    private let key = "RussellKestrelConfig"

    init() {
        if let data = UserDefaults.standard.data(forKey: key),
           let saved = try? JSONDecoder().decode(KestrelConfig.self, from: data) {
            config = saved
        } else {
            config = .default
        }
    }

    func reset() { config = .default }

    private func save() {
        guard let data = try? JSONEncoder().encode(config) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
