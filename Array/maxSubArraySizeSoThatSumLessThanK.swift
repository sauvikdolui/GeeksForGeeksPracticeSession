//
//  maxSubArraySizeSoThatSumLessThanK.swift
//  
//
//  Created by Sauvik Dolui on 19/04/20.
//

import Foundation

/*
    Maximum subarray size, such that all subarrays of that size have sum less than k
 
    Given an array of n positive integers and a positive integer k, the task is to find the maximum subarray size such
    that all subarrays of that size have sum of elements less than k.
    https://www.geeksforgeeks.org/maximum-subarray-size-subarrays-size-sum-less-k/?ref=lbp
 
    =============
       EXAMPLES
    =============
    Input :  arr[] = {1, 2, 3, 4} and k = 8.
    Output : 2
    Sum of subarrays of size 1: 1, 2, 3, 4.
    Sum of subarrays of size 2: 3, 5, 7.
    Sum of subarrays of size 3: 6, 9.
    Sum of subarrays of size 4: 10.
    So, maximum subarray size such that all subarrays
    of that size have sum of elements less than 8 is 2.
   
    Input :  arr[] = {1, 2, 10, 4} and k = 8.
    Output : -1
    There is an array element with value greater than k,
    so subarray sum cannot be less than k.
   
    Input :  arr[] = {1, 2, 10, 4} and K = 14
    Output : 2

 */


/// Prepares and returns an array of same size, the elements here are the the pre-fix sum upto that index.
/// So element i in this array is a[0] + a[1] + a[3] + ..... + a[i-1] + a[i]
///
/// - Parameter originalArray: The array for while prefix sum array is to be prepared
/// - Returns: Pre-fix sum array
func getPrefixSumArray(originalArray: [Int]) -> [Int]{
    var resultArray = Array<Int>(repeating: 0, count: originalArray.count)
    var prefixSum = 0
    for (index, item) in originalArray.enumerated() {
        prefixSum += item
        resultArray[index] = prefixSum
    }
    return resultArray
}

func sizeBSearch(prefixSumArray: [Int], k: Int) -> Int {
    var result = -1
    
    // Possible values of the sizes are in range 1...prefixSumArray.count
    
    var start = 1
    var end = prefixSumArray.count
    while start <= end {
        let mid = (start + end) / 2
        
        // Check if for all sub-array with size mid, summation of elements are <= k or not
        var currentIndex = mid
        for i in mid..<prefixSumArray.count {
            // Will check difference with an element which is behind by `mid` positions
            if prefixSumArray[i] - prefixSumArray[i - mid] > k {
                break
            }
            currentIndex += 1
        }
        if currentIndex == prefixSumArray.count {
            // Searching completed keeping a distance of `mid` and for each time, the sum was <= k
            // let's increase the size
            result = mid
            start = mid + 1
        } else {
            // Searching completed with sub-array size mid, and found at least one instance where the sum > k
            // let's decrease the size
            end = mid - 1
        }
    }
    return result
}

func maxSubArraySize(arr: [Int], k: Int) -> Int {
    var result = -1
    
    // 1. Prepare the prefix sum array
    let prefixSumArray = getPrefixSumArray(originalArray: arr)
    print(arr, k)
    
    // 2. Perform a binary search for size of the all possible sub-arrays where sum for each of them is less than k
    result = sizeBSearch(prefixSumArray:prefixSumArray, k: k)
    
    return result
}


print(maxSubArraySize(arr: [1, 2, 3, 4], k: 8))
print(maxSubArraySize(arr: [1, 2, 10, 4], k: 8))
print(maxSubArraySize(arr: [1, 2, 10, 4], k: 14))

