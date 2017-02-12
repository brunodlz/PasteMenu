import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    fileprivate var statusItem: NSStatusItem!
    fileprivate var popover: NSPopover!
    
    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem.image = NSImage(named: "pastemenu")
        statusItem.target = self
        statusItem.action = #selector(showPaste(_:))
        statusItem.highlightMode = true
        
        popover = NSPopover()
        popover.contentViewController = PasteMenuViewController(nibName: "PasteMenuViewController",
                                                                bundle: nil)
    }

    @objc fileprivate func showPaste(_ sender: NSStatusBarButton) {
        
        guard !popover.isShown else {
            popover.close()
            return
        }
        popover.show(relativeTo: sender.bounds, of: sender, preferredEdge: .minY)
    }
    
}

