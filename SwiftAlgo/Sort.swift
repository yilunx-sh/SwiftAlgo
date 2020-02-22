//
//  Sort.swift
//  SwiftAlgo
//
//  Created by Yilun Xu on 2/13/20.
//  Copyright © 2020 yilunx. All rights reserved.
//

import Foundation

class Sort {
    public static func insertionSort<T>(_ array: [T]?, _ isOrderedBefore: (T, T) -> Bool) -> [T]? {
        guard var arr  = array else {
            return nil
        }
        for index in 1..<list.count {
            var temp = index
            let val = arr[temp]
            while temp > 0 && isOrderedBefore(val, arr[temp - 1]) {
                arr[temp] = arr[temp - 1]
                temp -= 1
            }
            arr[temp] = val
        }
        print(arr)
        return arr
    }
    
    public static func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }

        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }
    
    static func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] > right[rightIndex] {
                orderedArray.append(right[rightIndex])
                rightIndex += 1
            } else {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
            }
        }
        
        while leftIndex < left.count {
          orderedArray.append(left[leftIndex])
          leftIndex += 1
        }

        while rightIndex < right.count {
          orderedArray.append(right[rightIndex])
          rightIndex += 1
        }
        
        return orderedArray
    }
}
