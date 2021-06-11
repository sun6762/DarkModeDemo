//
//  MineVC.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

class MineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.dynamicColor(.white, darkColor: .gray)
        
        
        let button = UIButton.init(frame: .init(x: 100, y: 100, width: 150, height: 30))
        view.addSubview(button)
        button.setTitle("切换浅色/深色", for: .normal)
        button.setTitleColor(UIColor.dynamicColor(.black, darkColor: .white), for: .normal)
        button.addTarget(self, action: #selector(tapForSwitch), for: .touchUpInside)
    }
    
    @objc
    private
    func tapForSwitch() {
        navigationController?.pushViewController(SSSwitchVC(), animated: true)
    }
    
}
