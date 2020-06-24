//
//  LRUCache.swift
//  Created 6/23/20
//  Using Swift 5.0
// 
//  Copyright © 2020 K Y. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

public class LRUCache<Key: Hashable, Value>{
    
    public typealias CacheNode = ListNode<(Key, Value)>
    
    var capacity: Int
    var size: Int
    var map: [Key: CacheNode]
    var queue: Queue<Key, Value>
    
    public init(_ capacity: Int) {
        map = [:]
        map.reserveCapacity(capacity)
        size = 0
        self.capacity = capacity
        queue = Queue(capacity)
    }
    
    public func get(_ key: Key) -> Value? {
        // if it exists in the queue,
        // link its neighbours together, then reassign head
        if let node = map[key] {
            let prev = node.prev
            let next = node.next
            next?.prev = prev
            prev?.next = next
            queue.push(node)
            map[key] = queue.head!
            return node.value.1
        }
        // otherwise return nil
        return nil
    }
    
    public func put(_ key: Key, _ value: Value) {
        let putHead: CacheNode
        // is it in cache?
        if let node = map[key] {
            // if so, modify this value
            // a. remove it from the linked list and close the elements around it
            queue.remove(node)
            // b. update value
            node.value.1 = value
            putHead = node
        }
        // otherwise, create a new node to insert into the cache
        else {
            putHead = CacheNode((key, value))
        }
        // did the queue have to bump something off?
        // if so, remove it from the map
        if let popped = queue.push(putHead) {
            map.removeValue(forKey: popped.value.0)
        }
        // putting in an LRU cache always moves it to the front of the queue
        if let head = queue.head {
            map[key] = head
        }
    }
    
}
