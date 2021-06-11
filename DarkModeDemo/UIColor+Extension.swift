//
//  UIColor+Extension.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/3.
//

import Foundation
import UIKit

extension UIColor {
    
    static func dynamicColor(_ lightColor: UIColor, darkColor: UIColor? = UIColor.white)  -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return lightColor
                }else{
                    return darkColor!
                }
            }
        } else {
            return lightColor
        }
    }
}
