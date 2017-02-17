import Foundation

enum Type: String, RawRepresentable {
    case link  = "LINK"
    case email = "EMAIL"
    case audio = "MUSIC"
    case video = "VIDEO"
    case text  = "TEXT"
}

struct PasteMenuViewModel {
    
    var links = [String]()
    var types = [String]()
    
    func numberOfRows() -> Int {
        return links.count
    }
    
    func get(link row: Int) -> String {
        guard row >= 0 && row <= links.count else { return "" }
        return links[row]
    }
    
    func get(type row: Int) -> String {
        guard row >= 0 && row <= links.count else { return "" }
        return types[row]
    }
    
    mutating func set(link content: String) {
        guard content.characters.count > 0 else { return }
        
        types.append(validate(text: content))
        links.append(content)
    }
    
    private func validate(text: String) -> String {
        
        if text.containsAudio() {
            return Type.audio.rawValue
        }
        else if text.containsVideo() {
            return Type.video.rawValue
        }
        else if text.containsLink() {
            return Type.link.rawValue
        }
        else if text.containsEmail() {
            return Type.email.rawValue
        }
        return Type.text.rawValue
    }
    
}
