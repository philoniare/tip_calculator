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
        // migration to add the timestamp field
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    migration.enumerateObjects(ofType: BillRecord.className()) { oldObject, newObject in
                        let billDate = NSDate()
                        newObject!["billDate"] = billDate
                    }
                }
        })
        
        Realm.Configuration.defaultConfiguration = config
        
        
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
        cell.textLabel?.text = String(self.storedBills[(indexPath as NSIndexPath).row].billAmount)
        print(self.storedBills[(indexPath as NSIndexPath).row].billDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
