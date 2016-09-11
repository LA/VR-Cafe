//
//  GameLibraryViewController.swift
//  GenZi
//
//  Created by Adar Butel on 9/10/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Game"

class GameLibraryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let games = Game.getGameLibrary()
    private let gamesPerRow = 3 as CGFloat

    private let cellSpacing = 1 as CGFloat
    private var cellSize = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View Controller Title
        title = "Game Library"
        
        // Set background color to black
        collectionView?.backgroundColor = UIColor.blackColor()
        
        // When you drag, the collection view bounces
        collectionView?.alwaysBounceVertical = true
        
        // Set Cell Size According Games Per Row
        // let cellHeight = ((collectionView!.frame.height) / gamesPerRow) - (layout.sectionInset.top + layout.sectionInset.bottom)
        let cellWidth = ((collectionView!.frame.width) / gamesPerRow) - cellSpacing
        let cellHeight = cellWidth
        cellSize = CGSizeMake(cellWidth, cellHeight)

        // Register Cell Class
        self.collectionView!.registerClass(GameLibraryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Hide Nav Bar While Scrolling
        navigationController?.hidesBarsOnSwipe = true
        
        // Add Back Bar Button
        //let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: nil)
        //navigationItem.leftBarButtonItem = backButton
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return games.count
        return 45
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        // Set properties
        
    
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSize
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellSpacing
    }
}
