//
//  LinkedList.swift
//  TDDDict
//
//  Created by Zhiwei Yu on 3/11/21.
//

import Foundation

protocol LinkedListProtocol {
    var length: Int { get }
    func middleElement() -> Node?
    func ifContainsCycle() -> Bool
    func findCycleLength() -> Int
    func startNodeOfCycle() -> Node?
    func reverse()
    func removeDuplicate()
    func thirdNodeFromTheEnd() -> Node?
}

class LinkedList: LinkedListProtocol {
    var head: Node?
    
    var length: Int {
        var count = 0
        var curr = head
        while curr != nil {
            count += 1
            curr = curr?.next
        }
        return count
    }
    
    func middleElement() -> Node? {
        var fast = head, slow = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func ifContainsCycle() -> Bool {
        var fast = head, slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if (fast === slow) {
                return true
            }
        }
        return false
    }
    
    func findCycleLength() -> Int {
        var fast = head, slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if (fast === slow) {
                var curr = slow
                var length = 1
                while (curr?.next !== slow) {
                    length += 1
                    curr = curr?.next
                }
                return length
            }
        }
        return 0
    }
    
    func startNodeOfCycle() -> Node? {
        if !ifContainsCycle() {
            return nil
        }
        let length = findCycleLength()
        var x = head, y = head
        var i = 0
        while i < length {
            y = y?.next
            i += 1
        }
        while x !== y {
            x = x?.next
            y = y?.next
        }
        return x
    }
    
    func reverse() {
        
    }
    
    func removeDuplicate() {
        
    }
    
    func thirdNodeFromTheEnd() -> Node? {
        var slow = head, fast = head?.next?.next
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
    
}

class Node {
    var value: Int
    var next: Node?

    init(value: Int) {
        self.value = value
    }
}
