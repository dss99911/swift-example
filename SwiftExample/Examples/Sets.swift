//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Sets {
    func merge_two_sets() {
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

        oddDigits.union(evenDigits).sorted()
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        oddDigits.intersection(evenDigits).sorted()
        // []
        oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        // [1, 9]
        oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        // [1, 2, 9]


        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]

        houseAnimals.isSubset(of: farmAnimals)
        // true
        farmAnimals.isSuperset(of: houseAnimals)
        // true
        farmAnimals.isDisjoint(with: cityAnimals)
        // true
    }
}
