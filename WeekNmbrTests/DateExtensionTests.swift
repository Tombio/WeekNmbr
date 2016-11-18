//
//  DateExtensionTests.swift
//  WeekNmbr
//
//  Created by Tomi Lahtinen on 16/11/2016.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let date = Calendar.current.date(bySettingHour: 0, minute: 1, second: 1, of: Date())
        let hourComponent = Calendar.current.dateComponents([.hour], from: date.nextHour())
        XCTAssert(hourComponent == 1, "Hour component test")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
