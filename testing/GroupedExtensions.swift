//
//  GroupedExtensions.swift
//  testing
//
//  Created by Marcelo Sampaio on 12/12/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import Foundation
protocol TCEJSONEncodable {
    func encodeToJSON() -> Any
}
extension Bool: TCEJSONEncodable {
    func encodeToJSON() -> Any { return self as Any }
}

extension Float: TCEJSONEncodable {
    func encodeToJSON() -> Any { return self as Any }
}

extension Int: TCEJSONEncodable {
    func encodeToJSON() -> Any { return self as Any }
}

extension Int32: TCEJSONEncodable {
    func encodeToJSON() -> Any { return NSNumber(value: self as Int32) }
}

extension Int64: TCEJSONEncodable {
    func encodeToJSON() -> Any { return NSNumber(value: self as Int64) }
}

extension Double: TCEJSONEncodable {
    func encodeToJSON() -> Any { return self as Any }
}

extension String: TCEJSONEncodable {
    func encodeToJSON() -> Any { return self as Any }
}

private func encodeIfPossible<T>(_ object: T) -> Any {
    if let encodableObject = object as? TCEJSONEncodable {
        return encodableObject.encodeToJSON()
    } else {
        return object as Any
    }
}

extension Array: TCEJSONEncodable {
    func encodeToJSON() -> Any {
        return self.map(encodeIfPossible)
    }
}

extension Dictionary: TCEJSONEncodable {
    func encodeToJSON() -> Any {
        var dictionary = [AnyHashable: Any]()
        for (key, value) in self {
            dictionary[key as! NSObject] = encodeIfPossible(value)
        }
        return dictionary as Any
    }
}

extension Data: TCEJSONEncodable {
    func encodeToJSON() -> Any {
        return self.base64EncodedString(options: Data.Base64EncodingOptions())
    }
}

private let dateFormatter: DateFormatter = {
    let fmt = DateFormatter()
    fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    fmt.locale = Locale(identifier: "en_US_POSIX")
    return fmt
}()

extension Date: TCEJSONEncodable {
    func encodeToJSON() -> Any {
        return dateFormatter.string(from: self) as Any
    }
}

extension UUID: TCEJSONEncodable {
    func encodeToJSON() -> Any {
        return self.uuidString
    }
}
