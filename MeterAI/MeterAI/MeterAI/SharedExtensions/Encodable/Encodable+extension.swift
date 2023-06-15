//
//  Encodable+extension.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 13.05.2023.
//

import Foundation


extension Encodable {
    func asDictionary() -> Dictionary<String, Any>? {
        guard let data = try? JSONEncoder().encode(self) else {
            #if DEBUG
            print("Error encoding codable object.")
            #endif
            return nil
        }
        guard let dictionary = ((try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]) as [String : Any]??) else {
            #if DEBUG
            print("Error serializing codable object.")
            #endif
            return nil
        }
        return dictionary
    }
}
