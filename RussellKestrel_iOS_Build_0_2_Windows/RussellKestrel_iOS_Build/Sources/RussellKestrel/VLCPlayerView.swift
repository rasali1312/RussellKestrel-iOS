import SwiftUI
import UIKit
import VLCKit

struct VLCPlayerView: UIViewRepresentable {
    let url: URL

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        let player = VLCMediaPlayer()
        player.drawable = view
        player.media = VLCMedia(url: url)
        context.coordinator.player = player
        context.coordinator.currentURL = url
        player.play()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard context.coordinator.currentURL != url else { return }
        context.coordinator.currentURL = url
        let player = context.coordinator.player ?? VLCMediaPlayer()
        player.drawable = uiView
        player.stop()
        player.media = VLCMedia(url: url)
        context.coordinator.player = player
        player.play()
    }

    static func dismantleUIView(_ uiView: UIView, coordinator: Coordinator) {
        coordinator.player?.stop()
        coordinator.player?.drawable = nil
        coordinator.player = nil
    }

    final class Coordinator {
        var player: VLCMediaPlayer?
        var currentURL: URL?
    }
}
