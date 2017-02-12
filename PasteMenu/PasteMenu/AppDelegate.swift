import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    fileprivate var statusItem: NSStatusItem!
    fileprivate var popover: NSPopover!
    
    var eventMonitor: EventMonitor?
    
    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem.image = NSImage(named: "pastemenu")
        statusItem.target = self
        statusItem.action = #selector(showPaste(_:))
        statusItem.highlightMode = true
        
        startPopover()
        startMonitor()
    }

    private func startPopover() {
        popover = NSPopover()
        popover.contentViewController = PasteMenuViewController(nibName: "PasteMenuViewController",
                                                                bundle: nil)
    }
    
    private func startMonitor() {
        eventMonitor = EventMonitor(mask: [.leftMouseDown,.rightMouseDown]) { [unowned self] (event) in
            if self.popover.isShown {
                self.closePaste(sender: event)
            }
        }
        eventMonitor?.start()
    }
    
    func closePaste(sender: AnyObject?) {
        popover.performClose(sender)
    }
    
    @objc fileprivate func showPaste(_ sender: NSStatusBarButton) {
        guard !popover.isShown else {
            popover.close()
            eventMonitor?.stop()
            return
        }
        popover.show(relativeTo: sender.bounds, of: sender, preferredEdge: .minY)
    }
    
}

