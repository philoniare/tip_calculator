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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.selectedSegmentIndex = UserPreferences.getDefaultRateIndex()
    }
    
    @IBAction func onTipChanged(_ sender: AnyObject) {
        let tipIndex = tipControl.selectedSegmentIndex
        
        // Store the tipIndex
        UserPreferences.setDefaultRateIndex(tipIndex)
    }
}
