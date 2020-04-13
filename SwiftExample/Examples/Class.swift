//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class SuperClass {
    func superName() -> String {
        "Super"
    }
}

class Class: SuperClass, Hashable {

    let name: String
    var sideLength: Double = 0
    lazy var lazyField = "dd"

    //designated initializer
    //call init() of super class, if not mentioned, it's super.init()
    override init() {
        name = "empty"
        super.init()
    }


    //designated initializer
    init(name: String) {
        self.name = name
    }

    //convenience initializer
    //call self.init(). it's secondary init
    convenience init(id: Int) {
        self.init()
    }

    deinit {
        print("this object is deallocated.")
    }

    override func superName() -> String {
        super.superName()
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {//newValue
            sideLength = newValue / 3.0
        }
    }

    //if only getter. no need to mention 'get'
    var perimeter2: Double {
        3.0 * sideLength
    }

    var data: String = "" {
        willSet {//call this before set
            perimeter = 10
        }
        didSet  {//call this after set
            sideLength = 10
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    //operator function
    static func ==(lhs: Class, rhs: Class) -> Bool {
        if lhs === rhs {
            return true
        }
        if type(of: lhs) != type(of: rhs) {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        return true
    }
}


func init_class() {
    Class() == Class(name: "dd")
}

typealias AudioSample = UInt16

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}