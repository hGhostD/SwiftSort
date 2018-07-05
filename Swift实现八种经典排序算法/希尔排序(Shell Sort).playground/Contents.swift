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

func shellSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    var tempArray = sortArray
    var gap = sortArray.count / 2 + 1
    while gap > 0 {
        var i = 0
        while i < sortArray.count {
            var j = i
            while j < sortArray.count - gap {
                if tempArray[j] > tempArray[j + gap] {
                    tempArray.swapAt(j, j + gap)
                }
                j += gap
            }
            i += 1
        }
        gap -= 1
    }
    return tempArray
}

var array: [Student] = []
for i in 0...9 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}
print(shellSort(array))

