//
//  SSBaseVC.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import UIKit

class SSBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.backIndicatorImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.init(named: "back")?.withRenderingMode(.alwaysOriginal)
        
        
        let backItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        
    }
    
 
    

}
