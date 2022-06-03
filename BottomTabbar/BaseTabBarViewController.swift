//
//  BaseTabBarViewController.swift
//  BottomTabbar
//
//  Created by Erkam on 3.06.2022.
//

import UIKit

class BaseTabBar : UITabBar {}

class BaseTabBarViewController: UITabBarController {
    
    enum Tabs {
        case home
        case library
        case search
    
        var selectedImage : UIImage {
            switch self {
            case .home:
                return UIImage(systemName: "house.fill")!.withRenderingMode(.alwaysOriginal).withTintColor(.black)
            case .library:
                return UIImage(systemName: "book.fill")!.withRenderingMode(.alwaysOriginal)
            case .search:
                return UIImage(systemName: "magnifyingglass.circle.fill")!.withRenderingMode(.alwaysOriginal)
            }
        }
    
        var unselectedImage : UIImage {
            switch self {
            case.home:
                return UIImage(systemName: "house")!.withRenderingMode(.alwaysOriginal)
            case .library:
                return UIImage(systemName: "book")!.withRenderingMode(.alwaysOriginal)
            case .search:
                return UIImage(systemName: "magnifyingglass")!.withRenderingMode(.alwaysOriginal)
            }
        }
        
    }
    
    static func tabBarController() -> BaseTabBarViewController {
        let tabBarController = BaseTabBarViewController()
        return tabBarController
    }
    
    lazy var customTabBar : BaseTabBar = {
        let tabBar = BaseTabBar(frame:self.tabBar.frame)
        return tabBar
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customTabBar)
        setValue(customTabBar,forKey: "tabBar")
        
        let homeVC = HomeViewController()
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        homeVC.tabBarItem = UITabBarItem(title:"Home", image: Tabs.home.unselectedImage, selectedImage: Tabs.home.selectedImage)
        
        let libraryVC = LibraryViewController()
        let libraryNavVC = UINavigationController(rootViewController: libraryVC)
        libraryVC.tabBarItem = UITabBarItem(title:"Library",image: Tabs.library.unselectedImage,selectedImage: Tabs.library.selectedImage)
        
        let searchVC = SearchViewController()
        let searchNavVC = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(title:"Search",image: Tabs.search.unselectedImage,selectedImage: Tabs.search.selectedImage)
        
        viewControllers = [homeNavVC,libraryNavVC,searchNavVC]
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        if let items = tabBar.items{
            for (index,item) in items.enumerated() {
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0 )
                item.tag = index
                }
        }

    }
    

   
}
