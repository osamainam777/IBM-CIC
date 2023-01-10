//
//  Utility.swift
//  Rides
//
//  Created by Usama Inaam Rasheed on 1/9/23.
//

import Foundation
import UIKit

class Utility : NSObject {
    
    class func validRange(number: Int) -> Bool {
        if number >= 1 && number <= 100 {
            return true
        }
        return false
    }
    
    class func showAlertError(viewController: UIViewController) {
        let dialogMessage = UIAlertController(title: "Attention", message: "The input value must in between 1 to 100. Please try again", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         dialogMessage.addAction(ok)
        viewController.present(dialogMessage, animated: true, completion: nil)
    }
}

