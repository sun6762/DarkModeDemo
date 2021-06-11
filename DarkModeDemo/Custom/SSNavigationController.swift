//
//  SSNavigationController.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

class SSNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 设置导航栏颜色
        self.navigationBar.barTintColor = UIColor.dynamicColor(UIColor.yellow, darkColor: UIColor.orange)
        self.navigationBar.isTranslucent = true
        self.navigationBar.setBackgroundImage(nil, for: .default)
        
        /// 设置标题
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.dynamicColor(UIColor.red, darkColor: UIColor.green), NSAttributedString.Key.font: UIFont.init(name: "PingFangSC-Medium", size: 14)!]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            let button = UIButton.init(type: .custom)
            button.setImage(UIImage.init(named: "back"), for: .normal)
            button.setImage(UIImage.init(named: "back"), for: .highlighted)
            button.frame = .init(x: 0, y: 0, width: 30, height: 30)
            button.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem =  UIBarButtonItem.init(customView: button)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @objc
    private func clickBack() -> () {
        self.popViewController(animated: true)
    } 
}
