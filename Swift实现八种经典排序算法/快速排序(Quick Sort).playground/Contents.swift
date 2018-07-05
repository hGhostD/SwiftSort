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

func quickSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    if sortArray.count < 1 { return sortArray }
    var tempSortArray = sortArray
    quickSortPrivateMethod(&tempSortArray, leftIndex: 0, rightIndex: tempSortArray.count - 1)
    return tempSortArray
    
}

func quickSortPrivateMethod<T:custProtol>(_ sortArray: inout [T], leftIndex:Int, rightIndex:Int) {
    var left = leftIndex, right = rightIndex, baselineIndex = 0
    if left < right {
        baselineIndex = partition(array: &sortArray, leftIndex: leftIndex, rightIndex: rightIndex)
        quickSortPrivateMethod(&sortArray, leftIndex: leftIndex, rightIndex: baselineIndex - 1)
        quickSortPrivateMethod(&sortArray, leftIndex: baselineIndex + 1, rightIndex: right)
    }
}

func partition<T:custProtol>(array:inout [T], leftIndex: Int, rightIndex: Int) -> Int {
    var pivot = leftIndex, index = pivot + 1
    var i = index
    while i <= rightIndex {
        if array[i] < array[pivot] {
            array.swapAt(i , index)
            index += 1
        }
        i += 1
    }
    array.swapAt(pivot, index - 1)
    return index - 1
}

var array: [Student] = []
for i in 0...9 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}
print(quickSort(array))
