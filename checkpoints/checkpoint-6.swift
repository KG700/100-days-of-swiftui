enum Direction {
    case up, down
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

    mutating func changeGear(direction: Direction) {
        if (direction == .up && currentGear < 10) {
            currentGear += 1
        } else if (direction == .down && currentGear > 1) {
            currentGear -= 1
        }
    }

}
    
var newCar = Car(model: "Toyota", numberOfSeats: 4, currentGear: 1)
newCar.changeGear(direction: Direction.up)
print(newCar.currentGear)
newCar.changeGear(direction: Direction.down)
print(newCar.currentGear)