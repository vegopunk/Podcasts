//
//  MainTabBarController.swift
//  Podcasts
//
//  Created by Денис Попов on 14.02.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import UIKit

class MainTabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .purple
        
        setupViewController()
        
        setupPlayerDetailsView()
        perform(#selector(maximizePlayerDetails), with: nil, afterDelay: 1)
        
    }
    
    @objc func minimizePlayerDetails() {
        
        
        maximizedTopAnchorConstraint.isActive = false
        
        minimizedTopAnchorConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    @objc func maximizePlayerDetails() {
        maximizedTopAnchorConstraint.isActive = true
        maximizedTopAnchorConstraint.constant = 0
        minimizedTopAnchorConstraint.isActive = false
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK:- Setup Functions
    
    var maximizedTopAnchorConstraint : NSLayoutConstraint!
    var minimizedTopAnchorConstraint : NSLayoutConstraint!
    
    fileprivate func setupPlayerDetailsView() {
        print("Setting up PlayerDetailsView...")
        
        let playerDetailsView = PlayerDetailsView.initFromNib()

        playerDetailsView.backgroundColor = .red
        
//        view.addSubview(playerDetailsView)
        view.insertSubview(playerDetailsView, belowSubview: tabBar)
        
        playerDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
    
        
        maximizedTopAnchorConstraint = playerDetailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height)
        
        maximizedTopAnchorConstraint.isActive = true
        
       minimizedTopAnchorConstraint = playerDetailsView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        
//        minimizedTopAnchorConstraint.isActive = true
        
        
        playerDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        playerDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
    
    
    
    func setupViewController() {
        viewControllers = [
            generateNavigationController(for: PodcastsSearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(for: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(for: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController , title : String , image : UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
//        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
    
    
    
    
    
    
    
    
}
