//
//  BinaryTree.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/14/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

// binary search tree
enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case.empty:
            return 0
        }
    }
    
    mutating func nativeInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        if newValue > value {
            right.nativeInsert(newValue: newValue)
        } else {
            left.nativeInsert(newValue: newValue)
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePreOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traverseInOrder(process: process)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePostOrder( process: (T) -> ()) {
      switch self {
      case .empty:
        return
      case let .node(left, value, right):
        left.traversePostOrder(process: process)
        right.traversePostOrder(process: process)
        process(value)
      }
    }
    
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
                
            if searchValue > value {
                return right.search(searchValue: searchValue)
            } else {
                return left.search(searchValue: searchValue)
            }
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
    }
  }
}
