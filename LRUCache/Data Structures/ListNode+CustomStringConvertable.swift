//
//  ListNode+CustomStringConvertable.swift
//  Created 6/23/20
//  Using Swift 5.0
// 
//  Copyright © 2020 K Y. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

extension ListNode: CustomStringConvertible where Value: CustomStringConvertible {
    public var description: String {
        return "ListNode: " + value.description
    }
}
