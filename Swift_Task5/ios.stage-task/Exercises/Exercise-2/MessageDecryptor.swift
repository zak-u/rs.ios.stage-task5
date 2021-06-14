import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        if (message.count <= 60) && ( message.count >= 1) {
            var multiplier = 0
            //We add new word if we met a number
            var words : [(Int,String)] = []
            
            var word = ""
            var newNumber : Int? = nil
            
            for char in message {
                if char.isLetter {
                    //letter
                    word.append(char)
                }else if char.isNumber{
                    //number
                    if newNumber != nil {
                        newNumber = Int(String(newNumber!)+String(char))
                    }else {
                        words.append((multiplier,word))
                        word = ""
                        newNumber = Int(String(char))
                    }
                }else if char == "["{
                    // "["
                    if newNumber != nil {
                        multiplier = newNumber!
                        newNumber = nil
                    }
                }else if char == "]" {
                    // "]"
                    if !words.isEmpty {
                        while multiplier > 0 {
                            words[words.count - 1].1.append(word)
                            multiplier = multiplier - 1
                        }
                        word =  words[words.count - 1].1
                        multiplier = words[words.count - 1].0
                        words.removeLast()
                    }
                }
            }
            return word;
            
        }else{
            return ""
        }
    }
}
