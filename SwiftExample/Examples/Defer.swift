//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Defer {
    var fridgeIsOpen = false
    let fridgeContent = ["milk", "eggs", "leftovers"]

    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true

        //even if error occurs, this is called after function is completed
        defer {
            fridgeIsOpen = false
        }

        let result = fridgeContent.contains(food)
        return result
    }

    func main() {
        fridgeContains("banana")
        print(fridgeIsOpen)
        // Prints "false"
    }

}
