import Foundation
var list =
"""
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

//Separate the list into something we can actually work with
let elfItems = list.components(separatedBy: .whitespacesAndNewlines)

var elvesTotals = [Int]()
var currentElfTotal = 0
for item in elfItems {
    // Determine if we're at the end of reading thru this current elf's list
    if item.isEmpty {
        elvesTotals.append(currentElfTotal)
        currentElfTotal = 0
        continue
    }
    
    
}
