//
//  ViewModelTests.swift
//  RSSFeedTests
//
//  Created by Saiteja Alle on 9/18/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import XCTest
@testable import RSSFeed

class ViewModelTests: XCTestCase {
    var viewModel:ViewModel?
    
    override func setUpWithError() throws {
        self.viewModel = ViewModel()
        XCTAssertNotNil(self.viewModel)
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    func testFetchAlbumDataSuccess() throws {
        let fetchExpectation = expectation(description: "View Model Fetch")
        DispatchQueue.main.async {
            self.viewModel?.fetchAlbumData()
        }
        self.viewModel?.rssFeedData.bind(listener: { (value) in
            if value != nil {
              fetchExpectation.fulfill()
            }
        })
        waitForExpectations(timeout: 3, handler: { (_) in
            XCTAssert(self.viewModel?.rssFeedData.value != nil, "Failed")
            XCTAssert(self.viewModel?.apiError.value == nil, "Failed")
        })
    }
    
    func testFetchAlbumDataFailure() throws {
        
        let fetchExpectation = expectation(description: "View Model Fetch")
        DispatchQueue.main.async {
            self.viewModel?.fetchAlbumData()
        }
        self.viewModel?.apiError.bind(listener: { (value) in
            if value != nil {
              fetchExpectation.fulfill()
            }
        })
        waitForExpectations(timeout: 3, handler: { (_) in
            XCTAssert(self.viewModel?.rssFeedData.value == nil, "Failed")
            XCTAssert(self.viewModel?.apiError.value != nil, "Failed")
        })
        
    }

}
