//
//  APIRouter.swift
//  iOSRxMovies
//
//  Created by Adriano Song on 04/11/19.
//  Copyright © 2019 Adriano Song. All rights reserved.
//

import Foundation
import Alamofire

//ref:
//https://medium.com/@marioamgad9/swift-4-2-building-a-network-layer-using-alamofire-and-rxswift-e044b5636d55

enum ApiRouter: URLRequestConvertible {
    
    // MARK: - Endpoints
    case getMovies
    
    // MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    fileprivate var parameters: Parameters? {
        switch self {
        case .getMovies:
            //A dict of the key (From the constants file) and its value is returned
            return nil//["testParam" : "testParamValue"]
        }
    }
    
    // MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    fileprivate var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    fileprivate var path: String {
        switch self {
        case .getMovies:
            return "movies"
        }
    }
    
    // swiftlint:disable force_unwrapping
    func asURLRequest() throws -> URLRequest {
        
        let baseUrl = try (Bundle.main.object(forInfoDictionaryKey: "base_url") as? String)?.asURL()
        
        var urlRequest = URLRequest(url: baseUrl!.appendingPathComponent(path))
        
        urlRequest.setValue(AppConstants.ContentType.json.rawValue,
                            forHTTPHeaderField: AppConstants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(AppConstants.ContentType.json.rawValue,
                            forHTTPHeaderField: AppConstants.HttpHeaderField.contentType.rawValue)
        
        let enconding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try enconding.encode(urlRequest, with: parameters)
    }
}
