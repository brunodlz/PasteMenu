import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    fileprivate var statusItem: NSStatusItem!
    
    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem.image = NSImage(named: "pastemenu")
        statusItem.target = self
        statusItem.action = #selector(showPaste(_:))
        statusItem.highlightMode = true
    }

    func applicationWillTerminate(_ aNotification: Notification) { }

    @objc fileprivate func showPaste(_ sender: NSStatusBarButton) {
        print("it's working !!!")
    }
    
}

