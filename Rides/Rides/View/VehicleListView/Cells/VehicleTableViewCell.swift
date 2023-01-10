//
//  VehicleTableViewCell.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var vinLable: UILabel!
    @IBOutlet weak var makeModelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> VehicleTableViewCell {
        let kVehicleTableViewCellIdentifier = "kVehicleTableViewCellIdentifier"
        tableView.register(UINib(nibName: "VehicleTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kVehicleTableViewCellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: kVehicleTableViewCellIdentifier, for: indexPath) as! VehicleTableViewCell
        return cell
    }
    
    func loadData(data: VehicleModel) {
        vinLable.text = "Vin: \(data.vin ?? "")"
        makeModelLabel.text = "Make and Model: \(data.makeModel ?? "")"
    }
}
