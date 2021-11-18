//
//  NovedadesViewModel.swift
//  Somosmas
//
//  Created by Nahuel Paez on 27/10/2021.
//

import Foundation

class NovedadesViewModel{
    private let apiServices = LatestNewsWS()
    
    //MARK:- Closures reutlizables.
    var bindStartRequest = {() -> Void in }
    var bindEndRequest = {() -> Void in }
    var bindErrorMessage = {(_ errorMessage: String) -> Void in }
    var bindRequestData = {(_ arrayLatestNews: [LatestNewsDTO]) -> Void in }
    
    func fetchData(){
        self.bindStartRequest()
        
        self.apiServices.getLatestNewsData { arrayLatestNews in
            self.bindEndRequest()
            self.bindRequestData(arrayLatestNews)
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.bindErrorMessage(errorMessage)
        }
    }
}
