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
        let _currencyFormatter : NSNumberFormatter = NSNumberFormatter()
        _currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        _currencyFormatter.currencyCode = NSLocale.currentLocale().displayNameForKey(NSLocaleCurrencySymbol, value: NSLocaleCurrencyCode)
        return _currencyFormatter.stringFromNumber(amount)!;
    }
}