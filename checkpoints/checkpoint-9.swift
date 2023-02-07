func randomInt(_ intArray: [Int]?) -> Int {
    intArray?.randomElement() ?? Int.random(in: 1...100)
}

print(randomInt(nil))
print(randomInt([]))
print(randomInt([1000, 2000, 6000, 4000]))