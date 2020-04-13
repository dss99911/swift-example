//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Closure {
    func closure() {
        var sum: (Int, Int) -> Int = { (num1: Int, num2: Int) -> Int in
            num1 + num2
        }

        //if closure parameter can be inferred, no need to mention types.
        var sum2: (Int, Int) -> Int = { num1, num2 in
            num1 + num2
        }

        //you don't need to mention parameter name
        var sum3: (Int, Int) -> Int = {$0 + $1}

        sum(1, 2)

        var numbers = [20, 19, 7, 12]

        //if it's closure, no need to add parenthesis
        numbers.map { number -> Int in
            let result = 3 * number
            return result
        }

        //you can shorten with just method
        numbers.sort(by: >)
    }

    func return_void() {
        func someFunctionThatTakesAClosure(closure: () -> Void) {
            // function body goes here
        }
    }

    func escaping_closure() {
        //if closure is called after function is called, need to mention escaping maybe for keeping variables which closure can refer.

        class SomeClass {
            var completionHandlers: [() -> Void] = []
            var x = 10
            func doSomething() {
                someFunctionWithEscapingClosure { self.x = 100 }
                someFunctionWithNonescapingClosure { self.x = 200 }
            }

            func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
                completionHandlers.append(completionHandler)
            }

            func someFunctionWithNonescapingClosure(closure: () -> Void) {
                //error
//                completionHandlers.append(completionHandler)
            }
        }
    }

    func auto_closure() {
        var customersInLine = ["Ewa", "Barry", "Daniella"]
        // customersInLine is ["Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: @autoclosure () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: customersInLine.remove(at: 0))
        // Prints "Now serving Ewa!"
    }

    //if need to init property with some logic.
    //this is different with defining getter. getter is for always, this is for initializing time only
    let someProperty: String = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return "someValue"
    }()
}

//shows how to brack strong circular reference
class ClosureWithStrongReference {
    class HTMLElement {

        let name: String
        let text: String?

        lazy var asHTML: () -> String = {
            [unowned self] in
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        }

        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }

        deinit {
            print("\(name) is being deinitialized")
        }

    }
}