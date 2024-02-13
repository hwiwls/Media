//
//  TabBarViewController.swift
//  Media
//
//  Created by hwijinjeong on 2/14/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarConfig()
        
        view.backgroundColor = .darkGray
    }
    
    private func tabBarConfig() {
        tabBar.barTintColor = .darkGray
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        
        let contentOverviewViewController = UINavigationController(
            rootViewController: ContentOverviewViewController()
        )
        
        let myPageViewController = UINavigationController(
            rootViewController: MyPageViewController()
        )
        
        contentOverviewViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house")?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "house")
        )
        
        
        myPageViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person.fill")?
                .withRenderingMode(.alwaysOriginal)
                .withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        
        let tabItems = [
            contentOverviewViewController,
            myPageViewController
        ]
        
//        tabItems.forEach {
//            $0.isNavigationBarHidden = true
//            $0.navigationBar.isTranslucent = false
//        }
        
        setViewControllers(tabItems, animated: true)
    }

}
