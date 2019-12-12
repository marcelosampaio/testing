import Foundation
import UIKit


class MainClass {

    var nome = String()
    var childs = [Child1]()
    
    init() {
        self.nome = String()
        self.childs = [Child1]()
    }
    
    public func dictionaryRepresentation() -> [String:Any?] {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.nome, forKey: "nome")
        var childArray = [NSDictionary]()
        for child in self.childs {
            let childDic = child.dictionaryRepresentation()
            childArray.append(childDic as NSDictionary)
        }
    
        dictionary.setObject(childArray, forKey: "childs" as NSCopying)

        return dictionary as! [String : Any?]
        
    }
    
}

