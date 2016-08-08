//
//  HistoryViewController.swift
//  Tipster
//
//  Created by Philoniare on 8/8/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var billTableView: UITableView!
    var storedBills: Results<BillRecord>!
    
    override func viewWillAppear(animated: Bool) {
        // populate the list with bills from storage
        let realm = try! Realm()
        storedBills = realm.objects(BillRecord)
    }
    
    override func viewDidLoad() {
         billTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storedBills.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.billTableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = String(self.storedBills[indexPath.row].billAmount)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}