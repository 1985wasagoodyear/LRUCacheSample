//
//  Queue.swift
//  Created 6/23/20
//  Using Swift 5.0
// 
//  Copyright © 2020 K Y. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

public class Queue<Key, Value> {
    
    public typealias QueueNode = ListNode<(Key, Value)>
    
    var capacity: Int
    var size: Int
    public var head: QueueNode?
    public weak var tail: QueueNode?
    
    public init(_ capacity: Int) {
        assert(capacity > 0)
        size = 0
        self.capacity = capacity
    }
    
    /// places the given node at the front of the queue
    /// can return the tail poppped, if exists
    @discardableResult
    public func push(_ node: QueueNode?) -> QueueNode? {
        // empty queue
        if head == nil {
            tail = node
        }
        // max capacity? time to dump the tail
        else if size == capacity {
            let popNode = tail
            head?.prev = node
            node?.next = head
            head = node
            tail = tail?.prev
            tail?.next = nil
            return popNode
        }
        // otherwise, adding new node
        else {
            head?.prev = node
            node?.next = head
        }
        // assign to head, increase size
        head = node
        size += 1
        return nil
    }
    
    @discardableResult
    public func peek() -> QueueNode? {
        return head
    }
    
    /// unsafe function, does not check if the queue contains the node
    public func remove(_ node: QueueNode?) {
        let prev = node?.prev
        let next = node?.next
        next?.prev = prev
        prev?.next = next
        // remove if it is the head
        if head === node {
            head = nil
        }
        // remove if it is the tail
        if tail === node {
            tail = node?.prev
        }
        size -= 1
    }
    
}
