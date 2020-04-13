//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Enum {
    enum Rank: Int {
        case ace = 1//by default, it starts with 0
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king


        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }

        init?(rawValue: Int) {
            if (rawValue > 10) {
                return nil
            } else {
                self = .ace
            }
        }
    }
    func test() {
        let ace = Rank.ace
        let aceRawValue = ace.rawValue
        let rankByNum = Rank(rawValue: 1)
    }

    //similar to sealed class
    enum ServerResponse {
        case result(String, String)
        case failure(String)
    }

    let success = ServerResponse.result("6:00 am", "8:09 pm")
    let failure = ServerResponse.failure("Out of cheese.")

    func response() {
        switch success {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure...  \(message)")
        }
        // Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."
    }

    func generic() {
        enum OptionalValue<Wrapped> {
            case none
            case some(Wrapped)
        }
        var possibleInteger: OptionalValue<Int> = .none
        possibleInteger = .some(100)
    }

    func iterable() {
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }

        for beverage in Beverage.allCases {
            print(beverage)
        }
    }

    func recursive_enum() {
        enum ArithmeticExpression {
            case number(Int)
            indirect case addition(ArithmeticExpression, ArithmeticExpression)
            indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
        }

        indirect enum ArithmeticExpression2 {
            case number(Int)
            case addition(ArithmeticExpression2, ArithmeticExpression2)
            case multiplication(ArithmeticExpression2, ArithmeticExpression2)
        }
    }
}


