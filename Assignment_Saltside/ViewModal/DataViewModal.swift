//
//  DataViewModal.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import Foundation
import UIKit

typealias CompletionHandler = (_ isSuccess: Bool, _ message: String)->()

class DataViewModal {
    /// Router Object
    private let router = Router<APIRequest>()
    
    /// Method which calls the api for fetching the data
    /// - Parameter completion: completion handler for callbacks
    func fetchData(completion: @escaping CompletionHandler) {
        router.request(.fetchRecords) { (result) in
            switch result {
            case .success(let response):
                //if the response is successful then parse the response received
                self.parse(response: response, completion: completion)
            case .failure(let message):
                completion(false, message)
            }
        }
    }
    
    /// Parse the response received
    /// - Parameters:
    ///   - response: response JSON string from api
    ///   - completion: completion handler
    private func parse(response: String?, completion: @escaping CompletionHandler) {
        if let response = response, let data = response.data(using: .utf8) {
            do {
                //parse data through codable inherited data modal
                let dataResponse = try JSONDecoder().decode(Array<DataValues>.self, from: data)
                //store the data in the data record modal
                _ = DataRecords(for: dataResponse)
                completion(true, "Data fetched and saved")
            } catch {
                completion(false, error.localizedDescription)
            }
        } else {
            completion(false, "Invalid response format")
        }
    }
}
