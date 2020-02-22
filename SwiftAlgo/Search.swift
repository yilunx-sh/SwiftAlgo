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

extension String {

//    // brutal force
//    func index(of pattern: String) -> Index? {
//      // 1
//      for i in indices {
//
//        // 2
//        var j = i
//        var found = true
//        for p in pattern.indices {
//          guard j != endIndex && self[j] == pattern[p] else { found = false; break }
//          j = index(after: j)
//        }
//        if found {
//          return i
//        }
//      }
//      return nil
//    }
    
    fileprivate var skipTable: [Character: Int] {
      var skipTable: [Character: Int] = [:]
      for (i, c) in enumerated() {
        skipTable[c] = count - i - 1
      }
      return skipTable
    }
    
    fileprivate func match(from currentIndex: Index, with pattern: String) -> Index? {
      // 1
      if currentIndex < startIndex { return nil }
      if currentIndex >= endIndex { return nil }
      
      // 2
      if self[currentIndex] != pattern.last { return nil }

      // 3
      if pattern.count == 1 && self[currentIndex] == pattern.last { return currentIndex }
      return match(from: index(before: currentIndex), with: "\(pattern.dropLast())")
    }
    
    func index(of pattern: String) -> Index? {
      // 1
      let patternLength = pattern.count
      guard patternLength > 0, patternLength <= count else { return nil }

      // 2
      let skipTable = pattern.skipTable
      let lastChar = pattern.last!

      // 3
      var i = index(startIndex, offsetBy: patternLength - 1)
      
      // 1
      while i < endIndex {
        let c = self[i]

        // 2
        if c == lastChar {
          if let k = match(from: i, with: pattern) { return k }
          i = index(after: i)
        } else {
          // 3
          i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
        }
      }
      return nil
    }
}
