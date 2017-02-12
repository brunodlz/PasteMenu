import Foundation

struct PasteMenuViewModel {
    
    var links = [String]()
    
    func numberOfRows() -> Int {
        return links.count
    }
    
    func get(link row: Int) -> String {
        
        guard row >= 0 && row <= links.count else { return "" }
        
        return links[row]
    }
    
    mutating func set(link newLink: String) {
        guard newLink.characters.count > 0 else { return }
        links.append(newLink)
    }
}
