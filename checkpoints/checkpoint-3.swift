// Approach 1

for i in 1...100 {

    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}

// Approach 2

for i in 1...100 {
    var message = ""

    if i.isMultiple(of: 3) {
        message = "Fizz"
    }

    if i.isMultiple(of: 5) {
        message += "Buzz"
    }

    if message.isEmpty {
        message = String(i)
    }

    print(message)
}
