//import UIKit
//
//프로토콜지향 프로그래밍 (Protocol Oriented Programming, POP)
//스위프트 표준 라이브러리를 보면 타입과 관련된 코드들이 대부분 구조체 형태로 되어 있음(클래스가 아닌)
//
//구조체 형태면 상속이 안됨, 그러면 기능 확장은?
//프로토콜 + 익스텐션 .....> 제너릭
//프로토콜과 익스텐션의 결합
//// 프로토콜 소개
//// 타입이 구현해야 하는 요구사항을 정의하는 규칙들의 집합.
//// 구조체, 클래스, 열거형이 반드시 포함해야 하는 메서드와 프로퍼티를 정의
//// 여러사람이 개발할때 존나 편함
//구조체는 상속이 안되니까 프로토콜이랑 익스텐션으로 기능확장을 함
///
//
//// 프로토콜 요구사항
//protocol MyProtocol {
//    var mustBeValue: Int { get set }
//    var doesNotNeadToValue: Int { get }
//}
//
//protocol MyFullName {
//    var fullName:String { get set }
//}
//
//struct MyStruct: MyProtocol {
//    var mustBeValue: Int {
//        get { return 0 }
//        set {}
//    }
//    var doesNotNeadToValue: Int {
//        get { return 0 }
//    }
//}
//
//// 프로퍼티의 경우 단순 저장 프로퍼티는 프로토콜에 x
//// 계산속성이어야 함.
//// 한번에 여러개의 프로토콜을 채택할 수 있음
//// 프로토콜을 확장하고 싶다면, 기존 프로토콜에 새로운 내용을 추가하는게 아니라, 새로운 프로토콜로 만들어서 여러개를 채택하도록 하는 방식이
//// 더 좋다.
//
//
//
//
////메서드 요구사항
//protocol MyProtocolMethod {
//    func random() -> Double
//}
//
//struct MyMethod: MyProtocolMethod {
//    func random() -> Double {
//        return 0.0
//    }
//}
//
//
//// 타입 메서드?
//// 인스턴스화 해서 저장할 목적이 아니라, 그냥 해당 프로토콜의 기능과 관련해서 어떠한 리턴값을 바로바로 필요한 경우?
//// 이거에 대한설명은 다시 정리
//// class func     static func
//// 인스턴스 형성해서 접근하려고 하면 안나옴. 클래스타 구조체 이름에 .찍고 접근해야 나옴
//
//
////프로토콜 예제 01
////다음 프로토콜을 채택하는 Person 구조체를 정의하고, 프로토콜의 메서드를 구현하세요.
//// 예시 코드:
//
//protocol Greeting {
//    var name: String { get }
//    func sayHello()
//}
//
//struct Person: Greeting {
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    func sayHello() {
//        print("Hello, \(self.name)!")
//    }
//}
//
//
////..
//
//let person = Person(name: "park")
//person.sayHello()     // Hello, park!
//
//
////프로토콜 예제 02
////다음 프로토콜을 채택하는 Circle 클래스를 정의하고, 프로토콜의 연산 프로퍼티를 구현하세요.
//// 예시 코드:
//protocol Shape {
//    var area: Double { get }
//}
//
//struct Circle: Shape {
//    var r: Int
//    
//    init(r: Int) {
//        self.r = r
//    }
//    
//    var area: Double {
//        get { return r * r * 3.14 }
//    }
//}
//
////프로토콜 예제 03
////다음 프로토콜을 채택하는 Car 구조체를 정의하고, 프로토콜의 타입 메서드를 구현하세요.
//protocol Vehicle {
//    static func makeNoise()
//}
//
//struct Car: Vehicle {
//    static func makeNoise() {
//        print("beep")
//    }
//}
//
////프로토콜 예제 04
////다음 프로토콜을 채택하는 Counter 클래스를 정의하고, 프로토콜의 타입 연산 프로퍼티를 구현하세요.
//protocol Countable {
//    static var count: Int { get set }
//}
//
//class Counter: Countable {
//    static var count: Int {
//        get { return 0 }
//        set { }
//    }
//}
////
////
////프로토콜 예제 05
////Equatable 프로토콜을 채택한 Student 구조체를 정의하고, 두 Student 인스턴스가 같은지 비교하는 == 연산자를 구현해보세요.
////예시 코드:
//
//struct Student: Equatable {
//    var name: String
//    var age: Int
//}
//
//let alice = Student(name: "Alice", age: 20)
//let bob = Student(name: "Bob", age: 21)
//
//print(alice == bob) // false
//
//
//// 변경 메서드 요구사항 (mutating method requirements)
//protocol MyMutatingProtocol {
//    var name: String { get }
//    mutating func updateName(name: String) // -> 내부값을 변경하는 함수일경우 mutating키워드 필수
//}
//
//// 열거형
//protocol Togglable {
//    mutating func toggle()
//}
//
//enum OnOffSwitch: Togglable {
//    case off, on
//    
//    mutating func toggle() {
//        switch self {
//        case .off:
//            self = .on
//        case .on:
//            self = .off
//        }
//    }
//}

import Foundation
/*:
 ## 프로토콜(protocol) 소개 p.96

 타입이 구현해야 하는 요구사항을 정의하는 규칙들의 집합

 구조체, 클래스, 열거형이 반드시 포함해야 하는 메서드와 프로퍼티를 정의
 */
protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String

    init(name: String) {
        self.name = name
    }

    func buildMessage() -> String {
        return "Hello " + name
    }

    // 클래스에서 타입 메서드
    class func calcName(name: String, str: String) -> String {
        return name + " " + str
    }
}

