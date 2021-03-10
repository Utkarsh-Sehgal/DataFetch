//
//  DataItemTVC.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import UIKit

class DataItemTVC: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var dataContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataDescription: UILabel!
    
    /// MARK: View overrides
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //provide corner radius to cell main view 
        dataContentView.layer.cornerRadius = dataContentView.frame.height/8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Configure the cell title and description based on the index
    /// - Parameter index: index for which cell is to be configured
    func configureCell(for index: Int) {
        self.dataDescription.text = DataRecords.data[index].description
        self.titleLabel.text = DataRecords.data[index].title
        self.titleLabel.accessibilityIdentifier = AccessibilityIdentifiers.dataCellTitleLabel
        accessibilityLabel = AccessibilityIdentifiers.dataCellIdentifier(forTitle: DataRecords.data[index].title)
    }
}
