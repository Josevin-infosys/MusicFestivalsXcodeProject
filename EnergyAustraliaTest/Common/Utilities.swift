//
//  Utilities.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 22/01/23.
//

import Foundation
import UIKit

extension Data {
    
    func convertToJSON() throws -> [[String: Any]]?  {
        
        guard let jsonObject = try JSONSerialization.jsonObject(with: self, options: .fragmentsAllowed) as? [AnyObject] else {
            throw NSError(domain: NSCocoaErrorDomain, code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON"])
        }
        return jsonObject.map { $0 as! [String: Any] }
    }
}

extension ViewController {
    
    func addAlert(message: String) {
        let alert = UIAlertController(title: "Try Again", message: message, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

