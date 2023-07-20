//: [Previous](@previous)

// Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기

class Calculator {
    
    // 더하기, 뺴기, 곱하기, 몫 구하기(나누기), 나머지 구하기 연산 기능 구현
    func add(_ firstNumber: Double, _ secondNumber: Double) {
        print("\(firstNumber) + \(secondNumber) = \(firstNumber + secondNumber)")
    }
    
    func substract(_ firstNumber: Double, _ secondNumber: Double) {
        print("\(firstNumber) - \(secondNumber) = \(firstNumber - secondNumber)")
    }
    
    func multiply(_ firstNumber: Double, _ secondNumber: Double) {
        print("\(firstNumber) * \(secondNumber) = \(firstNumber * secondNumber)")
    }
    
    func divide(_ firstNumber: Double, _ secondNumber: Double) {
        guard secondNumber != 0 else { return print("0으로 나눌 수 없습니다.") }
        print("\(firstNumber) / \(secondNumber) = \(firstNumber / secondNumber)")
    }
    
    // Lv2 : Lv1에서 만든 Calculator 클래스에 나머지 연산을 가능하도록 코드를 추가하고, 연산 진행 후 출력하기
    func  remainder(_ firstNumber: Double, _ secondNumber: Double) {
        guard secondNumber != 0 else { return print("0으로 나눌 수 없습니다.") }
        print("\(firstNumber) % \(secondNumber) = \(firstNumber.truncatingRemainder(dividingBy: secondNumber))")
    }
}

let calculator = Calculator()
calculator.add(1, 2)
calculator.substract(20, 12)
calculator.multiply(8, 9)
calculator.divide(15, 5)
calculator.remainder(15, 2)

//: [Next](@next)
