//
//  File.swift
//  
//
//  Created by Joshua Button on 5/29/20.
//

import Foundation
import GRDB

struct Database {
    static func initialize() {
        let dbPool = try! DatabasePool(path: "database.sqlite")
    }
}
