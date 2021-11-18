//
//  ButtonPrimary.swift
//  Somosmas
//
//  Created by Coti on 29/09/2021.
//

import Foundation
import UIKit

@IBDesignable class ButtonPrimary: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.tintColor = UIColor.systemBlue
    }
}
