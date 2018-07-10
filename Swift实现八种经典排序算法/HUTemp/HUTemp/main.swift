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
// 一般是针对已知范围的应用排序。而且这个范围不能太大

func contingSort<T:custProtol>(_ sortArray:inout [T], maxValue: NSInteger) -> [T] {
    var bucketArray:[NSInteger] = Array(repeating: 0, count: maxValue + 1),
    sortedIndex = 0,
    arrayLen = sortArray.count,
    bucketLen = maxValue + 1
    var i = 0
    while i < arrayLen {
        let key = sortArray[i] as! Student
        
        bucketArray[key.age] += 1
        i += 1
    }
    
    var j = 0
    while j < bucketLen {
        while bucketArray[j] > 0 {
            let new = Student(name: (sortArray[sortedIndex] as! Student).name, age: j) as! T
            sortArray[sortedIndex] = new
            sortedIndex += 1
            bucketArray[j] -= 1
        }
        j += 1
    }
    return sortArray
}

var array: [Student] = []
for i in 0...10 {
    let age = Int(arc4random() % 10)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}

print(contingSort(&array, maxValue: 10))


