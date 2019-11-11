//
//  MovieApi.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 04/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import RxSwift

class MovieApi: BaseApi {
    
    static func getMovies() -> Observable<Movie> {
        return request(urlConvertile: ApiRouter.getMovies)
    }
}
