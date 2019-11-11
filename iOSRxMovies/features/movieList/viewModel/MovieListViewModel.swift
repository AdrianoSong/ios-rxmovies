//
//  MovieListViewModel.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 28/10/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Alamofire
import AlamofireImage

protocol MovieListViewModelDelegate: class {
    func fetchedMovies(movies: Movie)
}

class MovieListViewModel {
    
    fileprivate let disposebag = DisposeBag()
    
    weak var delegate: MovieListViewModelDelegate?
    
    init(delegate: MovieListViewModelDelegate?) {
        
        self.delegate = delegate
        
        callForMovies()
    }
    
    fileprivate func callForMovies() {
        MovieApi.getMovies()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (moviesResult) in
                self.delegate?.fetchedMovies(movies: moviesResult)
            }, onError: { (error) in
                print("error \(error)")
            }, onCompleted: {
                print("onComplete moviesResult")
            }).disposed(by: disposebag)
    }
    
    func getPosterImage(posterStringUrl: String?, completion: @escaping (Image) -> Void) {
        
        guard let stringUrl = posterStringUrl else {
            return
        }
        
        Alamofire.request(stringUrl).responseImage { (respondeImage) in
            guard let image = respondeImage.value else {
                return
            }
            
            completion(image)
        }
    }
}
