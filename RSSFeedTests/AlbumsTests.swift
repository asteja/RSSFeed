//
//  AlbumsTests.swift
//  RSSFeedTests
//
//  Created by Saiteja Alle on 9/18/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import XCTest
@testable import RSSFeed

class AlbumsTests: XCTestCase {

    var exampleJSONData: Data!
    var rssFeed: RSSFeed!

    override func setUpWithError() throws {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "AlbumsDataExample", withExtension: "json")!
        exampleJSONData = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        rssFeed = try! decoder.decode(RSSFeed.self, from: exampleJSONData)
    }

    func testNumberOfAlbums() throws {
        XCTAssertEqual(rssFeed.feed?.albums?.count, 40)
    }
}
