//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

// 'class' : passed by reference
// 'struct' : always copied when they are passed around in your code.
// 'struct' : field can't be changed. it's immutable
class Struct {
    struct Card {
        var rank: String
        var suit: String
        func simpleDescription() -> String {
            "The \(rank) of \(suit)"
        }

        //with mutating keyword. you can change field
        mutating func changeRank(rank: String) {
            self.rank = rank

            //self also can be changed.
            self = Card(rank: "new", suit: "new")
        }
    }

    func run() {
        let threeOfSpades = Card(rank: "3", suit: "spades")
        let threeOfSpadesDescription = threeOfSpades.simpleDescription()
    }
}