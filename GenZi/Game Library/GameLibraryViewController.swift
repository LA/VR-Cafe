//
//  GameLibraryViewController.swift
//  GenZi
//
//  Created by Adar Butel on 9/10/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Game"
private let headerIdentifier = "HeaderCell"

class GameLibraryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let games = Game.getGameLibrary()
    private let gamesPerRow = 3 as CGFloat
    private let genres = Genre.getGenres()

    private let cellSpacing = 1 as CGFloat
    private var cellSize = CGSize()
    
    // Timer for segue fade.
    private var timer = Timer()
    private let timerDelay = 0.0125
    // Rate of change in the alpha during fade.
    private let alphaRate = 0.05 as CGFloat
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View Controller Title
        title = "Game Library"
        
        // Set background color to black
        collectionView?.backgroundColor = UIColor.black
        
        // When you drag, the collection view bounces
        collectionView?.alwaysBounceVertical = true
        
        // Set Cell Size According Games Per Row
        // let cellHeight = ((collectionView!.frame.height) / gamesPerRow) - (layout.sectionInset.top + layout.sectionInset.bottom)
        let cellWidth = ((collectionView!.frame.width) / gamesPerRow) - cellSpacing
        let cellHeight = cellWidth
        cellSize = CGSize(width: cellWidth, height: cellHeight)

        // Register Cell Class
        collectionView!.register(GameLibraryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Register Header Cell
        collectionView!.register(GenreHeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier);
        
        // Hide Nav Bar While Scrolling
        navigationController?.hidesBarsOnSwipe = false
        
        // Add Back Bar Button
        //let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: nil)
        //navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Turn off Timer to avoid bugs.
        timer.invalidate()
        
        // Set Timer to Increase Alpha over Time
        timer = Timer.scheduledTimer(timeInterval: timerDelay, target: self, selector: #selector(increaseAlpha), userInfo: nil, repeats: true)
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
            // Speed Alpha Rate * 4
            collectionView?.alpha -= alphaRate * 4
        }
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return genres.count
        // return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return games.count
        // return games.count / genres.count
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Create Detail View Controller to Open
        let detailVc = GameDetailViewController()
        
        // Set Detail VC Game to Game it Clicked
        //detailVc.game = games[indexPath.row]
        
        // Turn off Timer to avoid bugs.
        timer.invalidate()
        
        // Set Timer to Lower Alpha over Time
        timer = Timer.scheduledTimer(timeInterval: timerDelay, target: self, selector: #selector(lowerAlpha), userInfo: nil, repeats: true)
        
        // Push Detail View Controller on to Stack
        navigationController?.pushViewController(detailVc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> GenreHeaderCollectionViewCell {
        
        if kind == UICollectionElementKindSectionHeader {
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! GenreHeaderCollectionViewCell
            
            headerCell.genreLabel.text = genres[indexPath.section].rawValue
            
            return headerCell
        }
        
        return UICollectionReusableView() as! GenreHeaderCollectionViewCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 40)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
