//
//  ViewExtensions.swift
//  GenZi
//
//  Created by Adar Butel on 9/9/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

extension UIColor {
    @nonobjc static let genziPurple = UIColor(red: 102/255, green: 96/255, blue: 176/255, alpha: 1.0)
}

// Common Use Properties
let buttonFontSize = 35 as CGFloat
let headerFontSize = 20 as CGFloat
let cornerRadius = 75 as CGFloat

// Visual Format Extension
extension UIView {
    
    func addConstraints(withFormat format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
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

// UIButton Extension
extension UIButton {
    
    @nonobjc static let homeButtonRect = CGRect(x: 0, y: 0, width: 150, height: 150)
    
    func layedOut() -> UIButton {
        let button = self
        button.backgroundColor = .genziPurple
        button.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
//        button.layer.cornerRadius = cornerRadius
        button.layer.cornerRadius = button.layer.bounds.size.width / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

