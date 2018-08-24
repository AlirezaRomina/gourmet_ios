//
//  Item.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

protocol Item{
    var id: Int64 {get set}
    var name: String {get set}
    var ingredients: String {get set}
    var imageUrl: String {get set}
    var rating: Double {get set}
    var rateNumber: Int {get set}
    var price: Double {get set}
    var vegan: Bool {get set}
    var calories: Double {get set}
}

struct ItemModel: Item, Codable{
    var id: Int64
    var name: String
    var ingredients: String
    var imageUrl: String
    var rating: Double
    var rateNumber: Int
    var price: Double
    var vegan: Bool
    var calories: Double
    
    init(id: Int64, name: String, ingredients: String, imageUrl: String, rating: Double, rateNumber: Int, price: Double, vegan: Bool, calories: Double) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.imageUrl = imageUrl
        self.rating = rating
        self.rateNumber = rateNumber
        self.price = price
        self.vegan = vegan
        self.calories = calories
    }
    
}

struct ItemCreationModel{
    var id: Int64
    var name: String
    var ingredients: String
    var image: UIImage
    var rating: Double
    var rateNumber: Int
    var price: Double
    var vegan: Bool
    var calories: Double
    
    init(id: Int64, name: String, ingredients: String, image: UIImage, rating: Double, rateNumber: Int, price: Double, vegan: Bool, calories: Double) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.image = image
        self.rating = rating
        self.rateNumber = rateNumber
        self.price = price
        self.vegan = vegan
        self.calories = calories
    }
    
}

