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
}
