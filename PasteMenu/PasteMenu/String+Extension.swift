import Foundation

extension String {
    
    func containsAudio() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "\\.mp(3|4)$", options: [.caseInsensitive])
            return regex.numberOfMatches(in: self, options: [],
                                         range: NSMakeRange(0, self.characters.count)) > 0
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func containsVideo() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "\\.(avi|mkv)$", options: [.caseInsensitive])
            return regex.numberOfMatches(in: self,
                                         options: [], range: NSMakeRange(0, self.characters.count)) > 0
        } catch {
            fatalError(error.localizedDescription)
        }
    }
 
    func containsLink() -> Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
    }
    
    func containsEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
}
