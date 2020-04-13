//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation


func optional() {
    //nullable
    var optionalString: String? = "Hello"
    print(optionalString == nil)
    // Prints "false"

    var optionalName: String? = "John Appleseed"
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }

    //default value
    let nickName: String? = nil
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickName ?? fullName)"
}