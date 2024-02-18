import Foundation

struct Student {
    var firstName: String
    var lastName: String
    var averageGrade: Double
}

class Journal {
    var students: [Student] = []

    func addStudent(student: Student) {
        students.append(student)
    }

    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    func displayStudentsInfo() {
        for student in students {
            print("\(student.firstName) \(student.lastName), \(student.averageGrade)")
        }
    }

    func listStudentsByGPA() {
        let sortedStudents = students.sorted(by: { $0.averageGrade > $1.averageGrade })
        for student in sortedStudents {
            print("\(student.firstName) \(student.lastName), \(student.averageGrade)")
        }
    }

    func findAverageScore() -> Double {
        let totalScore = students.reduce(0.0) { $0 + $1.averageGrade }
        return totalScore / Double(students.count)
    }

    func findStudentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

func getInput() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let stringData = String(data: inputData, encoding: .utf8)!
    return stringData.trimmingCharacters(in: .newlines)
}

let journal = Journal()

while true {
    print("Choose from 1 to 6:")
    print("1. Add Student")
    print("2. Remove Student")
    print("3. Display All Students")
    print("4. List Students by GPA")
    print("5. Find Average Score")
    print("6. Find Student with Highest GPA")
    
    if let choice = Int(getInput()) {
        switch choice {
        case 1:
            print("Enter first name:")
            let firstName = getInput()
            print("Enter last name:")
            let lastName = getInput()
            print("Enter average grade:")
            if let averageGrade = Double(getInput()) {
                journal.addStudent(student: Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade))
            } else {
                print("Incorrect average grade!")
            }
        case 2:
            print("Enter first name of student to remove:")
            let firstName = getInput()
            print("Enter last name of student to remove:")
            let lastName = getInput()
            journal.removeStudent(firstName: firstName, lastName: lastName)
        case 3:
            journal.displayStudentsInfo()
        case 4:
            journal.listStudentsByGPA()
        case 5:
            let averageScore = journal.findAverageScore()
            print("\(averageScore)")
        case 6:
            if let highestGPAStudent = journal.findStudentWithHighestGPA() {
                print("\(highestGPAStudent.firstName) \(highestGPAStudent.lastName), \(highestGPAStudent.averageGrade)")
            } else {
                print("No students in the journal.")
            }
        default:
            print("Incorrect choice!")
        }
    } else {
        print("Incorrect choice!")
    }
}
