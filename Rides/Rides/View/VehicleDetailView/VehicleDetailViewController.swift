//
//  VehicleDetailViewController.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import UIKit

class VehicleDetailViewController: UIViewController {

    @IBOutlet weak var vinLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var makeModel: UILabel!
    @IBOutlet weak var carTypeLabel: UILabel!
    
    var dataSource: VehicleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Vehicle Details"
        
        guard let data = dataSource else { return }
        
        vinLabel.text = "Vin: \(data.vin ?? "")"
        colorLabel.text = "Color: \(data.color ?? "")"
        makeModel.text = "Make and Model: \(data.makeModel ?? "")"
        carTypeLabel.text = "Car Type: \(data.carType ?? "")"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
