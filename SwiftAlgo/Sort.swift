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
}
