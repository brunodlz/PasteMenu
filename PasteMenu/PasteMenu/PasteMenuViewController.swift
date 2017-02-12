import Cocoa

class PasteMenuViewController: NSViewController {

    @IBOutlet weak var linkTextField: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var objects = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addLinkPressed(_ sender: NSButton) {
        let text = linkTextField.stringValue
        guard text.characters.count > 0 else { return }
        
        objects.append(text)
        linkTextField.stringValue = ""
        tableView.reloadData()
    }
}

extension PasteMenuViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.make(withIdentifier: "cell", owner: self) as! NSTableCellView
        cellView.textField?.stringValue = objects[row]
        return cellView
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let link = self.objects[tableView.selectedRow]
        
        NSPasteboard.general().clearContents()
        NSPasteboard.general().setString(link, forType: NSPasteboardTypeString)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.objects.count
    }
    
}
