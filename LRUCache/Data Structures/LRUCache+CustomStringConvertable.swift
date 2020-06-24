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

extension LRUCache: CustomStringConvertible, CustomDebugStringConvertible where Key: CustomStringConvertible, Value: CustomStringConvertible {
    public var debugDescription: String {
        """
        Capacity: \(size) / \(capacity)
        Map Contents: \n\(map)
        Queue Contents: \n\(queue)
        """
    }
    
    public var description: String {
        return queue.description
    }
    
    public func getAndPrint(_ key: Key) {
        print(get(key)?.description ?? "nil")
    }
}
