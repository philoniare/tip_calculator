//
//  HistoryViewController.swift
//  Tipster
//
//  Created by Philoniare on 8/8/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        let realm = try! Realm()
        let allBills = realm.objects(BillRecord)
        print(allBills)
    }
}