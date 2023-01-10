//
//  VehicleListModel.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import Foundation

struct VehicleModel: Codable {
    
    var vin: String?
    var makeModel: String?
    var carType: String?
    var color: String?
    
    enum CodingKeys: String, CodingKey {
        case vin = "vin"
        case makeModel = "make_and_model"
        case carType = "car_type"
        case color = "color"
    }
}
