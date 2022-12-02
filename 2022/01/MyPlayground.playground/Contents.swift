import Foundation

// First we need the input path
guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else { exit(1) }

guard var listInput = try? String(contentsOfFile: path) else { exit(1) }

//Separate the list into something we can actually work with
let elfItems = listInput.components(separatedBy: .whitespacesAndNewlines)

var elvesTotals = [Int]()
var currentElfTotal = 0
for item in elfItems {
    // Determine if we're at the end of reading thru this current elf's list
    if item.isEmpty {
        // Append the current elf total and reset to next elf
        elvesTotals.append(currentElfTotal)
        currentElfTotal = 0
        continue
    }
    
    // We have another carried item so lets add that to the total
    guard let caloricValue = Int(item) else { continue }
    currentElfTotal += caloricValue
}

// Once we exit scope of the for loop we need to do one final
// appending check to see if we have a straggler elf
if currentElfTotal > 0 {
    elvesTotals.append(currentElfTotal)
    currentElfTotal = 0
}

//Now we need to find the highest. Time to sort!
let sortedTotals = elvesTotals.sorted(by: > )

//Our answer should be the first
print(sortedTotals.first ?? "No answer!")
