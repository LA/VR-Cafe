//
//  InstructionViewController.swift
//  GenZi
//
//  Created by Adar Butel on 9/9/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Instruction"

class InstructionViewController: UICollectionViewController {
    
    // Instructions
    private let instructions = Instruction.getViveInstructions()
    
    // Cell Size
    private var cellWidth: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View Controller Title
        title = "How-To"
        
        // Set background color to black
        collectionView?.backgroundColor = UIColor.blackColor()
        
        // When you drag, the collection view bounces
        collectionView?.alwaysBounceVertical = true
        
        // Register Cell Class
        collectionView?.registerClass(InstructionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Create Cell Spacing Layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Set Cell Width According to Edge Insets
        cellWidth = (view.frame.width) - (layout.sectionInset.left + layout.sectionInset.right)

        // Add Layout to Collection View
        collectionView?.collectionViewLayout = layout
        
        // Hide Nav Bar While Scrolling
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    // Number of Items in CollectionView
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return instructions.count
    }
    
    // The Cells in the Collection View
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // Create Instruction Cell and Set All Neccessary Properties
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! InstructionCollectionViewCell
        
        // Set properties
        cell.titleLabel.text = instructions[indexPath.row].title
        cell.descriptionTextView.text = instructions[indexPath.row].description
        cell.imageView.image = instructions[indexPath.row].image
        
        return cell
    }
    
    // Size of each collection view item
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(cellWidth, 200)
    }
}



