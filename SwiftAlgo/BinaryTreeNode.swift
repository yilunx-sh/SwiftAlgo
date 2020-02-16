//
//  BinarySearchTree.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/14/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

class BTNode<T> {
    var value: T
    var left: BTNode?
    var right: BTNode?
    
    init(value: T) {
        self.value = value
    }
}
