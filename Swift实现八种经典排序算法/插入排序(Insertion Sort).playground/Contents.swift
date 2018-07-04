import Foundation

typealias custProtol = Comparable & Equatable
struct Student {
    let name: String
    let age: Int
}
extension Student: custProtol {
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func > (lhs: Student, rhs: Student) -> Bool {
        return lhs.age > rhs.age
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.age == rhs.age
    }
    
}


func insertionSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    var tempSortArray = sortArray
    for i in 1 ..< sortArray.count {
        let tempValue = tempSortArray[i]
        var insertIndex = 0
        for j in  0 ..< i {
            insertIndex = i - 1 - j
            if tempValue > tempSortArray[insertIndex] {
                insertIndex = i - j
                break
            }
            tempSortArray[insertIndex + 1] = tempSortArray[insertIndex]
        }
        tempSortArray[insertIndex] = tempValue
    }
    return tempSortArray
}

var array: [Student] = []
for i in 0...3 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}
insertionSort(array)

