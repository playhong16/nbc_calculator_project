import Foundation

class HotelReservationManger {
    
    let roomManager = RoomManager.shared
    
    var myReservation: [Room] = []
    
    private var isRunning = true
    
    var myAccount: Int = 0
    
    func run() {
        while isRunning {
            getMenu()
        }
    }
    
    func getMenu() {
        print("---------------------------------")
        print("* 호텔 예약 관리 프로그램입니다.")
        print("1. 랜덤 금액 지급")
        print("2. 호텔 객실 정보 보기")
        print("3. 호텔 객실 예약하기")
        print("4. 나의 예약 목록 보기")
        print("5. 나의 예약 목록 체크인 날짜 순으로 보기")
        print("6. 예약 삭제하기")
        print("7. 예약 수정하기")
        print("8. 나의 입출금 내역 출력하기")
        print("9. 나의 잔액 보기")
        print("0. 프로그램 종료하기")
        print("---------------------------------")
        getNumber()
    }
    
    func getNumber() {
        print("원하시는 번호를 입력해주세요.")
        let input = readLine()
        guard let input = input else { return }
        switch input {
        case "1":
            getRandomPay()
        case "2":
            getRoomInfomation()
        case "3":
            makeReservation()
        case "4":
            getMyReservation()
        case "5":
            getSortedMyReservation()
        case "6":
            deleteReservation()
        case "7":
            modifyReservation()
        case "0":
            isRunning = false
            print("프로그램을 종료합니다.")
        default:
            print("잘못된 번호를 입력하셨습니다.")
            getMenu()
        }
    }
    
    func getRandomPay() {
        let payRange = Int.random(in: 100000...500000)
        let pay = payRange - (payRange % 10000)
        myAccount += pay
        print("\(pay)원이 입금되었습니다.")
    }
    
    func getRoomInfomation() {
        for (number, room) in roomManager.createRooms() {
            print("\(number)호 - 1박 \(room.price)원")
        }
        sleep(2)
    }
    
    func makeReservation() {
        print("------------------------------------------")
        print("방 번호, 체크인 날짜, 체크아웃 날짜를 각각 입력해주세요.")
        print("------------------------------------------")
        
        print("원하시는 방 번호를 입력해주세요. (ex. 101")
        let roomNumber = readLine()
        guard let roomNumber = roomNumber else { return }
        var choiceRoom = roomManager.createRooms()[roomNumber]
        
        print("체크인 날짜를 입력하세요. (ex. 2023-07-21")
        let checkIn = readLine()
        choiceRoom?.checkIn = checkIn
        
        print("체크아웃 날짜를 입력하세요. (ex. 2023-07-21")
        let checkOut = readLine()
        choiceRoom?.checkOut = checkOut
        
        guard let room = choiceRoom
        else {
            print("예약을 실패했습니다. 다시 시도해주세요.")
            return
        }
        myReservation.append(room)
        print("예약이 완료되었습니다.")
        sleep(2)
    }
    
    func getMyReservation() {
        if myReservation.isEmpty {
            print("예약하신 방이 없습니다.")
            sleep(3)
        } else {
            for room in myReservation {
                var index = myReservation.firstIndex(of: room)
                guard let index = index, let checkIn = room.checkIn, let checkOut = room.checkOut else { return }
                print("\(index + 1). \(room.number)호, 체크인: \(checkIn), 체크아웃: \(checkOut), 1박가격: \(room.price)원")
            }
            sleep(2)
        }
    }
    
    func getSortedMyReservation() {
        if myReservation.isEmpty {
            print("예약하신 방이 없습니다.")
            sleep(3)
        } else {
            for room in myReservation.sorted() {
                var index = myReservation.firstIndex(of: room)
                guard let index = index, let checkIn = room.checkIn, let checkOut = room.checkOut else { return }
                print("\(index + 1). \(room.number)호, 체크인: \(checkIn), 체크아웃: \(checkOut), 1박가격: \(room.price)원")
            }
            sleep(2)
        }
    }
    
    func deleteReservation() {
        getSortedMyReservation()
        print("취소할 예약 번호를 입력하세요.")
        let input = readLine()
        guard let number = input else { return }
        let convert = Int(number)
        guard let index = convert
        else {
            print("예약된 번호가 아닙니다.")
            return
        }
        myReservation.remove(at: index - 1)
        print("취소가 완료되었습니다.")
        sleep(1)
        getSortedMyReservation()
    }
    
    func modifyReservation() {
        getSortedMyReservation()
        print("변경할 예약 번호를 입력하세요.")
        let input = readLine()
        guard let number = input else { return }
        let convert = Int(number)
        guard let index = convert
        else {
            print("예약된 번호가 아닙니다.")
            return
        }
        
        print("변경할 방 호수를 입력하세요.")
        let roomNumber = readLine()
        guard let roomNumber = roomNumber else { return }
    }
}

HotelReservationManger().run()

