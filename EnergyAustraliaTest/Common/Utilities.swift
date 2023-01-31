//
//  Utilities.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 22/01/23.
//

import Foundation
import UIKit

extension ViewController {
    
    func addAlert(message: String) {
        let alert = UIAlertController(title: "Try Again", message: message, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
            print("clicked Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
        })
    }
}

