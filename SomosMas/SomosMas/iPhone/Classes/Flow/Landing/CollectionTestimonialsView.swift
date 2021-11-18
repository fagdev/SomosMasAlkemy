//
//  CollectionTestimonialsView.swift
//  Somosmas
//
//  Created by Flavio Gomez on 08/11/2021.
//

import Foundation
import UIKit

class CollectionTestimonialsView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let viewModel = HomeViewModel()
    private var arrayTestimonials = [Testimonial]()
    
    private func setBinds() {
        self.viewModel.bindErrorMessage = { (_ errorMessage: String) -> Void in
            self.showAlertWithTitle("Error", message: errorMessage)
        }
        
        self.viewModel.bindTestimonials = { (_ arrayTestimonials: [Testimonial]) -> Void in
            let prefix = arrayTestimonials.prefix(4)
            self.arrayTestimonials = Array(prefix)
        }
    }
    
    
    
    
    
}
