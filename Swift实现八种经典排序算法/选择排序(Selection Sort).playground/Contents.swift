import Foundation

typealias custProtol = Comparable & Equatable
struct Student {
    let name: String
    let age: NSInteger
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


func selectionSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    var tempSortArray = sortArray
    for i in 0 ..< sortArray.count {
        var minIndex = i
        for j in minIndex + 1 ..< sortArray.count {
            if tempSortArray[minIndex] > tempSortArray[j] {
                minIndex = j
            }
        }
        tempSortArray.swapAt(minIndex, i)
    }
    return tempSortArray
}

var array: [Student] = []
for i in 0...3 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}
selectionSort(array)
