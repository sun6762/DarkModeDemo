//
//  SSSwitchVC.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

class SSSwitchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        
        view.backgroundColor = UIColor.dynamicColor(.white, darkColor: .gray)
        
        let button = UIButton.init(frame: .init(x: 100, y: 100, width: 150, height: 30))
        view.addSubview(button)
        button.setTitle("切换浅色/深色", for: .normal)
        button.setTitleColor(UIColor.dynamicColor(.black, darkColor: .white), for: .normal)
        button.addTarget(self, action: #selector(tapForSwitch), for: .touchUpInside)
        
        
        
        let label = UILabel.init(frame: .init(x: 30, y: 150, width: 200, height: 30))
        label.text = "是否跟随系统Dark Mode"
        view.addSubview(label)
        
        
        let darkModeSwitch = UISwitch.init(frame: .init(x: label.frame.maxX + 30, y: 150, width: 50, height: 30))
        view.addSubview(darkModeSwitch)
        darkModeSwitch.isOn = false
        darkModeSwitch.addTarget(self , action:#selector(tapForSwitchFollowDarkMode(sender:)), for: .valueChanged)
        
        
        let attrLabel = UILabel.init(frame: .init(x: 30, y: 200, width: 200, height: 30))
        view.addSubview(attrLabel)
        
        let attr = NSMutableAttributedString.init(string: "这是", attributes: [NSAttributedString.Key.foregroundColor : UIColor.dynamicColor(UIColor.red, darkColor: UIColor.orange)])
        attr.append(NSAttributedString.init(string: "富文本", attributes: [NSAttributedString.Key.foregroundColor : UIColor.dynamicColor(UIColor.black, darkColor: UIColor.white)]))
        attrLabel.attributedText = attr
        
        let imgV = UIImageView.init(image: UIImage.init(named: "back"))
        view.addSubview(imgV)
        imgV.center = view.center
        
        navigationItem.title = "设置"
    }
    
    @objc
    private
    func tapForSwitchFollowDarkMode(sender: UISwitch) {
        SSUserDefaultsConfig.isFollowUserInterfaceStyle = sender.isOn
    }
     
    
    @objc
    private
    func tapForSwitch() {
        if #available(iOS 13.0, *) {
            if UIApplication.shared.keyWindow?.overrideUserInterfaceStyle == UIUserInterfaceStyle.dark {
                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
                SSUserDefaultsConfig.currentUserInterfaceStyle = "light"
            }else if UIApplication.shared.keyWindow?.overrideUserInterfaceStyle == UIUserInterfaceStyle.light {
                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
                SSUserDefaultsConfig.currentUserInterfaceStyle = "dark"
            }else{
                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
                SSUserDefaultsConfig.currentUserInterfaceStyle = "light"
            }
        } else {
            
        }
    }
}
