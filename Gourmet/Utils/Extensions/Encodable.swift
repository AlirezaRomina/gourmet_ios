//
//  Encodable.swift
//  Gourmet
//
//  Created by Deniz Mersinlioğlu on 20.10.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

extension Encodable {
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    func prettyPrinted() -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(self)
        return String(data: data, encoding: .utf8)!
    }
    
    func toDict() -> [String: Any] {
        do {
            return try JSONSerialization.jsonObject(with: self.serialize()!, options: []) as! [String: Any]
        } catch {
            print("Can't convert to dictionary")
            return [:]
        }
    }
}
