//: Playground - noun: a place where people can play

import Foundation

//辅助空间 效率太低了
func quickSort(data:[Int])->[Int] {
    if data.count <= 1 {
        return data
    }
    var left:[Int] = []
    var right:[Int] = []
    let pivot:Int = data[0]
    for index in 0..<data.count {
        if data[index] < pivot {
            left.append(data[index])
        }else{
            right.append(data[index])
        }
    }
    
    var leftResult = quickSort(data: left)
    leftResult.append(pivot)
    let rightResult = quickSort(data: right)
    leftResult.append(contentsOf: rightResult)
    return leftResult
}

let arr = [23,12,11,43,54,43,12,66]
let resultArr = quickSort(data: arr)





