//
//  Queue.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/13/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

struct Queue<T> {
    fileprivate var list = LinkedList<T>()
    
    public mutating func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    public mutating func dequeue() -> T? {
        guard !list.isEmpty , let element = list.first else {
            return nil
        }
        _ = list.remove(node: element)
        return element.value
    }
    
    public func peek() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return element.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return list.description
    }
}
