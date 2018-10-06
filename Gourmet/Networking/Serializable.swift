//
//  Serializable.swift
//  TestProject
//
//  Created by Deniz Mersinlioğlu on 30.09.2018.
//  Copyright © 2018 mersinliogludeniz. All rights reserved.
//

import Foundation

protocol Serializable: Codable {
    func serialize() -> Data?
}

extension Serializable {
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
