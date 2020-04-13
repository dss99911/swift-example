//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

protocol Protocol {
    var simpleDescription: String { get }
    var simpleDescription2: String { get set }
    mutating func adjust()
    func test()
}

class SimpleClass: Protocol {
    var simpleDescription: String = "A very simple class."
    var simpleDescription2: String = ""
    var anotherProperty: Int = 69105

    //no need mutating keyword as it can change field always
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }

    func test() {

    }
}

struct SimpleStructure: Protocol {
    var simpleDescription: String = "A simple structure"
    var simpleDescription2: String = ""

    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }

    func test() {

    }
}

//limiting classes which inherit this protocol
protocol ClassOnlyProtocal : Apple {

}

class Apple : ClassOnlyProtocal{

}

class Banana/*: ClassOnlyProtocal*/{//this is not available

}

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}

typealias NameAged = Named & Aged

func wishHappyBirthday(to celebrator: NameAged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

func protocol_composition() {
    let birthdayPerson = Person(name: "Malcolm", age: 21)
    wishHappyBirthday(to: birthdayPerson)
    // Prints "Happy birthday, Malcolm, you're 21!"
}

//this is for compatibility with objective-c. function/property may not be implemented
//@objc protocols can be adopted only by classes that inherit from Objective-C classes or other @objc classes.
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int // => ((Int) -> Int)?
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}