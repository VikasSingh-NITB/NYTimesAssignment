//
//  NYTimesAssignmentTests.swift
//  NYTimesAssignmentTests
//
//  Created by Vikas Singh on 08/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//
import Foundation
import XCTest
@testable import NYTimesAssignment

class NYTimesAssignmentTests: XCTestCase {
    
    let featuredArticleJSON = [Constants.url: "https://www.apple.com",
                               Constants.abstract: "Unit Test Abstract",
                               Constants.section: "Unit Test Section",
                               Constants.title: "Unit Test Title",
                               Constants.publishedDate: "2018-08-08"]
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testFeaturedArticle() {
        do {
            _ = try MostPopularArticle(json: featuredArticleJSON)
        } catch {
            XCTAssert(false)
        }
    }
    
}
