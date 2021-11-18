//
//  AboutUsWS.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 28/10/2021.
//
import Alamofire
import Foundation

struct AboutUsWS {
func getAboutUsData(completion: @escaping AboutUsDTOCompletionHandler, errorHandler: @escaping ErrorHandler) {
    
    let aboutUsDataURL = "http://ongapi.alkemy.org/api/members"
    
    AF.request(aboutUsDataURL, encoding: JSONEncoding.default).responseDecodable(of: AboutResultDTO.self) {
        response in
         
        switch response.result {
        case .success(let result):
            
            if let isSuccess = result.success, isSuccess, let arrayAboutUs = result.data {
                completion(arrayAboutUs)
            } else {
                errorHandler(result.message ?? "Error inesperado")
            }
        
        case .failure(let error):
            errorHandler(error.localizedDescription)
        }
    }
    }
}
