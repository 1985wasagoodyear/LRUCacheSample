//
//  ListNode.swift
//  Created 6/23/20
//  Using Swift 5.0
// 
//  Copyright © 2020 K Y. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

open class ListNode<Value> {
    public var value: Value
    public weak var prev: ListNode?
    public var next: ListNode?
    public init(_ value: Value,
                prev: ListNode? = nil,
                next: ListNode? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}
