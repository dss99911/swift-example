//
// Created by hyun kim on 13/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

protocol GeneralProtocol {
    func aa()
}

class Generic<Element> {
    var element: Element?
}

extension Generic: GeneralProtocol where Element: Codable {
    func aa() {

    }

    var textualDescription: String {
        "test"
    }

    func bb() -> Element {
        element!
    }

}

func test() {
//    Generic<If>().aa()
    Generic<String>().aa()//String is Codable. so, can use the function.
}

//AssociatedType : generic on protocol
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

extension Array: Container {}

extension If {
    typealias Item = T
}
extension If: Container {

    func append(_ item: Item) {
    }
    var count: Int {
        fatalError("count has not been implemented")
    }
    subscript(i: Int) -> Item {
        fatalError("subscript(_:) has not been implemented")
    }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//returning associated type protocol 'Container' is available with 'some' keyword
//and the return type should be fixed to specific class. can't be changed by condition
func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}

func testaa() {
    let opaqueContainer = makeOpaqueContainer(item: 12)
    let twelve = opaqueContainer[0]

}
