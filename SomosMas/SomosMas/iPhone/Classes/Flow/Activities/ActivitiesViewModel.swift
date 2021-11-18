//
//  ActivitiesViewModel.swift
//  Somosmas
//
//  Created by Artekium on 21/10/2021.
//

import Foundation

class ActivitiesViewModel {
    
    private let model = ActivitiesModel()
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void in }
    var genericError = {(_ errorMessage: String) -> Void in }
    var bindingRefreshData = { (_ arrayActivities: [Activity]) -> () in }
    
    var activitiesResult: [Activity] = [] {
        didSet { self.bindingRefreshData(self.activitiesResult) }
    }
    
    func getActivities() {
        self.bindInitRequest()
        self.model.getActivitiesArray { arrayActivities in
            self.bindEndRequest()
            if arrayActivities.count == 0 {
                self.genericError("Por los momentos no hay actividades para mostrar")
            } else {
                self.activitiesResult = arrayActivities
            }
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.genericError("Hubo un error al obtener la información")
        }
    }
}
