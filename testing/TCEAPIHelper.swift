//
//  TCEAPIHelper.swift
//  testing
//
//  Created by Marcelo Sampaio on 12/12/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import Foundation

class TCEAPIHelper {
    static func rejectNil(_ source: [String:Any?]) -> [String:Any]? {
        var destination = [String:Any]()
        for (key, nillableValue) in source {
            if let value: Any = nillableValue {
                destination[key] = value
            }
        }

        if destination.isEmpty {
            return nil
        }
        return destination
    }
}
