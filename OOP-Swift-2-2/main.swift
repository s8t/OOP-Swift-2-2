//
//  main.swift
//  OOP-Swift-2-2
//
//  Created by Anton Stepanov on 09.01.2021.
//

import Foundation

let file = Bundle.main.path(forResource: "list", ofType: "txt")
let contents = try String(contentsOfFile: file!)
let rows = contents.split(separator:"\n")

var students = [Int:[String:String]]()

for (index, row) in rows.enumerated() {
    let part = row.split(separator: ";")
    students[index] = [
        "firstName" : String(part[0]),
        "lastName" : String(part[1]),
        "birthDate" : String(part[2])
    ]
}

for student in students.values {
    print("\(String(student["firstName"]!)) \(String(student["lastName"]!)) \(String(student["birthDate"]!))")
}
