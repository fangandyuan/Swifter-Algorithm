//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

var array = Array(arrayLiteral: 28,43,34,93,56,55,30,78,29)

for i in 0...(array.count - 2) {
    for j in (i+1)...(array.count - 1) {
        if array[i] < array[j] {
            let temp = array[i]
            array[i] = array[j]
            array[j] = temp
        }
    }
}

print(array)
