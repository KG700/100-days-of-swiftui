enum Direction {
    case up, down
}

enum GearsError: Error {
    case topGear, bottomGear
}

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int

    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model 
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }

    mutating func changeGear(direction: Direction) throws {
        if (direction == .up && currentGear == 10) {
            throw GearsError.topGear
        }

        if (direction == .down && currentGear == 1) {
            throw GearsError.bottomGear
        }


        if (direction == .up) {
            currentGear += 1
        } else if (direction == .down) {
            currentGear -= 1
        }
    }

}

var newCar = Car(model: "Toyota", numberOfSeats: 4, currentGear: 1)

try newCar.changeGear(direction: Direction.up)
print(newCar.currentGear)
try newCar.changeGear(direction: Direction.down)
print(newCar.currentGear)