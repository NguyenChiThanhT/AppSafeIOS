//
//  APIRouter.swift
//  AppSafe
//
//  Created by NGUYEN CHI THANH on 4/8/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case register(registerBody:RegisterBody)
    
    private var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        }
    }
    
    private var path: String {
        switch self {
        case .register:
            return "register.php"
        }
    }
    
    private var headers: HTTPHeaders {
        let headers = ["Content-Type": "application/json"]
        switch self {
        case .register:
            break
        }
        return headers
    }
    
    var  params: [String:Any]? {
        switch self {
        case .register(let registerBody):
            return registerBody.toParams()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Configs.BASE_URL.asURL()
        
        var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let params_ = self.params {
            switch self.method {
            case .get:
                urlRequest = try URLEncoding.queryString.encode(urlRequest, with: params_)
                break
                
            default  :
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: params_)
                
                break
            }
        }
        
        return urlRequest
    }
}
