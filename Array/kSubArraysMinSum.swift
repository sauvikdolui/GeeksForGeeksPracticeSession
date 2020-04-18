//
//  kSubArraysMinSum.swift
//
//
//  Created by Sauvik Dolui on 18/04/20.
//

/*
    PROBLEM STATEMENT:
    Split the given array into K sub-arrays such that maximum sum of all sub arrays is minimum.
    https://www.geeksforgeeks.org/split-the-given-array-into-k-sub-arrays-such-that-maximum-sum-of-all-sub-arrays-is-minimum/?ref=rp
 
    -------------------------
    EXAMPLE INPUT AND OUTPUT |
    -------------------------
    1. Given Array = [1, 2, 3, 4], and K = 3
    2. Break array into sub-arrays such that number of elements are 3
    3. Possible break downs are
 
    ==============================================================================
           Break Down       || Sum of individual Array || Max Sum of sub-arrays
    ==============================================================================
           [1], [2, 3], [4] || 1, 5, 4                 ||  5
           [1], [2] [3, 4]  || 1, 2, 7                 ||  7
           [1, 2], [3], [4] || 3, 3, 4                 ||  4  <- Minimum Sum (RESULT)
    ==============================================================================
 
 
    -------------------------
            APPROACH
    -------------------------
 
    1. Find out all possible sums, sum can be in the range (minimum element)...(sum of all elements)
    2. Prepare a function which will let us know if a certain sum or less can be deducted from a sub-array where number of
       sub-arrays are exactly K.
    3. Perform a binary search to search minimum value from the range (minimum element)...(sum of all elements) by
       sending mid value to the function.
 */


func isSubArraySumPossible(sum: Int, K: Int, arr: [Int]) -> Bool {
    
    var sumSubArray = 0
    var countOfSubArrays = 0
    for i in 0..<arr.count {
        
        // 1. is this element > sum, return false
        if arr[i] > sum { return false }
        
        sumSubArray += arr[i]
        
        if sumSubArray > sum {
            countOfSubArrays += 1
            sumSubArray = arr[i]
        }
    }
    countOfSubArrays += 1
    if countOfSubArrays <= K {
        return true
    } else {
        return false
    }
}
func find_k_SubArrayMinimumSum(array: [Int], K: Int) -> Int {
    
    // Input Sanity Checking
    guard array.isEmpty == false else { return 0 }
    
    // Step 1:
    let minPossibleSum: Int = array.min()!
    let maxPossibleSum: Int = array.reduce(0, +)
    print("Binary Search Range: \(minPossibleSum)...\(maxPossibleSum)")
    
    
    // Step 3: Perform binary-search to find out the minimum possible value of mid in the range while preparing K sub arrays
    var start = minPossibleSum
    var end = maxPossibleSum
    
    var result = 0
    while start <= end {
        let mid = (start + end) / 2
        if isSubArraySumPossible(sum:mid, K: K, arr: array) {
            result = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return result
}

let result = find_k_SubArrayMinimumSum(array: [1, 2, 3, 4], K:3)
print(result)
