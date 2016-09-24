//
//  CurrencyField.swift
//  Tipster
//
//  Created by Philoniare on 8/5/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import UIKit

/// 💲Custom TextField, automatically formats to currency and vice versa
class CurrencyField: UITextField {
    var stringValue : String { return text ?? "" }
    var doubleValue : Double { return Double(integerValue) / 100 }
    var integerValue: Int    { return Int(numbersOnly) ?? 0 }
    
    // Returns the amount formatted by local currency
    var currency    : String {
        return Utils.numToCurrency(amount: doubleValue)
    }
    var numbersOnly : String {
        let numArray = stringValue.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted)
        return numArray.joined(separator: "")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(CurrencyField.editingChanged(_:)), for: .editingChanged)
        keyboardType = .numberPad
        editingChanged(self)
    }
    func editingChanged(_ sender: UITextField) { sender.text = currency }
}
