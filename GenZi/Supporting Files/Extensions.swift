//
//  ViewExtensions.swift
//  GenZi
//
//  Created by Adar Butel on 9/9/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

// Visual Format Extension
extension UIView {
    
    func addConstraints(withFormat format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}


// Random Number Extension
extension Int {
    
    static func randomIntFrom(start: Int, to end: Int) -> Int {
        var a = start
        var b = end
        // swap to prevent negative integer crashes
        if a > b {
            swap(&a, &b)
        }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
}