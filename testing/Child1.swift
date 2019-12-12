//
//  Child1.swift
//  testing
//
//  Created by Marcelo Sampaio on 12/12/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import Foundation


class Child1 {
    
    var id = String()
    var longDescription = String()
    var summary = [Child2]()
    
    init() {
        self.id = String()
        self.longDescription = String()
        self.summary = [Child2]()
    }
    
    public func dictionaryRepresentation() -> [String:Any?] {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.longDescription, forKey: "longDescription")
        
        var childArray = [NSDictionary]()
        for child in self.summary {
            let childDic = child.dictionaryRepresentation()
            childArray.append(childDic as NSDictionary)
        }
    
        dictionary.setObject(childArray, forKey: "summary" as NSCopying)

        return dictionary as! [String : Any?]
        
    }
    
}
