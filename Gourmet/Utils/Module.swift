//
//  Module.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 23.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import Foundation
import Swinject

class Module {
    
    static let container = Container()
    
    class func injectDependecies(container: Container) {
        container.register(WebService.self) {_ in WebService()}
        container.register(ClientSession.self) {_ in ClientSession()}
    }
    
    class func setup() {
        injectDependecies(container: container)
    }
}
