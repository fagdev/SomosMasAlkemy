//
//  LatestNewsWS.swift
//  Somosmas
//
//  Created by Nahuel Paez on 21/10/2021.
//

import Foundation
import Alamofire

struct LatestNewsWS {
    
    func getLatestNewsData(completion: @escaping LatestNewsDTOCompletionHandler, errorHandler: @escaping ErrorHandler) {
        let latestNewsDataURL = "http://ongapi.alkemy.org/api/news"
        
        AF.request(latestNewsDataURL, encoding: JSONEncoding.default).responseDecodable(of: LatestNewsData.self) {
            response in
            
            switch response.result {
            
            case .success(let result):
                
                 if let isSuccess = result.success, isSuccess, let arrayLatestNews = result.data {
                     completion(arrayLatestNews)
                 } else {
                     errorHandler(result.message ?? "Error")
                 }
            case .failure(let error):
                 errorHandler(error.localizedDescription)
            }
        }
    }
}
