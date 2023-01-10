//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import Foundation

class VehicleListViewModel: BaseService {
   
    func GetCountriesModelList(size: Int, completion: (([VehicleModel]?)-> Void)?) {
        let url = BaseUrl + "?size=\(size)"
        super.FireGenericRequest(url: url , methodType: MethodType.get, headers: nil) { (responseModel) in
            completion?(responseModel)
        }
    }
}
