import Foundation

struct PasteMenuViewModel {
    
    var links = [String]()
    
    func numberOfRows() -> Int {
        return links.count
    }
    
    func get(link row: Int) -> String {
        return links[row]
    }
    
    mutating func set(link newLink: String) {
        links.append(newLink)
    }
}
