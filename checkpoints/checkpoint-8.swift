protocol Building {
    var rooms: Int { get }
    var agentName: String { get }
    var cost: Int { get set }
    func salesSummary()
}

struct House: Building {
    let rooms: Int
    let agentName: String
    var cost: Int

    func salesSummary() {
        print("This \(rooms) bedroom house was sold by \(agentName) for £\(cost)")
    }
}

struct Office: Building {
    let rooms: Int
    let agentName: String
    var cost: Int

    func salesSummary() {
        print("This \(rooms) room office block was sold by \(agentName) for £\(cost)")
    }
}

var house = House(rooms: 4, agentName: "Dexters", cost: 200_000)
var office = Office(rooms: 100, agentName: "Dexters", cost: 5_000_000)

house.salesSummary()
office.salesSummary()