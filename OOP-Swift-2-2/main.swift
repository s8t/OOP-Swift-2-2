//
//  main.swift
//  OOP-Swift-2-2
//
//  Created by Anton Stepanov on 09.01.2021.
//

import Foundation

struct Student {

    var firstName : String
    var lastName : String
    var birthDate : String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    init(_ firstName : String, _ lastName : String, _ birthDate : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
    }

}

func loadStudentsFromTxt(_ file: String) -> [Int:Student] {
       
    var students = [Int:Student]()
    do {
        let contents = try String(contentsOfFile: file)
        let rows = contents.split(separator:"\n")
        for (index, row) in rows.enumerated() {
            let part = row.split(separator: ";")
            let student = Student(String(part[0]), String(part[1]), String(part[2]))
            students[index] = student
        }
    } catch {
        // ... something went wrong
    }
    
    return students
}


func saveStudentsToTxt(_ students: [Int:Student], _ file: String) {

    var rows = [String]()
    for student in students.values {
        let row = "\(student.firstName);\(student.lastName);\(student.birthDate)"
        rows.append(row)
    }
    // ... write to file
}

/// ---Setup App---------------------------------------------------

let file = Bundle.main.path(forResource: "list", ofType: "txt")!

/// ---Main code---------------------------------------------------

let students = loadStudentsFromTxt(file)

for student in students.values {
    print("\(student.fullName) \(student.birthDate)")
}

saveStudentsToTxt(students, file)


