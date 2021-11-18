//
//  ActivitiesModel.swift
//  Somosmas
//
//  Created by Artekium on 21/10/2021.
//

import Foundation

struct ActivitiesModel {
    private let service = ActivitiesWS()
    
    func getActivitiesArray(completion: @escaping ActivitiesArrayHandler, errorHandler: @escaping ErrorHandler) {
        
        service.getActivitiesList(completion: { activitiesResult in
            guard let activitiesArray = activitiesResult.data?.map({dto in Activity(dto: dto)})
            else {
                errorHandler("Hubo un error al obtener los datos")
                return }
            completion(activitiesArray)
        }, errorHandler: errorHandler)
    }
}
