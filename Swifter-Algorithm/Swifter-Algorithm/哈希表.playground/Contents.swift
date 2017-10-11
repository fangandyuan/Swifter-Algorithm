//: Playground - noun: a place where people can play

import Foundation

//哈希表的实现
//多个表组合成一个表

public struct HashTable<Key: Hashable,Value> {
    private typealias Element = (key:Key,value:Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    private(set) public var count = 0
    
    public var isEmpty: Bool {return count == 0}
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    private func index(forkey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    private func value(forkey key: Key) -> Value? {
        let indxt = self.index(forkey: key)
        for element in buckets[indxt] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    private mutating func updateValue(_ value: Value, forkey key: Key) -> Value? {
        let index = self.index(forkey: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let orderVaule = element.value
                buckets[index][i].value = value
                return orderVaule
            }
        }
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    public mutating func removeValue(forKey key:Key) -> Value? {
        let index = self.index(forkey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forkey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forkey: key)
            }else {
                removeValue(forKey: key)
            }
        }
    }
}

var hashTable = HashTable<String, String>(capacity: 5)
hashTable["name"] = "fangyuan"
let x = hashTable["name"]
hashTable["name"] = "zhangchunjiao"
print(hashTable)
hashTable["name"] = nil













