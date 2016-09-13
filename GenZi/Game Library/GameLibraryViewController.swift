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
    
    // Timer for segue fade.
    private var timer = NSTimer()
    private let timerDelay = 0.0125
    // Rate of change in the alpha during fade.
    private let alphaRate = 0.05 as CGFloat
    
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
        navigationController?.hidesBarsOnSwipe = false
        
        // Add Back Bar Button
        //let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: nil)
        //navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewWillAppear(animated: Bool) {
        // Turn off Timer to avoid bugs.
        timer.invalidate()
        
        // Set Timer to Increase Alpha over Time
        timer = NSTimer.scheduledTimerWithTimeInterval(timerDelay, target: self, selector: #selector(increaseAlpha), userInfo: nil, repeats: true)
    }
    
    // MARK: Custom Methods
    // Used to create the fade when segueing into a detail
    func increaseAlpha() {
        if collectionView!.alpha >= 1 {
            timer.invalidate()
        } else {
            collectionView?.alpha += alphaRate
        }
    }
    
    func lowerAlpha() {
        if collectionView!.alpha <= 0 {
            timer.invalidate()
        } else {
            collectionView?.alpha -= alphaRate * 4
        }
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
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Create Detail View Controller to Open
        let detailVc = GameDetailViewController()
        
        // Set Detail VC Game to Game it Clicked
        //detailVc.game = games[indexPath.row]
        
        // Turn off Timer to avoid bugs.
        timer.invalidate()
        
        // Set Timer to Lower Alpha over Time
        timer = NSTimer.scheduledTimerWithTimeInterval(timerDelay, target: self, selector: #selector(lowerAlpha), userInfo: nil, repeats: true)
        
        // Push Detail View Controller on to Stack
        navigationController?.pushViewController(detailVc, animated: true)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellSpacing
    }
}
