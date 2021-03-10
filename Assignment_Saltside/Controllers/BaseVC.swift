//
//  BaseVC.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 09/03/21.
//

import UIKit

class BaseVC: UIViewController {

    // MARK: - View LifeCycle Method(s)
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// Instantiate controller
    ///
    /// - Parameters:
    ///   - storyboard: StoryBoard Name
    ///   - identifier: Identifier of controller
    /// - Returns: Instantiated Controller
    func instantiateController(on storyboard: Storyboard, withIdentifier identifier: ControllerIdentifiers) -> UIViewController {
        let currentStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = currentStoryboard.instantiateViewController(withIdentifier: identifier.rawValue)
        return controller
    }
    
    /// Show Alert
    ///
    /// - Parameter message: Message
    func showAlertBase(message: String) {
        Utility.showAlert(on: self, withTitle: "Message", andMessage: message)
    }
}
