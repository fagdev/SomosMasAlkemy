//
//  SlidesWS.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 22/10/2021.
//

import Foundation
import Alamofire

struct SlideWS {
    
    func getSlideData(completion: @escaping SlideDTOCompletionHandler, errorHandler: @escaping ErrorHandler) {
        
        let slideDataURL = "http://ongapi.alkemy.org/api/slides"
        
        AF.request(slideDataURL, encoding: JSONEncoding.default).responseDecodable(of: SlideData.self) {
            response in
             
            switch response.result {
            case .success(let result):
                
                if let isSuccess = result.success, isSuccess, let arraySlide = result.data {
                    completion(arraySlide)
                } else {
                    errorHandler(result.message ?? "Error inesperado")
                }
            
            case .failure(let error):
                errorHandler(error.localizedDescription)
            }
        }
    }
}
