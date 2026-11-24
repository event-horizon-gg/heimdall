import AppKit
import SwiftUI

/// The Event Horizon logo, drawn from the watermark's alpha in a single tint.
/// Heimdall keeps it neutral to match its surfaces; it sits only where there is no text.
struct EventHorizonMark: View {
    var opacity: Double = 0.06
    private static let image: NSImage? = {
        let image: NSImage?
        if let url = Bundle.main.url(forResource: "event-horizon-watermark",withExtension: "png") { image = NSImage(contentsOf: url) }
        else {
            // `--render` from an unbundled binary: read it from the repo.
            let repo = URL(fileURLWithPath: #filePath).deletingLastPathComponent().deletingLastPathComponent()
            image = NSImage(contentsOf: repo.appendingPathComponent("packaging/brand/event-horizon-watermark.png"))
        }
        image?.isTemplate = true
        return image
    }()

    var body: some View {
        if let image = Self.image {
            Image(nsImage: image).renderingMode(.template).resizable().interpolation(.high).aspectRatio(contentMode: .fit)
                .foregroundStyle(.primary).opacity(opacity).allowsHitTesting(false).accessibilityHidden(true)
        }
    }
}
