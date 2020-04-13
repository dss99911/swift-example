//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Strings {
    func literal() {
        var sample = "aa"
        var sample2 = "aab"

        var useVariable = "\(sample + sample2) test"

        let quotation = """
                        I said "I have \(sample) apples."
                        And then I said "I have \(sample + sample2) pieces of fruit."
                        """
        let ignoreEscape = #"Line 1\nLine 2"#

        let threeMoreDoubleQuotationMarks = #"""
                                            Here are three more double quotes: """
                                            """#

        print(#"6 times 7 is \#(6 * 7)."#)
    }

    func prefix_suffix() {
        var sample = "asdfsdf"

        sample.hasPrefix("as")
        sample.hasSuffix("df")
    }
}

