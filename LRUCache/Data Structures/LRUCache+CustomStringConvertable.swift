//
//  LRUCache+CustomStringConvertable.swift
//  Created 6/23/20
//  Using Swift 5.0
// 
//  Copyright © 2020 K Y. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

extension LRUCache: CustomStringConvertible where Key: CustomStringConvertible, Value: CustomStringConvertible {
    public var description: String {
        return queue.description
    }
    
    public func getAndPrint(_ key: Key) {
        if let value = get(key) {
            print(value)
        } else {
            print("nil")
        }
    }
}
