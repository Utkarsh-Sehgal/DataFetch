//
//  RequestManager.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import Foundation
import UIKit

/// Request Protocol
public protocol Request {
    var baseURL: String { get }
    var path: String { get }
    var method: Methods { get }
    var parameters: Any? { get }
    var headers: [[String: String]]? { get }
    var queryParam: [URLQueryItem]? { get }
}
//types of APIs request
public enum APIRequest {
    case fetchRecords
}

// Getters for all the parameters required for building an API request
extension APIRequest: Request {
    //Query params to be passed with url requests if any
    public var queryParam: [URLQueryItem]? {
        switch self {
        case .fetchRecords:
            return nil
        }
    }
    //Base api url
    public var baseURL: String {
        switch self {
        case .fetchRecords:
            return BASE_API_URL
        }
    }
    //Path for the url request
    public var path: String {
        switch self {
        case .fetchRecords:
            return "/ashwini9241/6e0f26312ddc1e502e9d280806eed8bc/raw/7fab0cf3177f17ec4acd6a2092fc7c0f6bba9e1f/saltside-json-data"
        }
    }
    //HTTP methods for the url request
    public var method: Methods {
        switch self {
        case .fetchRecords:
            return .get
        }
    }
    //Parameters to be passed HTTPRequestBody if any
    public var parameters: Any? {
        switch self {
        default:
            return nil
        }
    }
    //Headers to be passed in url requests if any
    public var headers: [[String : String]]? {
        switch self {
        default:
            return nil
        }
    }
}
