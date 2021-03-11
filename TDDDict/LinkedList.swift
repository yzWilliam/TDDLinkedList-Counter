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
    func thirdNodeFromTheEnd() -> Node?
    func ifContainsCycle() -> Bool
    func findCycleLength() -> Int
    func startNodeOfCycle() -> Node?
    func reverse()
    func removeDuplicate()
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
    
    func thirdNodeFromTheEnd() -> Node? {
        var slow = head, fast = head?.next?.next
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
    
    func ifContainsCycle() -> Bool {
        var fast = head, slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
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
            if fast === slow {
                var curr = slow
                var length = 1
                while curr?.next !== slow {
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
        var x = head, y = head
        for _ in 1...findCycleLength() {
            y = y?.next
        }
        while x !== y {
            x = x?.next
            y = y?.next
        }
        return x
    }
    
    func reverse() {
        var prev: Node?
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        head = prev
    }
    
    func removeDuplicate() {
        var numbers = Set<Int>()
        var prev: Node?
        var curr = head
        while curr != nil {
            if numbers.contains(curr!.value) {
                prev?.next = curr?.next
            } else {
                numbers.insert(curr!.value)
            }
            prev = curr
            curr = curr?.next
        }
    }
    
}

class Node {
    var value: Int
    var next: Node?

    init(value: Int) {
        self.value = value
    }
}
