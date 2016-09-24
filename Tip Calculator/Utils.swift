//
//  Utils.swift
//  Tipster
//
//  Created by Philoniare on 8/5/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import Foundation
import RealmSwift

class Utils {
    static func numToCurrency(amount: Double) -> String {
        let price = amount as NSNumber
        let _formatter = NumberFormatter()
        _formatter.numberStyle = .currency
        _formatter.locale = Locale.current
        return _formatter.string(from: price)!
    }
    
    static func getRealmConfig() -> Realm.Configuration {
        return Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    // migration to add the timestamp field   
                    migration.enumerateObjects(ofType: BillRecord.className()) { oldObject, newObject in
                        let billDate = NSDate()
                        newObject!["billDate"] = billDate
                    }
                }
            }
        )
    }
}
