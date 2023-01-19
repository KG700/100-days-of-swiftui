enum squareRootErrors: Error {
    case outOfBounds, noRoot
}

func squareRootOf(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw squareRootErrors.outOfBounds
    }

    for i in 1...100 {
        if i * i == number {
            return i
        }
    }

    throw squareRootErrors.noRoot
}

do {
    print(try squareRootOf(25))
} catch squareRootErrors.outOfBounds {
    print("Number is out of bounds")
} catch squareRootErrors.noRoot {
    print("Number has no root")
} catch {
    print("error found")
}