import Foundation

class RoomManager {
    
    static let shared = RoomManager()
    
    private init() {}
    
    func createRooms() -> [String : Room] {
        let room101: Room = Room(number: 101, price: 129000)
        let room102: Room = Room(number: 102, price: 159000)
        let room103: Room = Room(number: 103, price: 189000)
        let room104: Room = Room(number: 104, price: 229000)
        let room105: Room = Room(number: 105, price: 319000)
        
        let rooms: [String : Room] = ["101" : room101, "102" : room102, "103": room103, "104": room104, "105": room105]
        return rooms
    }
}

