//
//  LoginWS.swift
//  Somosmas
//
//  Created by Mario Angelillo on 07/10/2021.
//

import Foundation
import Alamofire

//COMENTO EL CÓDIGO DE MARIO, HASTA TENER RESOLUCIÓN DE LA API. FLAVIO 15/10/2021

//struct Services {
//
//    func login(email: String, password: String, completionHandler: @escaping ResultLoginHandler, errorHandler: @escaping ErrorHandler) {
//
//        let user: [String: String] = ["email": email, "password": password]
//        let url = "http://ongapi.alkemy.org/api/login"
//
//        AF.request(url, method: .post, parameters: user, encoding: JSONEncoding.default).responseDecodable(of: LoginResponseDTO.self, decoder: JSONDecoder()) { response in
//            switch response.result {
//               case .success(let data):
//                guard let token = data.token else {
//                       errorHandler(Messages.Error.parse)
//                       return
//                   }
//                   // GUARDAR EL TOKEN Y REDIRIJO AL HOME
//                   print("Inició sesión correctamente, \(token)")
//               case .failure(let error):
//                   errorHandler(error.localizedDescription)
//               }
//        }
//    }
//}

// UTLIZO API QUE CREE AUXILIARMENTE PARA QUE EL ENTORNO DE TRABAJO SEA MAS REAL

struct LoginService {
    
    static let shared = LoginService()
    let baseURL = "https://be-alkemy.herokuapp.com/api/login"
    let token = ""
    
    func login(user: User, completionHandler: @escaping ResultLoginHandler, errorHandler: @escaping ErrorHandler) {
        
        let Encoder = JSONParameterEncoder.default
        AF.request(baseURL, method: .post, parameters: user, encoder: Encoder).responseDecodable(of: LoginResponseDTO.self, decoder: JSONDecoder()){ response in
            
            switch response.result {
            case .success(let data):
                guard let token = data.token else {
                    errorHandler(data.msg ?? "Error de autenticación")
                    return
                }
                completionHandler(token)
            case .failure(let error):
                errorHandler(error.localizedDescription)
            }
        }
    }
}
