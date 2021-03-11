//
//  LinkedListTest.swift
//  TDDDictTests
//
//  Created by Zhiwei Yu on 3/11/21.
//

import XCTest
@testable import TDDDict

class LinkedListTest: XCTestCase {

    var list: LinkedList?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        list = LinkedList()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setUpWithNoCycle() {
        list?.head = Node(value: 1)
        list?.head?.next = Node(value: 2)
        list?.head?.next?.next = Node(value: 3)
        list?.head?.next?.next?.next = Node(value: 4)
        list?.head?.next?.next?.next?.next = Node(value: 5)
    }
    
    func setUpWithCycle() {
        setUpWithNoCycle()
        list?.head?.next?.next?.next?.next?.next = list?.head?.next?.next
    }

    func testInit() throws {
        XCTAssertNotNil(list)
    }
    
    func testHead() throws {
        list?.head = Node(value: 1)
        XCTAssertEqual(list?.head?.value, 1)
        XCTAssertNil(list?.head?.next)
    }
    
    func testLength() throws {
        setUpWithNoCycle()
        XCTAssertEqual(list?.length, 5)
    }
    
    func testMiddleElement() throws {
        setUpWithNoCycle()
        XCTAssertEqual(list?.middleElement()?.value, 3)
    }
    
    func testIfContainsCycle_hasCycle() throws {
        setUpWithCycle()
        XCTAssertEqual(list?.ifContainsCycle(), true)
    }
    
    func testIfContainsCycle_noCycle() throws {
        setUpWithNoCycle()
        XCTAssertEqual(list?.ifContainsCycle(), false)
    }
    
    func testFindCycleLength_hasCycle() throws {
        setUpWithCycle()
        XCTAssertEqual(list?.findCycleLength(), 3)
    }
    
    func testFindCycleLength_noCycle() throws {
        setUpWithNoCycle()
        XCTAssertEqual(list?.findCycleLength(), 0)
    }
    
    func testFindCycleStart_hasCycle() throws {
        setUpWithCycle()
        XCTAssertEqual(list?.startNodeOfCycle()?.value, 3)
    }
    
    func testFindCycleStart_noCycle() throws {
        setUpWithNoCycle()
        XCTAssertNil(list?.startNodeOfCycle())
    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
