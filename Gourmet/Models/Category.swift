//
//  Category.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

protocol Category{
    var id: Int64 {get set}
    var name: String {get set}
    var description: String {get set}
    var imageUrl: String {get set}
    var items: [ItemModel] {get set}
}

struct CategoryModel: Category, Codable{
    var id: Int64
    var name: String
    var description: String
    var imageUrl: String
    var items: [ItemModel]
    
    init(id: Int64, name: String, description: String, imageUrl: String, items: [ItemModel]) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.items = items
    }
}

