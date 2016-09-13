//
//  HomeViewController.swift
//  GenZi
//
//  Created by Adar Butel on 9/11/16.
//  Copyright © 2016 com.adarbutel. All rights reserved.
//

import UIKit

let buttonFontSize = 35 as CGFloat

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        navigationController?.hidesBarsOnSwipe = true
        
        gameButton.addTarget(self, action: #selector(gamesTapped), forControlEvents: .TouchUpInside)
        howToButton.addTarget(self, action: #selector(howToTapped), forControlEvents: .TouchUpInside)
        
        
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
        let button = UIButton(frame: CGRectMake(0, 0, 100, 50))
        button.backgroundColor = purpleColor
        button.setTitle("How-To", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(buttonFontSize)
        return button
    }()
    
    let gameButton: UIButton = {
        let button = UIButton(frame: CGRectMake(0, 0, 100, 50))
        button.backgroundColor = purpleColor
        button.setTitle("Games", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(buttonFontSize)
        return button
    }()
    
    func setupViews() {
        view.backgroundColor = UIColor.blackColor()
        
        view.addSubview(howToButton)
        view.addSubview(gameButton)

        view.addConstraints(withFormat: "H:|-80-[v0]-80-|", views: howToButton)
        view.addConstraints(withFormat: "H:|-80-[v0]-80-|", views: gameButton)
        // view.addConstraints(withFormat: "V:|-150-[v0]-50-[v1]-150-|", views: howToButton, gameButton)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[v0]-50-[v1]-250-|", options: [.AlignAllCenterX], metrics: nil, views: ["v0": howToButton, "v1": gameButton]))
        
        view.addConstraint(NSLayoutConstraint(item: howToButton, attribute: .Height, relatedBy: .Equal, toItem: gameButton, attribute: .Height, multiplier: 1.0, constant: 0.0))
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
