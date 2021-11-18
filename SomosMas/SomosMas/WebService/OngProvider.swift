//
//  OngProvider.swift
//  Somosmas
//
//  Created by Flavio Gomez on 06/10/2021.
//

import Foundation
import Alamofire

class OngProvider {
    
    static let shared = OngProvider()
    let baseURL = "https://be-alkemy.herokuapp.com/api/"
    let statusOk = 200...299
    let token = ""
    
    func registerUser(newUser: NewUser, success: @escaping SignUpUsersSuccess, failure: @escaping SignUpUsersFailure){
        
        let url = "\(baseURL)register"
        let Encoder = JSONParameterEncoder.default
        
        AF.request(url,method: .post, parameters: newUser, encoder: Encoder ).responseDecodable(of: SignInResponse.self, decoder: JSONDecoder()){
            
            response in
            
            if let resp = response.value {
                success(resp)
            } else{
                failure(response.error)
            }
        }
    }
}
