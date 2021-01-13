//
//  main.swift
//  OOP-Swift-2-2
//
//  Created by Anton Stepanov on 09.01.2021.
//

import Foundation

//let rows: [String] = [
//    "Ivan;Petrov;01.01.01",
//    "Petr;Ivanov;02.02.02"
//]

let file = Bundle.main.path(forResource: "list", ofType: "txt")
let contents = try String(contentsOfFile: file!)
let rows = contents.split(separator:"\n")

for row in rows {
    let part = row.split(separator: ";")
    print("\(part[0]) \(part[1]) \(part[2])")
}

