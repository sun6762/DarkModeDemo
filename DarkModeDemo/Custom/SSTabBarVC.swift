//
//  SSTabBarVC.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

class SSTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let home = SSNavigationController.init(rootViewController: HomeVC())
//        home.tabBarItem.image = UIImage.init(named: "home_light")?.withRenderingMode(.alwaysOriginal)
//        home.tabBarItem.selectedImage = UIImage.init(named: "home_selected_light")?.withRenderingMode(.alwaysOriginal)
//        home.title = "Home"
////        home.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -6, right: 0)
//        home.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        
//        home.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
//        addChild(home)
        
        addChildController(viewController: HomeVC(), title: "home", imageName: "home", selectedImageName: "home_selected", textColor: UIColor.lightGray, selectedTextColor: UIColor.red, darkTextColor: UIColor.white, darkSelectedTextColor: UIColor.green)
        
        
        let mine = SSNavigationController.init(rootViewController: MineVC())
        mine.title = "Mine"
        addChild(mine)
        
        self.selectedIndex = 0
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        for nav in children {
            let index = children.firstIndex(of: nav)
            if index == 0 {
                if #available(iOS 12.0, *) {
                    /// 先前的是 dark mode
                    if previousTraitCollection?.userInterfaceStyle == .dark {
                        setupNaviagtionController(naviagtionController: nav, imageName: "home_light", selectedImageName: "home_selected_light", textColor: UIColor.lightGray, selectedTextColor: UIColor.red)
                    }else {
                        setupNaviagtionController(naviagtionController: nav, imageName: "home_dark", selectedImageName: "home_selected_dark", textColor: UIColor.white, selectedTextColor: UIColor.green)
                    }
                }else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
    private
    func addChildController(viewController: UIViewController, title: String? = "" ,imageName: String, selectedImageName: String, textColor: UIColor? = UIColor.white, selectedTextColor: UIColor? = UIColor.black, darkTextColor: UIColor? = UIColor.white, darkSelectedTextColor: UIColor? = UIColor.black) {
        let nav = SSNavigationController.init(rootViewController: viewController)
        nav.title = title
        if #available(iOS 13.0, *), UIApplication.shared.keyWindow?.overrideUserInterfaceStyle == UIUserInterfaceStyle.dark{
            setupNaviagtionController(naviagtionController: nav, imageName: "\(imageName)_dark", selectedImageName: "\(selectedImageName)_dark", textColor: darkTextColor, selectedTextColor: darkSelectedTextColor)
        }else{
            setupNaviagtionController(naviagtionController: nav, imageName: "\(imageName)_light", selectedImageName: "\(selectedImageName)_light", textColor: textColor, selectedTextColor: selectedTextColor)
        }
        
        self.addChild(nav)
    }
    
    private
    func setupNaviagtionController(naviagtionController: UIViewController, imageName: String, selectedImageName: String, textColor: UIColor? = UIColor.white, selectedTextColor: UIColor? = UIColor.black){
        naviagtionController.tabBarItem.image = UIImage.init(named: imageName)?.withRenderingMode(.alwaysOriginal)
        naviagtionController.tabBarItem.selectedImage = UIImage.init(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        naviagtionController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedTextColor ?? UIColor.black], for: .selected)
        naviagtionController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: textColor ?? UIColor.white], for: .normal)
        naviagtionController.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -6, right: 0)
    }
}
