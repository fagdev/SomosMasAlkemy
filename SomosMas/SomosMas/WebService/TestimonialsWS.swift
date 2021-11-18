//
//  TestimonialsWS.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/14/21.
//

import Foundation
import Alamofire

struct TestimonialsWS {
        
    func getTestimonialsData(completion: @escaping TestimonialDTOCompletionHandler, errorHandler: @escaping ErrorHandler) {
        
        let testimonialsDataURL = "http://ongapi.alkemy.org/api/testimonials"
        
        AF.request(testimonialsDataURL, encoding: JSONEncoding.default).responseDecodable(of: TestimonialsData.self) {
            response in
             
            switch response.result {
                
            case .success(let result):
                
                if let isSuccess = result.success, isSuccess, let arrayTestimonials = result.data {
                    completion(arrayTestimonials)
                } else {
                    errorHandler(result.message ?? "Error inesperado")
                }
            
            case .failure(let error):
                errorHandler(error.localizedDescription)
            }
        }
    }
}