MyClass.calcName(name: "park", str: "good")

/**
 ## 프로토콜 채택 예시
 protocol 프로토콜 이름 {
 // 프로토콜 정의
 }

 class MyClass: 프로토콜 이름 {
 // 클래스 정의
 }

 struct MyStruct: 프로토콜 이름 {
 // 구조체 정의
 }

 enum MyEnum: 프로토콜 이름 {
 // 열거형 정의
 }
 */


// 프로퍼티 요구사항
protocol MyProtocol {
    // var fullName: String { get set }
    var mustBeValue: Int { get set }
    var doesNotNeedToValue: Int { get }
}

protocol MyProtocolFullName {
    var fullName: String { get set }
}

struct MyStruct: MyProtocol {

    var mustBeValue: Int {
        get { return 0}
        set { }
    }

    var doesNotNeedToValue: Int {
        get { return 0}
    }

}
//let my = MyStruct()
//my.mustBeValue


// 메서드 요구사항
protocol MyProtocolMethod {
    func random() -> Double
}

// 타입 메서드 요구사항...
protocol MyProtocolMethod2 {
    static func randomG() -> Double
}

struct MyMethod: MyProtocolMethod, MyProtocolMethod2 {
    func random() -> Double {
        return 0.0
    }

    // 타입 메서드를 구조체에서 구현하기 위해서는 static func 로 시작
    static func goodMethod() -> String {
        return "good"
    }

    static func randomG() -> Double {
        return 1.1
    }
}


// 타입 메서드
MyMethod.goodMethod()

// 인스턴스 메서드
let myMethod = MyMethod()
myMethod.random()


// 변경 메서드 요구사항 (mutating method requirements)
protocol MyMutatingProtocol {
    var name: String { get }
    mutating func updateName(name: String)
}

