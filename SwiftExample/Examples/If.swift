//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class If<T> {
    func ifs() {
        var a = 1

        if (a > 2) {
            print("> 2")
        } else {
            print("<= 2")
        }

        //can remove parentheses, brace around body is mandatory
        if a > 2 {
            print("> 2")
        } else {
            print("<= 2")
        }
    }

    func optional() {
        var optionalName: String? = "John Appleseed"
        //if optionalName is not null
        if let name = optionalName {
            print("Hello, \(name)")
        }
    }

    func two_optional() {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if let buildingNumber = buildingNumber, let street = street {
                return "\(buildingNumber) \(street)"
            } else if buildingName != nil {
                return buildingName
            } else {
                return nil
            }
        }
    }

    func early_exit() {
        func greet(person: [String: String]) {
            guard let name = person["name"] else {
                return
            }

            if let name2 = person["name"] {
                return
            }

            print("Hello \(name)!")

            //this name2 can not be referred by other.
            //print("Hello \(name2)!")

            //this protect the value not null like guard
            guard let location = person["location"] else {
                print("I hope the weather is nice near you.")
                return
            }

            var name3:String? = ""
            guard let temp = name3 , temp.count > 0  else {
                print("Name is nil or an empty string. Cannot process")
                return
            }

            print("I hope the weather is nice in \(location).")
        }

        greet(person: ["name": "John"])
        // Prints "Hello John!"
        // Prints "I hope the weather is nice near you."
        greet(person: ["name": "Jane", "location": "Cupertino"])
        // Prints "Hello Jane!"
        // Prints "I hope the weather is nice in Cupertino."
    }
}
