//
//  Colors.swift
//  SomosMas
//
//  Created by Kenyi Rodriguez on 27/09/21.
//

import Foundation
import UIKit
import SwiftUI

enum Color: String, CaseIterable{
    
    case textPrimary
    case actionTextPrimary
    case actionTextSecondary
    case borderButtonPrimary 
    case backgroundPrimary
    case backgroundButtonPrimary
    case backgroundButtonSecondary
}

extension UIColor {
    convenience init(color: Color){
        self.init(named: color.rawValue)!
    }
}

