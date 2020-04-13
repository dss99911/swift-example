//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Type {
    func var_vs_Let() {
        let constant = "1"
        var variable = "1"

        variable = "2"
    }

    func optional() {
        // null and optional
        let a: String? = nil
        print(a == nil)//true
    }

    func tuple() {
        let min = 1, max = 2
        var a = (min, max)
        print(a.0, a.1)

        var (c, d) = (min, max)
        print(c, d)
    }

    func unwrapped_optional() {
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString! // requires an exclamation point

        let assumedString: String! = possibleString
        let implicitString: String = assumedString // no need for an exclamation point
    }

    func same_variable() {
        let a = "1"
        if (a == "1") {
            let a = "2"
        }
    }

    func casting() {
        var a: Any = "1"

        if (a is AnyObject) {//except for primary type

        }

        let b = a as? String
        let c = a as! String

        if let d = a as? String {

        }
    }

    func logFunctionName(string: String = #function) {
        print(string)
    }
    func myFunction() {
        logFunctionName() // Prints "myFunction()".
    }
}
