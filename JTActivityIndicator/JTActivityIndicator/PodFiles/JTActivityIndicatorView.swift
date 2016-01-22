//
//  JTActivityIndicatorView.swift
//  JTActivityIndicator
//
//  Created by Juan Garcia on 1/21/16.
//  Copyright © 2016 jerti. All rights reserved.
//

import UIKit

class JTActivityIndicatorView: UIView
{
    @IBOutlet weak var messageLabel: UILabel!
    
    func setMessage(message: String)
    {
        self.messageLabel.text = message
    }
    
}
