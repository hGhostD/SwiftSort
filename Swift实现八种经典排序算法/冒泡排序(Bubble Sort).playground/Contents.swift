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

func bubbleSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    //冒泡排序
    var tempSortArray = sortArray
    let sortArrayCount = sortArray.count
    
    for i in 0..<sortArrayCount {
        for j in 0..<sortArrayCount - i - 1 {
            if tempSortArray[j] > tempSortArray[j + 1] {
                tempSortArray.swapAt(j, j + 1)
            }
        }
    }
    return tempSortArray
}


var array: [Student] = []
for i in 0...3 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}
bubbleSort(array)
