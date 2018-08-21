//
//  Item.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

protocol Item{
    var id: String {get set}
    var name: String {get set}
    var description: String {get set}
    var imageUrl: String {get set}
    var rating: Double {get set}
    var rateNumber: Int {get set}
    var price: Double {get set}
    var currency: String {get set}
}

struct ItemModel: Item, Codable{
    var id: String
    var name: String
    var description: String
    var imageUrl: String
    var rating: Double
    var rateNumber: Int
    var price: Double
    var currency: String
    
    init(id: String, name: String, description: String, imageUrl: String, rating: Double, rateNumber: Int, price: Double, currency: String) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.rating = rating
        self.rateNumber = rateNumber
        self.price = price
        self.currency = currency
    }
    
}
