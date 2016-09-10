//
//  Game.swift
//  GenZi
//
//  Created by Adar Butel on 9/10/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import Foundation
import UIKit

struct Game {
    
    var title: String
    var description: String
    var image: UIImage
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
    
    static func getGameLibrary() -> [Game] {
        return [Game]()
    }
}