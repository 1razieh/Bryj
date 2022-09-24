//
//  TabBarViewController.swift
//  BryjApp
//
//  Created by Razieh Halimi on 2022-09-22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .red
        viewControllers = [homeNavigationController(),
                           shopNavigationController(),
                           accountNavigationController(),
                           bagNavigationController()]
    }
    
    func homeNavigationController() -> UINavigationController {
        return self.makeNavigation(page: PageName.home.rawValue, itemImage: homeIcone, tag: 0)
    }
    
    func shopNavigationController() -> UINavigationController {
        return self.makeNavigation(page: PageName.shop.rawValue, itemImage: shopIcone, tag: 1)
    }
    
    func accountNavigationController() -> UINavigationController {
        return self.makeNavigation(page: PageName.account.rawValue, itemImage: accountIcone, tag: 2)
    }
    
    func bagNavigationController() -> UINavigationController {
        return self.makeNavigation(page: PageName.bag.rawValue, itemImage: bagIcone, tag: 3)
    }
    
    private func makeNavigation(page: PageName.RawValue, itemImage:UIImage?, tag:Int ) -> UINavigationController {
        let bagVC = MainViewController(PageName(rawValue: page) ?? PageName.home)
        bagVC.tabBarItem = UITabBarItem(title: page, image: itemImage, tag: tag)
        return UINavigationController(rootViewController: bagVC)
    }
}
