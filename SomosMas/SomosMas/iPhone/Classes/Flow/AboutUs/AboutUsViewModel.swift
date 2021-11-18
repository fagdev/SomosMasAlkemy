//
//  AboutUsViewModel.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 28/10/2021.
//

import Foundation
class AboutUsViewModel {
        
    private let apiService = AboutUsWS()
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void  in }
    var bindErrorMessage = { (_ errorMessage: String) -> Void  in }
    var bindAboutUs = { (_ arrayAboutUs: [AboutUs]) -> Void in }
    
    func fetchData() {
        
        self.bindInitRequest()
        
        self.apiService.getAboutUsData { arrayAboutUs in
            
            
            self.bindAboutUs(arrayAboutUs.toAboutUs)
            self.bindEndRequest()
            
        } errorHandler: { errorMessage in
            
            self.bindEndRequest()
            self.bindErrorMessage(errorMessage)
        }
    }
}
