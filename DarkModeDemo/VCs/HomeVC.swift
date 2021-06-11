//
//  HomeVC.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.dynamicColor(.white, darkColor: .gray)
        
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle  = .light
        } else {
            // Fallback on earlier versions
        }
        
        
        navigationItem.title = "Home"
    }
}
