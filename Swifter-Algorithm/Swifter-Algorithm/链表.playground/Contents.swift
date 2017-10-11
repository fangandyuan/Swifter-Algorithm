//: Playground - noun: a place where people can play

import Foundation

//链表的实现

//节点
public class LinkedListNode<T> {
    var value : T
    var next : LinkedListNode?
    weak var previous : LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}
//链表
public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    private var head: Node?
    public var isEmpty: Bool {
        return head == nil
    }
    public var first: Node? {
        return head
    }
    
    public var last : Node? {
        if var node = head {
            while let next = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        }else {
            head = newNode
        }
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public func nodeAt(_ index: Int) -> Node? {
        guard index >= 0 else {
            return nil
        }
        
        var node = head
        var i = index
        while node != nil {
            if i == 0 {
                return node
            }
            i -= 1
            node = node!.next
        }
        return nil
    }
    
    public subscript(index: Int) -> T? {
        let node = nodeAt(index)
        assert(node != nil)
        return node!.value
    }
    
    public func nodesBeforerAndAfter(index: Int) -> (Node?,Node?) {
        assert(index>=0)
        var i = index
        var next = head
        var prev: Node?
        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next!.next
        }
        assert(i == 0)
        return (prev,next)
    }
    
    public func insert(value: T,atIndex index: Int) {
        let (prev, next) = nodesBeforerAndAfter(index: index)
        let newNode = Node(value: value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        prev?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
    }
    
    public func remove(node:Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prve = prev {
            prev?.next = next
        }else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    public func removeAt(_ index: Int) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return remove(node: node!)
    }
    //翻转
    public func reverse() {
        var node = head;
        //tail = node
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
    
    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(value: transform(node!.value))
            node = node!.next
        }
        return result
    }
    
    public func filter(predicate: (T) -> Bool) ->  LinkedList<T> {
        let result = LinkedList<T>()
        var node = head
        while node != nil {
            if predicate(node!.value) {
                result.append(value: node!.value)
            }
            node = node!.next
        }
        return result
    }
    
}

extension LinkedList : CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = first
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += "," }
        }
        return s + "]"
    }
}

//enum LinkedList<T> {
//    indirect case node(T, next : LinkedList)
//    case end
//}

let list = LinkedList<String>()
list.append(value: "hello")
list.append(value: "world")
list.append(value: "swift")
list.insert(value: "fangyuan", atIndex: 2)
list[0]
list[1]
list[2]
list.count
list.first?.value
list.isEmpty
list.last?.value

let m = list.map { (value) -> Int in
    value.characters.count
}

print(m)










