//
//  testManager.swift
//  npuzzle
//
//  Created by Luc CASIMIR on 1/18/17.
//  Copyright © 2017 Owee. All rights reserved.
//

import XCTest

class testManager: XCTestCase {

    var manager = Manager()
    var success = npuzzleError.success
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        XCTAssert(manager.errorHandle == success)
    }
    
    func testMakePuzzle()
    {
        manager.makePuzzle()
        XCTAssert(manager.errorHandle == success)
    }
    
    func testResolvePuzzle(){
        manager.resolvePuzzle()
        XCTAssert(manager.errorHandle == success)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
