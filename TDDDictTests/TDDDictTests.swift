//
//  TDDDictTests.swift
//  TDDDictTests
//
//  Created by Zhiwei Yu on 3/11/21.
//

import XCTest
@testable import TDDDict

class TDDDictTests: XCTestCase {

    var counter: Counter?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testInit() throws {
        counter = Counter(str: "test")
        XCTAssertEqual(counter?.str, "test")
    }
    
    func testEmptyString() throws {
        counter = Counter(str: "")
        XCTAssertEqual(counter?.count(), [Character: Int]())
    }
    
    func test1() throws {
        counter = Counter(str: "abc")
        let res = counter?.count()
        XCTAssertEqual(res?["a"], 1)
        XCTAssertEqual(res?["b"], 1)
        XCTAssertEqual(res?["c"], 1)
    }
    
    func test2() throws {
        counter = Counter(str: "aac")
        let res = counter?.count()
        XCTAssertEqual(res?["a"], 2)
        XCTAssertEqual(res?["c"], 1)
    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
