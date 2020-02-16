//
//  LinkedList.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/12/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation


public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    public func append(node: Node<T>) {
        if let tailNode = tail {
            node.previous = tailNode
            tailNode.next = node
        } else {
            head = node
        }
        
        tail = node
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while (node != nil) {
                if i == 0 {
                    return node
                }
                i = i - 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        if let next = next {
            next.previous = prev
        } else {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil {
                text += ", "
            }
        }
        text += "]"
        return text
    }
}
