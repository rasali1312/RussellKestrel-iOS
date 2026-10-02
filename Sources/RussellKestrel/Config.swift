import Foundation

enum KestrelConfig {
    static let webURL = URL(string: "http://82.45.245.21:8081")!
    static let externalRTSPBase = "rtsp://82.45.245.21:8554/mode=real&idc=1&ids="

    static func rtspURL(channel: Int) -> URL? {
        guard (1...16).contains(channel) else { return nil }
        return URL(string: externalRTSPBase + String(channel))
    }
}
