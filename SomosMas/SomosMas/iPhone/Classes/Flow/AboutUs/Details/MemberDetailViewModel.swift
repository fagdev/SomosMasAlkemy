//
//  MemberDetailViewModel.swift
//  Somosmas
//
//  Created by Artekium on 27/10/2021.
//

import Foundation

class MemberDetailViewModel {
    private let model = MemberDetailModel()
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void in }
    var showError = { (_ errorMessage: String) -> Void in }
    var bindMemberResult = { (_ member: Member) -> () in }
    
    var result: Member! {
        didSet { self.bindMemberResult(self.result) }
    }
    
    func getMemberDetail(id: Int) {
        self.bindInitRequest()
        self.model.getMemberData(id: id) { memberDetail in
            self.result = memberDetail
            self.bindEndRequest()
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.showError("Hubo un error al obtener la información")
        }
    }
}
