//
//  Child2.swift
//  testing
//
//  Created by Marcelo Sampaio on 12/12/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import Foundation


class Child2 {
    var monthLabel = String()
    var month = Int()
    var points = [Int]()
    
    init() {
        self.monthLabel = String()
        self.month = Int()
        self.points = [Int]()
    }
    
    public func dictionaryRepresentation() -> [String:Any?] {
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.monthLabel, forKey: "monthLabel")
        dictionary.setValue(self.month, forKey: "month")
        dictionary.setValue(self.points, forKey: "points")
        
        return dictionary as! [String : Any?]
    }
    
}
