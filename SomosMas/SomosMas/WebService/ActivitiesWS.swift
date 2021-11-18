//
//  ActivitiesWS.swift
//  Somosmas
//
//  Created by Artekium on 21/10/2021.
//

import Foundation
import Alamofire

struct ActivitiesWS {
    
    func getActivitiesList(completion: @escaping ActivitiesResultHandler, errorHandler: @escaping ErrorHandler){
        let url = "http://ongapi.alkemy.org/api/activities"
        let request = AF.request(url)
        
        request.responseData { response in
            switch response.result {
            case .success(let data):
                guard let activitiesResult = data.toDTO(ActivitiesResultDTO.self)
                else { return }
                completion(activitiesResult)
            case .failure(let error):
                errorHandler(error.localizedDescription)
            }
        }
    }
}
