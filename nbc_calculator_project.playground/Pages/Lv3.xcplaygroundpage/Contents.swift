//: [Previous](@previous)

/*
Lv3 : AddOperation(더하기), SubstractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기) 연산 클래스를을 만든 후 클래스간의 관계를 고려하여 Calculator 클래스와 관계를 맺기
 - 관계를 맺은 후 필요하다면 Calculator 클래스의 내부코드를 변경하기
    -- 나머지 연산자(%) 기능은 제외합니다.
 - Lv2 와 비교하여 어떠한 점이 개선 되었는지 스스로 생각해 봅니다.
    -- hint. 클래스의 책임(단일책임원칙)
 */

// MARK: - 더하기 연산 클래스 구현

class AddOperation {
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

// MARK: - 빼기 연산 클래스 구현

class SubstractOperation {
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

// MARK: - 곱하기 연산 클래스 구현

class MultiplyOperation {
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

// MARK: - 나누기 연산 클래스 구현

class DivideOperation {
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        guard secondNumber != 0
        else {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return firstNumber / secondNumber
    }
}

// MARK: - 계산기 클래스 구현

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



// MARK: - 연산 결과 확인

let calculator = Calculator()
let addResult = calculator.calculate(15, 15, operation: "+")
let substactResult = calculator.calculate(25, 15, operation: "-")
let multiplyResult = calculator.calculate(30, 25, operation: "*")
let divideResult = calculator.calculate(29, 0, operation: "/")

print(calculator.calculate(addResult, substactResult, operation: "*"))
print(addResult)
print(substactResult)
print(multiplyResult)
print(divideResult)

//: [Next](@next)
