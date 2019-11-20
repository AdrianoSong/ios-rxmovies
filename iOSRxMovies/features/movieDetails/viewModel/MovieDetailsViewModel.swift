//
//  MovieDetailsViewModel.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 20/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation

class MovieDetailsViewModel {
    
    fileprivate var movie: MovieElement?
    
    init(movie: MovieElement) {
        self.movie = movie
    }
    
    func getMovieTitle() -> String {
        return movie?.title ?? ""
    }
}
