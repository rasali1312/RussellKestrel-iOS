import SwiftUI
import UIKit
import VLCKit

struct VLCPlayerView: UIViewRepresentable {
    let url: URL

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        start(url: url, on: view, coordinator: context.coordinator)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard context.coordinator.currentURL != url else { return }
        stop(coordinator: context.coordinator)
        start(url: url, on: uiView, coordinator: context.coordinator)
    }

    static func dismantleUIView(_ uiView: UIView, coordinator: Coordinator) {
        coordinator.player?.stop()
        coordinator.player?.drawable = nil
        coordinator.player = nil
    }

    private func start(url: URL, on view: UIView, coordinator: Coordinator) {
        let player = VLCMediaPlayer()
        player.drawable = view
        player.media = VLCMedia(url: url)
        coordinator.player = player
        coordinator.currentURL = url
        player.play()
    }

    private func stop(coordinator: Coordinator) {
        coordinator.player?.stop()
        coordinator.player?.drawable = nil
        coordinator.player = nil
        coordinator.currentURL = nil
    }

    final class Coordinator {
        var player: VLCMediaPlayer?
        var currentURL: URL?
    }
}
