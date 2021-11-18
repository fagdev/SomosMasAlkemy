//
//  OnBoardingViewModel.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 22/10/2021.
//

import Foundation
class OnBoardingViewModel {
        
    private let apiService = SlideWS()

    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void  in }
    var bindErrorMessage = { (_ errorMessage: String) -> Void  in }
    var bindSlide = { (_ arraySlide: [Slide]) -> Void in }
    
    func fetchData()  {
        
        self.bindInitRequest()
        
        self.apiService.getSlideData { arraySlide in
            self.bindEndRequest()
            self.bindSlide(arraySlide.toSlide)
           
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.bindErrorMessage(errorMessage)
        }
    }
}
