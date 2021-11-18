//
//  MembersWS.swift
//  Somosmas
//
//  Created by Artekium on 27/10/2021.
//

import Foundation
import Alamofire

struct MembersWS {
    func getMemberById(id: Int, completion: @escaping MembersResultHandler, errorHandler: @escaping ErrorHandler) {
        let url = "http://ongapi.alkemy.org/api/members/\(id)"
        let request = AF.request(url)
        
        request.responseData { response in
            switch response.result {
            case .success(let data):
                guard let member = data.toDTO(MembersResultDTO.self)
                else { return }
                completion(member)
            case .failure(let error):
                errorHandler(error.localizedDescription)
            }
        }
    }
}
