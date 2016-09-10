//
//  Instruction.swift
//  GenZi
//
//  Created by Adar Butel on 9/9/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import Foundation
import UIKit

struct Instruction {
    
    var title: String
    var description: String
    var image: UIImage
    
    init(title: String, description: String, image: UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
    
    static func getViveInstructions() -> [Instruction] {
        return [Instruction(title: "Getting Started", description: "Place the headset on your head, and use the straps above your ears to tighten or loosen the headset accordingly.", image: UIImage()), Instruction(title: "Turn on the Controllers", description: "Press the middle button BELOW the round pad to turn on the controllers. You should feel a small vibration.", image: UIImage()), Instruction(title: "Open the Game Library", description: "Press the middle button ABOVE the round pad to open the menu. Then select library with the trigger and select a game.", image: UIImage()), Instruction(title: "Have Fun", description: "Wait for your game to load, and then go have a blast.", image: UIImage())]
    }
}
