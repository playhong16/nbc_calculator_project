import Foundation

struct Room {
    
    let number: Int
    let price: Int
    var checkIn: String?
    var checkOut: String?
    
    init(number: Int, price: Int, checkIn: String? = nil, checkOut: String? = nil) {
        self.number = number
        self.price = price
        self.checkIn = checkIn
        self.checkOut = checkOut
    }
}

extension Room: Comparable {
    static func < (lhs: Room, rhs: Room) -> Bool {
        guard let lhsCheckIn = lhs.checkIn, let rhsCheckIn = rhs.checkIn else { return false }
        return lhsCheckIn < rhsCheckIn
    }
}


