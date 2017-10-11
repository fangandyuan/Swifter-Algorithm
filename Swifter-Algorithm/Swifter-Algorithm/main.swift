//
//  main.swift
//  Swifter-Algorithm
//
//  Created by 方圆 on 16/6/26.
//  Copyright © 2016年 fangyuan. All rights reserved.
//

import Foundation

print("Hello, World!")

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

extension BinaryTree {
    public func traverseInOrder(process: (T)-> Void) {//中序遍历   左子树 -> 根结点 -> 右子树
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (T)-> Void) {//先序遍历 根结点 -> 左子树 -> 右子树
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T)-> Void) {//后序遍历 左子树 -> 右子树 -> 根结点
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}

let node1 = BinaryTree.node(.empty, "5", .empty)
let node2 = BinaryTree.node(.empty, "15", .empty)
let node3 = BinaryTree.node(node1, "10", node2)

node3.traversePostOrder { (str) in
    print(str)
}

//print(node3.description)

