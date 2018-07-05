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

func mergeSort<T:custProtol>(_ sortArray:[T]) -> [T] {
    if sortArray.count < 2 { return sortArray }
    var tempSortArray = sortArray
    let sortArrayMiddleIndex = sortArray.count / 2 - 1
    let leftArray = [T]() + tempSortArray[0 ... sortArrayMiddleIndex]
    let rightArray = [T]() + tempSortArray[sortArrayMiddleIndex + 1 ... sortArray.count - 1]
    
    let resultArray = mergeArray(leftArray: mergeSort(leftArray), rightArray: mergeSort(rightArray))
    return resultArray
}

func mergeArray<T:custProtol>(leftArray:[T], rightArray:[T]) -> [T] {
    var mergeArray = [T]()
    var minArray = leftArray.count < rightArray.count ? leftArray : rightArray
    var maxArray = leftArray.count < rightArray.count ? rightArray: leftArray
    var minIndex = 0, maxIndex = 0
    while minIndex < minArray.count {
        if maxIndex >= maxArray.count {
            mergeArray.append(minArray[minIndex])
            minIndex += 1
            continue
        }
        if minArray[minIndex] < maxArray[maxIndex] {
            mergeArray.append(minArray[minIndex])
            minIndex += 1
        }else {
            mergeArray.append(maxArray[maxIndex])
            maxIndex += 1
        }
    }
    while minIndex < minArray.count {
        mergeArray.append(maxArray[minIndex])
        minIndex += 1
    }
    while maxIndex < maxArray.count {
        mergeArray.append(maxArray[maxIndex])
        maxIndex += 1
    }
    return mergeArray
}

var array: [Student] = []
for i in 0...9 {
    let age = Int(arc4random() % 100)
    
    let student = Student(name: "S\(i).", age: age)
    array.append(student)
}
print(mergeSort(array))
