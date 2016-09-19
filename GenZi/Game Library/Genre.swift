//
//  Genre.swift
//  GenZi
//
//  Created by Adar Butel on 9/18/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import Foundation

enum Genre: String {
    case action = "Action"
    case adventure = "Adventure"
    case kids = "Kids"
    case shooter = "Shooter"
    
    static func getGenres() -> [Genre] {
        return [action, adventure, kids, shooter]
    }
}
