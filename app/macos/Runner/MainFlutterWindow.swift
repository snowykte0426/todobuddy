import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()

    // Keep the calendar and category list side by side from the first launch.
    let preferredSize = NSSize(width: 1120, height: 720)
    let minimumSize = NSSize(width: 800, height: 600)
    let availableSize = (screen ?? NSScreen.main).map {
      let availableContentRect = self.contentRect(forFrameRect: $0.visibleFrame)
      return NSSize(width: availableContentRect.width - 48, height: availableContentRect.height - 48)
    } ?? preferredSize

    contentMinSize = NSSize(
      width: min(minimumSize.width, availableSize.width),
      height: min(minimumSize.height, availableSize.height)
    )
    setContentSize(NSSize(
      width: min(preferredSize.width, availableSize.width),
      height: min(preferredSize.height, availableSize.height)
    ))
    center()
  }
}
