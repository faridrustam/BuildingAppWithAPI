//
//  TabBarVC.swift
//  NetworkingAppWithAPI
//
//  Created by Farid Rustamov on 27.01.25.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        let firstVC = UINavigationController(rootViewController: PostVC())
        firstVC.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(systemName: "pencil.circle"), tag: 1)
        firstVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let secondVC = UINavigationController(rootViewController: AlbumsVC())
        secondVC.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack"), tag: 2)
        secondVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let thirdVC = UINavigationController(rootViewController: PhotoVC())
        thirdVC.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo.artframe.circle"), tag: 3)
        thirdVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let fourthVC = UINavigationController(rootViewController: UsersVC())
        fourthVC.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.circle"), tag: 4)
        fourthVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}
