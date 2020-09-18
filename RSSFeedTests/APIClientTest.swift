//
//  APIClientTest.swift
//  RSSFeedTests
//
//  Created by Saiteja Alle on 9/18/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import XCTest
@testable import RSSFeed

class APIClientTest: XCTestCase {

    let testImageUrl = "https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/d6/c2/52/d6c252be-a8ea-ea07-d80b-8c3abe245306/603497848508.jpg/200x200bb.png"
        
    func testAlbumDataSuccess() throws {
        let asyncExpectation = expectation(description: "Async block executed")
        APIClient.albumData { (feed, error) in
            DispatchQueue.main.async {
                var isNetWorkResultSuccess = false
                if feed != nil {
                    isNetWorkResultSuccess = true
                }
                XCTAssert(isNetWorkResultSuccess == true , "Failed")
                asyncExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testAlbumDataFailure() throws {
        let asyncExpectation = expectation(description: "Async block executed")
        APIClient.albumData { (feed, error) in
            DispatchQueue.main.async {
                var isNetWorkResultError = false
                if error != nil {
                    isNetWorkResultError = true
                }
                XCTAssert(isNetWorkResultError == true , "Failed")
                asyncExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testLoadImageSuccess() throws {
        let asyncExpectation = expectation(description: "Async block executed")
        APIClient.loadImage(imageURL: testImageUrl) { (data, error) in
            DispatchQueue.main.async {
                var isNetWorkResultSuccess = false
                if data != nil {
                    isNetWorkResultSuccess = true
                }
                XCTAssert(isNetWorkResultSuccess == true , "Failed")
                asyncExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testLoadImageFailure() throws {
        let asyncExpectation = expectation(description: "Async block executed")
        APIClient.loadImage(imageURL: testImageUrl) { (data, error) in
            DispatchQueue.main.async {
                var isNetWorkResultError = false
                if error != nil {
                    isNetWorkResultError = true
                }
                XCTAssert(isNetWorkResultError == true , "Failed")
                asyncExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }


}
