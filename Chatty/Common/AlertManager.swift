//
//  AlertManager.swift
//  Chatty
//
//  Created by Oguz Tandogan on 17.04.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import UIKit

struct AlertManager {
    
    static func showConfirmAlert(title: String?, message: String?,buttonTitle: String?, controller: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: false, completion: nil)
    }
    static func showChoiceAlert() {
        
    }
}
