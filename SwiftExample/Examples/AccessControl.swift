//
// Created by hyun kim on 13/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class AccessControl {
    public class SomePublicClass {}
    internal class SomeInternalClass {}
    fileprivate class SomeFilePrivateClass {}
    private class SomePrivateClass {}
}

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}