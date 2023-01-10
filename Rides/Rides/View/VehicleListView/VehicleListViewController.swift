//
//  VehicleListViewController.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import UIKit

class VehicleListViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var displayButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = VehicleListViewModel()
    var dataSource : [VehicleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViewController()
    }
    
    func setUpViewController() {
        self.title = "Vehicle List"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    func apiCall(number: Int) {
        viewModel.GetCountriesModelList(size: number) { response in
            if let data = response {
                self.dataSource = data
                self.dataSource = self.dataSource.sorted{$0.vin! < $1.vin!}
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func displayTapped(_ sender: Any) {
        let number = Int(textfield.text ?? "0") ?? 0
        if Utility.validRange(number: number) {
            apiCall(number: number)
            
        } else {
            Utility.showAlertError(viewController: self)
        }
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        dataSource = []
        textfield.text = ""
        self.tableView.reloadData()
    }
}

extension VehicleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VehicleTableViewCell.cellForTableView(tableView: tableView, atIndexPath: indexPath)
        cell.loadData(data: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehicleDetailViewController = VehicleDetailViewController()
        vehicleDetailViewController.dataSource = dataSource[indexPath.row]
        self.navigationController?.pushViewController(vehicleDetailViewController, animated: true)
    }
    
    
}
