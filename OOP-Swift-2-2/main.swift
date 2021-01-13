//
//  main.swift
//  OOP-Swift-2-2
//
//  Created by Anton Stepanov on 09.01.2021.
//

import Foundation

func loadStudentsFromTxt(_ file: String) -> [Int:[String:String]] {
    
    let contents = try! String(contentsOfFile: file)
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
    return students
}

func getFullName(_ student: [String:String]) -> String {
    return "\(String(student["firstName"]!)) \(String(student["lastName"]!))"
}

/// ---Setup App---------------------------------------------------

let file = Bundle.main.path(forResource: "list", ofType: "txt")!

/// ---Main code---------------------------------------------------

let students = loadStudentsFromTxt(file)

for (_,student) in students {
    print(getFullName(student), "\(String(student["birthDate"]!))")
}
