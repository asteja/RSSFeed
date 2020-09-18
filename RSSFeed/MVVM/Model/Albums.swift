//
//  Albums.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import Foundation

struct RSSFeed: Decodable {
    let feed:Albums?
}

struct Albums: Decodable {
    let albums:[Album]?
    enum CodingKeys: String, CodingKey {
        case albums = "results"
    }
}

struct Album: Decodable {
    let name: String
    let artistName: String
    let thumbnail: String
    let releaseDate: String
    let copyright: String
    let genres: [[String:String]]
    let url: String
    enum CodingKeys: String, CodingKey {
        case name, artistName, releaseDate, copyright, genres, url
        case thumbnail = "artworkUrl100"
    }
}
