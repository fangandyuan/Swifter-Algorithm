//: Playground - noun: a place where people can play

import Foundation

//public class BinaryTree<T> {
//    public var value: T
//    public weak var parent: BinaryTree?
//    public var left : BinaryTree?
//    public var right : BinaryTree?
//
//    public init(value: T, left: BinaryTree?, right: BinaryTree?) {
//        self.value = value
//        self.left = left
//        self.right = right
//    }
//}

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>,T,BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left,_,right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree : CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left,value,right):
            return "value: \(value),left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

let node1 = BinaryTree.node(.empty, "5", .empty)
let node2 = BinaryTree.node(.empty, "10", .empty)
let node3 = BinaryTree.node(node1, "10", node2)

node3.description








