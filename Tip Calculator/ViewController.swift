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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        
        // Fetch the default tip rate
        let tipIndex = UserPreferences.getDefaultRateIndex()
        tipControl.selectedSegmentIndex = tipIndex
        calculateTip()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip() {
        let tipPercentages = [0.15, 0.2, 0.25]
        let bill = billField.doubleValue
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = Utils.numToCurrency(amount: tip)
        totalLabel.text = Utils.numToCurrency(amount: total)
    }
    
    @IBAction func onEditingEnd(_ sender: AnyObject) {
        // Store the amount
        let currentBill = BillRecord()
        let bill = billField.doubleValue
        
        currentBill.billAmount = bill
        currentBill.billDate = NSDate()
        
        Realm.Configuration.defaultConfiguration = Utils.getRealmConfig()
        let realm = try! Realm()
        try! realm.write {
            realm.add(currentBill)
        }
    }
}

