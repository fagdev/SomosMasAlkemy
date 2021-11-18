//
//  HomeViewModel.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/14/21.
//

import Foundation

class HomeViewModel {
        
    private let apiService = TestimonialsWS()
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void  in }
    var bindErrorMessage = { (_ errorMessage: String) -> Void  in }
    var bindTestimonials = { (_ arrayTestimonials: [Testimonial]) -> Void in }
    
    func fetchData() {
        
        self.bindInitRequest()
        
        self.apiService.getTestimonialsData { arrayTestimonial in
            
            
            self.bindTestimonials(arrayTestimonial.toTestimonials)
            self.bindEndRequest()
            
        } errorHandler: { errorMessage in
            
            self.bindEndRequest()
            self.bindErrorMessage(errorMessage)
        }
    }
}
