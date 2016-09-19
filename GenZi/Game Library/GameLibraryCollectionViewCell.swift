//
//  GameLibraryCollectionViewCell.swift
//  GenZi
//
//  Created by Adar Butel on 9/10/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

class GameLibraryCollectionViewCell: UICollectionViewCell {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Game Logo Image View
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupViews() {
        
        addSubview(imageView)
        
        // Layout Constraints with Visual Format
        
        // Set Image Vertical Size to Touch Top and Bottom
        addConstraints(withFormat: "V:|[v0]|", views: imageView)
        
        // Set Image Horizontal Size to Touch Left and Right
        addConstraints(withFormat: "H:|[v0]|", views: imageView)
    }
}
