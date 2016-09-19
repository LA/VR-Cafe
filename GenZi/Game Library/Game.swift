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
    var genre: Genre
    
    init(title: String, description: String, image: UIImage, genre: Genre) {
        self.title = title
        self.description = description
        self.image = image
        self.genre = genre
    }
    
    static func getGameLibrary() -> [Game] {
        return [Game]()
    }
}
