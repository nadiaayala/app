//
//  Chore.swift
//  Piggy
//
//  Created by Nadia Ayala on 29/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import RealmSwift

class Chore: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var done: Bool = false
}
