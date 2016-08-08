//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Philoniare on 8/3/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var billField: CurrencyField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        
        // Fetch the default tip rate
        let tipIndex = UserPreferences.getDefaultRateIndex()
        tipControl.selectedSegmentIndex = tipIndex
        calculateTip()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip() {
        let tipPercentages = [0.15, 0.2, 0.25]
        let bill = billField.doubleValue
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = Utils.numToCurrency(tip)
        totalLabel.text = Utils.numToCurrency(total)
    }
    @IBAction func onEditingEnd(sender: AnyObject) {
        // Store the amount
        let currentBill = BillRecord()
        let bill = billField.doubleValue
        
        currentBill.billAmount = bill
        let realm = try! Realm()
        try! realm.write {
            realm.add(currentBill)
        }
    }
}

