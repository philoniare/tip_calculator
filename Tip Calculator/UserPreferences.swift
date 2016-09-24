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
        let defaults = UserDefaults.standard
        return defaults.integer(forKey: Keys.tipIndexKey)
    }
    
    static func setDefaultRateIndex(_ tipIndex: Int) {
        let defaults = UserDefaults.standard
        defaults.set(tipIndex, forKey: Keys.tipIndexKey)
        defaults.synchronize()
    }
}
