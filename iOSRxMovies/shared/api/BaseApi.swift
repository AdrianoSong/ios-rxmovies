//
//  BaseApi.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 04/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class BaseApi {
    
    static func request<T: Codable>(urlConvertile: URLRequestConvertible) -> Observable<T> {
        
        return Observable<T>.create { emitter in
            let request = Alamofire.request(urlConvertile).responseData(completionHandler: { data in
                
                switch data.result {
                case .success(let dataValue):
                    
                    do {
                        let decoder = JSONDecoder()
                        let parsedDataToModel = try decoder.decode(T.self, from: dataValue)
                        
                        emitter.onNext(parsedDataToModel)
                        emitter.onCompleted()
                        
                    } catch let error {
                        emitter.onError(error)
                    }
                case .failure(let error):
                    emitter.onError(error)
                }
            })
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
