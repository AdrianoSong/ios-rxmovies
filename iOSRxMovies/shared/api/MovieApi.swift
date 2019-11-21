//
//  MovieApi.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 04/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import RxSwift
import UIKit
import AlamofireImage

class MovieApi: BaseApi {
    
    static func getMovies() -> Observable<Movie> {
        return request(urlConvertile: ApiRouter.getMovies)
    }
    
    static func requestPosterCachedImage(
        newMoviewPosterURL: URLRequest,
        imageCotainer: UIImageView,
        size: CGSize = CGSize(width: 100, height: 150)) {
        imageCotainer.af_setImage(
            withURLRequest: newMoviewPosterURL, imageTransition: .crossDissolve(0.4), completion: { result in
                guard let resultImage = result.value else {
                    imageCotainer.image = UIImage(named: "question_mark")?
                        .af_imageScaled(to: CGSize(width: 100, height: 100))
                        .af_imageRounded(withCornerRadius: 20.0)
                    return
                }
                                
                imageCotainer.image = resultImage
                    .af_imageScaled(to: size)
                    .af_imageRounded(withCornerRadius: 20.0)
        })
    }
}
