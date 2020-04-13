//
// Created by hyun kim on 13/04/20.
// Copyright (c) 2020 Hyun. All rights reserved.
//

import Foundation

func json() {
    struct Person: Codable {
        var name: String
        var age: Int
    }

    let jsonString = """
                     [
                         {
                             "name": "Taylor Swift",
                             "age": 26
                         },
                         {
                             "name": "Justin Bieber",
                             "age": 25
                         }
                     ]
                     """

    let jsonData = Data(jsonString.utf8)

    let decoder = JSONDecoder()

    do {
        let people = try decoder.decode([Person].self, from: jsonData)
        print(people)
    } catch {
        print(error.localizedDescription)
    }
}
