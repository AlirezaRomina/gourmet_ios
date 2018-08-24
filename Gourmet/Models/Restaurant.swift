//
//  Restaurant.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 23.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

protocol Restaurant{
    var id: Int64 {get set}
    var name: String {get set}
    var description: String {get set}
    var imageUrl: String {get set}
    var categories: [CategoryModel] {get set}
}

struct RestaurantModel: Restaurant, Codable{
    var id: Int64
    var name: String
    var description: String
    var imageUrl: String
    var categories: [CategoryModel]
    init(id: Int64, name: String, description: String, imageUrl: String, categories: [CategoryModel]) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.categories = categories
    }
}
