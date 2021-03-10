//
//  ViewController.swift
//  Assignment_Saltside
//
//  Created by Utkarsh Sehgal on 08/03/21.
//

import UIKit

class DataListVC: BaseVC {

    //MARK: IBOutlets
    /// table view to display the data fetched
    @IBOutlet weak var dataItemList: UITableView!
    
    //MARK: Properties
    /// data view model lazy instance to manage data apis for fetching records
    private var dataViewModal: DataViewModal = {
        return DataViewModal()
    }()
    
    //MARK: View controller life cycle method(s)
    override func viewDidLoad() {
        super.viewDidLoad()
        DataRecords.data.removeAll()
        fetchRecords()
        dataItemList.accessibilityIdentifier = AccessibilityIdentifiers.dataListTable
    }
    
    //MARK: Helper fucntions
    private func fetchRecords() {
        dataViewModal.fetchData { [unowned self] (isSuccess, message) in
            if isSuccess {
                self.reloadRecords()
            } else {
                self.showAlertBase(message: message)
            }
        }
    }
    
    /// Reload the data table view
    private func reloadRecords() {
        DispatchQueue.main.async { [weak self] in
            self?.dataItemList.reloadData()
        }
    }
}

//MARK: UITableViewDataSource and Delegate
extension DataListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataRecords.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DataItemTVC") as? DataItemTVC {
            cell.configureCell(for: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            if let controller = self.instantiateController(on: .main, withIdentifier: .detailsVC) as? DetailsVC {
                // set dataIndex for controller for identifying the data which needs to be displayed
                controller.dataIndex = indexPath.row
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
