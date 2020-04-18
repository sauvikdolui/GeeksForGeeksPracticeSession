//
//  MergeKSortedArrays.swift
//  
//
//  Created by Sauvik Dolui on 18/04/20.
//

/*
    PROBLEM STATEMENT:
    Merge k sorted arrays
    Source: https://www.geeksforgeeks.org/merge-k-sorted-arrays-set-2-different-sized-arrays/?ref=rp
 
    Given k sorted arrays of possibly different sizes, merge them and print the sorted output.

    Input: k = 3
          arr[][] = { {1, 3},
                      {2, 4, 6},
                      {0, 9, 10, 11}} ;
    Output: 0 1 2 3 4 6 9 10 11

    Input: k = 2
          arr[][] = { {1, 3, 20},
                      {2, 4, 6}} ;
    Output: 1 2 3 4 6 20
 */


func mergeKSortedArrays(_ arr: [[Int]]) -> [Int] {
    
    var indicesToScan = Array<Int>(repeating: 0, count: arr.count)
    let numberOfElements = arr.map { $0.count }
    let totalElements = numberOfElements.reduce (0, + )
    //print(indicesToScan)
    //print(numberOfElements)
    
    var resultArray: [Int] = []
    while resultArray.count < totalElements {
        
        // Get the minimum element & array index using current scan index for each array
        var min = Int.max
        var minIndex = -1
        for i in 0..<indicesToScan.count {
            if indicesToScan[i] == -1 { continue } // all elements are already collected in resultArray from arr[i]
            if arr[i][indicesToScan[i]] < min {
                minIndex = i
                min = arr[i][indicesToScan[i]]
            }
        }
        resultArray.append(min)
        
        if indicesToScan[minIndex] + 1 < arr[minIndex].count {
            indicesToScan[minIndex] += 1
        } else {
            // All elements are collected from arr[minIndex], marking indexToScan as -1 so
            // that we skip this array later while determining the minimum elements
            indicesToScan[minIndex] = -1
        }
    }
    return resultArray
}

print(mergeKSortedArrays(
    [
        [1, 3],
        [2, 4, 6],
        [0, 9, 10, 11]
    ]
))
