//
//  AccessibilityIdentifiers.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

enum AccessibilityIdentifiers {
    // MARK: - Data List
    static let dataListTable = "dataListTable"
    static let dataCellPrefix = "dataCell"
    static let dataCellTitleLabel = "dataCellTitleLabel"
    
    // MARK: - Data Detail
    static let dataDetailTitleLabel = "dataDetailTitleLabel"
    static let dataDetailDescriptionLabel = "dataDetailDescriptionLabel"
    static let dataDetailBackButton = "dataDetailBackButton"
    
    static func dataCellIdentifier(forTitle title: String) -> String {
        return "\(AccessibilityIdentifiers.dataCellPrefix) \(title)"
    }
}
