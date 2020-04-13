//
// Created by hyun kim on 12/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

class Exception {
    enum PrinterError: Error {
        case outOfPaper
        case noToner(name: String)
        case onFire
    }

    func send(job: Int, toPrinter printerName: String) throws -> String {
        if printerName == "Never Has Toner" {
            throw PrinterError.noToner(name: "black")
        }
        assert(printerName == "test")
        precondition(printerName != "test2", "name should not be test2")

        if (printerName != nil) {
            //do something
        } else {
            assertionFailure()
        }

        return "Job sent"
    }

    func one_catch() {
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
            print(printerResponse)
        } catch {
            print(error)
        }
    }

    func multiple_catch() {
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrinterError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error: \(printerError).")
        } catch PrinterError.noToner(let name) {
            print("no toner error: \(name).")
        } catch is PrinterError {//check with type instead of object
            print("Printer error")
        } catch {
            print(error)
        }
        // Prints "Job sent"
    }

    func try_to_optional() {
        let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
        let printerSuccess2 = try! send(job: 1884, toPrinter: "Mergenthaler")
        if let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner") {
            return
        }
    }
}
