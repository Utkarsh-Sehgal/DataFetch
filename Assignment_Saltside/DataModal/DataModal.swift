//
//  DataModal.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import Foundation

/// Data values with conformanc e to Codable for decoding the JSON response
struct DataValues: Codable {
    ///image url
    var image: String
    /// description for a data item
    var description: String
    /// title for a data item
    var title: String
}

/// Data records to store the parsed data response
class DataRecords {
    /// Data received
    static var data = [DataValues]()
    
    /// Initializer for setting up the records as per the response received
    /// - Parameter data: data response after decoding
    init(for data: [DataValues]) {
        DataRecords.data = data
    }
}
