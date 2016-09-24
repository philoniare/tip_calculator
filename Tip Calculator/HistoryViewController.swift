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
    
    override func viewWillAppear(_ animated: Bool) {   
        Realm.Configuration.defaultConfiguration = Utils.getRealmConfig()
        
        // delete entries that were added more than 10 minutes ago
        deleteOldEntries()
        
        
        // populate the list with bills from storage
        let realm = try! Realm()
        storedBills = realm.objects(BillRecord.self)
    }
    
    func deleteOldEntries() {
        let realm = try! Realm()
        storedBills = realm.objects(BillRecord.self)
        let tenMinAgo = NSDate().addingTimeInterval(-60*10)
        for storedBill in storedBills {
            if(storedBill.billDate.compare(tenMinAgo as Date) == .orderedAscending) {
                try! realm.write {
                    realm.delete(storedBill)
                }
            }
        }
    }
    
    override func viewDidLoad() {
         billTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storedBills.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.billTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = String(Utils.numToCurrency(amount:
            self.storedBills[(indexPath as NSIndexPath).row].billAmount))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
