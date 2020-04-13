//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Function {

    func greet(person: String, day: Int = 1) -> String {
        let tomorrow = day + 1
        return "Hello \(person), today is \(tomorrow)."
    }

    func one_line_no_need_return(person: String, day: String) -> String {
        "Hello \(person), today is \(day)."
    }

    func default_parameter(person: String, day: Int = 1) -> String {
        let tomorrow = day + 1
        return "Hello \(person), today is \(tomorrow)."
    }

    func argument_label_change(_ person: String, on day: Int) -> String {
        let tomorrow = day + 1
        return "Hello \(person), today is \(tomorrow)."
    }

    func tuple(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0

        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }

        var a = (min, max)
        print(a.0, a.1)
        return (min, max, sum)
    }

    func call_function() {
        let result = greet(person: "name", day: 1)
        let _ = default_parameter(person: "name")//ignore return value
        let result3 = argument_label_change("name", on: 1)
        let result4 = tuple(scores: [1, 2, 3])
        let (a, b, c) = tuple(scores: [1, 2, 3])

        print(result4.sum, result4.min)
    }

    func nested_function() {
        func returnFifteen() -> Int {
            var y = 10

            func add() {
                y += 5
            }

            add()
            return y
        }

        let a = returnFifteen()
    }

    func return_fuction() {
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne(number: Int) -> Int {
                return 1 + number
            }

            return addOne
        }

        var increment = makeIncrementer()
        increment(7)
    }



    //lambda == function.
    func input_function() {
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }

        func lessThanTen(number: Int) -> Bool {
            return number < 10
        }

        var numbers = [20, 19, 7, 12]
        hasAnyMatches(list: numbers, condition: lessThanTen)
    }

    func generic() {
        func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
                where T.Element: Equatable, T.Element == U.Element
        {
            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        return true
                    }
                }
            }
            return false
        }

        anyCommonElements([1, 2, 3], [3])
    }

    func variadic() {
        func arithmeticMean(_ numbers: Double...) -> Double {
            var total: Double = 0
            for number in numbers {
                total += number
            }
            return total / Double(numbers.count)
        }
        arithmeticMean(1, 2, 3, 4, 5)
        // returns 3.0, which is the arithmetic mean of these five numbers
        arithmeticMean(3, 8.25, 18.75)
        // returns 10.0, which is the arithmetic mean of these three numbers
    }

    func in_out() {
        //parameter can be changeable
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }

        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
    }

}
