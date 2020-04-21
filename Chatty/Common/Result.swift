//
//  ErrorHandler.swift
//  Chatty
//
//  Created by Oguz Tandogan on 14.04.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import Foundation

enum Result<Value: Any, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}
