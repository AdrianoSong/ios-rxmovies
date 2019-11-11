//
//  Movie.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation

typealias Movie = [MovieElement]

class MovieElement: Codable {
    
    let title: String?
    let overview: String?
    let duration: String?
    let releaseYear: String?
    let coverUrl: String?
    let backdropsURL: [String]?
    let id: String?
    
    enum CodingKeys : String, CodingKey {
        case backdropsURL = "backdrops_url"
        case id
        case coverUrl = "cover_url"
        case releaseYear = "release_year"
        case title
        case duration
        case overview
    }
    
    init(title: String?,
         overview: String? = nil,
         duration: String? = nil,
         releaseYear: String? = nil,
         coverUrl: String? = nil,
         backdropsURL: [String]? = nil,
         id: String? = nil) {
        self.title = title
        self.overview = overview
        self.duration = duration
        self.releaseYear = releaseYear
        self.coverUrl = coverUrl
        self.backdropsURL = backdropsURL
        self.id = id
    }
}
