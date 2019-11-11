//
//  AppConstants.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 04/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation

struct AppConstants {
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
