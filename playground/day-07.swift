import Cocoa

func sameLetters(word1: String, word2: String) -> Bool {
    word1.sorted() == word2.sorted()
}

print(sameLetters(word1: "apple", word2: "lpape"))

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)