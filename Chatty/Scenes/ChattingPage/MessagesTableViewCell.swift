//
//  MessagesTableViewCell.swift
//  Chatty
//
//  Created by Oguz Tandogan on 20.04.2020.
//  Copyright © 2020 Oguz Tandogan. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBackgroundView: UIView!
    
    @IBOutlet weak var backgroundViewTopConstraint: UIView!
    @IBOutlet weak var backgroundViewBottomConstraint: UIView!
    @IBOutlet weak var backgroundViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundViewRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageLabelLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageLabelRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageLabelBottomConstraint: NSLayoutConstraint!
    
    // Changing background view
    var isIncoming: Bool = false {
        didSet {
            messageBackgroundView.backgroundColor = isIncoming ? UIColor.white : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            messageBackgroundView.layer.cornerRadius = 7
        }
    }

    func configure(with model: ChattingPage.Response) {
        isIncoming = model.isIncoming
        if isIncoming {
            guard let sender = model.sender else {return}
            // align to the left
            let nameAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.orange,
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)
                ] as [NSAttributedString.Key : Any]
            // sender name at top, message at the next line
            let senderName = NSMutableAttributedString(string: sender + "\n", attributes: nameAttributes)
            let message = NSMutableAttributedString(string: model.message ?? "")
            senderName.append(message)
            messageLabel.attributedText = senderName
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = false
        }
        else {
            // align to the right
            messageLabel.text = model.message
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = false
        }
    }
    
}
