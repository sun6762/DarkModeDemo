//
//  AppDelegate.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = SSTabBarVC() 
        
        // 设置 darkMode
        if #available(iOS 13.0, *) {
            if SSUserDefaultsConfig.isFollowUserInterfaceStyle == true {
                /// 跟随系统的dark Mode
                window?.overrideUserInterfaceStyle = UITraitCollection.current.userInterfaceStyle
                if UITraitCollection.current.userInterfaceStyle == .light {
                    SSUserDefaultsConfig.currentUserInterfaceStyle = "light"
                } else if UITraitCollection.current.userInterfaceStyle == .dark {
                    SSUserDefaultsConfig.currentUserInterfaceStyle = "dark"
                }
            } else{
                if SSUserDefaultsConfig.currentUserInterfaceStyle == "dark" {
                    window?.overrideUserInterfaceStyle = UIUserInterfaceStyle.dark
                }else if SSUserDefaultsConfig.currentUserInterfaceStyle == "light" {
                    window?.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
                }else {
                    window?.overrideUserInterfaceStyle = UIUserInterfaceStyle.unspecified
                }
            }
        }
        
        return true
    }
    
    
}

