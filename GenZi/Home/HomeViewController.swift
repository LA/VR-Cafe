//
//  HomeViewController.swift
//  GenZi
//
//  Created by Adar Butel on 9/11/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        navigationController?.hidesBarsOnSwipe = true
        
        gameButton.addTarget(self, action: #selector(gamesTapped), for: .touchUpInside)
        howToButton.addTarget(self, action: #selector(howToTapped), for: .touchUpInside)
        
        setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func howToTapped() {
        let instructionVc = InstructionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(instructionVc, animated: true)
    }
    
    func gamesTapped() {
        let gameVc = GameLibraryViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(gameVc, animated: true)
    }
    
    let howToButton: UIButton = {
        let button = UIButton(frame: UIButton.homeButtonRect)
        button.setTitle("How-To", for: .normal)
        return button.layedOut()
    }()
    
    let gameButton: UIButton = {
        let button = UIButton(frame: UIButton.homeButtonRect)
        button.setTitle("Games", for: .normal)
        return button.layedOut()
    }()
    
    func setupViews() {
        view.backgroundColor = UIColor.black
        
        view.addSubview(howToButton)
        view.addSubview(gameButton)
        
        view.addConstraints(withFormat: "V:|-100-[v0]-25-[v1]-250-|", views: howToButton, gameButton)
        
        view.addConstraints(withFormat: "H:|-15-[v0]-15-|", views: howToButton)
        view.addConstraints(withFormat: "H:|-15-[v0]-15-|", views: gameButton)
        
        view.addConstraint(NSLayoutConstraint(item: gameButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: howToButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: gameButton, attribute: .height, relatedBy: .equal, toItem: howToButton, attribute: .height, multiplier: 1.0, constant: 0.0))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
