//
//  Search.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/14/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

class Search {
    public func binarySearch<T: Comparable>(_ key: T, _ array: [T]?) -> Int? {
        guard let arr = array else {
            return nil
        }
        
        var left = 0
        var right = arr.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] == key {
                return mid
            } else if arr[mid] < key {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return nil
    }
    
    public func binarySearch2(key: Int, array: [Int]?) -> Int? {
        guard let arr = array else {
            return nil
        }
        let range = 0..<arr.count
        return dfs(key: key, array: arr, range: range)
        
    }
    
    private func dfs(key: Int, array: [Int], range: Range<Int>) -> Int?{
        if  range.lowerBound > range.upperBound {
            return nil
        }
        let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if array[mid] == key {
            return mid
        } else if array[mid] > key {
            return dfs(key: key, array: array, range: range.lowerBound..<mid)
        } else {
            return dfs(key: key, array: array, range: mid + 1..<range.upperBound)
        }
    }
}
