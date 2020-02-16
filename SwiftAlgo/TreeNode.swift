//
//  TreeNode.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/14/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    weak var parent: TreeNode? // add the parent property
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: TreeNode) {
        children.append(child)
        child.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map{ $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension TreeNode where T: Equatable {
    
    func search(value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}



