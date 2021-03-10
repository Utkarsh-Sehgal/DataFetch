//
//  NetworkingUtility.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import Foundation

//Variable for base url
public var BASE_API_URL: String {
    //Using xcconfig file for storing the base url and fetching the same
    if let baseUrl = Utility.infoForKey(Constants.ConfigKeys.baseApiUrl) {
        return baseUrl
    }
    return ""
}

//This enum will be used to get api type
public enum Methods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case patch = "PATCH"
}

//API Error constants
struct APIError {
    static let invalidRequest = "Invalid request"
    static let unsupportedData = "Unsupported Data"
}
