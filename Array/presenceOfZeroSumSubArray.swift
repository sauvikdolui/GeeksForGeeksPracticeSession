//
//  presenceOfZeroSumSubArray.swift
//  
//
//  Created by Sauvik Dolui on 19/04/20.
//

import Foundation

/*
    For a given array of signed integers, check if there is a sub-array where sum of elements is 0.
 
    =========
    Example
    =========
    [1, 4, -2, -2, 5] for this array there is one sub-array [4, -2, -2] where the summation of the elements is 0.
 
    ==============
    APPROACH
    ==============
    Prepare the pre-fix sum array of the given array. If there is an repeating element in this array, then the given
    array has a sub-array where sum of elements are 0.
    
    For [1, 4, -2, -2, 5] the prefix sum array = [1, 5, 3, 1, 6], we can see that there is a repeating element 1. So this
    array has a sub array where the summation of the elements is zero.
 */

func getPrefixSumArray(array: [Int]) -> [Int] {
    var resultArray = Array<Int>(repeating: 0, count: array.count)
    var sum = 0
    for (index, item) in array.enumerated() {
        sum += item
        resultArray[index] = sum
    }
    return resultArray
}

func hasZeroSumSubArray(array: [Int]) -> Bool {
    let prefixSumArray = getPrefixSumArray(array: array)
    let uniqueElements = Set(prefixSumArray)
    return prefixSumArray.count != uniqueElements.count
}
print(hasZeroSumSubArray(array:[1, 4, -2, -2, 5]))
