//
//  Common.swift
//  DarkModeDemo
//
//  Created by bobo on 2021/6/10.
//

import Foundation

// MARK: - UserDefaults -
@propertyWrapper
struct SSUserDefaults<T> {
    
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get{
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}


struct SSUserDefaultsConfig {
    
    /// 是否跟随手机的 darkMode
    @SSUserDefaults("SSIsFollowUserInterfaceStyle", defaultValue: false)
    static var isFollowUserInterfaceStyle: Bool
    
    /// 当前的darkMode
    @SSUserDefaults("SSCurrentUserInterfaceStyle", defaultValue: "")
    static var currentUserInterfaceStyle: String
}
