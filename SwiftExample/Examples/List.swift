//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation
class List {
    func array() {
        var shoppingList = ["catfish", "water", "tulips"]
        shoppingList[1] = "bottle of water"

        //you can add item on array
        shoppingList.append("blue paint")
        print(shoppingList)

        //substring
        let sequence2 = shoppingList[..<1]

        shoppingList[4...6] = ["Bananas", "Apples"]
    }

    func emptyArray() {
        var emptyArray = [String]()
        emptyArray = [] //type information can be inferred
    }
}
