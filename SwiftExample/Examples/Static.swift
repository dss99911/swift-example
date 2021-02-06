//
// Created by hyun kim on 02/06/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

open class Static {
    //this is not able to be inherited
    static var a = "1"
    static func ab() {
        
    }

    //this can be inherited
    class var b: String {
        "1"
    }
    open class var white: String { get }
}

class StaticInherit : Static {
    override class var b: String {
        "2"
    }
}
