//
//  PrefixSumArray.swift
//  
//
//  Created by Sauvik Dolui on 19/04/20.
//

import Foundation

/*
        Prefix Sum Array – Implementation and Applications in Competitive Programming
        Given an array arr[] of size n, its prefix sum array is another array prefixSum[] of same size such that the
        value of prefixSum[i] is arr[0] + arr[1] + arr[2] … arr[i].
 
        Examples :
        ==========
        Input  : arr[] = {10, 20, 10, 5, 15}
        Output : prefixSum[] = {10, 30, 40, 45, 60}
 */

func getPrefixSumArray(originalArray: [Int]) -> [Int]{
    var resultArray = Array<Int>(repeating: 0, count: originalArray.count)
    var prefixSum = 0
    for (index, item) in originalArray.enumerated() {
        prefixSum += item
        resultArray[index] = prefixSum
    }
    return resultArray
}

print(getPrefixSumArray(originalArray: [10, 20, 10, 5, 15] ))
