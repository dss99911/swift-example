//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

extension Int: Protocol {
    var simpleDescription: String {
        "The number \(self)"
    }
    var simpleDescription2: String {
        get {
            "The number \(self)"
        }
        set {

        }
    }

    mutating func adjust() {
        self += 42
    }

    func test() {

    }
}

func main() {
    print(7.simpleDescription)
// Prints "The number 7"
}


extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

struct Vector2D {
    var x = 0.0, y = 0.0
}


prefix operator +++
prefix operator +++++++++++

extension Vector2D: Equatable {

    // a + b
    static func +(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }

    // -a
    static prefix func -(vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }

    static func +=(left: inout Vector2D, right: Vector2D) {
        left = left + right
    }

    static func ==(left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }

    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }

    mutating static prefix func +++++++++++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

func test() {
    +++++++++++Vector2D(x: 1,y: 2)
}