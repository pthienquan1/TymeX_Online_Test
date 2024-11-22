import UIKit

func findMissingNumber(arr: [Int], n: Int) -> Int {
    // Calculate the expected sum of numbers from 1 to n+1
    let expectedSum = (n + 1) * (n + 2) / 2
    
    // Calculate the actual sum of numbers in the array
    let actualSum = arr.reduce(0, +)
    
    // The missing number is the difference between the expected and actual sum
    return expectedSum - actualSum
}

// Sample:
let arr = [3, 7, 1, 2, 6, 4]
let n = 6
let missingNumber = findMissingNumber(arr: arr, n: n)
print("The missing number is \(missingNumber)")

