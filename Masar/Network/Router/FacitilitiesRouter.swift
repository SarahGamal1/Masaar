//
//  MachineRouter.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import Foundation
import Alamofire

enum FacitilitiesRouter: URLRequestConvertible {
    
    case getFacitilities(departmentID: Int ,page: Int)
    
    var headers : HTTPHeaders {
        return ["" :""]
    }
    
    var method : HTTPMethod {
        switch self {
        case .getFacitilities:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getFacitilities(let departmentID, let page) :
            return [
                "departmentID": departmentID,
                "pageIndex": page,
                "pageSize": 10
            ]
        }
    }
    
    var url: URL {
        let relativePath : String?
        switch self {
        case .getFacitilities :
            relativePath = Constants.getFacitilitiesEndpoint
        }
        var url = URL(string: Constants.baseURL)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default :
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
