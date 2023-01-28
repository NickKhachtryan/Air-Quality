import UIKit
//
//func plus(_ num1 : Int,_ num2 : Int)-> Int{
//    return num1 + num2
//}
//
//
//func minus(_ num1 : Int,_ num2 : Int)-> Int{
//    return num1 - num2
//}
//
//print(plus(50, 40))
//
//minus(90, 50)





//func mathOperations(_ num1 : Int,_ num2 : Int, actions : (Int , Int) -> Int )-> Int{
//    return actions(num2, num1)
//}

//let result = mathOperations(20, 10) { (newNum1, newNum2) -> Int in
//    return newNum1 * newNum2
//}

//let result = mathOperations(30, 20) {$0 * $1}
//
//print(result)
//
//var num1 : Int = 20
//var num2 : Int = 30
//
//
//func mathOperations(_ actions : (Int , Int) -> Int )-> Int{
//    return actions(num2, num1)
//}
//
////let result = mathOperations(30, 20) {$0 * $1}
//let result = mathOperations(*)
//print(result)


//let numbers : Array = [2, 5, 67, 54, 20, 4]

//for (index,number) in numbers.enumerated() {
//    print("index : \(index); number : \(number)")
//}

//let numbers : Set = [2, 5, 67, 54, 20, 4]
//
//for number in numbers {
//    print("number : \(number)")
//}

//for number in numbers.enumerated() {
//    print(number.offset)
//    print(number.element)
//}

//let result = numbers.map {$0 + 2000}

//let result = numbers.map {"\($0)"}
//print(result)

//for number in numbers  {
//    print(number + 2000)
//}

//for number in 1...10 {
//    print(number)
//}

//for _ in 1...10 {
//    print("Hello")
//}



//let dict = ["TV" : "Television", "ICE" : "Refrigator", "COLD" : "Fridge"]
//
//for item in dict {
//    print("\(item.key) is \(item.value)")
//}

//let hello = "Hello, Nick!"
////print(hello)
////print(hello , terminator : "")
//for letter in hello {
//    print(letter , terminator : " ")
//    print(letter , terminator : " ")
//    print(letter , terminator : " ")
//}

let numbers = [2, 5, 67, 54, 20, 4]

numbers[5]
//
//numbers.map { (numbers) -> Int in
//    numbers * 100
//}


//typealias myTypeInt = Int
//
//var num : myTypeInt = 0
//let a = 50
//let b = 7
//var multiply : Int {return a * b}

protocol CanDrive{func driveCar()}
protocol CanSpeak {func speak()}
class Animals{
    func walk(){print("Can Walk")}
    
}
class Humans : Animals , CanDrive , CanSpeak{
    func driveCar(){print("Can Drive")}
    func readBooks(){print("Can read Books")}
    func speak(){print("Can Speak")}
}
class Parrots : Animals , CanSpeak{
    func fly(){print("Can Fly")}
    func speak(){print("Can Speak")}
}
class Educate{
    func teachDrive(toTeach : CanDrive){toTeach.driveCar()}
}
class Monkey : Animals , CanDrive{
    func driveCar(){print("Can Drive")}
}

let human = Humans()
human.speak()
human.driveCar()

let parrot = Parrots()
parrot.speak()

let educate = Educate()
educate.teachDrive(toTeach: human)
//educate.teachDrive(toTeach: parrot)


















