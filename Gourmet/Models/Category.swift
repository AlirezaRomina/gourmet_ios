//
//  Category.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation

struct Category: Serializable{
    var id: Int64
    var name: String
    var description: String
    var imageUrl: String
    var items: [Item]
    
    init(id: Int64, name: String, description: String, imageUrl: String, items: [Item]) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.items = items
    }
}

