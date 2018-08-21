//
//  Category.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

protocol Category{
    var id: String {get set}
    var name: String {get set}
    var description: String {get set}
    var imageUrl: String {get set}
}

struct CategoryModel: Category, Codable{
    var id: String
    var name: String
    var description: String
    var imageUrl: String
    
    init(id: String, name: String, description: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
    
}
