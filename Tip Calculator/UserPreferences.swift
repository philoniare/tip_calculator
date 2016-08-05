//
//  UserPreferences.swift
//  Tipster
//
//  Created by Philoniare on 8/5/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import Foundation

class UserPreferences {
    enum Keys {
        static let tipIndexKey = "tipIndex"
    }
    
    static func getDefaultRateIndex() -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.integerForKey(Keys.tipIndexKey)
    }
    
    static func setDefaultRateIndex(tipIndex: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipIndex, forKey: Keys.tipIndexKey)
        defaults.synchronize()
    }
}
