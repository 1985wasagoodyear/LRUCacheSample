//
//  Queue+CustomStringConvertable.swift
//  Created 6/23/20
//  Using Swift 5.0
// 
//  Copyright © 2020 K Y. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

extension Queue: CustomStringConvertible where Key: CustomStringConvertible, Value: CustomStringConvertible {
    public var description: String {
        var nodes: [String] = []
        nodes.reserveCapacity(size)
        var node = head
        while let value = node?.value {
            let desc = "Key: " + value.0.description
                + ", Value: " + value.1.description
            nodes.append(desc)
            node = node?.next
        }
        if nodes.isEmpty {
            return "empty"
        }
        return nodes.joined(separator: "\n")
    }
    
}
