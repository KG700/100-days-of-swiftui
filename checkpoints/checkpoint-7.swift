class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("woof woof woof!!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("wuuuf")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("yip yip")
    }
}

class Cat: Animal {
    let isTame: Bool
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }

    func speak() {
        print("meow")
    }
}

final class Persian: Cat {
    override func speak() {
        print("meeooow")
    }
}

final class Lion: Cat {
    override func speak() {
        print("Roooaaar!")
    }
}

let greyhound = Dog(legs: 4)
let poodle = Poodle(legs: 4)
let corgi = Corgi(legs: 4)
let cat = Cat(legs: 4, isTame: true)
let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)

greyhound.speak()
poodle.speak()
corgi.speak()
cat.speak()
persian.speak()
lion.speak()