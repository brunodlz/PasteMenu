import Foundation

enum Type: String, CustomStringConvertible {
    case link
    case email
    case audio
    case video
    case text
    
    var description: String {
        switch self {
        case .link: return "LINK"
        case .email: return "EMAIL"
        case .audio: return "MUSIC"
        case .video: return "VIDEO"
        case .text: return "TEXT"
        }
    }
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
            return Type.audio.description
        }
        else if text.containsVideo() {
            return Type.video.description
        }
        else if text.containsLink() {
            return Type.link.description
        }
        else if text.containsEmail() {
            return Type.email.description
        }
        return Type.text.description
    }
    
}
