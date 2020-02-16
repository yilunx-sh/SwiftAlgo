//
//  main.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/12/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

var stackTest = false
var linkedListTest = false
var queueTest = false
var insertionSortTest = false
var binarySearchTest = false
var treeTest = false
var binarySearchTreeTest = true

// MARK: - stack test

if stackTest {
    var stack = Stack<String>()
    print(stack.isEmpty)
    stack.push("1")
    print(stack.peek() as Any)
    let _ = stack.pop()
    let _ = stack.pop()
    stack.push("3D Games by Tutorials")
    stack.push("tvOS Apprentice")
    stack.push("iOS Apprentice")
    stack.push("Swift Apprentice")
    print(stack.count)
    print(stack.isEmpty)
    print(stack)
}

// MARK: - linked list test

if linkedListTest {
    let linkedList = LinkedList<String>()
    let node = Node(value: "1")
    linkedList.append(node: node)
    linkedList.append(value: "2")
    linkedList.append(value: "3")
    print(linkedList)
    print(linkedList.nodeAt(index: 2) ?? "nil")
    let _ = linkedList.remove(node: node)
    print(linkedList)
    
    let numbers = LinkedList<Int>()
    numbers.append(value: 5)
    numbers.append(value: 10)
    numbers.append(value: 15)
    print(numbers.nodeAt(index: 1) ?? "nil")
    print(numbers)
    
}

// MARK: - queue test

if queueTest {
    var queue = Queue<Int>()
    queue.enqueue(10)
    queue.enqueue(3)
    queue.enqueue(57)
    print(queue)
    _ = queue.dequeue()
    print(queue)
    
    var queue2 = Queue<String>()
    queue2.enqueue("mad")
    queue2.enqueue("lad")
    if let first = queue2.dequeue() {
      print(first)
    }
    print(queue2)
}

// MARK: - sort

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]

if insertionSortTest {
    _ = Sort.insertionSort(list, >)
    _ = Sort.insertionSort(list, { (a, b) -> Bool in
        return a < b
    })
}

// MARK: - binary search

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

if binarySearchTest {
    let s = Search()
    let res = s.binarySearch(5, [2])
    print(res as Any)
    
    let res2 = s.binarySearch2(key: 43, array: numbers)
    print(res2 as Any)
}

// MARK: - tree

if treeTest {
    let beverages = TreeNode(value: "beverages")

    let hotBeverage = TreeNode(value: "hot")
    let coldBeverage = TreeNode(value: "cold")

    let tea = TreeNode(value: "tea")
    let coffee = TreeNode(value: "coffee")
    let cocoa = TreeNode(value: "cocoa")

    let blackTea = TreeNode(value: "black")
    let greenTea = TreeNode(value: "green")
    let chaiTea = TreeNode(value: "chai")

    let soda = TreeNode(value: "soda")
    let milk = TreeNode(value: "milk")

    let gingerAle = TreeNode(value: "ginger ale")
    let bitterLemon = TreeNode(value: "bitter lemon")

    beverages.add(child: hotBeverage)
    beverages.add(child: coldBeverage)

    hotBeverage.add(child: tea)
    hotBeverage.add(child: coffee)
    hotBeverage.add(child: cocoa)

    coldBeverage.add(child: soda)
    coldBeverage.add(child: milk)

    tea.add(child: blackTea)
    tea.add(child: greenTea)
    tea.add(child: chaiTea)

    soda.add(child: gingerAle)
    soda.add(child: bitterLemon)
    
    print(beverages)
    
    print(beverages.search(value: "cocoa") as Any) // returns the "cocoa" node
    print(beverages.search(value: "chai") as Any) // returns the "chai" node
    print(beverages.search(value: "bubbly") as Any)
    
    let number = TreeNode(value: 3)
    print(number)
}

if binarySearchTreeTest {
    // leaf nodes
    let node5 = BinaryTree.node(.empty, "5", .empty)
    let nodeA = BinaryTree.node(.empty, "a", .empty)
    let node10 = BinaryTree.node(.empty, "10", .empty)
    let node4 = BinaryTree.node(.empty, "4", .empty)
    let node3 = BinaryTree.node(.empty, "3", .empty)
    let nodeB = BinaryTree.node(.empty, "b", .empty)

    // intermediate nodes on the left
    let Aminus10 = BinaryTree.node(nodeA, "-", node10)
    let timesLeft = BinaryTree.node(node5, "*", Aminus10)

    // intermediate nodes on the right
    let minus4 = BinaryTree.node(.empty, "-", node4)
    let divide3andB = BinaryTree.node(node3, "/", nodeB)
    let timesRight = BinaryTree.node(minus4, "*", divide3andB)

    // root node
    let tree = BinaryTree.node(timesLeft, "+", timesRight)
    print(tree)
    print(tree.count)
    
    var binaryTree: BinaryTree<Int> = .empty
    binaryTree.insert(newValue: 5)
    binaryTree.insert(newValue: 7)
    binaryTree.insert(newValue: 9)
    print(binaryTree)
}

