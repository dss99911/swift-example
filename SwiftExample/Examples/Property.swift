//
// Created by hyun kim on 13/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Property {
    static var text: String = ""
    weak var tenant: PropertyWrapper? = PropertyWrapper()//weak reference to prevent circular reference. swift doesn't have gc. so, should look after if it's circular reference or not.
    unowned var tenant2: PropertyWrapper = PropertyWrapper()//this is for not optional type.
    var tenant3: PropertyWrapper!//this is same with lateinit var. no need to initialize while init()

    class PropertyWrapper {
        @propertyWrapper
        struct TwelveOrLess {
            private var number: Int
            init() {
                self.number = 0
                self.projectedValue = true
            }
            var wrappedValue: Int {
                get { return number }
                set { number = min(newValue, 12) }
            }
            var projectedValue: Bool
        }

        func test() {
            struct SmallRectangle {
                @TwelveOrLess var height: Int
                @TwelveOrLess var width: Int
            }

            var rectangle = SmallRectangle()
            print(rectangle.height)
            // Prints "0"

            rectangle.height = 10
            print(rectangle.$height)
            // Prints "10"

            rectangle.height = 24
            print(rectangle.height)
            // Prints "12"
        }

        func test2() {
            struct SmallRectangle {
                private var _height = TwelveOrLess()
                private var _width = TwelveOrLess()
                var height: Int {
                    get { return _height.wrappedValue }
                    set { _height.wrappedValue = newValue }
                }
                var width: Int {
                    get { return _width.wrappedValue }
                    set { _width.wrappedValue = newValue }
                }
            }
        }
    }

    class PropertyWrapperWithOtherField {
        @propertyWrapper
        struct SmallNumber {
            private var maximum: Int
            private var number: Int

            var wrappedValue: Int {
                get { return number }
                set { number = min(newValue, maximum) }
            }

            init() {
                maximum = 12
                number = 0
            }
            init(wrappedValue: Int) {
                maximum = 12
                number = min(wrappedValue, maximum)
            }
            init(wrappedValue: Int, maximum: Int) {
                self.maximum = maximum
                number = min(wrappedValue, maximum)
            }
        }

        func test1() {
            struct ZeroRectangle {
                @SmallNumber var height: Int
                @SmallNumber var width: Int
            }

            var zeroRectangle = ZeroRectangle()
            print(zeroRectangle.height, zeroRectangle.width)
            // Prints "0 0"
        }

        func test_with_init_value() {
            struct UnitRectangle {
                @SmallNumber var height: Int = 1
                @SmallNumber var width: Int = 1
            }

            var unitRectangle = UnitRectangle()
            print(unitRectangle.height, unitRectangle.width)
            // Prints "1 1"
        }

        func test_with_init_value_and_other_fields() {
            struct NarrowRectangle {
                @SmallNumber(maximum: 5) var height: Int = 2
                @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
            }

            var narrowRectangle = NarrowRectangle()
            print(narrowRectangle.height, narrowRectangle.width)
            // Prints "2 3"

            narrowRectangle.height = 100
            narrowRectangle.width = 100
            print(narrowRectangle.height, narrowRectangle.width)
            // Prints "5 4"
        }
    }

    class PropertyWrapperWithProjectedValue {
        @propertyWrapper
        struct SmallNumber {
            private var number: Int
            var projectedValue: Bool
            init() {
                self.number = 0
                self.projectedValue = false
            }
            var wrappedValue: Int {
                get { return number }
                set {
                    if newValue > 12 {
                        number = 12
                        projectedValue = true
                    } else {
                        number = newValue
                        projectedValue = false
                    }
                }
            }
        }
        struct SomeStructure {
            @SmallNumber var someNumber: Int
        }
        var someStructure = SomeStructure()

        func test() {
            someStructure.someNumber = 4
            print(someStructure.$someNumber)
            // Prints "false"

            someStructure.someNumber = 55
            print(someStructure.$someNumber)
            // Prints "true"
        }

        enum Size {
            case small, large
        }

        struct SizedRectangle {
            @SmallNumber var height: Int
            @SmallNumber var width: Int

            mutating func resize(to size: Size) -> Bool {
                switch size {
                case .small:
                    height = 10
                    width = 20
                case .large:
                    height = 100
                    width = 100
                }
                return $height || $width
            }
        }

    }
}
