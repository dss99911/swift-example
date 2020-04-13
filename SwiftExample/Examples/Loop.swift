//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Loop {
    func for_in() {
        let individualScores = [75, 43, 103, 87, 12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        print(teamScore)
        // Prints "11"
    }

    func for_range() {
        var total = 0

        //0,1,2,3
        for i in 0..<4 {
            total += i
        }
        print(total)
        // Prints "6"

        //0,1,2,3,4
        for i in 0...4 {
            total += i
        }
        print(total)
        // Prints "10"
    }

    func one_sided_range() {
        let names = [1,2,3]
        for name in names[2...] {
            print(name)
        }
        // Brian
        // Jack

        for name in names[...2] {
            print(name)
        }

        for name in names[..<2] {
            print(name)
        }

        let range = ...5
        range.contains(7)   // false
        range.contains(4)   // true
        range.contains(-1)  // true
    }

    func for_without_item() {
        func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
            var result = [Item]()
            for _ in 0..<numberOfTimes {
                result.append(item)
            }
            return result
        }
        makeArray(repeating: "knock", numberOfTimes: 4)
    }

    func dictionary_loop() {
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
        ]
        var largest = 0
        for (kind, numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print(largest)
        // Prints "25"
    }

    func whiles() {
        var n = 2
        while n < 100 {
            n *= 2
        }
        print(n)
        // Prints "128"

        var m = 2
        repeat {
            m *= 2
        } while m < 100
        print(m)
        // Prints "128"
    }
}

