//: Playground - noun: a place where people can play

import UIKit

//方程式为：f(x) = 0，示例中f(x) = 1+x-x^3

func f(x:Double) -> (Double) {
    return 1 + x - x * x * x;
}

func main (){
    var a : Double = 0.0
    var b : Double = 10.0
    var e : Double = 0.0
    
    while f(x: e) != 0 {
        f(x: a)
        f(x: b)
        f(x: e)
        e = (a + b) / 2.0
        if (f(x: a) * f(x: e)) < 0 {
            b = e
        }else if (f(x: b) * f(x: e)) < 0 {
            a = e
        }
    }
    print(e)
}

main()
