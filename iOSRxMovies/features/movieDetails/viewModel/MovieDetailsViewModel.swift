//
//  MovieDetailsViewModel.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 20/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    
    fileprivate var movie: MovieElement?
    
    init(movie: MovieElement) {
        self.movie = movie
    }
    
    func getMovieTitle() -> String {
        return movie?.title ?? ""
    }
    
    func getMovieOverview() -> String {
        return movie?.overview ?? "Fail to fecth movie overview"
    }
    
    func setImagePoster(imageContainer: UIImageView) {
        guard let newMoviePosterString = movie?.coverUrl,
            let posterURL = URL(string: newMoviePosterString) else {
                return
        }
        
        let newMoviewPosterURL = URLRequest(url: posterURL)
        
        let width = UIScreen.main.bounds.width / 2
        
        MovieApi.requestPosterCachedImage(
            newMoviewPosterURL: newMoviewPosterURL,
            imageCotainer: imageContainer,
            size: CGSize(width: width, height: 200))
    }
}
