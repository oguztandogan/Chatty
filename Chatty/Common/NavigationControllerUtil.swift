//
//  NavigationControllerUtil.swift
//  Chatty
//
//  Created by Oguz Tandogan on 20.04.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation
import UIKit

struct NavigationControllerUtil {
    
    func hideBackBarButton(controller: UIViewController) {
        controller.navigationItem.setHidesBackButton(true, animated: true);
    }
}
