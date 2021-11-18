//
//  ButtonSecondary.swift
//  Somosmas
//
//  Created by Coti on 29/09/2021.
//

import Foundation
import UIKit

@IBDesignable class ButtonSecondary: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.backgroundColor = UIColor.systemBlue.cgColor
        self.tintColor = UIColor.white
    }
}
