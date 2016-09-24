//
//  TipRecord.swift
//  Tipster
//
//  Created by Philoniare on 8/5/16.
//  Copyright © 2016 philoniare. All rights reserved.
//

import RealmSwift

class BillRecord: Object {
    dynamic var billAmount = 0.0
    dynamic var billDate = NSDate()
}
