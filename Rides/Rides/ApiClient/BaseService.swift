//
//  BaseService.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import Foundation

import UIKit
import Foundation

enum MethodType: String {
    case get     = "GET"
    case post    = "POST"
}

class BaseService {
    
    // MARK: Rebuilt Methods
    func FireGenericRequest<ResponseModel: Codable>(url: String, methodType: MethodType, headers: [String: String]?, completion: @escaping ((ResponseModel?) -> Void)) {
        
        // Request Preparation
        guard let serviceUrl = URL(string: url) else {
            print("Error Building URL Object")
            return
        }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = methodType.rawValue
        
        // Header Preparation
        if let header = headers {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        // Firing the request
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error: \(error.debugDescription)")
                completion(nil)
                
            } else {
                if let data = data {
                    do {
                        guard let object = try? JSONDecoder().decode(ResponseModel.self , from: data) else {
                            print("Error Decoding Response Model Object")
                            return
                        }
                        DispatchQueue.main.async {
                            completion(object)
                        }
                    }
                }
            }
        }.resume()
    }
    
    private func buildGenericParameterFrom<RequestModel: Codable>(model: RequestModel?) -> [String : AnyObject]? {
        var object: [String : AnyObject] = [String : AnyObject]()
        do {
            if let dataFromObject = try? JSONEncoder().encode(model) {
                object = try JSONSerialization.jsonObject(with: dataFromObject, options: []) as! [String : AnyObject]
            }
        } catch (let error) {
            print("\nError Encoding Parameter Model Object \n \(error.localizedDescription)\n")
        }
        return object
    }
}
