//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Philoniare on 8/3/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = Utils.numToCurrency(tip)
        totalLabel.text = Utils.numToCurrency(total)
    }
}