// 열거형
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch : Togglable {
    case off, on

    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var myswitch: OnOffSwitch = .on
myswitch.toggle()


// 초기화 구문 요구사항 (Initializer Requirements)
protocol MyInitProtocol {
    init(str1: String, int1: Int)
}

class MyInitClass : MyInitProtocol {
    var str = ""
    var num = 0

    // required 필수 초기화
    // 모든 하위 클래스가 해당 초기화 구문을 구현해야 함을 강제
    required init(str1: String, int1: Int) {
        self.str = str1
        self.num = int1
    }
}

class MyContClass : MyInitClass {

    required init(str1: String, int1: Int) {
        super.init(str1: str1, int1: int1)
    }
}

/*:
 # 클래스 익스텐션 class extension 소개 p.105

 클래스에 기능을 추가하는 방법중 하나
 ```
 extension 클래스/구조체 이름 {
    // 새로운 기능 코드
 }
 ```
 */

// 메서드 확장
extension Double {

    var squared: Double {
        return self * self
    }

    var cubed: Double {
        get {
            return self * self * self
        }
    }
}

let myValue: Double = 3.0
print( myValue.squared )

// 연산 프로퍼티 확장
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let myNum = 2
myNum.isEven

2.isEven

// 프로토콜 + 익스텐션
protocol NoExtension {
    var test: Int { get }
    func testFunctiong(str: String) -> String
}

extension NoExtension {
    var test: Int {
        get {
            return 7
        }
    }

    func testFunctiong(str: String) -> String {
        return "test \(str)"
    }
}

class MyExtensionClass : NoExtension {
    var test: Int {
        get {
            return 0
        }
    }
}

let myExtensionClass = MyExtensionClass()
myExtensionClass.test


print("end")

//프로토콜 예제 06
//다음 코드에서 Person 클래스를 프로토콜로 변환하고, Student 클래스가 이 프로토콜을 준수하도록 수정해보세요.
// 예시 코드:

protocol Person {
    var name: String { get set }
    var age: Int { get set }

    func introduce()
}

class Student: Person {
    var name: String
    var age: Int
    var school: String
    
    init(name: String, age: Int, school: String) {
        self.name = name
        self.age = age
        self.school = school
    }

    func introduce() {
        print("My name is \(name) and I'm \(age) years old.")
        print("I go to \(school).")
    }
}

//프로토콜 예제 07
//프로토콜을 채택하고 준수하는 클래스를 정의하고, 해당 클래스의 인스턴스를 생성하고 프로토콜의 메서드를 호출하는 코드를 작성해보세요.
//
//프로토콜의 이름은 Speaker이고, 인사말을 출력하는 메서드 speak(message: String)을 가지고 있습니다.
// 예시 코드:
protocol Greeter {
    func greet(name: String)
}

class Person: Greeter {
    var name:String
    
    init(name: String) {
        self.name = name
    }

    func greet(name: String) {
        print("Hello, \(name)!")
    }
}

let person = Person(name: "")
person.greet(name: "Kim")

//프로토콜 예제 08
//프로토콜을 상속받는 서브 프로토콜을 정의하고, 해당 프로토콜을 채택하고 준수하는 구조체를 정의하세요.
// 예시 코드:
protocol Animal {
    var name: String { get }
    func makeSound()
}

protocol Man: Animal {
    var owner: String { get }
}

struct Dog: Man {
    var name: String
    var owner: String
    
    func makeSound() {
        print("Woof!")
    }
}


//...
let bob = Dog(name: "Bob", owner: "Charlie")
bob.makeSound()     // Woof!


//프로토콜 예제 09
//프로토콜에 연산 프로퍼티와 타입 메서드를 선언하고, 해당 프로토콜을 채택하고 준수하는 클래스를 정의하세요.
// 예시 코드:
protocol Calculable {
    var value: Int { get set }
    static func add(_ a: Int, _ b: Int) -> Int
}

class Calculator: Calculable {
    
    var value: Int {
        get { return 0 }
        set { }
    }
    
    class func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}


//프로토콜 예제 10
//프로토콜을 확장하여 기본 구현을 제공하고, 해당 프로토콜을 채택하고 준수하는 열거형을 정의하세요.
// 예시 코드:
protocol Colorful {
    var color: String { get }
    func describe()
}

extension Colorful {
    func describe() {
        print("This is \(color).")
    }
}

enum Fruit: Colorful {
    var color: String {
        get {
            switch self {
            case .apple:
                return "red"
            case .banana:
                return "yellow"
            case .cherry:
                return "pink"
            }
        }
    }
    case apple, banana, cherry
}



//...
let fruit = Fruit.apple
fruit.describe()        // This is red.
Fruit.banana.describe() // This is yellow.
Fruit.cherry.describe() // This is pink.

//서브스크립트(Subscripts)
//콜렉션의 요소에 접근
//
//서브스크립트(Subscripts)는 클래스, 구조체, 열거형의 콜렉션/리스트/시퀀스의 멤버 요소에 접근할 수 있는 단축표현
//설정과 검색을 위한 별도의 메서드 없이 인덱스로 값을 설정하고 조회하기 위해 서브 스크립트를 사용
//
//예) someArray[index] 로 Array 인스턴스에 요소를 접근하고 someDictionary[key] 로 Dictionary 인스턴스에 요소를 접근
struct MySubscripts {
    var arr: [String] = []

    subscript(index: Int) -> String {
        return arr[index]
    }
}

let mysc = MySubscripts(arr: ["Park", "Kim", "Lee"])
mysc[1]


