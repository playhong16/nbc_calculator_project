//: [Previous](@previous)

// Lv4 : AddOperation(더하기), SubtractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 연산 클래스들을 AbstractOperation라는 클래스명으로 만들어 사용하여 추상화하고 Calculator 클래스의 내부 코드를 변경합니다.

// MARK: - 연산 추상화 클래스 구현

class AbstractOperation {
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return 0
    }
}

class AddOperation: AbstractOperation {
    override func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

// MARK: - 빼기 연산 클래스 구현

class SubstractOperation: AbstractOperation {
    override func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

// MARK: - 곱하기 연산 클래스 구현

class MultiplyOperation: AbstractOperation {
    override func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

// MARK: - 나누기 연산 클래스 구현

class DivideOperation: AbstractOperation {
    override func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        guard secondNumber != 0
        else {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return firstNumber / secondNumber
    }
}

class Calculator {
    func calculate(_ firstNumber: Double, _ secondNumber: Double, operation: String) -> Double {
        switch operation {
        case "+":
            return AddOperation().operate(firstNumber, secondNumber)
        case "-":
            return SubstractOperation().operate(firstNumber, secondNumber)
        case "*":
            return MultiplyOperation().operate(firstNumber, secondNumber)
        case "/":
            return DivideOperation().operate(firstNumber, secondNumber)
        default:
            print("계산할 수 없습니다.")
            return 0.0
        }
    }
}

let calculator = Calculator()
let addResult = calculator.calculate(11, 27, operation: "+")
let substactResult = calculator.calculate(27, 15, operation: "-")
let multiplyResult = calculator.calculate(9, 9, operation: "*")
let divideResult = calculator.calculate(29, 0, operation: "/")

print(calculator.calculate(addResult, substactResult, operation: "*"))
print(addResult)
print(substactResult)
print(multiplyResult)
print(divideResult)

//: [Next](@next)
