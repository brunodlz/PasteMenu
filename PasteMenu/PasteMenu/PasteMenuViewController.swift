import Cocoa

class PasteMenuViewController: NSViewController {

    @IBOutlet weak var descriptionTextField: NSTextField!
    @IBOutlet weak var descriptionTableView: NSTableView!
    
    var viewModel = PasteMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addDescriptionPressed(_ sender: NSButton) {
        saveDescription()
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        saveDescription()
    }
    
    private func saveDescription() {
        viewModel.set(link: descriptionTextField.stringValue)
        descriptionTextField.stringValue = ""
        descriptionTableView.reloadData()
    }
}

extension PasteMenuViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        guard let column   = tableColumn else { return nil }
        
        guard let cellView = tableView.make(withIdentifier: column.identifier,
                                            owner: self) as? NSTableCellView else { return nil }

        if column.identifier == "content" {
            cellView.textField?.stringValue = viewModel.get(link: row)
            return cellView
        }
        if column.identifier == "type" {
            cellView.textField?.stringValue = " \(viewModel.get(type: row)) "
            return cellView
        }
        
        return cellView
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        let link = viewModel.get(link: descriptionTableView.selectedRow)
        
        let pasteboard = NSPasteboard.general()
        pasteboard.clearContents()
        pasteboard.setString(link, forType: NSPasteboardTypeString)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.numberOfRows()
    }
    
}
