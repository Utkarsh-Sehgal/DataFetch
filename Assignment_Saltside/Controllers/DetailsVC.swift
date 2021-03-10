//
//  DetailsVC.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 09/03/21.
//

import UIKit
import Nuke

class DetailsVC: BaseVC {
    //MARK: IBOutlets
    /// Image for the respective data after downloading from the url
    @IBOutlet weak var dataImage: UIImageView!
    /// title label to display title
    @IBOutlet weak var titleLabel: UILabel!
    /// description label to display description
    @IBOutlet weak var descriptionLabel: UILabel!
    /// Back button
    @IBOutlet weak var backBtn: UIButton!
    /// Data index for the data to be displayed
    var dataIndex: Int = -1
    
    //MARK: View controller life cycle method(s)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dataImage.layer.cornerRadius = dataImage.frame.height/2
    }
    
    //MARK: IBAction(s)
    @IBAction func backBtnAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK: Helper Fucntion(s)
    /// Setup UI elements as per design
    private func configureUI() {
        if let url = URL.init(string: DataRecords.data[dataIndex].image) {
            //Using Nuke third party for Image downloading and caching
            //Used SPM instead of cocoapods for installing Nuke third party as it reduces the app build time and we didn't need to change anything inside the third party source code
            Nuke.loadImage(with: url as ImageRequestConvertible, into: dataImage)
        } else {
            self.showAlertBase(message: "Image Downloading Failed")
        }
        dataImage.contentMode = .scaleAspectFill
        dataImage.backgroundColor = .gray
        titleLabel.text = DataRecords.data[dataIndex].title
        descriptionLabel.text = DataRecords.data[dataIndex].description
        setupAccessibilityIdentifiers()
    }
    
    /// Setup Accessibility identifiers for UI elements for use in UITesting
    func setupAccessibilityIdentifiers() {
        titleLabel.accessibilityIdentifier = AccessibilityIdentifiers.dataDetailTitleLabel
        descriptionLabel.accessibilityIdentifier = AccessibilityIdentifiers.dataDetailDescriptionLabel
        backBtn.accessibilityIdentifier = AccessibilityIdentifiers.dataDetailBackButton
    }
}
