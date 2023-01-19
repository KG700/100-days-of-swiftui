func printLuckyNumbers(_ luckyNumbers: [Int]) {
    for message in (luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $1 > $0 }.map { "\($0) is a lucky number" }) {
        print(message)
    }
}

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
printLuckyNumbers(luckyNumbers)