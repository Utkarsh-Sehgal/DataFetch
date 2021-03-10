//
//  Utility.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import Foundation
import UIKit

/// Custom class for implemnetation of the commonly used functions
class Utility {
    /// Get the corresponding string for the key from the config file
    /// - Parameter key: Key for which the value is to be provided
    /// - Returns: Value string
    static func infoForKey(_ key: String) -> String? {
           return (Bundle.main.infoDictionary?[key] as? String)?
               .replacingOccurrences(of: "\\", with: "")
    }
    
    /// Shows Alert
    ///
    /// - Parameters:
    ///   - controller: Presenting Controller
    ///   - title: Title of alert
    ///   - message: Message content
    ///   - style: Alert controller style Defaul is Alert
    static func showAlert(on controller: UIViewController, withTitle title: String?, andMessage message: String?, alertStyle style: UIAlertController.Style = .alert, action: ((UIAlertAction)->Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: action))
            controller.present(alertController, animated: true, completion: nil)
        }
    }
}
