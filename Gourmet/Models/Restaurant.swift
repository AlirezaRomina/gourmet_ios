//
//  Restaurant.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 23.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

struct Restauran: Codable{
    var id: Int64
    var name: String
    var description: String
    var imageUrl: String
    var categories: [Category]
    init(id: Int64, name: String, description: String, imageUrl: String, categories: [Category]) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.categories = categories
    }
}
