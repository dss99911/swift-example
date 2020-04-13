//
// Created by hyun kim on 13/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Method {
    class SuperClass {
        //this can't be override by sub class.
        static func apple() {

        }

        class func banana() {

        }
    }

    class SomeClass: SuperClass {
        override class func banana() {
            super.banana()
        }

        class func someTypeMethod() {
            // type method implementation goes here
        }
    }

    func test() {
        SomeClass.someTypeMethod()
        SomeClass.apple()
        SomeClass.banana()
    }

}
