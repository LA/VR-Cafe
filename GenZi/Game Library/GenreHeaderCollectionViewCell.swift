//
//  GenreHeaderCollectionViewCell.swift
//  GenZi
//
//  Created by Adar Butel on 9/18/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

class GenreHeaderCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Genre Label
    let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre"
        label.font = UIFont.systemFont(ofSize: headerFontSize)
        label.textColor = .genziPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        
        backgroundColor = .white
        layer.borderColor = UIColor.genziPurple.cgColor
        layer.borderWidth = 3.0
        
        addSubview(genreLabel)
        
        // Set Label Centered Horizontally and Vertically
        addConstraint(NSLayoutConstraint(item: genreLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: genreLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
}
