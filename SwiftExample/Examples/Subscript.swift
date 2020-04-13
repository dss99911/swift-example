//
// Created by hyun kim on 13/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

//allow a[1], a[1,2], a["aa"] etc.
class SubscriptOneColumn {
    struct TimesTable {
        let multiplier: Int
        subscript(index: Int) -> Int {
            return multiplier * index
        }
    }

    func test() {
        let threeTimesTable = TimesTable(multiplier: 3)
        print("six times three is \(threeTimesTable[6])")
        // Prints "six times three is 18"
    }

}

class SubscriptTwoColumn {
    struct Matrix {
        let rows: Int, columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            grid = Array(repeating: 0.0, count: rows * columns)
        }
        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }
    
    func test() {
        var matrix = Matrix(rows: 2, columns: 2)

        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
    }
}

class TypeSubscript {
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        static subscript(n: Int) -> Planet {
            return Planet(rawValue: n)!
        }
    }

    func test() {
        let mars = Planet[4]
        print(mars)
    }
}