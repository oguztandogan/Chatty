//
//  TextFieldSettings.swift
//  Chatty
//
//  Created by Oguz Tandogan on 13.04.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import UIKit
private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let length = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return length
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let text = textField.text
        textField.text = text?.safelyLimitedTo(length: maxLength)
    }
}

extension String
{
    func safelyLimitedTo(length range: Int)->String {
        if (self.count <= range) {
            return self
        }
        return String( Array(self).prefix(upTo: range) )
    }
}
