//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Philoniare on 8/4/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipIndex = defaults.integerForKey("tipIndex")
        tipControl.selectedSegmentIndex = tipIndex
    }
    
    @IBAction func onTipChanged(sender: AnyObject) {
        let tipIndex = tipControl.selectedSegmentIndex
        
        // Store the tipIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipIndex, forKey: "tipIndex")
        defaults.synchronize()
    }
}
