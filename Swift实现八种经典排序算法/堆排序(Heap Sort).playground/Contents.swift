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

var len: NSInteger = 0

func heapSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    if sortArray.count <= 1 { return sortArray}
    var tempSortArray = sortArray
    buildMaxHeap(array: &tempSortArray)
    var index = tempSortArray.count - 1
    while index > 0 {
        tempSortArray.swapAt(0, index)
        len -= 1
        heapify(array: &tempSortArray, index: 0)
        index -= 1
    }
    return tempSortArray
}

func buildMaxHeap<T:custProtol>(array:inout [T]) {
    len = array.count
    var i = len / 2
    while i >= 0 {
        heapify(array: &array, index: i)
        i -= 1
    }
}

func heapify<T:custProtol>(array: inout [T], index: NSInteger) {
    var left = 2 * index + 1, right = 2 * index + 2, largest = index
    if left < len && array[left] > array[largest] {
        largest = left
    }
    if right < len && array[right] > array[largest] {
        largest = right
    }
    if largest != index {
        array.swapAt(index, largest)
        heapify(array: &array, index: largest)
    }
}

var array: [Student] = []
for i in 0...9 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}

print(heapSort(array))
