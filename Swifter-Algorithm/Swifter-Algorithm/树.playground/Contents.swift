//: Playground - noun: a place where people can play

import Foundation

public class TreeNode<T> {
    public var value: T
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChildren(node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
    
}

extension TreeNode : CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += "{" + children.map{ (node) -> String in
                return node.description
                }.joined(separator: ",") + "}"
        }
        return s
    }
}

extension TreeNode where T: Equatable {
    func search(value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}







