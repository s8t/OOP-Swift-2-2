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

protocol StudentRepository {
    func findAll() -> [Int:Student]
    func saveAll(_ students: [Int:Student])
}

struct TXTStudentRepository : StudentRepository {
    
    private let file: String
    
    init(_ file: String) { self.file = file }
    
    func findAll() -> [Int:Student] {
           
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

    func saveAll(_ students: [Int:Student]) {

        var rows = [String]()
        for student in students.values {
            let row = "\(student.firstName);\(student.lastName);\(student.birthDate)"
            rows.append(row)
        }
        // ... write to file
    }
}

struct XMLStudentRepository : StudentRepository {
    
    private let file: String
    
    init(_ file: String) { self.file = file }
    
    func findAll() -> [Int:Student] {
        let students = [Int:Student]()
        // ... impl read from file
        return students
    }

    func saveAll(_ students: [Int:Student]) {
        // ... impl write to file
    }
}

/// ---Config App---------------------------------------------------

let type = "txt"
let file = Bundle.main.path(forResource: "list", ofType: type)!
var studentRepository: StudentRepository!
switch type {
case "txt":
    studentRepository = TXTStudentRepository(file)
case "xml":
    studentRepository = XMLStudentRepository(file)
default:
    print("Incorrect type file:", type)
}

/// ---Main code---------------------------------------------------

let students = studentRepository.findAll()

for student in students.values {
    print("\(student.fullName) \(student.birthDate)")
}

studentRepository.saveAll(students)
