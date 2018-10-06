//
//  Item.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 21.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit
let dummyItems: [Item] = [Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1),Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1),Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1),Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1),Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1),Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1),Item(id: 1, name: "asd", ingredients: "asd", imageUrl: "asd", rating: 1, rateNumber: 1, price: 1, vegan: false, calories: 1)]
struct Item: Codable{
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

