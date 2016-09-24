//
//  Utils.swift
//  Tipster
//
//  Created by Philoniare on 8/5/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import Foundation

class Utils {
    static func numToCurrency(amount: Double) -> String {
        let price = amount as NSNumber
        let _formatter = NumberFormatter()
        _formatter.numberStyle = .currency
        _formatter.locale = Locale.current
        return _formatter.string(from: price)!
    }
}
